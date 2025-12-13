    SMODS.Enhancement({
        key = 'tears',
        atlas = 'bld_blindrank',
        pos = {x = 4, y = 6},
        config = {
            chips = 20,
            extra = {
                value = 11,
                repetitions = 2,
                repetitions_up = 1,
                chips_up = 5,
                hues = {"Blue"}
            }},
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
        weight = 3,
        pools = {
            ["bld_obj_blindcard_generate"] = true,
            ["bld_obj_blindcard_cool"] = true,
            ["bld_obj_blindcard_single"] = true,
            ["bld_obj_blindcard_blue"] = true,
        },
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.repetition and context.other_card and context.other_card == card and context.other_card.facing ~= "back" then
                return {
                    repetitions = card.ability.extra.repetitions
                }
            end
            if context.cardarea == G.play and context.main_scoring then
                return {
                    chips = card.ability.chips
                }
            end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.chips,
                    card.ability.extra.repetitions
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
                card.ability.extra.repetitions = card.ability.extra.repetitions + card.ability.extra.repetitions_up
                card.ability.chips = card.ability.chips + card.ability.extra.chips_up
                card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
