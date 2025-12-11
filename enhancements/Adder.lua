    BLINDSIDE.Blind({
        key = 'adder',
        atlas = 'bld_blindrank',
        pos = {x = 4, y = 0},
        config = {
            extra = {
                value = 1,
                chips = 20,
                chipsup = 20,
            }
        },
        hues = {"Blue"},
        basic = true,
        calculate = function(self, card, context) 
            if context.cardarea == G.play and context.main_scoring then
                return {
                    chips = card.ability.extra.chips
                }
            end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.chips
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipsup
            card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
