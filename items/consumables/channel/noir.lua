SMODS.Consumable {
    key = 'noir',
    set = 'bld_obj_filmcard',
    atlas = 'bld_consumable',
    pos = {x=7, y=0},
    use = function(self, card, area)
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            if G.consumeables.config.card_limit > #G.consumeables.cards then
                play_sound('timpani')
                SMODS.add_card({ key = G.GAME.last_channel })
                card:juice_up(0.3, 0.5)
            end
            return true end }))
        delay(0.6)
    end,
    loc_vars = function(self, info_queue, card)
        -- This vanilla variable only checks for vanilla Tarots and Planets, you would have to keep track on your own for any custom consumables
        local noir_c = G.GAME.last_channel and G.P_CENTERS[G.GAME.last_channel] or nil
        local last_channel = noir_c and localize { type = 'name_text', key = noir_c.key, set = noir_c.set } or
            localize('k_none')
        local colour = (not noir_c or noir_c.name == 'c_bld_noir') and G.C.RED or G.C.GREEN

        if not (not noir_c or noir_c.name == 'c_bld_noir') then
            info_queue[#info_queue + 1] = noir_c
        end

        local main_end = {
            {
                n = G.UIT.C,
                config = { align = "bm", padding = 0.02 },
                nodes = {
                    {
                        n = G.UIT.C,
                        config = { align = "m", colour = colour, r = 0.05, padding = 0.05 },
                        nodes = {
                            { n = G.UIT.T, config = { text = ' ' .. last_channel .. ' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.3, shadow = true } },
                        }
                    }
                }
            }
        }

        return { vars = { last_channel, colours = { G.C.SECONDARY_SET.bld_obj_filmcard } }, main_end = main_end }
    end,
    can_use = function(self, card)
        return (G.GAME.last_channel and G.GAME.last_channel ~= 'c_bld_noir') and ((#G.consumeables.cards < G.consumeables.config.card_limit or card.area == G.consumeables))
    end
}