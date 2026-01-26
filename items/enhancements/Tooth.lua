    BLINDSIDE.Blind({
        key = 'tooth',
        atlas = 'bld_blindrank',
        pos = {x = 4, y = 2},
        config = {
            extra = {
                value = 11,
                money = 1,
                mult_per = 5,
            }},
        hues = {"Red"},
        loc_vars = function(self, info_queue, card)
            return {
                key = card.ability.extra.upgraded and 'm_bld_tooth_upgraded' or 'm_bld_tooth',
                vars = {
                    card.ability.extra.money,
                    card.ability.extra.mult_per
                }
            }
        end,
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.main_scoring then
                local dollars = 0
                --[[for i, joker in pairs(G.jokers.cards) do
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.4,
                        func = function()
                            joker:juice_up()
                            card:juice_up(0.6, 0.1)
                            play_sound('coin1', 0.8+ (0.9 + 0.2*math.random())*0.2, 1)
                            G.ROOM.jiggle = G.ROOM.jiggle + 0.7    
                            return true
                        end
                    }))
                    dollars = dollars + card.ability.extra.money
                end]]
                for i, blindcard in pairs(G.play.cards) do
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.3,
                        func = function()
                            blindcard:juice_up()
                            card:juice_up(0.6, 0.1)
                            play_sound('coin1', 0.8 + (0.9 + 0.2*math.random())*0.2, 0.8)
                            G.ROOM.jiggle = G.ROOM.jiggle + 0.7   
                            return true
                        end
                    }))
                    dollars = dollars + card.ability.extra.money
                end
                if card.ability.extra.upgraded then
                    return {
                        mult = card.ability.extra.mult_per*dollars,
                        dollars = dollars,
                        card = card
                    }
                end
                return {
                    dollars = dollars,
                    card = card
                }
            end
            if context.burn_card == card and context.cardarea == G.play then
                return {
                    remove = true,
                }
            end
        end,
        upgrade = function(card)
            if not card.ability.extra.upgraded then
            card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
