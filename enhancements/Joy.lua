    SMODS.Enhancement({
        key = 'joy',
        atlas = 'bld_blindrank',
        pos = {x = 5, y = 8},
        config = {
            extra = {
                value = 100,
                chips = 5,
                dollars = 2,
                hues = {"Blue", "Yellow"}
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
            if context.cardarea == G.play and context.main_scoring then
                return {
                    chips = card.ability.extra.chips * math.floor(((G.GAME.dollars or 0) + (G.GAME.dollar_buffer or 0))/card.ability.extra.dollars)
                }
            end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.chips, 
                    card.ability.extra.chips * math.floor(((G.GAME.dollars or 0) + (G.GAME.dollar_buffer or 0))/card.ability.extra.dollars)
                }
            }
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
