SMODS.Consumable {
    key = 'crime',
    set = 'bld_obj_filmcard',
    atlas = 'bld_consumable',
    pos = {x=5, y=1},
    config = {
        min_highlighted = 1,
        max_highlighted = 1,
    },
    use = function(self, card, area)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.hand.highlighted[1]:juice_up(0.8, 0.8)
                local seal = G.hand.highlighted[1].seal
                local edition = G.hand.highlighted[1].edition

                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.hand.highlighted[1]:set_seal(nil)
                        G.hand.highlighted[1]:set_edition(nil)
                        return true
                    end
                }))
                local cards_to_select = {}
                for k, v in pairs(G.hand.cards) do
                    if not (v == G.hand.highlighted[1]) then
                        table.insert(cards_to_select, v)
                    end
                end
                local cards = choose_stuff(cards_to_select, 2, 'crime')
                if seal then
                    for key, i in pairs(cards) do
                        local hand_card = i
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                hand_card:juice_up(0.4, 0.4)
                                hand_card:set_seal(seal)
                                return true
                            end
                        }))
                    end
                end
                if edition then
                    for key, i in pairs(cards) do
                        local hand_card = i
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                hand_card:set_edition(edition)
                                return true
                            end
                        }))
                    end
                end
                return true
            end
        })) 
        delay(0.3)
    end,
    can_use = function(self, card)
        if card.ability.consumeable.max_highlighted == #G.hand.highlighted then
            if G.hand.highlighted[1].seal or G.hand.highlighted[1].edition then
                return true
            end
        end
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.max_highlighted
            }
        }
    end,
}