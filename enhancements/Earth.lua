    SMODS.Enhancement({
        key = 'earth',
        atlas = 'bld_blindrank',
        pos = {x = 4, y = 5},
        config = {
            extra = {
                value = 10,
                odds = 3,
                oddsup = -1,
                hues = {"Green"}
            }
        },
        replace_base_card = true,
        no_rank = true,
        no_suit = true,
        overrides_base_rank = true,
        always_scores = true,
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
            ["bld_obj_blindcard_warm"] = true,
            ["bld_obj_blindcard_single"] = true,
            ["bld_obj_blindcard_green"] = true,
        },
        weight = 3,
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.before and card.facing ~= 'back' then
                if SMODS.pseudorandom_probability(card, pseudoseed("earth"), 1, card.ability.extra.odds, 'earth') and card.facing ~= "back" then
                    card:flip()
                    card:flip()
                else
                    if card.facing ~= 'back' then 
                    card:flip()
                    end
                end
            end
            if context.cardarea == G.play and context.main_scoring then
                if card.facing ~= 'back' then
                    return {
                        func = function()
                            local self_pos = nil
                            local retrigger_cards = {}
                            for i=1, #context.scoring_hand do
                                if context.scoring_hand[i] ~= card and context.scoring_hand[i].facing ~= 'back' then
                                    table.insert(retrigger_cards, context.scoring_hand[i])
                                end
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
                else
                    return {
                        message = localize('k_nope_ex'),
                        colour = G.C.GREEN
                    }
                end
            end
        end,
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue+1] = {key = 'bld_self_scoring', set = 'Other'}
            local chance, trigger = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'earth')
            return {
                vars = {
                    chance,
                    trigger
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.extra.odds = card.ability.extra.odds + card.ability.extra.oddsup
            card.ability.extra.upgraded = true
            end
        end
    })
    
----------------------------------------------
------------MOD CODE END----------------------
