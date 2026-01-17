SMODS.Tag {
    key = "deck",
    config = {
        relic = true
    },
    hide_ability = false,
    atlas = 'bld_relic',
    pos = {x = 0, y = 0},
    in_pool = function(self, args)
        return false
    end,
    loc_vars = function(self, info_queue, tag)
        return {
            vars = {
                #G.vouchers.cards
            }
        }
    end,
    apply = function(self, tag, context)
    end
}