    BLINDSIDE.Blind({
        key = 'snow',
        atlas = 'bld_blindrank',
        pos = {x = 7, y = 5},
        config = {
            extra = {
                chips = 0,
                gain_chips = 40,
                gain_chips_gain = 40,
                value = 11,
                retain = true,
            }},
        hues = {"Purple"},
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.main_scoring then
                return {
                    chips = card.ability.extra.chips
                }
            end

            if context.cardarea == G.hand and context.main_scoring then
                card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.gain_chips
                return {
                    message = localize('k_upgrade_ex')
                }
            end

            if context.after and context.scoring_hand then
                local i_scored = false
                for key, value in pairs(context.scoring_hand) do
                    if value == card then
                        i_scored = true
                        break
                    end
                end

                if i_scored then
                    card.ability.extra.chips = 0
                    return {
                        message = localize('k_reset')
                    }
                end
            end
        end,
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue+1] = {key = 'bld_retain', set = 'Other'}
            return {
                vars = {
                    card.ability.extra.chips,
                    card.ability.extra.gain_chips
                }
            }
        end,
        upgrade = function(card)
            if not card.ability.extra.upgraded then
                card.ability.extra.gain_chips = card.ability.extra.gain_chips + card.ability.extra.gain_chips_gain
                card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
