SMODS.Tag {
    key = "mining",
    hide_ability = false,
    atlas = 'bld_tag',
    pos = {x = 5, y = 2},
        in_pool = function(self, args)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
                return true
            else
            return false
            end
        end,
    apply = function(self, tag, context)
        if context.type == 'immediate'  then
            tag:yep('+', G.C.bld_hobby, function()
                return true
            end)
                local _poker_hands = {}
                local random_hands = {}
                for _, k in ipairs(G.handlist) do
                    local v = G.GAME.hands[k]
                    if v.visible then _poker_hands[#_poker_hands+1] = k end
                end
                for i=1, 3 do
                    local random_hand = pseudorandom_element(_poker_hands, pseudoseed('mining')) or "High Card"
                    table.insert(random_hands,random_hand)
                    for i = #_poker_hands, 1, -1 do  
                        if _poker_hands[i] == random_hand then
                        table.remove(_poker_hands, i)
                        end
                    end
                end
            local levels = 1
            update_hand_text({sound = 'button',volume = 0.7,pitch = 0.8,delay = 0.3}, {
                handname = localize('bld_3_hands'),
                chips = "...",
                mult = "...",
                level = "..."
            })
            for i = 1, #random_hands do
                level_up_hand(nil, random_hands[i], true, levels)

            end
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    play_sound('tarot1')
                    G.TAROT_INTERRUPT_PULSE = true
                    return true
                end
            }))
            update_hand_text({delay = 0}, {mult = "+",StatusText = true})
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.9,
                func = function()
                    play_sound('tarot1')
                    return true
                end
            }))
            update_hand_text({delay = 0}, {chips = "+",StatusText = true})
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.9,
                func = function()
                    play_sound('tarot1')
                    G.TAROT_INTERRUPT_PULSE = nil
                    return true
                end
            }))
            update_hand_text({sound = 'button',volume = 0.7,pitch = 0.9,delay = 0}, {level = "+" .. levels})
            delay(1.3)
            update_hand_text({sound = 'button',volume = 0.7,pitch = 1.1,delay = 0}, {mult = 0,chips = 0,handname = '',level = ''})
            tag.triggered = true
            return true
        end
    end,
}