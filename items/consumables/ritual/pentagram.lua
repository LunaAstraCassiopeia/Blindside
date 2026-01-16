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
        local destroyed_cards = choose_stuff(G.hand.cards, 2, 'pentagram')

        local enhancements = {}

        local args = {}
        args.guaranteed = true
        args.options = G.P_CENTER_POOLS.bld_obj_blindcard_generate
        for i = 1, 3, 1 do
            local enhancement = BLINDSIDE.poll_enhancement(args)
            enhancements[i] = enhancement
        end

        local cards = {}
        for i = 1, 3 do
            cards[i] = SMODS.add_card { set = "Base", enhancement = enhancements[i] }
        end
        upgrade_blinds(cards, nil, true)
        SMODS.calculate_context({ playing_card_added = true, cards = cards })
        delay(0.6)

        destroy_blinds_and_calc(destroyed_cards, card)
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