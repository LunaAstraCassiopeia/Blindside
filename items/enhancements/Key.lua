    BLINDSIDE.Blind({
        key = 'key',
        atlas = 'bld_blindrank',
        pos = {x = 3, y = 5},
        config = 
            {x_mult = 1.2,
            extra = {
                value = 4,
                retriggers = 1,
                x_mult_gain = 0.3,
            }},
        hues = {"Faded"},
        always_scores = true,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.x_mult,
                    card.ability.extra.retriggers
                }
            }
        end,
        calculate = function(self, card, context)
            if context.repetition and card.facing ~= 'back' and context.other_card and context.other_card == card and context.other_card.ability.extra.rescore ~= 1 then
                return {
                    repetitions = card.ability.extra.retriggers
                }
            end
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
