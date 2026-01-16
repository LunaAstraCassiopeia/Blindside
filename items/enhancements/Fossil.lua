    BLINDSIDE.Blind({
        key = 'fossil',
        atlas = 'bld_blindrank',
        pos = {x = 9, y = 6},
        config = {
            extra = {
                value = 13,
                odds = 2,
                retain = true,
                activated = false,
            }},
        hues = {"Green"},
        credit = {
            art = "AnneBean",
            code = "base4",
            concept = "base4"
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

            if context.hand_retain and card.ability.extra.activated and not card.ability.extra.upgraded then
                card.ability.extra.activated = false
                return {burn = true}
            end
        end,
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue+1] = {key = 'bld_retain', set = 'Other'}
            if not card.ability.extra.upgraded then
                info_queue[#info_queue+1] = {key = 'bld_burn', set = 'Other'}
            end
            local n,d = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
            return {
                key = card.ability.extra.upgraded and 'm_bld_fossil_upgraded' or 'm_bld_fossil',
                vars = {
                    n,d
                }
            }
        end,
        upgrade = function(card)
            if not card.ability.extra.upgraded then
            card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
