    BLINDSIDE.Blind({
        key = 'paint',
        atlas = 'bld_blindrank',
        pos = {x = 2, y = 4},
        config = {
            extra = {
                value = 15,
                money = 2,
                money_up = 1,
            }
        },
        hues = {"Yellow"},
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.main_scoring then
                    return {
                        dollars = card.ability.extra.money*#G.GAME.tags
                    }
            end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.money,
                    card.ability.extra.money*#G.GAME.tags
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.extra.money = card.ability.extra.money + card.ability.extra.money_up
            card.ability.extra.upgraded = true
            end
        end
    })
    
----------------------------------------------
------------MOD CODE END----------------------
