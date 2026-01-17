    BLINDSIDE.Blind({
        key = 'pot',
        atlas = 'bld_blindrank',
        pos = {x = 7, y = 2},
        config = {
            extra = {
                money = 1,
                value = 1,
                moneyup = 1,
            }},
        hues = {"Yellow"},
        basic = true,
        calculate = function(self, card, context)
            if (context.cardarea == G.hand or context.cardarea == G.play) and context.main_scoring then
                return {
                    dollars = card.ability.extra.money
                }
            end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.money
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.extra.money = card.ability.extra.money + card.ability.extra.moneyup
            card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
