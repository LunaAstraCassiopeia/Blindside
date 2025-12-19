    BLINDSIDE.Blind({
        key = 'hoard',
        atlas = 'bld_blindrank',
        pos = {x = 8, y = 2},
        config = {
            extra = {
                value = 13,
                mult = 5,
                xmult = 1.5,
                xmult_gain = 0.5,
            }},
        hues = {"Red"},
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.main_scoring then
                if #G.jokers.cards + G.GAME.joker_buffer <= 3 then
                    return {
                        mult = card.ability.extra.mult,
                        xmult = card.ability.extra.xmult
                    }
                else
                    return {
                        mult = card.ability.extra.mult
                    }
                end
            end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.mult, card.ability.extra.xmult
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain
            card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
