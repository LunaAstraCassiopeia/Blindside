SMODS.Tag {
    key = "bindle_relic",
    config = {
        discards = 2,
        relic = true
    },
    hide_ability = false,
    atlas = 'bld_relic',
    pos = {x = 2, y = 0},
    in_pool = function(self, args)
        return false
    end,
    loc_vars = function(self, info_queue, tag)
        return {
            vars = {
                tag.ability.discards
            }
        }
    end,
    apply = function(self, tag, context)
        if context.type == 'real_round_start'  then
            G.E_MANAGER:add_event(Event({func = function()
                ease_discard(1)
                tag_area_status_text(tag, "+1 Discard", G.C.RED, false, 0)
            return true end }))
        end
    end
}