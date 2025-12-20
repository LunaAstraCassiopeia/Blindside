SMODS.Consumable {
    key = 'eruption',
    set = 'bld_obj_ritual',
    atlas = 'bld_consumable',
    pos = {x=8, y=3},
    can_use = function (self, card)
        return #G.hand.cards > 0
    end,
    config = {
        extra = {
            upgrade = 2
        }
    },
    use = function(self, card, area)
        local chosen_cards = choose_stuff(G.hand.cards, card.ability.extra.upgrade, 'eruption')
        upgrade_blinds(chosen_cards, nil, true)

        G.E_MANAGER:add_event(Event({
            func = function ()
                add_tag(Tag('tag_bld_mantle'))
                play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                return true
            end
        }))
    end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_TAGS['tag_bld_mantle']
        return {
            vars = {
                card.ability.extra.upgrade
            }
        }
    end
}