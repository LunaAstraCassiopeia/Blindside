SMODS.Consumable {
    key = 'banish',
    set = 'bld_obj_ritual',
    atlas = 'bld_consumable',
    pos = {x=2, y=3},
    use = function(self, card, area)
        G.E_MANAGER:add_event(Event({
            func = (function()
                add_tag(Tag('tag_bld_imprisonment'))
                play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                return true
            end),
        }))
        delay(0.6)
    end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_TAGS['tag_bld_imprisonment']
    end,
    can_use = function(self, card)
        return true
    end
}