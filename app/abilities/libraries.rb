Canard::Abilities.for(:library) do
  can [:create, :update, :destroy, :show, :delete], Book
  cannot [:create], Reservation
  
end
