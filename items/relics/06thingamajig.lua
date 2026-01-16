SMODS.Tag {
    key = "thingamajig_relic",
    config = {
        relic = true
    },
    hide_ability = false,
    atlas = 'bld_relic',
    pos = {x = 5, y = 2},
    in_pool = function(self, args)
        return false
    end,
}