    BLINDSIDE.Blind({
        key = 'template',
        atlas = 'bld_blindrank',
        pos = {x = 4, y = 7},
        config = {
            extra = {
                value = 999,
                rescore = 1,
                retrigger = 3,
                rescore_up = 2,
            }},
        hues = {"Blue"}, -- Faded?
        always_scores = true,
        rare = true,
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
                                    BLINDSIDE.rescore_card(play_card, passed_context)
                                    card_eval_status_text(play_card, 'extra', nil, nil, nil, {message = localize('k_again_ex'),colour = G.C.DARK_EDITION})
                                    BLINDSIDE.rescore_card(play_card, passed_context)
                                    card_eval_status_text(play_card, 'extra', nil, nil, nil, {message = localize('k_again_ex'),colour = G.C.DARK_EDITION})
                                    BLINDSIDE.rescore_card(play_card, passed_context)
                                    if card.ability.extra.upgraded then
                                        card_eval_status_text(play_card, 'extra', nil, nil, nil, {message = localize('k_again_ex'),colour = G.C.DARK_EDITION})
                                        BLINDSIDE.rescore_card(play_card, passed_context)
                                        card_eval_status_text(play_card, 'extra', nil, nil, nil, {message = localize('k_again_ex'),colour = G.C.DARK_EDITION})
                                        BLINDSIDE.rescore_card(play_card, passed_context)
                                    end
                                end
                            end
                        end
                        SMODS.calculate_context({rescore_cards = retrigger_cards})
                        return true
                    end,
                }
            end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.retrigger
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.extra.upgraded = true
            card.ability.extra.retrigger = card.ability.extra.retrigger + card.ability.extra.rescore_up
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
