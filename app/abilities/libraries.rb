Canard::Abilities.for(:library) do
  can [:create, :update, :destroy], Book
  
end
