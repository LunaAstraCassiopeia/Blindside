    BLINDSIDE.Blind({
        key = 'fish',
        atlas = 'bld_blindrank',
        pos = {x = 7, y = 0},
        config = {
            extra = {
                value = 10,
                chips_gain = 0.5,
                chipsup = 0.5,
            }},
        hues = {"Blue"},
        rare = true,
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.main_scoring then
            local chip_return = 1
            local step = 0
            for i, held_card in pairs(G.hand.cards) do
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.4,
                        func = function()
                            held_card:juice_up()
                            held_card:flip()
                            if not held_card.ability.extra then
                                held_card.ability.extra = {temp_flipped = true}
                            else
                                if held_card.ability.extra.temp_flipped then
                                    held_card.ability.extra.temp_flipped = false
                                else
                                    held_card.ability.extra.temp_flipped = true
                                end
                            end
                            play_sound('chips1', 0.8 + (step * 0.05))
                            card:juice_up()
                            G.ROOM.jiggle = G.ROOM.jiggle + 0.7    
                            return true
                        end
                    }))
                step = step + 5
                chip_return = chip_return + card.ability.extra.chips_gain
            end
            return {
                xchips = chip_return
            }            
            end
            if context.cardarea == G.play and context.after then
                card.ability.chips = 0
            end
            --if context.burn_card and context.cardarea == G.play and context.burn_card == card and context.burn_card.facing ~= 'back' then
            --    return { remove = true }
            --end
        end,
        loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {key = 'bld_burn', set = 'Other'}
            return {
                vars = {
                    card.ability.extra.chips_gain
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.extra.chips_gain = card.ability.extra.chips_gain + card.ability.extra.chipsup
            card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
