SMODS.Tag {
    key = "birthcertificate_relic",
    config = {
        relic = true
    },
    hide_ability = false,
    atlas = 'bld_relic',
    pos = {x = 1, y = 4},
    in_pool = function(self, args)
        return false
    end,
}