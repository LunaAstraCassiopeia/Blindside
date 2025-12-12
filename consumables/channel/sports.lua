SMODS.Consumable {
    key = 'sports',
    set = 'bld_obj_filmcard',
    atlas = 'bld_consumable',
    pos = {x=9, y=1},
    config = {
        max_highlighted = 3
    },
    use = function(self, card, area)
        enhancements = {}
        for i = 1, 3, 1 do
            enhancements[i] = pseudorandom_element(SMODS.ObjectTypes.bld_obj_enhancements.enhancements, 'booster')
        end
        for i=1, #G.hand.highlighted do
            local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.highlighted[i]:flip();play_sound('card1', percent);G.hand.highlighted[i]:juice_up(0.3, 0.3);return true end }))
        end
        for i=1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function() G.hand.highlighted[i]:set_seal(enhancements[i], nil, true);return true end }))
        end 
        for i=1, #G.hand.highlighted do
            local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.highlighted[i]:flip();play_sound('tarot2', percent, 0.6);G.hand.highlighted[i]:juice_up(0.3, 0.3);return true end }))
        end
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end }))
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.max_highlighted
            }
        }
    end,
}