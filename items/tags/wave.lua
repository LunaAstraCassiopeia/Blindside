SMODS.Tag {
    key = "wave",
    hide_ability = false,
    atlas = 'bld_tag',
    pos = {x = 2, y = 0},
        in_pool = function(self, args)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
                return true
            else
            return false
            end
        end,
    apply = function(self, tag, context)
        if context.type == 'shop_start' and not (next(SMODS.find_card("j_bld_taglock")) and not (G.GAME.blind.boss or G.GAME.last_joker)) then
                tag:yep('+', G.C.BLUE, function() 
                    return true end)
                tag.triggered = true
        end
    end,
}