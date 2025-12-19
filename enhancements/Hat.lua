    BLINDSIDE.Blind({
        key = 'hat',
        atlas = 'bld_blindrank',
        pos = {x = 9, y = 4},
        config = {
            extra = {
                value = 13,
                minchips = 20,
                maxchips = 100,
                minmult = 1,
                maxmult = 30,
                dollars = 10,
                rescore = 1,
                number = 0,
            }},
        hues = {"Faded"},
        calculate = function(self, card, context) 
            if context.before and (context.cardarea == G.play or (context.cardarea == G.hand and card.ability.extra.upgraded)) and card.facing ~= 'back' then
                card.ability.extra.number = pseudorandom('arengee', 1, 6)
                if card.ability.extra.number == 1 then
                    return {
                        card = card,
                        level_up = true,
                        message = localize('k_level_up_ex')
                    }
                end
            end
            if (context.cardarea == G.play and context.main_scoring) or (context.cardarea == G.hand and context.main_scoring and card.ability.extra.upgraded) then
                if card.ability.extra.number == 2 then
                    return {
                        mult = pseudorandom('hat', card.ability.extra.minmult, card.ability.extra.maxmult)
                    }
                end
                if card.ability.extra.number == 3 then
                    return {
                        chips = pseudorandom('hat', card.ability.extra.minchips, card.ability.extra.maxchips)
                    }
                end
                if card.ability.extra.number == 4 then
                    return {
                        dollars = card.ability.extra.dollars
                    }
                end
                if card.ability.extra.number == 5 then
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
                                    card_eval_status_text(card, 'extra', nil, nil, nil, {
                                        message = localize('k_again_ex'),
                                        colour = G.C.DARK_EDITION})
                                        card:juice_up()
                                            local passed_context = context
                                            SMODS.score_card(play_card, passed_context)
                                        end
                                    end
                                end
                                SMODS.calculate_context({rescore_cards = retrigger_cards})
                        end
                    }
                end
                if card.ability.extra.number == 6 then
                    if card.facing ~= 'back' then 
                    card:flip()
                    end
                    return {
                        message = localize('k_nope_ex'),
                        colour = G.C.GREEN
                    }
                end
            end
        end,
        loc_vars = function (self, info_queue, card)
            return {key = card.ability.extra.upgraded and 'm_bld_hat_upgraded' or 'm_bld_hat',}
        end,
        upgrade = function(card)
            if not card.ability.extra.upgraded then
            card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
