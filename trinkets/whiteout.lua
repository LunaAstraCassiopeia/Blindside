
    SMODS.Joker({
        key = 'whiteout',
        atlas = 'bld_trinkets',
        pos = {x = 4, y = 3},
        rarity = 'bld_doodad',
        config = {
            extra = {
                active = true,
            }
        },
        cost = 10,
        blueprint_compat = true,
        eternal_compat = true,
        loc_vars = function (self, info_queue, card)
            info_queue[#info_queue+1] = G.P_CENTERS["m_bld_blank"]
            return {}
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
            if context.first_hand_drawn and card.ability.extra.active then
                local eval = function() return card.ability.extra.active end
                juice_card_until(card, eval, true)
            end
            if context.before and card.ability.extra.active and G.GAME.current_round.hands_played == 0 then
                if #context.full_hand == 1 then
                    card.ability.extra.active = false
                    context.full_hand[1]:set_ability(G.P_CENTERS.m_bld_blank, nil, true)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            context.full_hand[1]:juice_up()
                            return true
                        end
                    }))
                    return {
                        message = localize('k_whiteout_ex'),
                        colour = G.C.DARK_EDITION,
                    }
                end
            end

            if context.beat_boss then
                card.ability.extra.active = true
            end
        end
    })