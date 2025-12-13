    SMODS.Enhancement({
        key = 'tooth',
        atlas = 'bld_blindrank',
        pos = {x = 4, y = 2},
        config = {
            extra = {
                value = 11,
                money = 1,
                mult_per = 2,
                hues = {"Red"}
            }},
        replace_base_card = true,
        no_rank = true,
        no_suit = true,
        always_scores = false,
        overrides_base_rank = true,
        in_pool = function(self, args)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
                return true
            else
            return false
            end
        end,
        pools = {
            ["bld_obj_blindcard_generate"] = true,
            ["bld_obj_blindcard_warm"] = true,
            ["bld_obj_blindcard_single"] = true,
            ["bld_obj_blindcard_red"] = true,
        },
        loc_vars = function(self, info_queue, card)
            return {
                key = card.ability.extra.upgraded and 'm_bld_tooth_upgraded' or 'm_bld_tooth',
                vars = {
                    card.ability.extra.money
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
        end,
        upgrade = function(card)
            if not card.ability.extra.upgraded then
            card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
