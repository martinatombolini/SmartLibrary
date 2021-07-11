Canard::Abilities.for(:library) do
  can [:create, :update, :destroy, :show, :delete], Book
  can [:destroy], Reservation
  cannot [:create], Reservation
  
end
