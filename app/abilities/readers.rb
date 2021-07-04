Canard::Abilities.for(:reader) do
  can [:show], Book
  cannot [:create,:update,:destroy], Book
  can [:create, :destroy], Reservation
end
