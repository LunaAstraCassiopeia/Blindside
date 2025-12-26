SMODS.Tag {
    key = "microscope_relic",
    config = {
        relic = true
    },
    hide_ability = false,
    atlas = 'bld_relic',
    pos = {x = 3, y = 2},
    in_pool = function(self, args)
        return false
    end,
    apply = function(self, tag, context)
    end
}