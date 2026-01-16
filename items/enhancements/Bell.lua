    BLINDSIDE.Blind({
        key = 'bell',
        atlas = 'bld_blindrank',
        pos = {x = 6, y = 4},
        config = {
            extra = {
                value = 16,
            }
        },
        replace_base_card = true,
        no_rank = true,
        no_suit = true,
        hues = {"Green"},
        overrides_base_rank = true,
        in_pool = function(self, args)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
                return true
            else
            return false
            end
        end,
        calculate = function(self, card, context)
            if context.discard and context.main_eval and context.other_card == card and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.0,
                    func = function()
                        SMODS.add_card({ set = 'bld_obj_filmcard' })
                        G.GAME.consumeable_buffer = 0
                        return true
                    end
                }))
                return { message = localize('k_filmcard_ex'), colour = G.C.SECONDARY_SET.bld_obj_filmcard, burn = not card.ability.extra.upgraded }
            end
        end,
        loc_vars = function(self, info_queue, card)
            if not card.ability.extra.upgraded then
                info_queue[#info_queue+1] = {key = 'bld_burn', set = 'Other'}
            end
            return {
                key = card.ability.extra.upgraded and 'm_bld_bell_upgraded' or 'm_bld_bell',
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.extra.upgraded = true
            end
        end
    })
    
----------------------------------------------
------------MOD CODE END----------------------
