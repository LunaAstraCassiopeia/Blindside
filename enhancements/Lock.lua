    BLINDSIDE.Blind({
        key = 'lock',
        atlas = 'bld_blindrank',
        pos = {x = 2, y = 5},
        config = {bonus = 40,
            extra = {
                value = 2,
                repetitions = 1,
                pick_count = 0,
                pick_target = 3,
            }},
        hues = {"Faded"},
        always_scores = true,
        in_pool = function(self, args)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
                return true
            else
            return false
            end
        end,
        calculate = function(self, card, context)
            if context.repetition and context.cardarea == G.play and card.facing ~= 'back' and card.ability.extra.upgraded and context.other_card.ability.extra.rescore ~= 1 then
                return {
                    repetitions = card.ability.extra.repetitions
                }
            end
            if context.after and context.cardarea == G.play and card.facing ~= 'back' then
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                local key = nil
                for i=1, #G.play.cards do
                    if G.play.cards[i].config.center_key == 'm_bld_key' and not G.play.cards[i].getting_sliced then
                        -- play lockpicking cutscene
                        card.ability.extra.pick_count = card.ability.extra.pick_count + 1
                        key = G.play.cards[i]
                        break
                    end
                end
                if key then
                    if card.ability.extra.pick_count == 1 then
                        local juiceit = true
                        G.E_MANAGER:add_event(Event({trigger = 'before', delay = 2 * G.SETTINGS.GAMESPEED, func = function()
                            key:juice_up()
                            card_eval_status_text(
                                key,
                                'extra',
                                nil, nil, nil,
                                {message = "Lockpicking...", colour = G.C.DARK_EDITION, instant = true}
                            )
                            juice_card_until(key, function ()
                                return juiceit
                            end)
                            return true
                        end}))
                        G.E_MANAGER:add_event(Event({trigger = 'before', delay = 1, func = function()
                            juiceit = false
                            card_eval_status_text(
                                card,
                                'extra',
                                nil, nil, nil,
                                {message = "Almost!", colour = G.C.DARK_EDITION, instant = true}
                            )
                            return true
                        end}))
                    elseif card.ability.extra.pick_count == 2 then
                        local juiceit = true
                        G.E_MANAGER:add_event(Event({trigger = 'before', delay = 2 * G.SETTINGS.GAMESPEED, func = function()
                            key:juice_up()
                            card_eval_status_text(
                                key,
                                'extra',
                                nil, nil, nil,
                                {message = "Lockpicking...", colour = G.C.DARK_EDITION, instant = true}
                            )
                            juice_card_until(key, function ()
                                return juiceit
                            end)
                            return true
                        end}))
                        G.E_MANAGER:add_event(Event({trigger = 'before', delay = 1, func = function()
                            juiceit = false
                            card_eval_status_text(
                                card,
                                'extra',
                                nil, nil, nil,
                                {message = "One More!", colour = G.C.DARK_EDITION, instant = true}
                            )
                            return true
                        end}))
                    elseif card.ability.extra.pick_count >= 3 then
                        key.getting_sliced = true
                        card.getting_sliced = true

                        local juiceit = true
                        G.E_MANAGER:add_event(Event({trigger = 'before', delay = 2 * G.SETTINGS.GAMESPEED, func = function()
                            key:juice_up()
                            card_eval_status_text(
                                key,
                                'extra',
                                nil, nil, nil,
                                {message = "Lockpicking...", colour = G.C.DARK_EDITION, instant = true}
                            )
                            juice_card_until(key, function ()
                                return juiceit
                            end)
                            return true
                        end}))
                        G.E_MANAGER:add_event(Event({trigger = 'before', delay = 1, func = function()
                            juiceit = false
                            card_eval_status_text(
                                card,
                                'extra',
                                nil, nil, nil,
                                {message = "Unlocked!", colour = G.C.DARK_EDITION, instant = true}
                            )
                            key:start_dissolve()
                            return true
                        end}))
                        G.E_MANAGER:add_event(Event({trigger = 'before', delay = 1, func = function()
                            card:start_dissolve()
                            return true
                        end}))
                        SMODS.calculate_context({remove_playing_cards = true, removed = {card, key}, scoring_hand = context.scoring_hand})

                        local copy_card = SMODS.create_card({ set = 'Base', enhancement = 'm_bld_door' })
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

                        -- ghostbuster
                        G.E_MANAGER:add_event(Event({
                            func = function ()
                                G.E_MANAGER:add_event(Event({
                                    func = function ()
                                        G.E_MANAGER:add_event(Event({
                                            func = function ()
                                                for key, value in pairs({card, key}) do
                                                    value:remove()
                                                end
                                                return true
                                            end
                                        }))
                                        return true
                                    end
                                }))
                                return true
                            end
                        }))
                        return {
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
            end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                key = card.ability.extra.upgraded and 'm_bld_lock_upgraded' or 'm_bld_lock',
                vars = {
                    card.ability.bonus
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
