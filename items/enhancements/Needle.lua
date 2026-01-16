    BLINDSIDE.Blind({
        key = 'needle',
        atlas = 'bld_blindrank',
        pos = {x = 2, y = 2},
        config = {
            extra = {
                value = 13,
                x_mult = 2,
                x_mult_up = 1,
                mult = 5,
                active = false,
            }},
        hues = {"Green"},
        calculate = function(self, card, context)
                if context.first_hand_drawn then
                    local eval = function() return G.GAME.current_round.hands_played == 0 end
                    juice_card_until(card, eval, true)
                end
                if context.cardarea == G.play and context.main_scoring and G.GAME.current_round.hands_played == 0 then
                            return {
                                xmult = card.ability.extra.x_mult
                            }
                end
                if context.cardarea == G.play and context.main_scoring and G.GAME.current_round.hands_played ~= 0 then
                            return {
                                mult = card.ability.extra.mult
                            }
                end
            if context.burn_card and context.cardarea == G.play and context.burn_card == card and G.GAME.current_round.hands_played ~= 0 then
                return { remove = true }
            end
        end,
        loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {key = 'bld_burn', set = 'Other'}
            return {
                key = (G.GAME.current_round.hands_played == 0 or G.STATE == G.STATES.SHOP) and 'm_bld_needle' or 'm_bld_needle_inactive',
                vars = {
                    card.ability.extra.x_mult, card.ability.extra.mult
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.x_mult_up
            card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
