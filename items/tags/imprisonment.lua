SMODS.Tag {
    key = "imprisonment",
    hide_ability = false,
    atlas = 'bld_tag',
    --[[config = {
        extra = {
            rounds = 3
        }
    },]]
    pos = {x = 4, y = 4},
    in_pool = function(self, args)
        return false
    end,
    apply = function(self, tag, context)
        if not G.GAME.imprisonment_buffer and context.type == 'real_round_start' and not (next(SMODS.find_card("j_bld_taglock")) and not (G.GAME.blind.boss or G.GAME.last_joker)) and G.GAME.blind.boss then
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