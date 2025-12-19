    BLINDSIDE.Blind({
        key = 'vast',
        atlas = 'bld_blindrank',
        pos = {x = 0, y = 3},
        config = {
            extra = {
                value = 14,
                blue = 2,
                less_blue = -1,
            }},
        hues = {"Blue"},
        calculate = function(self, card, context) 
            if context.cardarea == G.hand and context.main_scoring then
                local blues = 0
                for i = 1, #context.scoring_hand do
                    if context.scoring_hand[i]:is_color("Blue") then
                        blues = blues + 1
                    end
                end
                if blues >= card.ability.extra.blue and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    return {
                        extra = {focus = card, message = localize('k_mineral_ex'), func = function()
                            G.E_MANAGER:add_event(Event({
                                trigger = 'before',
                                delay = 0.0,
                                func = (function()
                                        local planet = create_card('bld_obj_mineral',G.consumeables, nil, nil, nil, nil, nil, 'vast')
                                        planet:add_to_deck()
                                        G.consumeables:emplace(planet)
                                        G.GAME.consumeable_buffer = 0
                                    return true
                                end)}))
                        end},
                        colour = G.C.SECONDARY_SET.bld_obj_mineral,
                        card = card
                    }
                end
            end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                key = card.ability.extra.upgraded and 'm_bld_vast_upgraded' or 'm_bld_vast',
                vars = {
                    card.ability.extra.blue
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.extra.blue = card.ability.extra.blue + card.ability.extra.less_blue
            card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
