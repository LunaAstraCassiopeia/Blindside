    BLINDSIDE.Blind({
        key = 'way',
        atlas = 'bld_blindrank',
        pos = {x = 5, y = 6},
        config = {
            extra = {
                value = 12,
                x_chips = 1.75,
                chips = -25,
                x_chips_up = 0.75,
                chips_up = -25,
            }},
        always_scores = true,
        hues = {"Purple"},
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.chips,
                    card.ability.extra.x_chips
                }
            }
        end,
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.main_scoring then
                return {
                    chips = math.min(card.ability.extra.chips, hand_chips),
                    xchips = card.ability.extra.x_chips
                }
            end
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_up
            card.ability.extra.x_chips = card.ability.extra.x_chips + card.ability.extra.x_chips_up
            card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
