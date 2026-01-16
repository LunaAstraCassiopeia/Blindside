local gameMainMenuRef = Game.main_menu
function Game:main_menu(change_context)
    gameMainMenuRef(self, change_context)
    UIBox({
        definition = {
            n = G.UIT.ROOT,
            config = {
                align = "cm",
                colour = G.C.UI.TRANSPARENT_DARK
            },
            nodes = {
                {
                    n = G.UIT.T,
                    config = {
                        scale = 0.3,
                        text = "Blindside BETA v0.1.2",
                        colour = G.C.UI.TEXT_LIGHT
                    }
                }
            }
        },
        config = {
            align = "tri",
            bond = "Weak",
            offset = {
                x = 0,
                y = 0.6
            },
            major = G.ROOM_ATTACH
        }
    })
    G.SETTINGS.tutorial_complete = true
end

--PROPERLY COMPRESS TAGS
local at = add_tag
function add_tag(tag)
	at(tag)
	-- Update Costs for Clone Tag
	if tag.name == "cry-Clone Tag" then
		for k, v in pairs(G.I.CARD) do
			if v.set_cost then
				v:set_cost()
			end
		end
	end
	-- Make tags fit if there's more than 13 of them
	-- This + Tag.remove Hook modify the offset to squeeze in more tags when needed
	if #G.HUD_tags > 13 then
		for i = 2, #G.HUD_tags do
			G.HUD_tags[i].config.offset.y = 0.9 - 0.9 * 13 / #G.HUD_tags
		end
	end
end

local tr = Tag.remove
function Tag:remove()
	tr(self)
	if #G.HUD_tags >= 13 then
		for i = 2, #G.HUD_tags do
			G.HUD_tags[i].config.offset.y = 0.9 - 0.9 * 13 / #G.HUD_tags
		end
	end
end
