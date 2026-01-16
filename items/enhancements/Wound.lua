    BLINDSIDE.Blind({
        key = 'wound',
        atlas = 'bld_blindrank',
        pos = {x = 5, y = 9},
        config = {
            extra = {
                value = 30,
                mult = 2,
                xmult = 1.75,
            }},
        hues = {"Red"},
        curse = true,
        calculate = function(self, card, context)
            if context.burn_card and context.cardarea == G.play and context.burn_card == card then
                return { remove = true }
            end

            if context.cardarea == G.play and context.main_scoring then
                local not_red = 0
                for key, value in pairs(context.scoring_hand) do
                    if not value:is_color('Red') then
                        not_red = not_red + 1
                    end
                end
                if card.ability.extra.upgraded then
                    return {
                        mult = -card.ability.extra.mult * not_red,
                        xmult = card.ability.extra.xmult
                    }
                else
                    return {
                        mult = -card.ability.extra.mult * not_red
                    }
                end
            end
        end,
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue+1] = {key = 'bld_burn', set = 'Other'}
            return {
                key = card.ability.extra.upgraded and 'm_bld_wound_upgraded' or 'm_bld_wound',
                vars = {
                    card.ability.extra.mult,
                    card.ability.extra.xmult
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
