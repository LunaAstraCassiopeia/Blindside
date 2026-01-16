SMODS.Tag {
    key = "reroll",
    hide_ability = false,
    atlas = 'bld_tag',
    pos = {x = 2, y = 3},
        in_pool = function(self, args)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
                return true
            else
            return false
            end
        end,
    apply = function(self, tag, context)
        if context.type == 'shop_start'  then
            calculate_blindreroll_cost(true)
        end
        if context.type == 'after_reroll'  and not G.GAME.rerolled then
            G.GAME.round_resets.free_rerolls = G.GAME.round_resets.free_rerolls - 1
            G.GAME.rerolled = true
            tag:yep('+', G.C.GREEN, function() 
                return true end)
            tag.triggered = true
        end
    end,
}