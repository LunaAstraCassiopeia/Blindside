SMODS.Consumable {
    key = 'phalynx',
    set = 'bld_obj_rune',
    atlas = 'bld_consumable',
    pos = {x=9, y=5},
    config = {extra = {round = 2, charge = 2}},
    keep_on_use = function(self, card)
        return true
    end,
    cost = 4,
    can_use = function(self, card)
        if G.STATE == G.STATES.SELECTING_HAND then
            return card.ability.extra.charge >= card.ability.extra.round
        else
            return false
        end
    end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {key = 'bld_active', set = 'Other'}
        info_queue[#info_queue+1] = {key = 'bld_burn', set = 'Other'}
        return {
            vars = {
                (card.ability.extra.charge == card.ability.extra.round and localize('k_active_ex')) or (card.ability.extra.charge .. '/' .. card.ability.extra.round .. " " .. localize("k_rounds"))
            }
        }
    end,
    use = function(self, card, area, copier)
        card.ability.extra.charge = 0
        play_sound('bld_rune1', 1.1 + math.random()*0.1, 0.8)
        G.E_MANAGER:add_event(Event({
            trigger = 'immediate',
            func = function()
                local discard_count = #G.exhaust.cards
                for i=1, discard_count do --draw cards from deck
                    draw_card(G.exhaust, G.deck, i*100/discard_count,'up', nil ,nil, 0.005, i%2==0, nil, math.max((21-i)/20,0.7))
                end
                G.deck:shuffle('beta'..G.GAME.round_resets.ante, true)
                return true
            end
        }))
    end,
    load = function(self,card,card_table,other_card)
        local eval = function(card) return card.ability.extra.charge >= card.ability.extra.round end
        juice_card_until(card, eval, true)
    end,
    calculate = function(self, card, context)
        if context.end_of_round and not context.repetition and not context.individual and card.ability.extra.charge < card.ability.extra.round then
            card.ability.extra.charge = card.ability.extra.charge + 1
            if card.ability.extra.charge >= card.ability.extra.round then
                local eval = function(card) return card.ability.extra.charge >= card.ability.extra.round end
                juice_card_until(card, eval, true)
                return {
                    message = localize('k_active_ex'),
                    colour = G.C.MONEY,
                }
            else
                return {
                    message = card.ability.extra.charge .. '/' .. card.ability.extra.round,
                    colour = G.C.GREY,
                }
            end
        end
    end
}