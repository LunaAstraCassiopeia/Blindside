SMODS.Tag {
    key = "awe",
    hide_ability = false,
    atlas = 'bld_tag',
    --[[config = {
        extra = {
            rounds = 3
        }
    },]]
    pos = {x = 1, y = 4},
    in_pool = function(self, args)
        return false
    end,
    apply = function(self, tag, context)
        if context.type == 'shop_start' and not (next(SMODS.find_card("j_bld_taglock")) and not (G.GAME.blind.boss or G.GAME.last_joker)) then
            for key, value in pairs(G.jokers.cards) do
                value:set_debuff(false)
            end
            tag:yep('+', G.C.RED, function() 
                return true end)
            tag.triggered = true
        end
        if context.type == 'before' then
            for key, value in pairs(G.jokers.cards) do
                value:set_debuff(false)
            end
            for i, trinket in ipairs(G.jokers.cards) do
                if i == 1 or i == #G.jokers.cards then
                    trinket:set_debuff(true)
                end
            end
        end
    end,
}