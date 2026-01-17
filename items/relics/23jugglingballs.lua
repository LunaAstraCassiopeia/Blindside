SMODS.Tag {
    key = "jugglingballs_relic",
    config = {
        relic = true
    },
    hide_ability = false,
    atlas = 'bld_relic',
    pos = {x = 4, y = 1},
    in_pool = function(self, args)
        return false
    end,
    apply = function(self, tag, context)
        if context.type == 'eval' and G.GAME.last_blind and G.GAME.last_blind.boss  then
            G.E_MANAGER:add_event(Event({
                trigger = 'after', delay = 0.4,
                func = (function()
                    add_tag(Tag('tag_juggle'))
                    play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                    play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                    return true
                end)
            }))
        end
    end
}