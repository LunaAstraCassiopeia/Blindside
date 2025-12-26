SMODS.Tag {
    key = "timemachine_relic",
    config = {
        relic = true
    },
    hide_ability = false,
    atlas = 'bld_relic',
    pos = {x = 0, y = 4},
    in_pool = function(self, args)
        return false
    end,
    apply = function(self, tag, context)
    end
}