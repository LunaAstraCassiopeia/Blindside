    SMODS.Enhancement({
        key = 'way',
        atlas = 'bld_blindrank',
        pos = {x = 5, y = 6},
        config = {
            extra = {
                value = 12,
                x_chips = 1.5,
                chips = -20,
                hues = {"Purple"}
            }},
        replace_base_card = true,
        no_rank = true,
        no_suit = true,
        overrides_base_rank = true,
        always_scores = true,
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
            ["bld_obj_blindcard_cool"] = true,
            ["bld_obj_blindcard_single"] = true,
            ["bld_obj_blindcard_purple"] = true,
        },
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.chips,
                    card.ability.extra.x_chips
                }
            }
        end,
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.main_scoring then
                return {
                    chips = card.ability.extra.chips,
                    xchips = card.ability.extra.x_chips
                }
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
