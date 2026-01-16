    BLINDSIDE.Blind({
        key = 'fire',
        atlas = 'bld_blindrank',
        pos = {x = 4, y = 3},
        config = {
            extra = {
                chips = 80,
                value = 16,
                chipsup = 60,
            }},
        hues = {"Red"},
        calculate = function(self, card, context)
                if context.cardarea == G.play and context.main_scoring then
                    local chips = card.ability.extra.chips
                    return {
                        chips = chips
                    }
                end
            if context.burn_card and context.cardarea == G.play and context.burn_card == card then
                return { remove = true }
            end

        end,
        loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {key = 'bld_burn', set = 'Other'}
            return {
                vars = {
                    card.ability.extra.chips
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipsup
            card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
