    BLINDSIDE.Blind({
        key = 'amber_acorn',
        atlas = 'bld_blindrank',
        pos = {x = 4, y = 12},
        config = {
            extra = {
                value = 1,
                xchips = 1,
                xchips_increase = 0.1,
                xchipsup = 0.1,
            }
        },
        hues = {"Yellow"},
        hidden = true,
        legendary = true,
        calculate = function(self, card, context) 
            if context.cardarea == G.play and context.main_scoring then
                local step = 0
                for i, held_card in pairs(G.hand.cards) do
                    local stored_step = step
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
                            play_sound('chips1', 0.8 + (stored_step * 0.02))
                            card:juice_up()
                            G.ROOM.jiggle = G.ROOM.jiggle + 0.7    
                            return true
                        end
                    }))
                    step = step + 5
                end
                card.ability.extra.xchips = card.ability.extra.xchips + card.ability.extra.xchips_increase * #G.hand.cards
                return {
                    xchips = card.ability.extra.xchips,
                }
            end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.xchips,
                    card.ability.extra.xchips_increase
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.extra.xchips_increase = card.ability.extra.xchips_increase + card.ability.extra.xchipsup
            card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
