
    SMODS.Joker({
        key = 'doubloon',
        atlas = 'bld_trinkets',
        pos = {x = 4, y = 1},
        rarity = 'bld_curio',
        cost = 10,
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
        loc_vars = function (self, info_queue, card)
            info_queue[#info_queue+1] = G.P_TAGS['tag_bld_symmetry']
        end,
        calculate = function(self, card, context)
            if context.setting_blind then
                if context.setting_blind then
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after', delay = 0.4,
                        func = (function()
                            add_tag(Tag('tag_bld_symmetry'))
                            play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                            play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                            return true
                        end)
                    }))

                    return {
                        message = localize('k_tagged_ex')
                    }
                end
            end
        end
    })