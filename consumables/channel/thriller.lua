SMODS.Consumable {
    key = 'thriller',
    set = 'bld_obj_filmcard',
    atlas = 'bld_consumable',
    pos = {x=6, y=1},
    config = {
        max_highlighted = 1,
        extra = 1
    },
    use = function(self, card, area)
        local enhancement = nil
        local card = G.hand.highlighted[1]
        local color = card:get_color()
        if color == "Red" then
            SMODS.ObjectTypes.bld_obj_blindcard_red:delete_card(G.hand.highlighted[1].config.center)
            enhancement = pseudorandom_element(G.P_CENTER_POOLS.bld_obj_blindcard_red, 'thriller')
            SMODS.ObjectTypes.bld_obj_blindcard_red:inject_card(G.hand.highlighted[1].config.center)
        elseif color == "Blue" then
            SMODS.ObjectTypes.bld_obj_blindcard_blue:delete_card(G.hand.highlighted[1].config.center)
            enhancement = pseudorandom_element(G.P_CENTER_POOLS.bld_obj_blindcard_blue, 'thriller')
            SMODS.ObjectTypes.bld_obj_blindcard_blue:inject_card(G.hand.highlighted[1].config.center)
        elseif color == "Green" then
            SMODS.ObjectTypes.bld_obj_blindcard_green:delete_card(G.hand.highlighted[1].config.center)
            enhancement = pseudorandom_element(G.P_CENTER_POOLS.bld_obj_blindcard_green, 'thriller')
            SMODS.ObjectTypes.bld_obj_blindcard_green:inject_card(G.hand.highlighted[1].config.center)
        elseif color == "Yellow" then
            SMODS.ObjectTypes.bld_obj_blindcard_yellow:delete_card(G.hand.highlighted[1].config.center)
            enhancement = pseudorandom_element(G.P_CENTER_POOLS.bld_obj_blindcard_yellow, 'thriller')
            SMODS.ObjectTypes.bld_obj_blindcard_yellow:inject_card(G.hand.highlighted[1].config.center)
        elseif color == "Purple" then
            SMODS.ObjectTypes.bld_obj_blindcard_purple:delete_card(G.hand.highlighted[1].config.center)
            enhancement = pseudorandom_element(G.P_CENTER_POOLS.bld_obj_blindcard_purple, 'thriller')
            SMODS.ObjectTypes.bld_obj_blindcard_purple:inject_card(G.hand.highlighted[1].config.center)
        else
            SMODS.ObjectTypes.bld_obj_blindcard_faded:delete_card(G.hand.highlighted[1].config.center)
            enhancement = pseudorandom_element(G.P_CENTER_POOLS.bld_obj_blindcard_faded, 'thriller')
            SMODS.ObjectTypes.bld_obj_blindcard_faded:inject_card(G.hand.highlighted[1].config.center)
        end
        for i=1, #G.hand.highlighted do
            local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.3,func = function() G.hand.highlighted[i]:flip();play_sound('card1', percent);G.hand.highlighted[i]:juice_up(0.3, 0.3);return true end }))
        end
        for i=1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.2,func = function()
                G.hand.highlighted[i]:set_ability(enhancement)
                if G.hand.highlighted[i].ability.extra.upgraded then
                    G.hand.highlighted[i].ability.extra.upgraded = false
                    G.hand.highlighted[i]:upgrade(G.hand.highlighted[i])
                end
                ;return true end }))
        end 
        for i=1, #G.hand.highlighted do
            local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.3,func = function() G.hand.highlighted[i]:flip();play_sound('tarot2', percent, 0.6);G.hand.highlighted[i]:juice_up(0.3, 0.3);return true end }))
        end
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end }))
        delay(0.5)
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.max_highlighted
            }
        }
    end,
}