SMODS.Tag {
    key = "magnifyingglass_relic",
    config = {
        relic = true
    },
    hide_ability = false,
    atlas = 'bld_relic',
    pos = {x = 2, y = 2},
    in_pool = function(self, args)
        return false
    end,
    apply = function(self, tag, context)
        if context.type == 'eval' and G.GAME.last_blind  then
            add_tag(Tag('tag_bld_reroll'))
        end
    end
}