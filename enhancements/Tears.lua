    BLINDSIDE.Blind({
        key = 'tears',
        atlas = 'bld_blindrank',
        pos = {x = 4, y = 6},
        config = {
            chips = 25,
            extra = {
                value = 11,
                repetitions = 2,
                repetitions_up = 1,
                chips_up = 5,
            }},
        hues = {"Blue"},
        rare = true,
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.repetition and context.other_card and context.other_card == card and context.other_card.facing ~= "back" then
                return {
                    repetitions = card.ability.extra.repetitions
                }
            end
            if context.cardarea == G.play and context.main_scoring then
                return {
                    chips = card.ability.chips
                }
            end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.chips,
                    card.ability.extra.repetitions
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
                card.ability.extra.repetitions = card.ability.extra.repetitions + card.ability.extra.repetitions_up
                card.ability.chips = card.ability.chips + card.ability.extra.chips_up
                card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
