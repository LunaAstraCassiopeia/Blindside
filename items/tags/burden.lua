SMODS.Tag {
    key = "burden",
    hide_ability = false,
    atlas = 'bld_tag',
    --[[config = {
        extra = {
            rounds = 3
        }
    },]]
    pos = {x = 0, y = 4},
    in_pool = function(self, args)
        return false
    end,
    apply = function(self, tag, context)
        if context.type == 'shop_start' and not (next(SMODS.find_card("j_bld_taglock")) and not (G.GAME.blind.boss or G.GAME.last_joker)) then
            tag:yep('+', G.C.RED, function() 
                return true end)
            tag.triggered = true
        end
        if context.type == 'after_hand' then
            if not G.GAME.dollar_buffer then
                G.GAME.dollar_buffer = 0
            end
            local amount = math.ceil(-math.max(0, G.GAME.dollars + G.GAME.dollar_buffer)/2)
            if amount < 0 then
                G.GAME.dollar_buffer = G.GAME.dollar_buffer + amount
                ease_dollars(amount)
                G.E_MANAGER:add_event(Event({
                    func = function ()
                        G.GAME.dollar_buffer = 0
                        return true
                    end
                }))
            end
        end
    end,
}