    BLINDSIDE.Blind({
        key = 'rich',
        atlas = 'bld_blindrank',
        pos = {x = 5, y = 7},
        config = {
            extra = {
                money = 1,
                value = 999,
                moneyup = 1,
                mult = 2,
                multup = 1,
            }},
        hues = {"Yellow"},
        rare = true,
        credit = {
            art = "Gappie",
            code = "base4",
            concept = "base4"
        },
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.main_scoring then
                local yellows = {}
                for key, value in pairs(context.scoring_hand) do
                    if value:is_color("Yellow") and value ~= card then
                        table.insert(yellows, value)
                    end
                end
                for key, value in pairs(yellows) do
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.3,
                        func = function()
                            value:juice_up()
                            card:juice_up(0.6, 0.1)
                            play_sound('coin1', 0.8 + (0.9 + 0.2*math.random())*0.2, 0.8)
                            G.ROOM.jiggle = G.ROOM.jiggle + 0.7
                            return true
                        end
                    }))
                end
                return {
                    dollars = card.ability.extra.money * 2 ^ #yellows,
                    mult = card.ability.extra.mult * 2 ^ #yellows,
                }
            end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.money,
                    card.ability.extra.mult
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.extra.money = card.ability.extra.money + card.ability.extra.moneyup
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.multup
            card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
