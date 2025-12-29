    BLINDSIDE.Blind({
        key = 'adder',
        atlas = 'bld_blindrank',
        pos = {x = 4, y = 0},
        config = {
            extra = {
                value = 1,
                chips = 25,
                xchips = 1.25,
                chipsup = 25,
            }
        },
        hues = {"Blue"},
        basic = true,
        calculate = function(self, card, context) 
            if context.cardarea == G.play and context.main_scoring then
                if card.ability.extra.upgraded then
                    return {
                        chips = card.ability.extra.chips,
                        xchips = card.ability.extra.xchips
                    }
                else
                    return {
                        chips = card.ability.extra.chips
                    }
                end
                
            end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                key = card.ability.extra.upgraded and 'm_bld_adder_upgraded' or 'm_bld_adder',
                vars = {
                    card.ability.extra.chips,
                    card.ability.extra.xchips
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
