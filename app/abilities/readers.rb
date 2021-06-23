Canard::Abilities.for(:reader) do
  
  cannot [:create, :destroy, :update], Book
end
