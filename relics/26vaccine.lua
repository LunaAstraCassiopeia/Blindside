SMODS.Tag {
    key = "vaccine_relic",
    config = {
        relic = true
    },
    hide_ability = false,
    atlas = 'bld_relic',
    pos = {x = 4, y = 2},
    in_pool = function(self, args)
        return false
    end,
}