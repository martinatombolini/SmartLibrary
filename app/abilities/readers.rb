Canard::Abilities.for(:reader) do
  can [:show], Book
  cannot [:create,:update,:destroy], Book
end
