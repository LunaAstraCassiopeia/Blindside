SMODS.Seal {
    key = "ruin",
    atlas = 'bld_enhance', 
    pos = { x = 2, y = 1 },
    config = {
        extra = {
            odds = 6
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
        if context.cardarea == G.play and context.before and context.scoring_hand and tableContains(card, context.scoring_hand) and card.facing ~= 'back' then
            if SMODS.pseudorandom_probability(card, pseudoseed("bld_ruin"), 1, card.ability.seal.extra.odds, 'bld_ruin') and card.facing ~= "back" then
                card:set_debuff(true)
                card.ability.extra.i_debuffed_myself_btw = true
                if card.facing ~= 'back' then 
                    card:flip()
                end
            else
                card:flip()
                card:flip()
            end
        end
    end,
    loc_vars = function(self, info_queue, card)
        local n,d = SMODS.get_probability_vars(card, 1, card.ability.seal.extra.odds)
        return {
            vars = {
                n,
                d
            }
        }
    end
}