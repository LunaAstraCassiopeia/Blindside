SMODS.Tag {
    key = "cannonball_relic",
    config = {
        relic = true
    },
    hide_ability = false,
    atlas = 'bld_relic',
    pos = {x = 5, y = 1},
    in_pool = function(self, args)
        return false
    end,
    loc_vars = function (self, info_queue, tag)
        info_queue[#info_queue+1] = G.P_TAGS['tag_bld_toss']
    end,
    apply = function (self, tag, context)
        if context.type == 'shop_start' and G.GAME.last_blind then
            G.E_MANAGER:add_event(Event({
                trigger = 'after', delay = 0.4,
                func = (function()
                    add_tag(Tag('tag_bld_toss'))
                    play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                    play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                    return true
                end)
            }))
        end
    end,
}