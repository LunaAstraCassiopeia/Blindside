    BLINDSIDE.Blind({
        key = 'monolith',
        atlas = 'bld_blindrank',
        pos = {x = 7, y = 7},
        config = {
            extra = {
                xmult = 1,
                xmult_gain = 0.4,
                xmult_lose = 0.8,
                xmult_gain_up = 0.35,
                xmult_lose_up = 0.2,
                value = 11,
            }},
        hues = {"Purple"},
        rare = true,
        credit = {
            art = "Gud",
            code = "base4",
            concept = "base4"
        },
        calculate = function(self, card, context)
            if context.before then
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
                        card.ability.extra.xmult = math.max(0, card.ability.extra.xmult - card.ability.extra.xmult_lose)
                        return {
                            message = localize("k_downgrade_ex")
                        }
                    else
                       card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain
                        return {
                            message = localize("k_upgrade_ex")
                        }
                    end
                end
            end
            
            if context.cardarea == G.play and context.main_scoring then
                return {
                    xmult = card.ability.extra.xmult
                }
            end
        end,
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue+1] = {key = 'bld_retain', set = 'Other'}
            return {
                vars = {
                    card.ability.extra.xmult,
                    card.ability.extra.xmult_gain,
                    card.ability.extra.xmult_lose
                }
            }
        end,
        upgrade = function(card)
            if not card.ability.extra.upgraded then
                card.ability.extra.xmult_gain = card.ability.extra.xmult_gain + card.ability.extra.xmult_gain_up
                card.ability.extra.xmult_lose = card.ability.extra.xmult_lose + card.ability.extra.xmult_lose_up
                card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
