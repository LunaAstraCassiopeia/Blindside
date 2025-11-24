    SMODS.Enhancement({
        key = 'door',
        atlas = 'bld_blindrank',
        pos = {x = 9, y = 7},
        config = 
            {x_mult = 2,
            bonus = 80,
            extra = {
                value = 4,
                hues = {"Faded", "Red", "Green", "Blue", "Purple", "Yellow"}
            }},
        replace_base_card = true,
        no_rank = true,
        no_suit = true,
        always_scores = true,
        overrides_base_rank = true,
        in_pool = function(self, args)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
                    for _, playing_card in ipairs(G.playing_cards or {}) do
                        if SMODS.has_enhancement(playing_card, 'm_bld_door') then
                            return true
                        end
                    end
                    return false
            else
            return false
            end
        end,
        weight = 4,
        pools = {
            ["bld_obj_blindcard_generate"] = true,
            ["bld_obj_blindcard_single"] = true,
            ["bld_obj_blindcard_dual"] = true,
            ["bld_obj_blindcard_faded"] = true,
            ["bld_obj_blindcard_red"] = true,
            ["bld_obj_blindcard_green"] = true,
            ["bld_obj_blindcard_blue"] = true,
            ["bld_obj_blindcard_yellow"] = true,
            ["bld_obj_blindcard_purple"] = true,
            ["bld_obj_blindcard_warm"] = true,
            ["bld_obj_blindcard_cool"] = true,
        },
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.x_mult, card.ability.bonus
                }
            }
        end
    })
    
----------------------------------------------
------------MOD CODE END----------------------
