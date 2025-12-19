SMODS.Consumable {
    key = 'eruption',
    set = 'bld_obj_ritual',
    atlas = 'bld_consumable',
    pos = {x=8, y=3},
    can_use = function (self, card)
        return #G.hand.cards > 0
    end,
    use = function(self, card, area)
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
            print(enhancements[i])
            cards[i] = SMODS.add_card { set = "Base", enhancement = enhancements[i] }
        end
        upgrade_blinds(cards, nil, true)
        SMODS.calculate_context({ playing_card_added = true, cards = cards })
        delay(0.6)

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
        info_queue[#info_queue + 1] = G.P_TAGS['tag_bld_joker']
        return {
            vars = {
                card.ability.max_highlighted
            }
        }
    end
}