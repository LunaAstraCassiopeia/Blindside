    BLINDSIDE.Blind({
        key = 'joy',
        atlas = 'bld_blindrank',
        pos = {x = 5, y = 8},
        config = {
            extra = {
                value = 100,
                chips = 5,
                dollars = 2,
                dollars_gain = -1,
            }},
        hues = {"Blue", "Yellow"},
        rare = true,
        calculate = function(self, card, context) 
            if context.cardarea == G.play and context.main_scoring then
                return {
                    chips = card.ability.extra.chips * math.floor(((G.GAME.dollars or 0) + (G.GAME.dollar_buffer or 0))/card.ability.extra.dollars)
                }
            end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.chips, 
                    card.ability.extra.chips * math.floor(((G.GAME.dollars or 0) + (G.GAME.dollar_buffer or 0))/card.ability.extra.dollars),
                    card.ability.extra.dollars
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.extra.dollars = card.ability.extra.dollars + card.ability.extra.dollars_gain
            card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
