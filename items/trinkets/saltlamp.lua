
    SMODS.Joker({
        key = 'saltlamp',
        atlas = 'bld_trinkets',
        pos = {x = 1, y = 4},
        rarity = 'bld_keepsake',
        config = {
            extra = {
                active = false
            }
        },
        cost = 15,
        blueprint_compat = true,
        eternal_compat = true,
        in_pool = function(self, args)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
                return true
            else
            return false
            end
        end,
        credit = {
            art = "AstraLuna",
            code = "AstraLuna",
            concept = "AstraLuna"
        },
        calculate = function(self, card, context)
            if context.first_hand_drawn then
                card.ability.extra.active = true
                local eval = function() return card.ability.extra.active end
                juice_card_until(card, eval, true)
            end
            if context.before and next(context.poker_hands['bld_blind_flush']) and card.ability.extra.active then
                    if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                        G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            delay = 0.0,
                            func = function()
                                local _planet, _hand, _tally = nil, nil, 0
                                for _, handname in ipairs(G.handlist) do
                                    if SMODS.is_poker_hand_visible(handname) and G.GAME.hands[handname].played > _tally then
                                        _hand = handname
                                        _tally = G.GAME.hands[handname].played
                                    end
                                end
                                if _hand then
                                    for _, v in pairs(G.P_CENTER_POOLS.bld_obj_mineral) do
                                        if v.config.hand_type == _hand then
                                            _planet = v.key
                                        end
                                    end
                                end
                                if _planet then
                                    SMODS.add_card({ key = _planet })
                                end
                                G.GAME.consumeable_buffer = 0
                                return true
                            end
                        }))
                        card.ability.extra.active = false
                    end
                return {
                    message = localize('k_mineral_ex'),
                    colour = G.C.SECONDARY_SET.bld_obj_mineral,
                    card = card
                }
            end
        end
    })