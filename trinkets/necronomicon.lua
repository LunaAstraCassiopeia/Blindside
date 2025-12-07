
    SMODS.Joker({
        key = 'necronomicon',
        atlas = 'bld_trinkets',
        pos = {x = 6, y = 6},
        rarity = 'bld_curio',
        cost = 9,
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
        calculate = function(self, card, context)
            if context.setting_blind and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                SMODS.add_card {set = 'bld_obj_filmcard',}
                                G.GAME.consumeable_buffer = 0
                                return true
                            end
                        }))
                        SMODS.calculate_effect({ message = localize('k_filmcard_ex'), colour = G.C.SECONDARY_SET.bld_obj_filmcard },
                            context.blueprint_card or card)
                        return true
                    end)
                }))
            end
        end
    })