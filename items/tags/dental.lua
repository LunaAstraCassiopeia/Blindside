SMODS.Tag {
    key = "dental",
    hide_ability = false,
    atlas = 'bld_tag',
    --[[config = {
        extra = {
            rounds = 3
        }
    },]]
    pos = {x = 4, y = 1},
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
            tag:yep('+', G.C.RED, function() 
                return true end)
            tag.triggered = true
        end
        if context.type == 'before' then
            for key, value in pairs(G.play.cards) do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function ()
                        tag:juice_up(0.4, 0.8)
                        value:juice_up(0.6, 0.6)
                        return true
                    end
                }))
                ease_dollars(1)
            end
            --tag.ability.extra.rounds = tag.ability.extra.rounds - 1
            
            --[[tag:yep('+', G.C.RED, function() 
                return true end)
            tag.triggered = true]]
        end
    end,
}