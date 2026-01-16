
    SMODS.Joker({
        key = 'bedazzler',
        atlas = 'bld_trinkets',
        pos = {x = 8, y = 1},
        rarity = 'bld_doodad',
        cost = 10,
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
            if context.setting_blind and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                SMODS.add_card {set = 'bld_obj_mineral',}
                                G.GAME.consumeable_buffer = 0
                                return true
                            end
                        }))
                        SMODS.calculate_effect({ message = localize('k_mineral_ex'), colour = G.C.SECONDARY_SET.bld_obj_mineral },
                            context.blueprint_card or card)
                        return true
                    end)
                }))
            end
            if context.using_consumeable and context.consumeable.ability.set == 'bld_obj_mineral' then
                if #G.hand.cards > 0 then
                    G.hand:unhighlight_all()
                    local enhancement = pseudorandom_element(SMODS.ObjectTypes.bld_obj_enhancements.enhancements, 'booster')
                    local _cards = {}   
                    for k, v in ipairs(G.hand.cards) do
                        if not v.seal then
                            _cards[#_cards+1] = v  
                        end
                    end
                    if #_cards > 0 then
                        local selected_card, card_key = pseudorandom_element(_cards, pseudoseed('bedazzler'))
                        G.hand:add_to_highlighted(selected_card, true)
                    G.E_MANAGER:add_event(Event({func = function()
                        play_sound('tarot1')
                        card:juice_up(0.3, 0.5)
                        return true end }))
                    if #G.hand.highlighted > 0 then
                        for i=1, #G.hand.highlighted do
                            local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
                            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.highlighted[i]:flip();play_sound('card1', percent);G.hand.highlighted[i]:juice_up(0.3, 0.3);return true end }))
                        end
                        for i=1, #G.hand.highlighted do
                            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function() G.hand.highlighted[i]:set_seal(enhancement, nil, true);return true end }))
                        end 
                        for i=1, #G.hand.highlighted do
                            local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
                            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.highlighted[i]:flip();play_sound('tarot2', percent, 0.6);G.hand.highlighted[i]:juice_up(0.3, 0.3);return true end }))
                        end
                    end
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end }))
                        
                    end
                end
            end
        end
    })