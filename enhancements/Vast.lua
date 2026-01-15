    BLINDSIDE.Blind({
        key = 'vast',
        atlas = 'bld_blindrank',
        pos = {x = 0, y = 3},
        config = {
            extra = {
                value = 14,
                repetitions = 1,
                repetitions_up = 1,
            }},
        hues = {"Blue"},
        calculate = function(self, card, context) 
            if context.repetition and context.cardarea == G.hand and card.area == G.hand then
                local self_pos = nil
                for i=1, #G.hand.cards do
                    if G.hand.cards[i] == card then
                        self_pos = i
                    end
                end
                if G.hand.cards[self_pos-1] == context.other_card then
                    return {
                        repetitions = card.ability.extra.repetitions
                    }
                end
                if G.hand.cards[self_pos+1] == context.other_card then
                    return {
                        repetitions = card.ability.extra.repetitions
                    }
                end
            end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                key = card.ability.extra.upgraded and 'm_bld_vast_upgraded' or 'm_bld_vast',
                vars = {
                    card.ability.extra.repetitions
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.extra.repetitions = card.ability.extra.repetitions + card.ability.extra.repetitions_up
            card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
