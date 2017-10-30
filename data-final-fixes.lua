local ceil = math.ceil

for _, recipe in pairs(data.raw.recipe) do
  if recipe.ingredients then
    for _, ingredient in pairs(recipe.ingredients) do
      if ingredient.amount then
        ingredient.amount = ceil(ingredient.amount / 2)
      elseif ingredient[2] then
        ingredient[2] = ceil(ingredient[2] / 2)
      end
    end
  end
  if recipe.normal then
    if recipe.normal.ingredients then
      for _, ingredient in pairs(recipe.normal.ingredients) do
        if ingredient.amount then
          ingredient.amount = ceil(ingredient.amount / 2)
        elseif ingredient[2] then
          ingredient[2] = ceil(ingredient[2] / 2)
        end
      end
    end
  end
  if recipe.expensive then
    if recipe.expensive.ingredients then
      for _, ingredient in pairs(recipe.expensive.ingredients) do
        if ingredient.amount then
          ingredient.amount = ceil(ingredient.amount / 2)
        elseif ingredient[2] then
          ingredient[2] = ceil(ingredient[2] / 2)
        end
      end
    end
  end
end

for _, technology in pairs(data.raw.technology) do
  if technology.unit then
    if technology.unit.count then
      technology.unit.count = ceil(technology.unit.count / 2)
    end
    if technology.unit.time then
      technology.unit.time = ceil(technology.unit.time / 2)
    end
  end
end
