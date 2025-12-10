    SMODS.Enhancement({
        key = 'door',
        atlas = 'bld_blindrank',
        pos = {x = 9, y = 7},
        config = 
            {x_mult = 1.75,
            bonus = 60,
            extra = {
                value = 4,
                x_multup = 0.25,
                bonusup = 40,
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
            ["bld_obj_blindcard_generate"] = false,
            ["bld_obj_blindcard_single"] = false,
            ["bld_obj_blindcard_dual"] = false,
            ["bld_obj_blindcard_faded"] = false,
            ["bld_obj_blindcard_red"] = false,
            ["bld_obj_blindcard_green"] = false,
            ["bld_obj_blindcard_blue"] = false,
            ["bld_obj_blindcard_yellow"] = false,
            ["bld_obj_blindcard_purple"] = false,
            ["bld_obj_blindcard_warm"] = false,
            ["bld_obj_blindcard_cool"] = false,
        },
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.x_mult, card.ability.bonus
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.x_mult = card.ability.x_mult + card.ability.extra.x_multup
            card.ability.bonus = card.ability.bonus + card.ability.extra.bonusup
            card.ability.extra.upgraded = true
            end
        end
    })
    
----------------------------------------------
------------MOD CODE END----------------------
