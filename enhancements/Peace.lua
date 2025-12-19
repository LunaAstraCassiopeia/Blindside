    BLINDSIDE.Blind({
        key = 'peace',
        atlas = 'bld_blindrank',
        pos = {x = 7, y = 4},
        config = {
            extra = {
                value = 18,
                chips_mod = 15,
                chips_up = 10,
            }},
        hues = {"Blue"},
        calculate = function(self, card, context) 
            if context.cardarea == G.hand and context.main_scoring then
                return {
                    chips = card.ability.extra.chips_mod * #G.hand.cards
                }
            end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.chips_mod
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.extra.chips_mod = card.ability.extra.chips_mod + card.ability.extra.chips_up
            card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
