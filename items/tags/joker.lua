SMODS.Tag {
    key = "joker",
    hide_ability = false,
    atlas = 'bld_tag',
    pos = {x = 3, y = 3},
    in_pool = function(self, args)
        return false
    end,
    apply = function(self, tag, context)
        if context.type == 'after_hand' then
            BLINDSIDE.chipsmodify(1, 0, 0)
        end

        if context.type == 'shop_start' and not (next(SMODS.find_card("j_bld_taglock")) and not (G.GAME.blind.boss or G.GAME.last_joker)) then
            tag:yep('+', G.C.MONEY, function() 
                return true end)
            tag.triggered = true
        end
    end,
}