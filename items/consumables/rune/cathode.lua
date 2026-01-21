SMODS.Consumable {
    key = 'cathode',
    set = 'bld_obj_rune',
    atlas = 'bld_consumable',
    pos = {x=5, y=5},
    config = {extra = {round = 2, charge = 2}},
    keep_on_use = function(self, card)
        return true
    end,
    cost = 4,
    can_use = function(self, card)
        if G.consumeables then
            local channels = false
            for k,v in pairs(G.consumeables.cards) do
                if v.ability.set == 'bld_obj_filmcard' then
                    channels = true
                end
            end
            if channels then
                return card.ability.extra.charge >= card.ability.extra.round
            end
        end
    end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {key = 'bld_active', set = 'Other'}
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
        if G.consumeables then
            local channels = {}
            for k,v in pairs(G.consumeables.cards) do
                if v.ability.set == 'bld_obj_filmcard' then
                    table.insert(channels,v)
                end
            end
            if channels[1] then
                G.E_MANAGER:add_event(Event({
                    func = function() 
                        local card = copy_card(pseudorandom_element(channels, pseudoseed('cathode')), nil)
                        card:set_edition({negative = true}, true)
                        card:add_to_deck()
                        G.consumeables:emplace(card) 
                        return true
                    end}))
            end
        end
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
                    colour = G.C.SECONDARY_SET.bld_obj_filmcard,
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