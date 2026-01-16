
    SMODS.Joker({
        key = 'microchip',
        atlas = 'bld_trinkets',
        pos = {x = 4, y = 5},
        rarity = 'bld_doodad',
        cost = 8,
        blueprint_compat = true,
        eternal_compat = true,
        in_pool = function(self, args)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
                return true
            else
            return false
            end
        end,
        credit = {
            art = "AstraLuna",
            code = "AstraLuna",
            concept = "AstraLuna"
        },
        calculate = function(self, card, context)
            if context.setting_blind then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after', delay = 0.4,
                    func = (function()
                        add_tag(Tag('tag_bld_recursive'))
                        play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                        play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                        return true
                    end)
                }))
            end
        end,
        loc_vars = function (self, info_queue, card)
            info_queue[#info_queue+1] = G.P_TAGS['tag_bld_recursive']
        end
    })