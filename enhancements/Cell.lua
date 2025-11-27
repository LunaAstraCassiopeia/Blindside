    SMODS.Enhancement({
        key = 'cell',
        atlas = 'bld_blindrank',
        pos = {x = 9, y = 3},
        config = {
            extra = {
                value = 15,
                chips = 5,
                cell_tally = 0,
                chance = 1,
                trigger = 2,
                hues = {"Green"}
            }
        },
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
        weight = 3,
        pools = {
            ["bld_obj_blindcard_generate"] = true,
            ["bld_obj_blindcard_cool"] = true,
            ["bld_obj_blindcard_warm"] = true,
            ["bld_obj_blindcard_single"] = true,
            ["bld_obj_blindcard_green"] = true,
        },
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.main_scoring then
                    return {
                        chips = card.ability.extra.chips*card.ability.cell_tally
                    }
            end
            if context.after and context.cardarea == G.play and card.facing ~= 'back' then
                if SMODS.pseudorandom_probability(card, pseudoseed("flip"), card.ability.extra.chance, card.ability.extra.trigger, 'flip') then
                    G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                    local copy_card = copy_card(card, nil, nil, G.playing_card)
                    copy_card:add_to_deck()
                    G.deck.config.card_limit = G.deck.config.card_limit + 1
                    table.insert(G.playing_cards, copy_card)
                    G.hand:emplace(copy_card)
                    copy_card.states.visible = nil

                    G.E_MANAGER:add_event(Event({
                        func = function()
                            copy_card:start_materialize()
                            return true
                        end
                    }))
                    return {
                        message = localize('k_divide_ex'),
                        colour = G.C.GREEN,
                        func = function()
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    SMODS.calculate_context({ playing_card_added = true, cards = { copy_card } })
                                    return true
                                end
                            }))
                        end
                    }
                end
            end
            if context.burn_card and context.cardarea == G.play and context.burn_card == card and context.burn_card.facing ~= 'back' then
                return { remove = true }
            end
        end,
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue+1] = {key = 'bld_burn', set = 'Other'}
            local chance, trigger = SMODS.get_probability_vars(card, card.ability.extra.chance, card.ability.extra.trigger, 'flip')
            return {
                vars = {
                    card.ability.extra.chips,
                    chance,
                    trigger,
                    card.ability.extra.chips*card.ability.cell_tally
                }
            }
        end,
        update = function(self, card, dt)
            card.ability.cell_tally = 0
            if G.STAGE == G.STAGES.RUN then
                for k, v in pairs(G.playing_cards) do
                    if v:is_color("Green") then card.ability.cell_tally = card.ability.cell_tally+1 end
                end
            end
        end
    })
    
----------------------------------------------
------------MOD CODE END----------------------
