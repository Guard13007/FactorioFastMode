local ceil = math.ceil

-- reduces ingredient amount(s) and energy_required of recipes
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
  if recipe.energy_required then
    recipe.energy_required = recipe.energy_required / 2
  end
end

-- apply mod_recipe to ALL recipe values
for _, recipe in pairs(data.raw.recipe) do
  if recipe.ingredients then mod_recipe(recipe) end
  if recipe.normal then mod_recipe(recipe.normal) end
  if recipe.expensive then mod_recipe(recipe.expensive) end
end

-- reduces unit counts and time of all technologies
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

-- reduces mining_time on all resources
for _, resource in pairs(data.raw.resource) do
  if resource.minable and resource.minable.mining_time then
    resource.minable.mining_time = resource.minable.mining_time / 2
  end
end

-- reduces mining_time on all trees
for _, tree in pairs(data.raw.tree) do
  if tree.minable and tree.minable.mining_time then
  	tree.minable.mining_time = tree.minable.mining_time / 2
  end
end

-- reduces mining_time on all rocks
for name, entity in pairs(data.raw['simple-entity']) do
  if name:find('rock') and entity.minable and entity.minable.mining_time then
    entity.minable.mining_time = entity.minable.mining_time / 2
  end
end
