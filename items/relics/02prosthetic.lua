SMODS.Tag {
    key = "prosthetic_relic",
    config = {
        hands = 1,
        relic = true
    },
    hide_ability = false,
    atlas = 'bld_relic',
    pos = {x = 1, y = 0},
    in_pool = function(self, args)
        return false
    end,
    loc_vars = function(self, info_queue, tag)
        return {
            vars = {
                tag.ability.hands
            }
        }
    end,
    apply = function(self, tag, context)
        if context.type == 'real_round_start'  then
            G.E_MANAGER:add_event(Event({func = function()
                ease_hands_played(1)
                tag_area_status_text(tag, "+1 Hands", G.C.BLUE, false, 0)
            return true end }))
        end
    end
}