SMODS.Tag {
    key = "heartbreak",
    hide_ability = false,
    atlas = 'bld_tag',
    --[[config = {
        extra = {
            rounds = 3
        }
    },]]
    pos = {x = 1, y = 3},
    in_pool = function(self, args)
        return false
    end,
    apply = function(self, tag, context)
        if context.type == 'real_round_before_start' then
            G.GAME.blind:disable()
            G.GAME.blindassist:disable()
        end
        if not G.GAME.imprisonment_buffer and context.type == 'real_round_start' then
            G.GAME.imprisonment_buffer = true
            G.E_MANAGER:add_event(Event({
                func = function ()
                    if G.GAME.blind and not G.GAME.blind.disabled then
                        G.GAME.blind:disable()
                        G.GAME.blindassist:disable()
                    end
                    G.GAME.imprisonment_buffer = false
                    tag:yep('+', G.C.RED, function()
                    return true end)
                    tag.triggered = true
                    return true
                end
            }))
        end
    end,
}
