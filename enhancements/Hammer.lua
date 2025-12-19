    BLINDSIDE.Blind({
        key = 'hammer',
        atlas = 'bld_blindrank',
        pos = {x = 1, y = 5},
        config = {
            extra = {
                value = 15,
                repetitions = 2,
            }},
        hues = {"Faded"},
        always_scores = true,
        calculate = function(self, card, context) 
            if context.repetition and context.cardarea == G.play and card.area == G.hand and (context.other_card == context.scoring_hand[1] or (card.ability.extra.upgraded and context.other_card == context.scoring_hand[#context.scoring_hand])) then
                return {
                    repetitions = card.ability.extra.repetitions
                }
            end
        end,
        rare = true,
        loc_vars = function(self, info_queue, card)
            return {
                key = card.ability.extra.upgraded and 'm_bld_hammer_upgraded' or 'm_bld_hammer',
                vars = {
                    card.ability.extra.repetitions
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
