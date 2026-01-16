    BLINDSIDE.Blind({
        key = 'blood',
        atlas = 'bld_blindrank',
        pos = {x = 0, y = 4},
        config = {
            extra = {
                value = 14,
                mult = 0,
                mult_mod = 10,
                mult_modup = 5,
            }},
        hues = {"Red"},
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
                if #G.jokers.cards > 0 then
                    if not G.jokers.cards[1].ability.eternal and not G.jokers.cards[1].getting_sliced then
                    local sliced_card = G.jokers.cards[1]
                    sliced_card.getting_sliced = true
                    G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                    G.E_MANAGER:add_event(Event({func = function()
                        G.GAME.joker_buffer = 0
                        sliced_card:start_dissolve({HEX("57ecab")}, nil, 1.6)
                        play_sound('slice1', 0.96+math.random()*0.08)
                    return true end }))
                    SMODS.scale_card(card, {
                        ref_table = card.ability.extra,
                        ref_value = "mult",
                        scalar_value = "mult_mod",
                        operation = '+',
                        message_colour = G.C.RED
                    })
                    end
                end
            end
            if context.cardarea == G.play and context.main_scoring then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.mult, card.ability.extra.mult_mod
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.extra.mult_mod = card.ability.extra.mult_mod + card.ability.extra.mult_modup
            card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
