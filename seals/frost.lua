SMODS.Seal {
    key = "frost",
    atlas = 'bld_enhance', 
    pos = { x = 3, y = 1 },
    config = { 
        extra = { 
            howmany = 2
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
        if not context.end_of_round and context.repetition and context.other_card == card and (context.cardarea == G.play and card.facing ~= 'back' or context.cardarea == G.hand) and G.GAME.current_round.hands_left <= 1 then
            return {
                repetitions = 1 + #SMODS.find_card('j_bld_snowglobe')
            }
        end
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.seal.extra.howmany
            }
        }
    end
}