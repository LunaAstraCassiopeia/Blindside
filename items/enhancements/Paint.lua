    BLINDSIDE.Blind({
        key = 'paint',
        atlas = 'bld_blindrank',
        pos = {x = 2, y = 4},
        config = {
            extra = {
                value = 15,
                base_money = 2,
                base_moneyup = 6,
                money = 1,
            }
        },
        hues = {"Yellow"},
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.main_scoring then
                local num = 0
                for key, tag in pairs(G.GAME.tags) do
                    if not (tag.config and tag.config.relic) then
                        num = num + 1
                    end
                end
                return {
                    dollars = card.ability.extra.money*num + card.ability.extra.base_money
                }
            end
        end,
        loc_vars = function(self, info_queue, card)
            local num = 0
            for key, tag in pairs(G.GAME.tags) do
                if not (tag.config and tag.config.relic) then
                    num = num + 1
                end
            end
            return {
                vars = {
                    card.ability.extra.money,
                    card.ability.extra.money*num + card.ability.extra.base_money,
                    card.ability.extra.base_money
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.extra.base_money = card.ability.extra.base_money + card.ability.extra.base_moneyup
            card.ability.extra.upgraded = true
            end
        end
    })
    
----------------------------------------------
------------MOD CODE END----------------------
