    BLINDSIDE.Blind({
        key = 'square',
        atlas = 'bld_blindrank',
        pos = {x = 7, y = 12},
        config = {
            extra = {
                value = 1,
                xmult = 2,
                xmult_up = 1,
            }
        },
        hues = {"Red"},
        rare = true,
        calculate = function(self, card, context)
            if context.main_scoring and context.cardarea == G.play and #context.scoring_hand == 4 then
                return {
                    xmult = card.ability.extra.xmult
                }
            end
        end,
        credit = {
            art = "TarkanTheDragonBird",
            code = "base4",
            concept = "TarkanTheDragonBird"
        },
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
