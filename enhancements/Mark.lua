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
        always_scores = true,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.xmult
                }
            }
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
