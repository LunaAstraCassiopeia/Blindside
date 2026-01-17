SMODS.Consumable {
    key = 'superhero',
    set = 'bld_obj_filmcard',
    atlas = 'bld_consumable',
    pos = {x=6, y=0},
    config = {
        max_highlighted = 1,
        extra = 1
    },
    use = function(self, card, area)
        G.E_MANAGER:add_event(Event({
            func = function()
                local _first_dissolve = nil
                local new_cards = {}
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                local _card = copy_card(G.hand.highlighted[1], nil, nil, G.playing_card)
                _card:add_to_deck()
                G.deck.config.card_limit = G.deck.config.card_limit + 1
                table.insert(G.playing_cards, _card)
                G.hand:emplace(_card)
                _card:start_materialize(nil, _first_dissolve)
                _first_dissolve = true
                new_cards[#new_cards+1] = _card
                SMODS.calculate_context({ playing_card_added = true, cards = new_cards })
                return true
            end
        })) 
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra
            }
        }
    end,
}