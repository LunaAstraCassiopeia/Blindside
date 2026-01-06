    BLINDSIDE.Blind({
        key = 'bank',
        atlas = 'bld_blindrank',
        pos = {x = 0, y = 11},
        config = {
            extra = {
                value = 16,
                xmult = 0.25,
                xmult_up = 0.25,
                dollars_per = 8,
                dollars = -3
            }
        },
        credit = {
            art = "pangaea47",
            code = "base4",
            concept = "base4"
        },
        hues = {"Yellow"},
        rare = true,
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.main_scoring then
                return {
                    xmult = 1 + math.floor(G.GAME.dollars/card.ability.extra.dollars_per) * card.ability.extra.xmult,
                    dollars = card.ability.extra.dollars
                }
            end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.xmult,
                    card.ability.extra.dollars_per,
                    1 + math.floor(G.GAME.dollars/card.ability.extra.dollars_per) * card.ability.extra.xmult,
                    -card.ability.extra.dollars
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
