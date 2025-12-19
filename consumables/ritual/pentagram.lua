SMODS.Consumable {
    key = 'pentagram',
    set = 'bld_obj_ritual',
    atlas = 'bld_consumable',
    config = {
        extra = {
            removed = 2,
            chosen = 5,
        }
    },
    can_use = function (self, card)
        return G.hand and #G.hand.cards > 0
    end,
    pos = {x=0, y=3},
    use = function(self, card, area)
        local chosen_cards = choose_stuff(G.hand.cards, 5, 'pentagram')
        local destroyed_cards = choose_stuff(chosen_cards, 2, 'pentagram')

        destroy_blinds_and_calc(destroyed_cards, card)

        for key, value in pairs(chosen_cards) do
            if tableContains(value, destroyed_cards) then
                table.remove(chosen_cards, key)
            end
        end
        upgrade_blinds(chosen_cards)
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.removed,
                card.ability.extra.chosen - card.ability.extra.removed
            }
        }
    end
}