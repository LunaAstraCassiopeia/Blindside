SMODS.Seal {
    key = "sticky",
    atlas = 'bld_enhance', 
    pos = { x = 1, y = 2 },
    badge_colour = HEX('757CDC'),
    pools = {
        ["bld_obj_enhancements"] = true,
    },
    in_pool = function(self, args)
        if G.GAME.selected_back.effect.center.config.extra then
            if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
            return true
        else
        return false
        end
    end,
}