    BLINDSIDE.Blind({
        key = 'mouth',
        atlas = 'bld_blindrank',
        pos = {x = 0, y = 2},
        config = {
            extra = {
                xmult = 1.75,
                xmult_up = 0.75,
                value = 13,
            }},
        hues = {"Purple"},
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.main_scoring then
                if G.GAME.hands[context.scoring_name] and G.GAME.hands[context.scoring_name].played_this_round > 1 then
                return {
                    xmult = card.ability.extra.xmult
                }
            else
                            if card.facing ~= 'back' then 
                            card:flip()
                            end
                return {
                    message = localize('k_nope_ex'),
                    colour = G.C.RED
                }
            end
            else
            end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.xmult
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_up
            card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
