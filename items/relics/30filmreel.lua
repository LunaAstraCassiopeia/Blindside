SMODS.Tag {
    key = "film_reel_relic",
    config = {
        relic = true
    },
    hide_ability = false,
    atlas = 'bld_relic',
    pos = {x = 5, y = 4},
    in_pool = function(self, args)
        return false
    end,
}