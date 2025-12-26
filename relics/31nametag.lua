SMODS.Tag {
    key = "nametag_relic",
    config = {
        relic = true
    },
    hide_ability = false,
    atlas = 'bld_relic',
    pos = {x = 4, y = 0},
    in_pool = function(self, args)
        return false
    end,
}