    BLINDSIDE.Blind({
        key = 'serpent',
        atlas = 'bld_blindrank',
        pos = {x = 7, y = 1},
        config = {
            extra = {
                value = 12,
                draw_extra = 3,
                draw_extra_more = 2,
            }},
        hues = {"Green"},
        always_scores = true,
        calculate = function(self, card, context)
                if context.cardarea == G.play and context.after and card.facing ~= 'back' then
                    G.E_MANAGER:add_event(Event({
                        blocking = false,
                        func = function()
                            if G.STATE == G.STATES.SELECTING_HAND then
                                G.FUNCS.blind_draw_from_deck_to_hand(card.ability.extra.draw_extra)
                                return true
                            end
                        end
                    }))
                end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.draw_extra
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.extra.draw_extra = card.ability.extra.draw_extra + card.ability.extra.draw_extra_more
            card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
