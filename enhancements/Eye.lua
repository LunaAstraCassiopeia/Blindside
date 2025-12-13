    SMODS.Enhancement({
        key = 'eye',
        atlas = 'bld_blindrank',
        pos = {x = 9, y = 1},
        config = {
            h_x_chips = 1.75,
            mult = 3,
            extra = {
                value = 12,
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
        pools = {
            ["bld_obj_blindcard_generate"] = true,
            ["bld_obj_blindcard_cool"] = true,
            ["bld_obj_blindcard_single"] = true,
            ["bld_obj_blindcard_blue"] = true,
        },
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.h_x_chips, card.ability.mult
                }
            }
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
