local ceil = math.ceil

local mod_recipe = function(recipe)
  if recipe.ingredients then
    for _, ingredient in pairs(recipe.ingredients) do
      if ingredient.amount then
        ingredient.amount = ceil(ingredient.amount / 2)
      elseif ingredient[2] then
        ingredient[2] = ceil(ingredient[2] / 2)
      end
    end
  end
end

for _, recipe in pairs(data.raw.recipe) do
  if recipe.ingredients then mod_recipe(recipe) end
  if recipe.normal then mod_recipe(recipe.normal) end
  if recipe.expensive then mod_recipe(recipe.expensive) end
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
