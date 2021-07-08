class User < ApplicationRecord
  has_many :reservations
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2]
  acts_as_user :roles => [ :library, :reader]
  def self.from_omniauth(auth) 
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end
          
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(access_token)

    data = access_token.info
    user = User.where(email: data['email']).first
     unless user
    
      user = User.create( email: data['email'],password: Devise.friendly_token[0,20])
     end
    user
  end

  def is_library?
    return (self.roles_mask & 1) == 1
  end

  def set_library
    self.roles_mask = (self.roles_mask | 1)
    self.save
  end

  def unset_library
    self.roles_mask = (self.roles_mask & 1)
    self.save
  end

  def is_reader?
    return (self.roles_mask & 2) == 2
  end

  def set_reader
    self.roles_mask = (self.roles_mask | 2)
    self.save
  end

  def unset_reader
    self.roles_mask = (self.roles_mask & 1)
    self.save
  end


  validates :address, presence: true, if: :check_role?

  def check_role?
    roles_mask==1
  end

end
