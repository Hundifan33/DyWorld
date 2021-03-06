require "data/prefix"

Data_Table_Accumulators = {
	{
		Name = dyworld_prefix.."accumulator-1",
		--Icon = --todo
		Recipe_Craft_Time = 5,
		Recipe_Ingredients = {{"accumulator", 1},{"advanced-circuit", 5},{"steel-plate", 15},{"battery", 10}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = false,
		Stack = 50,
		Health = 500,
		Tint = {r=0.500, g=0.500, b=0.500},
		Energy = (5*4),
	},
	{
		Name = dyworld_prefix.."accumulator-2",
		--Icon = --todo
		Recipe_Craft_Time = 10,
		Recipe_Ingredients = {{dyworld_prefix.."accumulator-1", 1},{"advanced-circuit", 15},{"steel-plate", 25},{"battery", 25}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = false,
		Stack = 50,
		Health = 1000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Energy = (5*8),
	},
	{
		Name = dyworld_prefix.."accumulator-3",
		--Icon = --todo
		Recipe_Craft_Time = 15,
		Recipe_Ingredients = {{dyworld_prefix.."accumulator-2", 1},{"advanced-circuit", 50},{"steel-plate", 50},{"battery", 50}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = false,
		Stack = 50,
		Health = 2000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Energy = (5*16),
	},
	{
		Name = dyworld_prefix.."accumulator-4",
		--Icon = --todo
		Recipe_Craft_Time = 20,
		Recipe_Ingredients = {{dyworld_prefix.."accumulator-3", 1},{"processing-unit", 15},{"steel-plate", 75},{"battery", 75}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = false,
		Stack = 50,
		Health = 5000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Energy = (5*32),
	},
	{
		Name = dyworld_prefix.."accumulator-5",
		--Icon = --todo
		Recipe_Craft_Time = 25,
		Recipe_Ingredients = {{dyworld_prefix.."accumulator-4", 1},{"processing-unit", 30},{"steel-plate", 100},{"battery", 100}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = false,
		Stack = 50,
		Health = 10000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Energy = (5*64),
	},
	{
		Name = dyworld_prefix.."accumulator-6",
		--Icon = --todo
		Recipe_Craft_Time = 30,
		Recipe_Ingredients = {{dyworld_prefix.."accumulator-5", 1},{"processing-unit", 45},{"steel-plate", 150},{"battery", 150}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = false,
		Stack = 50,
		Health = 20000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Energy = (5*128),
	},
	{
		Name = dyworld_prefix.."accumulator-7",
		--Icon = --todo
		Recipe_Craft_Time = 35,
		Recipe_Ingredients = {{dyworld_prefix.."accumulator-6", 1},{"processing-unit", 60},{"steel-plate", 200},{"battery", 200}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = false,
		Stack = 50,
		Health = 50000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Energy = (5*256),
	},
	{
		Name = dyworld_prefix.."accumulator-8",
		--Icon = --todo
		Recipe_Craft_Time = 40,
		Recipe_Ingredients = {{dyworld_prefix.."accumulator-7", 1},{"processing-unit", 120},{"steel-plate", 250},{"battery", 250}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = false,
		Stack = 50,
		Health = 100000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Energy = (5*512),
	},
	{
		Name = dyworld_prefix.."accumulator-9",
		--Icon = --todo
		Recipe_Craft_Time = 45,
		Recipe_Ingredients = {{dyworld_prefix.."accumulator-8", 1},{"processing-unit", 250},{"steel-plate", 300},{"battery", 350}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = false,
		Stack = 50,
		Health = 200000,
		Tint = {r=0.500, g=0.500, b=0.500},
		Energy = (5*1024),
	},
}

function DyWorld_Accumulators_Recipe(DATA)
  local result =
  {
    type = "recipe",
    name = DATA.Name,
    energy_required = DATA.Recipe_Craft_Time,
	enabled = DATA.Recipe_Without_Tech,
    ingredients = {},
    result = DATA.Name,
    result_count = DATA.Recipe_Results_Count,
  }
  return result
end

function DyWorld_Accumulators_Item(DATA)
  local result =
  {
    type = "item",
    name = DATA.Name,
    icon = "__base__/graphics/icons/accumulator.png",
    flags = {"goes-to-quickbar"},
    subgroup = dyworld_prefix.."accumulator",
    order = DATA.Name,
    place_result = DATA.Name,
    stack_size = DATA.Stack,
  }
  return result
end




for k,v in pairs(Data_Table_Accumulators) do
data:extend(
	{
		DyWorld_Accumulators_Entity(v),
		DyWorld_Accumulators_Item(v),
		DyWorld_Accumulators_Recipe(v),
	})
	for _,z in pairs(v.Recipe_Ingredients) do
		table.insert(data.raw.recipe[v.Name].ingredients,z)
	end
end