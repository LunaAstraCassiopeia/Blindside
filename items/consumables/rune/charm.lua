SMODS.Consumable {
    key = 'charm',
    set = 'bld_obj_rune',
    atlas = 'bld_consumable',
    pos = {x=6, y=5},
    config = {max_highlighted = 1, extra = {round = 3, charge = 3}},
    keep_on_use = function(self, card)
        return true
    end,
    cost = 4,
    can_use = function(self, card)
        if card.ability.consumeable.max_highlighted == #G.hand.highlighted then
            return card.ability.extra.charge >= card.ability.extra.round
        end
    end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {key = 'bld_active', set = 'Other'}
        info_queue[#info_queue+1] = {key = 'bld_upgrade', set = 'Other'}
        return {
            vars = {
                (card.ability.extra.charge == card.ability.extra.round and localize('k_active_ex')) or (card.ability.extra.charge .. '/' .. card.ability.extra.round .. " " .. localize("k_rounds")),
                card.ability.max_highlighted
            }
        }
    end,
    use = function(self, card, area, copier)
        card.ability.extra.charge = 0
        play_sound('bld_rune1', 1.1 + math.random()*0.1, 0.8)
        upgrade_blinds(G.highlighted.cards)
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
                    colour = G.C.PURPLE,
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