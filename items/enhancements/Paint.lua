    BLINDSIDE.Blind({
        key = 'paint',
        atlas = 'bld_blindrank',
        pos = {x = 2, y = 4},
        config = {
            extra = {
                value = 15,
                money = 3,
            }
        },
        hues = {"Yellow"},
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.main_scoring then
                local num
                for k, v in pairs(G.GAME.tags) do
                    if not BLINDSIDE.is_relic(v.key) then
                        num = num + 1
                    end
                end
                if card.ability.extra.upgraded then
                    num = num*2
                end
                return {
                    dollars = card.ability.extra.money + num
                }
            end
        end,
        loc_vars = function(self, info_queue, card)
            local num
                for k, v in pairs(G.GAME.tags) do
                    if not BLINDSIDE.is_relic(v.key) then
                        num = num + 1
                    end
                end
                if card.ability.extra.upgraded then
                    num = num*2
                end
            return {
                key = card.ability.extra.upgraded and 'm_bld_paint_upgraded' or 'm_bld_paint',
                vars = {
                    card.ability.extra.money,
                    card.ability.extra.money + num
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.extra.upgraded = true
            end
        end
    })
    
----------------------------------------------
------------MOD CODE END----------------------
