SMODS.Tag {
    key = "toss",
    hide_ability = false,
    atlas = 'bld_tag',
    pos = {x = 0, y = 1},
        in_pool = function(self, args)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
                return true
            else
            return false
            end
        end,
    set_ability = function (self, tag)
        if #G.hand.cards then
            G.hand:change_size(1)
            G.GAME.round_resets.temp_handsize = (G.GAME.round_resets.temp_handsize or 0) + 1
        end
    end,
    apply = function(self, tag, context)
        if context.type == 'shop_start' and not (next(SMODS.find_card("j_bld_taglock")) and not (G.GAME.blind.boss or G.GAME.last_joker)) then
            tag:yep('+', G.C.GREEN, function() 
                return true end)
            tag.triggered = true
        end
        if context.type == 'real_round_start' and not (next(SMODS.find_card("j_bld_taglock")) and not (G.GAME.blind.boss or G.GAME.last_joker)) then
            G.hand:change_size(1)
            G.GAME.round_resets.temp_handsize = (G.GAME.round_resets.temp_handsize or 0) + 1
            return true
        end
    end,
}