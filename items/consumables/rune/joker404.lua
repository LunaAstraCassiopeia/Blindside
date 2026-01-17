SMODS.Consumable {
    key = 'joker404',
    set = 'bld_obj_rune',
    atlas = 'bld_consumable',
    pos = {x=4, y=6},
    config = {extra = {active = false, rounds = 1, roundsActive = 0}},
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
            vars = {
                card.ability.extra.roundsActive, card.ability.extra.rounds
            }
        }
    end,
    use = function(self, card, area, copier)
        card.ability.extra.active = true
        card.ability.extra.roundsActive = card.ability.extra.roundsActive + 1
        --card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled'), colour = G.C.DARK_EDITION, card = card})
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
        card.ability.extra.active = true
        card.ability.extra.roundsActive = card.ability.extra.roundsActive + 1
        end
        if context.joker_main and card.ability.extra.active then
            return {
                extra = {focus = card, message = localize{type='variable',key='a_rmult',vars={1}}, 
                colour = G.C.RED, func = function()
                    BLINDSIDE.chipsmodify(-1, 0 , 0)
                end},
                colour = G.C.RED,
                card = card
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