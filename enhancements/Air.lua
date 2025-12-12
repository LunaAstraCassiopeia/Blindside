    BLINDSIDE.Blind({
        key = 'air',
        atlas = 'bld_blindrank',
        pos = {x = 0, y = 5},
        config = {
            extra = {
                value = 14,
            }
        },
        replace_base_card = true,
        no_rank = true,
        no_suit = true,
        hues = {"Faded"},
        rare = true,
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
        pools = {
            ["bld_obj_blindcard_generate"] = true,
            ["bld_obj_blindcard_single"] = true,
            ["bld_obj_blindcard_faded"] = true,
        },
        calculate = function(self, card, context)
            if context.after and context.cardarea == G.play and card.facing ~= 'back' then
                local adjacent = {}
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                local self_pos = nil
                for i=1, #G.play.cards do
                    if G.play.cards[i] == card then
                        self_pos = i
                    end
                end
                if G.play.cards[self_pos-1] then
                    table.insert(adjacent, G.play.cards[self_pos-1])
                end
                if G.play.cards[self_pos+1] then
                    table.insert(adjacent, G.play.cards[self_pos+1])
                end
                if #adjacent > 0 then
                    local copied_card = pseudorandom_element(adjacent, pseudoseed("air"))
                    local copy_card = copy_card(copied_card, nil, nil, G.playing_card)
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
                        message = localize('k_copied_ex'),
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
            if context.burn_card and context.cardarea == G.play and context.burn_card == card and context.burn_card.facing ~= 'back' and not card.ability.extra.upgraded then
                return { remove = true }
            end
        end,
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue+1] = {key = 'bld_burn', set = 'Other'}
            return {
                key = card.ability.extra.upgraded and 'm_bld_air_upgrade' or 'm_bld_air'
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
