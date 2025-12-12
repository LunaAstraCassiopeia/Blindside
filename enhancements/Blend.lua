    BLINDSIDE.Blind({
        key = 'blend',
        atlas = 'bld_blindrank',
        pos = {x = 9, y = 2},
        config = {
            extra = {
                value = 14,
            }},
        hues = {"Purple"},
        rare = true,
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
        calculate = function(self, card, context)
                if context.cardarea == G.play and context.before and card.facing ~= 'back' then
                    for i=1, #G.play.cards do
                        if (G.play.cards[i]:is_color("Blue", true, false) or G.play.cards[i]:is_color("Red", true, false)) and G.play.cards[i] ~= card then
                            if G.play.cards[i].facing ~= 'back' then 
                            G.play.cards[i]:flip()
                            end
                            G.play.cards[i]:set_debuff(true)
                        end
                    end
                end
                if context.cardarea == G.play and context.main_scoring then
                    if not card.ability.extra.upgraded then
                        for i = 1, 2 do
                            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                            local planet = create_card('bld_obj_filmcard',G.consumeables, nil, nil, nil, nil, nil, 'vast')
                            planet:add_to_deck()
                            G.consumeables:emplace(planet)
                            G.GAME.consumeable_buffer = 0
                            end
                        end
                        return {
                            message = localize('k_filmcard_ex'),
                            colour = G.C.SECONDARY_SET.bld_obj_filmcard,
                            card = card
                        }
                    else
                        for i = 1, 2 do
                            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                            local planet = create_card('bld_obj_ritual',G.consumeables, nil, nil, nil, nil, nil, 'vast')
                            planet:add_to_deck()
                            G.consumeables:emplace(planet)
                            G.GAME.consumeable_buffer = 0
                            end
                        end
                        return {
                            message = localize('k_ritual_ex'),
                            colour = G.C.SECONDARY_SET.bld_obj_ritual,
                            card = card
                        }
                    end
                end
                if context.cardarea == G.play and context.after and card.facing ~= 'back' then
                    for i=1, #G.play.cards do
                        if (G.play.cards[i]:is_color("Blue", true, false) or G.play.cards[i]:is_color("Red", true, false)) and G.play.cards[i] ~= card then
                            G.play.cards[i]:set_debuff(false)
                        end
                    end
                end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                key = card.ability.extra.upgraded and 'm_bld_blend_upgrade' or 'm_bld_blend',
                vars = {
                    card.ability.chips
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
