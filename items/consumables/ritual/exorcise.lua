SMODS.Consumable {
    key = 'exorcise',
    set = 'bld_obj_ritual',
    atlas = 'bld_consumable',
    pos = {x=1, y=4},
    config = {
        min_highlighted = 1,
        max_highlighted = 3,
    },
    can_use = function (self, card)
        return #G.hand.highlighted > 1 and #G.hand.highlighted <= 3 and #G.jokers.cards >= 1
    end,
    use = function(self, card, area)
        upgrade_blinds(G.hand.highlighted)

        local destroy = pseudorandom_element(G.jokers.cards, pseudoseed('exorcise'))
        G.E_MANAGER:add_event(Event({
            trigger = "before",
            delay = 1,
            func = function ()
                destroy:juice_up()
                card_eval_status_text(destroy, 'extra', nil, nil, nil, {message = localize('k_exorcised_ex'), color = G.C.PURPLE})
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            func = function ()
                destroy:start_dissolve()
                return true
            end
        }))
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.max_highlighted
            }
        }
    end
}