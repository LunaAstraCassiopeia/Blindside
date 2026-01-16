    BLINDSIDE.Blind({
        key = 'mark',
        atlas = 'bld_blindrank',
        pos = {x = 5, y = 2},
        config = {
            extra = {
            xmult = 1.5,
                value = 12,
                xmult_gain = 0.5,
                cards_to_hand = {},
                flipped = true,
            }},
        hues = {"Red"},
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.xmult
                }
            }
        end,
        calculate = function(self, card, context)
            if context.main_scoring and (context.cardarea == G.play or context.cardarea == G.hand) then
                return {
                    xmult = card.ability.extra.xmult
                }
            end
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain
            card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
