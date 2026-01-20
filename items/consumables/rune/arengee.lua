SMODS.Consumable {
    key = 'arengee',
    set = 'bld_obj_rune',
    atlas = 'bld_consumable',
    pos = {x=2, y=5},
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
        return {
            vars = {
                (card.ability.extra.charge == card.ability.extra.round and localize('k_active_ex') .. "!") or (card.ability.extra.charge .. '/' .. card.ability.extra.round .. " " .. localize("k_rounds"))
            }
        }
    end,
    use = function(self, card, area, copier)
        card.ability.extra.charge = 0
        local pool = {"tag_bld_magic","tag_bld_memory","tag_bld_magic","tag_bld_magic"}
        local tag_key = choose_stuff(pool, 1, "arengee")[1]
        add_tag(Tag(tag_key))
        play_sound('bld_rune1', 1.1 + math.random()*0.1, 0.8)
    end,
    load = function(self,card,card_table,other_card)
        local eval = function(card) return card.ability.extra.active end
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
                    colour = G.C.GREEN,
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