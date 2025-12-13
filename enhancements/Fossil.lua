    SMODS.Enhancement({
        key = 'fossil',
        atlas = 'bld_blindrank',
        pos = {x = 9, y = 6},
        config = {
            extra = {
                value = 13,
                odds = 2,
                hues = {"Green"},
                activated = false,
            }},
        replace_base_card = true,
        no_rank = true,
        no_suit = true,
        overrides_base_rank = true,
        in_pool = function(self, args)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
                return true
            else
            return false
            end
        end,
        pools = {
            ["bld_obj_blindcard_generate"] = true,
            ["bld_obj_blindcard_cool"] = true,
            ["bld_obj_blindcard_warm"] = true,
            ["bld_obj_blindcard_single"] = true,
            ["bld_obj_blindcard_green"] = true,
        },
        calculate = function(self, card, context)
            if context.cardarea == G.hand and context.main_scoring then
                local mineral = nil
                for k, v in pairs(G.P_CENTER_POOLS.bld_obj_mineral) do
                    if v.config.hand_type == context.scoring_name then
                        mineral = v.key
                    end
                end
                if mineral and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    if SMODS.pseudorandom_probability(card, pseudoseed('fossil'), 1, card.ability.extra.odds, 'fossil') then
                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                        card.ability.extra.activated = true
                        return {
                            message = localize('k_fossil_excavate'),
                            func = function ()
                                G.E_MANAGER:add_event(Event({
                                    trigger = 'before',
                                    delay = 0.5,
                                    func = function()
                                        SMODS.add_card({key = mineral})
                                        G.GAME.consumeable_buffer = 0
                                        return true
                                    end
                                }))
                            end
                        }
                    else
                        return {
                            message = localize('k_nope_ex')
                        }
                    end
                end
            end

            --[[if context.burn_card and context.burn_card == card and card.ability.extra.activated then
                card.ability.extra.activated = false
                return {remove = true}
            end]]
        end,
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue+1] = {key = 'bld_burn', set = 'Other'}
            local n,d = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
            return {
                vars = {
                    n,d
                }
            }
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
