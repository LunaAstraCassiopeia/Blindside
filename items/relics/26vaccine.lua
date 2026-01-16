SMODS.Tag {
    key = "vaccine_relic",
    config = {
        relic = true
    },
    hide_ability = false,
    atlas = 'bld_relic',
    pos = {x = 3, y = 3},
    in_pool = function(self, args)
        return false
    end,
}