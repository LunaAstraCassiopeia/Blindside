SMODS.Consumable {
    key = 'betaexe',
    set = 'bld_obj_rune',
    atlas = 'bld_consumable',
    pos = {x=0, y=5},
    config = {extra = {round = 2, charge = 2}},
    keep_on_use = function(self, card)
        return true
    end,
    can_use = function(self, card)
        if G.STATE == G.STATES.SELECTING_HAND then
            return card.ability.extra.charge >= card.ability.extra.round
        else
            return false
        end
    end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {key = 'bld_active', set = 'Other'}
        info_queue[#info_queue + 1] = G.P_CENTERS.m_bld_beta
        return {
            vars = {
                (card.ability.extra.charge == card.ability.extra.round and localize('k_active_ex')) or (card.ability.extra.charge .. '/' .. card.ability.extra.round .. " " .. localize("k_rounds"))
            }
        }
    end,
    cost = 4,
    use = function(self, card, area, copier)
        card.ability.extra.charge = 0
        play_sound('bld_rune1', 1.1 + math.random()*0.1, 0.8)
        for i = 1, 5 do
        local beta = SMODS.create_card { set = "Base", enhancement = "m_bld_beta", area = G.discard }
        G.playing_card = (G.playing_card and G.playing_card + 1) or 1
        beta.playing_card = G.playing_card
        table.insert(G.playing_cards, beta)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.3,
            func = function()
                    beta:start_materialize({ G.C.SECONDARY_SET.Enhanced })
                    G.play:emplace(beta)
                return true
            end
        }))
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.7,
            func = function()
                for i = 1, 5 do
                    local beta = G.play[1]
                    draw_card(G.play, G.deck, 90, 'up')
                    SMODS.calculate_context({ playing_card_added = true, cards = {beta} })
                end
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.7,
                    func = function()
                        pseudoshuffle(G.deck.cards, 'beta'..G.GAME.round_resets.ante)
                        return true
                    end
                }))
                return true
            end
        }))
        card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_plus_beta'), colour = G.C.BLUE, card = card})
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
                    colour = G.C.BLUE,
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