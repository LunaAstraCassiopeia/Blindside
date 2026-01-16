SMODS.Tag {
    key = "antidote_relic",
    config = {
        relic = true
    },
    hide_ability = false,
    atlas = 'bld_relic',
    pos = {x = 2, y = 3},
    in_pool = function(self, args)
        return false
    end,
    apply = function(self, tag, context)
    end
}