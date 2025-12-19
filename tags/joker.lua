SMODS.Tag {
    key = "joker",
    hide_ability = false,
    atlas = 'bld_tag',
    pos = {x = 4, y = 2},
        in_pool = function(self, args)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
                return true
            else
            return false
            end
        end,
    apply = function(self, tag, context)
        if context.type == 'after_hand' and not (next(SMODS.find_card("j_bld_taglock"))) then
            BLINDSIDE.chipsmodify(1, 0, 0)
        end

        if context.type == 'shop_start' and not (next(SMODS.find_card("j_bld_taglock")) and not (G.GAME.blind.boss or G.GAME.last_joker)) then
            tag:yep('+', G.C.MONEY, function() 
                return true end)
            tag.triggered = true
        end
    end,
}