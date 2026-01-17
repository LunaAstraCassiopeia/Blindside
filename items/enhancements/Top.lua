    BLINDSIDE.Blind({
        key = 'top',
        atlas = 'bld_blindrank',
        pos = {x = 4, y = 8},
        config = {
            extra = {
                value = 100,
                chips_gain = 5,
                chips_gain_gain = 5,
                chip_return = 0,
                chips = 0,
            }},
        hues = {"Blue", "Purple"},
        rare = true,
        -- Thank you Ortalab
        calculate = function(self, card, context)
            if context.before and context.cardarea == G.play and card.facing ~= 'back'  then
            local chip_return = 0
            local step = 0
            for i, held_card in pairs(G.hand.cards) do
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.3,
                        func = function()
                            held_card:juice_up()
                            held_card:flip()
                            held_card:flip()
                            play_sound('chips1', 0.8 + (step * 0.05))
                            card:juice_up()
                            return true
                        end
                    }))
                step = step + 5
                chip_return = chip_return + card.ability.extra.chips_gain
            end
                card.ability.extra.chip_return = chip_return
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "chips",
                    scalar_value = "chip_return",
                    operation = '+',
                    message_colour = G.C.BLUE
                })
            end
            if context.cardarea == G.play and context.main_scoring then
                return {
                    chips = card.ability.extra.chips
                }
            end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.chips_gain,card.ability.extra.chips
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.extra.chips_gain = card.ability.extra.chips_gain + card.ability.extra.chips_gain_gain
            card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
