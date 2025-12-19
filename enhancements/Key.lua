    BLINDSIDE.Blind({
        key = 'key',
        atlas = 'bld_blindrank',
        pos = {x = 3, y = 5},
        config = 
            {x_mult = 1.25,
            extra = {
                value = 4,
                x_mult_gain = 0.25,
            }},
        hues = {"Faded"},
        always_scores = true,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.x_mult
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.x_mult = card.ability.x_mult + card.ability.extra.x_mult_gain
            card.ability.extra.upgraded = true
            end
        end
    })
    
----------------------------------------------
------------MOD CODE END----------------------
