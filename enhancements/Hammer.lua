    SMODS.Enhancement({
        key = 'hammer',
        atlas = 'bld_blindrank',
        pos = {x = 1, y = 5},
        config = {
            extra = {
                value = 15,
                repetitions = 2,
                hues = {"Faded"}
            }},
        replace_base_card = true,
        no_rank = true,
        no_suit = true,
        always_scores = true,
        overrides_base_rank = true,
        in_pool = function(self, args)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
                return true
            else
            return false
            end
        end,
        pools = {
            ["bld_obj_blindcard_generate"] = true,
            ["bld_obj_blindcard_single"] = true,
            ["bld_obj_blindcard_faded"] = true,
        },
        calculate = function(self, card, context) 
        if context.repetition and context.cardarea == G.play and context.other_card == context.scoring_hand[1] then
            return {
                repetitions = card.ability.extra.repetitions
            }
        end
        end,
        weight = 3,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.repetitions
                }
            }
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
