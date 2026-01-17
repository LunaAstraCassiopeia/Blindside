    BLINDSIDE.Blind({
        key = 'ox',
        atlas = 'bld_blindrank',
        pos = {x = 1, y = 0},
        config = {
            extra = {
                money = 4,
                mult = 8,
                money_up = 1,
                mult_up = 3,
                value = 11,
            }},
        hues = {"Yellow"},
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.main_scoring then
                local _best_hand, _hand, _tally = nil, nil, -1
                for k, v in ipairs(G.handlist) do
                    if G.GAME.hands[v].visible and G.GAME.hands[v].played > _tally then
                        _hand = v
                        _best_hand = k
                        _tally = G.GAME.hands[v].played
                    end
                end
                if _hand then
                    if _hand == context.scoring_name then
                        return {
                            mult = card.ability.extra.mult,
                            card = card
                        }
                    else
                        G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.money
                        G.E_MANAGER:add_event(Event({func = (function() G.GAME.dollar_buffer = 0; return true end)}))
                        return {
                            dollars = card.ability.extra.money,
                            card = card
                        }
                    end
                end
            end
            if card.ability.extra.upgraded and context.cardarea == G.hand and context.main_scoring then
                local _best_hand, _hand, _tally = nil, nil, -1
                for k, v in ipairs(G.handlist) do
                    if G.GAME.hands[v].visible and G.GAME.hands[v].played > _tally then
                        _hand = v
                        _best_hand = k
                        _tally = G.GAME.hands[v].played
                    end
                end
                if _hand then
                    if _hand == context.scoring_name then
                        G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.money
                        G.E_MANAGER:add_event(Event({func = (function() G.GAME.dollar_buffer = 0; return true end)}))
                        return {
                            dollars = card.ability.extra.money,
                            card = card
                        }
                    else
                        return {
                            mult = card.ability.extra.mult,
                            card = card
                        }
                    end
                end
            end
        end,
        loc_vars = function(self, info_queue, card)
            return {

                key = card.ability.extra.upgraded and 'm_bld_ox_upgraded' or 'm_bld_ox',
                vars = {
                    card.ability.extra.money, card.ability.extra.mult
                }
            }
        end,
        upgrade = function(card)
            if not card.ability.extra.upgraded then
                card.ability.extra.upgraded = true
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_up
                card.ability.extra.money = card.ability.extra.money + card.ability.extra.money_up
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
