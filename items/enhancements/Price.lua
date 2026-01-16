    BLINDSIDE.Blind({
        key = 'price',
        atlas = 'bld_blindrank',
        pos = {x = 8, y = 3},
        config = {
            mult = 10,
            extra = {
                value = 10,
                cost = 2,
                mult_gain = 10,
                cost_gain = 1,
            }},
        hues = {"Yellow"},
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.main_scoring then
                return {
                    dollars = -card.ability.extra.cost
                }
            end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.mult,
                    card.ability.extra.cost
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.extra.cost = card.ability.extra.cost + card.ability.extra.cost_gain
            card.ability.mult = card.ability.mult + card.ability.extra.mult_gain
            card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
