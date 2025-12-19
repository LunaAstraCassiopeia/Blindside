    BLINDSIDE.Blind({
        key = 'hook',
        atlas = 'bld_blindrank',
        pos = {x = 9, y = 0},
        config = {
            mult = 4,
            extra = {
                discards = 1,
                value = 10,
                mult_gain = 6,
            }},
        hues = {"Red"},
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.main_scoring then
                ease_discard(card.ability.extra.discards)
            end
            if context.burn_card and context.cardarea == G.play and context.burn_card == card then
                return { remove = true }
            end
        end,
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue+1] = {key = 'bld_burn', set = 'Other'}
            return {
                vars = {
                    card.ability.mult, card.ability.extra.discards
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.mult = card.ability.mult + card.ability.extra.mult_gain
            card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
