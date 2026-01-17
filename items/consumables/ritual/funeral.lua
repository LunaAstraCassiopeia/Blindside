SMODS.Consumable {
    key = 'funeral',
    set = 'bld_obj_ritual',
    atlas = 'bld_consumable',
    config = {
        min_highlighted = 1,
        max_highlighted = 2,
    },
    pos = {x=5, y=3},
    use = function(self, card, area)
        upgrade_blinds(G.hand.highlighted)

        delay(0.6)
        local best_hand, second_best_hand = nil, nil
        local best_tally, second_tally = -1, -1

        for _, v in ipairs(G.handlist) do
            local hand = G.GAME.hands[v]
            if hand.visible then
                local played = hand.played
                if played > best_tally then
                    second_best_hand = best_hand
                    second_tally = best_tally

                    best_hand = v
                    best_tally = played
                elseif played > second_tally then
                    second_best_hand = v
                    second_tally = played
                end
            end
        end

        G.E_MANAGER:add_event(Event({
            func = function ()
                G.bolt_played_hand = best_hand
                add_tag(Tag('tag_bld_debuff'))
                play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                return true
            end
        }))
        --[[G.E_MANAGER:add_event(Event({
            func = function ()
                G.bolt_played_hand = second_best_hand
                add_tag(Tag('tag_bld_debuff'))
                play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                return true
            end
        }))]]
    end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_TAGS['tag_bld_debuff']
        return {
            vars = {
                card.ability.max_highlighted
            }
        }
    end
}