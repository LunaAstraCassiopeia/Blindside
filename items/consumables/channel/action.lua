SMODS.Consumable {
    key = 'action',
    set = 'bld_obj_filmcard',
    atlas = 'bld_consumable',
    pos = {x=1, y=0},
    config = {
        max_highlighted = 1,
    },
    use = function(self, card, area)
        local destroyed_cards = {}
        for i=#G.hand.highlighted, 1, -1 do
            destroyed_cards[#destroyed_cards+1] = G.hand.highlighted[i]
        end
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
            card:juice_up(0.3, 0.5)
            return true end }))
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function() 
                for i=#G.hand.highlighted, 1, -1 do
                    local card = G.hand.highlighted[i]
                    if card.ability.name == 'Glass Card' then 
                        card:shatter()
                    else
                        card:start_dissolve(nil, i == #G.hand.highlighted)
                    end
                end
                return true end }))
        delay(0.3)
        for i = 1, #G.jokers.cards do
            G.jokers.cards[i]:calculate_joker({remove_playing_cards = true, removed = destroyed_cards})
        end

    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.max_highlighted
            }
        }
    end
}