    BLINDSIDE.Blind({
        key = 'eye',
        atlas = 'bld_blindrank',
        pos = {x = 9, y = 1},
        config = {
            h_x_chips = 1.75,
            mult = 3,
            extra = {
                value = 12,
                x_chips_up = 0.75,
                mult_up = 2,
            }},
        hues = {"Blue"},
        loc_vars = function(self, info_queue, card)
            return {
                key = card.ability.extra.upgraded and 'm_bld_eye_upgrade' or 'm_bld_eye',
                vars = {
                    card.ability.h_x_chips, card.ability.mult
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.extra.retain = true
            card.ability.h_x_chips = card.ability.h_x_chips + card.ability.extra.x_chips_up
            card.ability.mult = card.ability.mult + card.ability.extra.mult_up
            card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
