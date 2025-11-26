    SMODS.Enhancement({
        key = 'alert',
        atlas = 'bld_blindrank',
        pos = {x = 3, y = 6},
        config = {
            mult = 12,
            extra = {
                value = 141,
                cost = 3,
                hues = {"Yellow"}
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
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.mult,
                    card.ability.extra.cost
                }
            }
        end,
        --weight = 3,
        pools = {
            ["bld_obj_blindcard_generate"] = true,
            ["bld_obj_blindcard_warm"] = true,
            ["bld_obj_blindcard_single"] = true,
            ["bld_obj_blindcard_yellow"] = true,
        },
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.main_scoring then
                return {
                    dollars = -card.ability.extra.cost
                }
            end
        end,
    })
----------------------------------------------
------------MOD CODE END----------------------
