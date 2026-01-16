    BLINDSIDE.Blind({
        key = 'uno',
        atlas = 'bld_blindrank',
        pos = {x = 8, y = 12},
        config = {
            extra = {
                value = 1,
                xmult = 4,
                xmult_up = 2,
                xmult_down = 1,
                xmult_down_up = 0.5,
            }
        },
        hues = {"Red"},
        rare = true,
        calculate = function(self, card, context)
            if context.main_scoring and context.cardarea == G.play then
                return {
                    xmult = math.max(1, card.ability.extra.xmult - (#context.scoring_hand - 1) * card.ability.extra.xmult_down)
                }
            end
        end,
        credit = {
            art = "pangaea47",
            code = "base4",
            concept = "base4"
        },
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.xmult,
                    card.ability.extra.xmult_down
                }
            }
        end,
        upgrade = function(card)
            if not card.ability.extra.upgraded then
                card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_up
                card.ability.extra.xmult_down = card.ability.extra.xmult_down + card.ability.extra.xmult_down_up
                card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
