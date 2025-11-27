    SMODS.Enhancement({
        key = 'blank',
        atlas = 'bld_blindrank',
        pos = {x = 0, y = 0},
        config = {
            rescore = 0,
            extra = {
                value = 1,
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
        pools = {
            ["bld_obj_blindcard_single"] = true,
            ["bld_obj_blindcard_faded"] = true,
        },
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.main_scoring and context.scoring_hand then
                return {
                        func = function()
                            local self_pos = nil
                            local retrigger_cards = {}
                            for i=1, #context.scoring_hand do
                                if context.scoring_hand[i] == card then
                                    self_pos = i
                                end
                            end
                            if context.scoring_hand[self_pos-1] then
                                table.insert(retrigger_cards, context.scoring_hand[self_pos-1])
                            end
                            if context.scoring_hand[self_pos+1] then
                                table.insert(retrigger_cards, context.scoring_hand[self_pos+1])
                            end
                            for streak_index = 1, #retrigger_cards do
                                local streak_card = retrigger_cards[streak_index]
                                for _, play_card in ipairs(G.play.cards) do
                                    if play_card == streak_card and streak_card.ability.extra.rescore ~= 1 then
                                        card:juice_up()
                                        local passed_context = context
                                        card_eval_status_text(play_card, 'extra', nil, nil, nil, {message = localize('k_again_ex'),colour = G.C.DARK_EDITION})
                                        SMODS.score_card(play_card, passed_context)
                                    end
                                end
                            end
                            SMODS.calculate_context({rescore_cards = retrigger_cards})
                            return true
                        end,
                    }
            end
        end,
    })
----------------------------------------------
------------MOD CODE END----------------------
