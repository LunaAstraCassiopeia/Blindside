    SMODS.Enhancement({
        key = 'staff',
        atlas = 'bld_blindrank',
        pos = {x = 7, y = 3},
        config = {
            extra = {
                value = 11,
                hues = {"Purple"}
            }},
        replace_base_card = true,
        no_rank = true,
        no_suit = true,
        overrides_base_rank = true,
        always_scores = true,
        in_pool = function(self, args)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
                return true
            else
            return false
            end
        end,
        weight = 3,
        pools = {
            ["bld_obj_blindcard_generate"] = true,
            ["bld_obj_blindcard_cool"] = true,
            ["bld_obj_blindcard_single"] = true,
            ["bld_obj_blindcard_purple"] = true,
        },
        calculate = function(self, card, context)
            if context.modify_hand and context.scoring_hand then
                local i_scored = false
                for key, value in pairs(context.scoring_hand) do
                    if value == card then
                        i_scored = true
                    end
                end

                if not i_scored then
                    return
                end

                local enhancement = pseudorandom_element(SMODS.ObjectTypes.bld_obj_enhancements.enhancements, 'booster')
                local _cards = {}
                for k, v in ipairs(context.scoring_hand) do
                    if not v.seal and v ~= card then
                        _cards[#_cards+1] = v
                    end
                end
                if #_cards > 0 then
                    local selected_card, card_key = pseudorandom_element(_cards, pseudoseed('staff'))
                    G.E_MANAGER:add_event(Event({func = function()
                        selected_card:juice_up(0.3, 0.5)
                        return true end }))
                    G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.4,func = function() selected_card:flip();play_sound('tarot1');selected_card:juice_up(0.3, 0.3);return true end }))
                    G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.2,func = function() selected_card:set_seal(enhancement, nil, true);return true end }))
                    G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.4,func = function() selected_card:flip();play_sound('tarot2', 1, 0.6);selected_card:juice_up(0.3, 0.3);return true end }))
                    card.ability.extra.stored_card = selected_card
                end
            end

            if card.ability.extra.stored_card and context.burn_card and card.ability.extra.stored_card == context.burn_card and not card.ability.extra.upgraded then
                card.ability.extra.stored_card = nil
                return {
                    message = localize('k_staff'),
                    card = context.burn_card,
                    remove = true
                }
            end

            if context.after then
                card.ability.extra.stored_card = nil
            end
        end,
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue + 1] = {key = 'bld_burn', set = 'Other'}
            return {
                key = card.ability.extra.upgraded and 'm_bld_staff_upgraded' or 'm_bld_staff'
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
