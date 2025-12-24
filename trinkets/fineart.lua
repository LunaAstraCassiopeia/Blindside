
    SMODS.Joker({
        key = 'fineart',
        atlas = 'bld_trinkets',
        pos = {x = 2, y = 4},
        rarity = 'bld_keepsake',
        config = {
            extra = {
                xmult = 3,
                odds = 8,
                secret = 0,
            }
        },
        cost = 15,
        blueprint_compat = true,
        eternal_compat = true,
        loc_vars = function (self, info_queue, card)
            local n,d = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
            return {
                vars = {
                    card.ability.extra.xmult,
                    n,
                    d
                },
            }
        end,
        in_pool = function(self, args)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
                return true
            else
            return false
            end
        end,
        calculate = function(self, card, context)
            if context.joker_main then
                return {
                    xmult = card.ability.extra.xmult
                }
            end

            if context.end_of_round and not context.blueprint and not context.repetition and not context.individual then
                if card.ability.extra.secret and card.ability.extra.secret >= 2 and SMODS.pseudorandom_probability(card, pseudoseed('fineart'), 1, card.ability.extra.odds) then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            play_sound('tarot1')
                            card.T.r = -0.2
                            card:juice_up(0.3, 0.4)
                            card.states.drag.is = true
                            card.children.center.pinch.x = true
                            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                                func = function()
                                    G.jokers:remove_card(self)
                                    card:remove()
                                    card = nil
                                    return true
                                end}))
                            return true
                        end
                    }))
                    return {
                        message = localize('bld_fineart_dead')
                    }
                else
                    if not card.ability.extra.secret then
                        card.ability.extra.secret = 0
                    end
                    card.ability.extra.secret = card.ability.extra.secret + 1
                    return {
                        message = localize('k_safe_ex')
                    }
                end
            end
        end
    })