    SMODS.Enhancement({
        key = 'skull',
        atlas = 'bld_blindrank',
        pos = {x = 3, y = 3},
        config = {
            extra = {
                xmult_mod = 0.25,
                xmult = 1,
                value = 15,
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
        pools = {
            ["bld_obj_blindcard_generate"] = true,
            ["bld_obj_blindcard_cool"] = true,
            ["bld_obj_blindcard_single"] = true,
            ["bld_obj_blindcard_purple"] = true,
        },
        weight = 3,
        calculate = function(self, card, context)
                if context.cardarea == G.play and context.main_scoring and card.ability.extra.mult > 0 then
                        return {
                            xmult = card.ability.extra.xmult
                        }
                end
                if context.cardarea == G.play and context.after and context.scoring_hand and context.full_hand and card.facing ~= 'back' then
                    local unscored = {}
                    for k, v in pairs(context.full_hand) do
                        local scored = false
                        for _, scoring in pairs (context.scoring_hand) do 
                            if scoring == v then
                                scored = true
                            end
                        end
                        if not scored and not card.destroyed then
                            table.insert(unscored, v)
                        end
                    end

                    if #unscored > 0 then
                        local removed = pseudorandom_element(unscored, pseudoseed("skull"))
                        SMODS.calculate_context({remove_playing_cards = true, removed = {removed}, scoring_hand = context.scoring_hand})
                        removed.destroyed = true
                        G.E_MANAGER:add_event(Event({trigger = 'before', delay = 1, func = function()
                            removed:start_dissolve()
                            card_eval_status_text(
                                removed,
                                'extra',
                                nil, nil, nil,
                                {message = "Destroyed!", colour = G.C.ORANGE, instant = true}
                            )
                            delay(0.6)
                            return true
                        end}))
                        SMODS.scale_card(card, {
                            ref_table = card.ability.extra,
                            ref_value = "xmult",
                            scalar_value = "xmult_mod",
                            operation = '+',
                            message_colour = G.C.PURPLE
                        })
                    end
                end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.xmult_mod, card.ability.extra.xmult
                }
            }
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
