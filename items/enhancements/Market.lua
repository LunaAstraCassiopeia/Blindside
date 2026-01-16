    BLINDSIDE.Blind({
        key = 'market',
        atlas = 'bld_blindrank',
        pos = {x = 0, y = 9},
        config = {
            extra = {
                xmult = 1,
                x_mult_gain = 0.5,
                x_mult_lose = 0.5,
                x_mult_gain_up = 0.5,
                x_mult_lose_up = 0.25,
                value = 11,
                retain = true,
            }},
        hues = {"Purple"},
        rare = true,
        credit = {
            art = "Gud",
            code = "base4",
            concept = "base4"
        },
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.main_scoring then
                local mult = card.ability.extra.xmult
                card.ability.extra.xmult = card.ability.extra.xmult - card.ability.extra.x_mult_lose
                return {
                    xmult = mult
                }
            end

            if context.cardarea == G.hand and context.main_scoring then
                card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.x_mult_gain
                return {
                    message = localize('k_upgrade_ex')
                }
            end
        end,
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue+1] = {key = 'bld_retain', set = 'Other'}
            return {
                vars = {
                    card.ability.extra.xmult,
                    card.ability.extra.x_mult_gain,
                    card.ability.extra.x_mult_lose
                }
            }
        end,
        upgrade = function(card)
            if not card.ability.extra.upgraded then
                card.ability.extra.x_mult_gain = card.ability.extra.x_mult_gain + card.ability.extra.x_mult_gain_up
                card.ability.extra.x_mult_lose = card.ability.extra.x_mult_lose + card.ability.extra.x_mult_lose_up
                card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
