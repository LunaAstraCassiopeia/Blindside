SMODS.Consumable {
    key = 'joker404',
    set = 'bld_obj_rune',
    atlas = 'bld_consumable',
    pos = {x=4, y=6},
    config = {extra = {round = 1, charge = 1, disable = false}},
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
        return {
            vars = {
                (card.ability.extra.charge == card.ability.extra.round and localize('k_active_ex')) or (card.ability.extra.charge .. '/' .. card.ability.extra.round .. " " .. localize("k_rounds"))
            }
        }
    end,
    use = function(self, card, area, copier)
        card.ability.extra.charge = 0
        play_sound('bld_rune1', 1.1 + math.random()*0.1, 0.8)
        if not G.GAME.blind.disabled then
            card.ability.extra.disable = true
            G.GAME.blind:disable()
        else
            card.ability.extra.disable = false
        end
        card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_plus_joker404'), colour = G.C.DARK_EDITION, card = card})
    end,
    load = function(self,card,card_table,other_card)
        local eval = function(card) return card.ability.extra.active end
        juice_card_until(card, eval, true)
    end,
    calculate = function(self, card, context)
        if context.after and G.GAME.blind.disabled and card.ability.extra.disable then
            G.GAME.blind.config.blind.enable(G.GAME.blind)
            card.ability.extra.disable = false
        end
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