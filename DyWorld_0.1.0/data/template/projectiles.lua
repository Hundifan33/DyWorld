require "data/template-data/main"
require "data/template-data/tech"
require "data/prefix"

function DyWorld_Projectile_1(NAME, DMG, DMGTYPE, TINT)
	local result =
  {
    type = "projectile",
    name = NAME,
    flags = {"not-on-map"},
    collision_box = {{-0.05, -0.25}, {0.05, 0.25}},
    acceleration = 0,
    direction_only = true,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "damage",
          damage = {amount = DMG, type = DMGTYPE}
        }
      }
    },
    animation =
    {
      filename = "__base__/graphics/entity/bullet/bullet.png",
      tint = TINT,
      frame_count = 1,
      width = 3,
      height = 50,
      priority = "high"
	}
  }
  return result
end

function DyWorld_Projectile_2(NAME, DMG, DMGTYPE, TINT)
	local result =
  {
    type = "projectile",
    name = NAME,
    flags = {"not-on-map"},
    collision_box = {{-0.05, -0.25}, {0.05, 0.25}},
    acceleration = 0.05,
    direction_only = true,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "explosion"
          },
          {
            type = "damage",
            damage = {amount = DMG, type = DMGTYPE}
          },
          {
            type = "create-entity",
            entity_name = "small-scorchmark",
            check_buildability = true
          }
        }
      }
    },
    light = {intensity = 0.75, size = 15},
    animation =
    {
      filename = "__base__/graphics/entity/laser/laser-to-tint-medium.png",
      tint = TINT,
      frame_count = 1,
      width = 12,
      height = 33,
      priority = "high",
      blend_mode = "additive"
    },
  }
  return result
end

function DyWorld_Projectile_3(NAME, DMG, DMGTYPE, TINT)
	local result =
  {
    type = "projectile",
    name = NAME,
    flags = {"not-on-map"},
    collision_box = {{-0.05, -0.25}, {0.05, 0.25}},
    acceleration = 0.05,
    direction_only = true,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
       target_effects =
        {
          {
            type = "create-entity",
            entity_name = "laser-bubble"
          },
          {
            type = "damage",
            damage = { amount = DMG, type = DMGTYPE}
          }
        }
      }
    },
    light = {intensity = 0.5, size = 5},
    animation =
    {
      filename = "__base__/graphics/entity/laser/laser-to-tint-medium.png",
      tint = TINT,
      frame_count = 1,
      width = 12,
      height = 33,
      priority = "high",
      blend_mode = "additive"
    },
  }
  return result
end

for k,v in pairs(Data_Table_Projectiles) do
	if v.Projectile_Type == 1 then
	data:extend(
	{
		DyWorld_Projectile_1(v.Name, v.Dmg, v.DmgType, v.Tint)
	})
	elseif v.Projectile_Type == 2 then
	data:extend(
	{
		DyWorld_Projectile_2(v.Name, v.Dmg, v.DmgType, v.Tint)
	})
	elseif v.Projectile_Type == 3 then
	data:extend(
	{
		DyWorld_Projectile_3(v.Name, v.Dmg, v.DmgType, v.Tint)
	})
	end
end