SMODS.Consumable {
    key = 'arengee',
    set = 'bld_obj_rune',
    atlas = 'bld_consumable',
    pos = {x=2, y=5},
    config = {extra = {active = false, rounds = 3, roundsActive = 0, money = 5, chips = 80, xmult = 2, value = 0}},
    keep_on_use = function(self, card)
        return true
    end,
    cost = 4,
    can_use = function(self, card)
        if G.STATE == G.STATES.SELECTING_HAND then
            return not card.ability.extra.active
        else
            return false
        end
    end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {key = 'bld_active', set = 'Other'}
        return {
            key = (card.ability.extra.value == 2 and "c_bld_arengeetwo") or (card.ability.extra.value == 3 and "c_bld_arengeethree") or
            (card.ability.extra.value == 4 and "c_bld_arengeefour") or (card.ability.extra.value == 5 and "c_bld_arengeefive") or
            (card.ability.extra.value == 6 and "c_bld_arengeesix") or "c_bld_arengeeone",
            vars = {
                card.ability.extra.roundsActive, card.ability.extra.rounds, card.ability.extra.money, card.ability.extra.chips, card.ability.extra.xmult
            }
        }
    end,
    use = function(self, card, area, copier)
        card.ability.extra.active = true
        card.ability.extra.roundsActive = card.ability.extra.roundsActive + 1
        play_sound('bld_rune1', 1.1 + math.random()*0.1, 0.8)
        local eval = function(card) return card.ability.extra.active end
        juice_card_until(card, eval, true)
    end,
    load = function(self,card,card_table,other_card)
        local eval = function(card) return card.ability.extra.active end
        juice_card_until(card, eval, true)
    end,
    calculate = function(self, card, context)
        if context.setting_blind and card.ability.extra.active then 
        card.ability.extra.roundsActive = card.ability.extra.roundsActive + 1
        end
        if context.joker_main and card.ability.extra.active then
            if card.ability.extra.value == 2 then
                return{
                    dollars = card.ability.extra.money
                }
            end
            if card.ability.extra.value == 3 then
                return{
                    extra = {focus = card, message = localize('k_filmcard_ex'), func = function()
                        G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            delay = 0.0,
                            func = (function()
                                    if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                                    local planet = create_card('bld_obj_filmcard',G.consumeables, nil, nil, nil, nil, nil, 'vast')
                                    planet:add_to_deck()
                                    G.consumeables:emplace(planet)
                                    G.GAME.consumeable_buffer = 0
                                    end
                                return true
                            end)}))
                    end},
                    colour = G.C.SECONDARY_SET.bld_obj_filmcard,
                    card = card
                }
            end
            if card.ability.extra.value == 4 then
                return{
                    chips = card.ability.extra.chips
                }
            end
            if card.ability.extra.value == 5 then
                return{
                    xmult = card.ability.extra.xmult
                }
            end
        end
        if context.repetition and card.ability.extra.active and card.ability.extra.value == 6 and context.other_card and context.other_card.facing ~= 'back' and context.cardarea == G.play and context.other_card.ability.extra.rescore ~= 1 then
            return {
                repetitions = 1
            }
        end
        if context.after and card.ability.extra.active then
            card.ability.extra.value = pseudorandom('arengee', 1, 6)
            return {
                message = localize('k_reroll_ex'),
                colour = G.C.GREEN,
            }       
        end
        if context.end_of_round and not context.repetition and not context.individual and not card.getting_sliced and card.ability.extra.active and card.ability.extra.roundsActive == card.ability.extra.rounds then
            card.getting_sliced = true
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer - 1
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                G.GAME.consumeable_buffer = 0
                play_sound('bld_rune2', 1.0 + math.random()*0.1, 0.8)
                card:start_dissolve()
            return true end }))
        end
    end
}