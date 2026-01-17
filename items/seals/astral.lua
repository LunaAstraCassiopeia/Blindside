SMODS.Seal {
    key = "astral",
    atlas = 'bld_enhance', 
    pos = { x = 3, y = 0 },
    config = { 
        extra = { 
            mult = 2
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
                mult = G.GAME.hands[context.scoring_name].level*card.ability.seal.extra.mult
            }
        end
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.seal.extra.mult
            }
        }
    end
}