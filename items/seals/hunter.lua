SMODS.Seal {
    key = "hunter",
    atlas = 'bld_enhance', 
    pos = { x = 0, y = 1 },
    config = { 
        extra = { 
            dollars = 1,
            boss_dollars = 3
        } 
    },
    badge_colour = HEX('757CDC'),
    in_pool = function(self, args)
        if G.GAME.selected_back.effect.center.config.extra then
            if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
            return true
        else
        return false
        end
    end,
    pools = {
        ["bld_obj_enhancements"] = true,
    },
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play and card.facing ~= 'back' then
            return {
                dollars = G.GAME.blind.boss and card.ability.seal.extra.boss_dollars or card.ability.seal.extra.dollars
            }
        end
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.seal.extra.boss_dollars,
                card.ability.seal.extra.dollars
            }
        }
    end
}