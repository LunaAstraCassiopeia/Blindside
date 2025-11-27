    SMODS.Enhancement({
        key = 'key',
        atlas = 'bld_blindrank',
        pos = {x = 3, y = 5},
        config = 
            {x_mult = 1.25,
            extra = {
                value = 4,
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
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.x_mult
                }
            }
        end
    })
    
----------------------------------------------
------------MOD CODE END----------------------
