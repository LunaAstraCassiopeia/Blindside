    SMODS.Enhancement({
        key = 'manacle',
        atlas = 'bld_blindrank',
        pos = {x = 0, y = 1},
        config = {
            rescore = 0,
            extra = {
                value = 10,
                rescore = 1,
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
        weight = 3,
        pools = {
            ["bld_obj_blindcard_generate"] = true,
            ["bld_obj_blindcard_single"] = true,
            ["bld_obj_blindcard_faded"] = true,
        },
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.main_scoring then
                if #context.scoring_hand == 5 then
                            if card.facing ~= 'back' then 
                            card:flip()
                            end
                    return {
                        message = localize('k_nope_ex'),
                        colour = G.C.DARK_EDITION
                    }
                end
            end
            if context.cardarea == G.play and context.main_scoring and context.scoring_hand and #context.scoring_hand < 5 then
                return {
                        func = function()
                                local retrigger_cards = {}
                                for i=1, #context.scoring_hand do
                                    if context.scoring_hand[i] ~= card then
                                    table.insert(retrigger_cards, context.scoring_hand[i])
                                    end
                                end
                                for streak_index = 1, #retrigger_cards do
                                    local streak_card = retrigger_cards[streak_index]
                                    for _, play_card in ipairs(G.play.cards) do
                                        if play_card == streak_card and streak_card.ability.extra.rescore ~= 1 then
                                            card:juice_up()
                                            local passed_context = context
                                            card_eval_status_text(play_card, 'extra', nil, nil, nil, {
                                                message = localize('k_again_ex'),
                                                colour = G.C.DARK_EDITION})
                                            SMODS.score_card(play_card, passed_context)
                                        end
                                    end
                                end
                                SMODS.calculate_context({rescore_cards = retrigger_cards})
                        end
                    }
            end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.money
                }
            }
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
