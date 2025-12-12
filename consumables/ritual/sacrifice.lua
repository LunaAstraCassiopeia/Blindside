SMODS.Consumable {
    key = 'sacrifice',
    set = 'bld_obj_ritual',
    atlas = 'bld_consumable',
    config = {
        extra = {
            removed = 4,
            cash = 10,
        }
    },
    can_use = function (self, card)
        return G.hand and #G.hand.cards > 0
    end,
    pos = {x=1, y=0},
    use = function(self, card, area)
        local destroyed_cards = choose_stuff(G.hand.cards, 4, 'sacrifice')
        destroy_blinds_and_calc(destroyed_cards, card)
        ease_dollars(card.ability.extra.cash)
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.removed,
                card.ability.extra.cash
            }
        }
    end
}