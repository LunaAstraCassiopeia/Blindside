SMODS.Tag {
    key = "battery",
    hide_ability = false,
    config = {
        extra = {
            give = true
        }
    },
    atlas = 'bld_tag',
    pos = {x = 2, y = 1},
        in_pool = function(self, args)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
                return true
            else
            return false
            end
        end,
    set_ability = function (self, tag)
        tag.config.extra.give = true
    end,
    apply = function(self, tag, context)
        if tag.config.extra.give and #G.hand.cards > 0 then
            tag.config.extra.give = false
            ease_hands_played(1)
        end
        if context.type == 'shop_start' and not (next(SMODS.find_card("j_bld_taglock")) and not (G.GAME.blind.boss or G.GAME.last_joker)) then
            tag:yep('+', G.C.GREEN, function() 
                ease_hands_played(-1)
                return true end)
            tag.triggered = true
        end
        if tag.config.extra.give and context.type == 'real_round_start' then
            tag.config.extra.give = false
            ease_hands_played(1)
            return true
        end
    end,
}