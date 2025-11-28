    SMODS.Enhancement({
        key = 'line',
        atlas = 'bld_blindrank',
        pos = {x = 6, y = 6}, -- replace with actual sprite
        config = {
            extra = {
                xmult = 1,
                xmult_gain = 0.2,
                value = 11,
                hues = {"Purple"}
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
            ["bld_obj_blindcard_purple"] = true,
        },
        calculate = function(self, card, context)
            if context.modify_hand and context.scoring_hand then
                local i_scored = false
                for key, value in pairs(context.scoring_hand) do
                    if value == card then
                        i_scored = true
                    end
                end

                if not i_scored then
                    return
                end

                if G.GAME.current_round.discards_left > 0 then
                    return {
                        message = localize('k_upgrade_ex'),
                        func = function ()
                            G.E_MANAGER:add_event(Event({
                                func = function ()
                                    card.ability.extra.xmult = card.ability.extra.xmult + G.GAME.current_round.discards_left * card.ability.extra.xmult_gain
                                    return true
                                end
                            }))
                            ease_discard(-G.GAME.current_round.discards_left)
                        end
                    }
                end
            end

            if context.main_scoring and context.cardarea == G.play and card.ability.extra.xmult > 1 then
                return {
                    xmult = card.ability.extra.xmult
                }
            end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.xmult,
                    card.ability.extra.xmult_gain
                }
            }
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
