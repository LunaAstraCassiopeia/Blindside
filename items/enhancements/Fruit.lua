    BLINDSIDE.Blind({
        key = 'fruit',
        atlas = 'bld_blindrank',
        pos = {x = 2, y = 3},
        config = {
            rescore = 0,
            extra = {
                value = 100,
                rescore = 1,
            }},
        hues = {"Red","Faded"},
        rare = true,
        calculate = function(self, card, context)
            if not card.ability.extra.upgraded and context.cardarea == G.play and context.before and card.facing ~= 'back' then
                local self_pos = nil
                for i=1, #G.play.cards do
                    if G.play.cards[i] == card then
                        self_pos = i
                    end
                end
                if G.play.cards[self_pos-1] then
                    G.play.cards[self_pos-1].config.center.blind_debuff(G.play.cards[self_pos-1], true)
                end
                if G.play.cards[self_pos+1] then
                    G.play.cards[self_pos+1].config.center.blind_debuff(G.play.cards[self_pos+1], true)
                end
            end
            if context.cardarea == G.play and context.main_scoring and context.scoring_hand then
                return {
                        func = function()
                                local retrigger_cards = {}
                                for i=1, #context.scoring_hand do
                                    if context.scoring_hand[i]:is_color("Red") and context.scoring_hand[i] ~= card then
                                    table.insert(retrigger_cards, context.scoring_hand[i])
                                    end
                                end
                                if #retrigger_cards then
                                for streak_index = 1, #retrigger_cards do
                                    local streak_card = retrigger_cards[streak_index]
                                    for _, play_card in ipairs(G.play.cards) do
                                        if play_card == streak_card and play_card.ability.extra.rescore ~= 1 then
                                        card:juice_up()
                                    card_eval_status_text(card, 'extra', nil, nil, nil, {
                                        message = localize('k_again_ex'),
                                        colour = G.C.DARK_EDITION})
                                            local passed_context = context
                                            BLINDSIDE.rescore_card(play_card, passed_context)
                                        end
                                    end
                                end
                                SMODS.calculate_context({rescore_cards = retrigger_cards})
                            end
                        end
                    }
                
            end
            if context.after and context.scoring_hand and card.facing ~= 'back' then
                for _, other_card in ipairs(context.scoring_hand) do
                    other_card.ability.extra.rescore = 0
                end
            end
            if not card.ability.extra.upgraded and context.cardarea == G.play and context.after and card.facing ~= 'back' then
                local self_pos = nil
                for i=1, #G.play.cards do
                    if G.play.cards[i] == card then
                        self_pos = i
                    end
                end
                if G.play.cards[self_pos-1] then
                    G.play.cards[self_pos-1]:set_debuff(false)
                end
                if G.play.cards[self_pos+1] then
                    G.play.cards[self_pos+1]:set_debuff(false)
                end
            end
            end,
        loc_vars = function(self, info_queue, card)
            return {
                key = card.ability.extra.upgraded and 'm_bld_fruit_upgraded' or 'm_bld_fruit',
                vars = {
                    card.ability.extra.repetitions
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
