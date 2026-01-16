SMODS.Tag {
    key = "souvenir_relic",
    config = {
        relic = true
    },
    hide_ability = false,
    atlas = 'bld_relic',
    pos = {x = 2, y = 4},
    in_pool = function(self, args)
        return false
    end,
    apply = function(self, tag, context)
    end
}