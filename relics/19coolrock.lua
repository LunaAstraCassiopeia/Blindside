SMODS.Tag {
    key = "coolrock_relic",
    config = {
        relic = true
    },
    hide_ability = false,
    atlas = 'bld_relic',
    pos = {x = 2, y = 1},
    in_pool = function(self, args)
        return false
    end,
    apply = function(self, tag, context)
    end
}