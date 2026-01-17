SMODS.Consumable {
    key = 'prayer',
    set = 'bld_obj_ritual',
    atlas = 'bld_consumable',
    pos = {x=4, y=3},
    config = {
        min_highlighted = 1,
        max_highlighted = 1,
    },
    use = function(self, card, area)
        upgrade_blinds({G.hand.highlighted[1]})
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.max_highlighted
            }
        }
    end
}