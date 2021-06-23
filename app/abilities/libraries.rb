Canard::Abilities.for(:library) do
  can [:create, :destroy, :update], Book
  
end
