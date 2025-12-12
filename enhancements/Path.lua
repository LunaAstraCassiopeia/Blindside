    SMODS.Enhancement({
        key = 'path',
        atlas = 'bld_blindrank',
        pos = {x = 2, y = 8},
        config = {
            mult = 10,
            extra = {
                value = 100,
                poker_hand = "bld_blind_2pair",
                --new_hand = "bld_blind_2oak",
                hues = {"Red", "Blue"}
            }},
        pools = {
            ["bld_obj_blindcard_generate"] = true,
            ["bld_obj_blindcard_warm"] = true,
            ["bld_obj_blindcard_cool"] = true,
            ["bld_obj_blindcard_dual"] = true,
            ["bld_obj_blindcard_red"] = true,
            ["bld_obj_blindcard_blue"] = true,
        },
        weight = 3,
        replace_base_card = true,
        no_rank = true,
        no_suit = true,
        overrides_base_rank = true,
        in_pool = function(self, args)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
                return true
            else
            return false
            end
        end,
        calculate = function(self, card, context)
            if context.modify_hand and context.cardarea == G.hand and context.scoring_hand and context.main_eval then
                if next(context.poker_hands[card.ability.extra.poker_hand]) then
                    return {
                        mult = card.ability.mult
                    }
                end
            end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.mult,
                }
            }
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
