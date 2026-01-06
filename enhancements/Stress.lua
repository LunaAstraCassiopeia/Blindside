    BLINDSIDE.Blind({
        key = 'stress',
        atlas = 'bld_blindrank',
        pos = {x = 3, y = 10},
        config = {
            h_x_mult = 0.8,
            extra = {
                value = 30,
                xmult = 1.5,
            }
        },
        hues = {"Purple"},
        curse = true,
        credit = {
            art = "Gud",
            code = "base4",
            concept = "base4"
        },
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.h_x_mult
                }
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
