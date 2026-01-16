SMODS.Tag {
    key = "clapper_relic",
    config = {
        relic = true
    },
    hide_ability = false,
    atlas = 'bld_relic',
    pos = {x = 4, y = 4},
    in_pool = function(self, args)
        return false
    end,
}