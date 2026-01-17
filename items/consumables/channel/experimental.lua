SMODS.Consumable {
    key = 'experimental',
    set = 'bld_obj_filmcard',
    atlas = 'bld_consumable',
    pos = {x=7, y=1},
    config = {
        tags = 1
    },
    use = function(self, card, area)
            G.E_MANAGER:add_event(Event({
            func = (function()
                for i = 1, card.ability.tags do
                add_tag(Tag('tag_bld_reroll'))
                play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                end
                return true
            end),
        }))
        delay(0.6)
    end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_TAGS['tag_bld_reroll']
        return {
            vars = {
                card.ability.tags
            }
        }
    end,
    can_use = function(self, card)
        return true
    end
}