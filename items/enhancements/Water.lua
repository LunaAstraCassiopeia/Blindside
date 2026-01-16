    BLINDSIDE.Blind({
        key = 'water',
        atlas = 'bld_blindrank',
        pos = {x = 6, y = 1},
        config = {
            extra = {
                value = 100,
                xchips_bonus = 0.25,
                xchips_bonus_up = 0.25,
                xchips = 1,
            }},
        hues = {"Faded", "Blue"},
        rare = true,
        loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {key = 'bld_burn', set = 'Other'}
            return {
                vars = {
                    card.ability.extra.xchips, card.ability.extra.xchips_bonus
                }
            }
        end,
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.before and card.facing ~= 'back' then   
                    SMODS.scale_card(card, {
                        ref_table = card.ability.extra,
                        ref_value = "xchips",
                        scalar_value = "xchips_bonus",
                        operation = '+',
                        message_colour = G.C.BLUE
                    })
            end
            if context.main_scoring and context.cardarea == G.play then
                return {
                    xchips = card.ability.extra.xchips
                }
            end
            if context.burn_card and context.cardarea == G.play and context.burn_card == card then
                return { remove = true }
            end

        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.extra.xchips_bonus = card.ability.extra.xchips_bonus + card.ability.extra.xchips_bonus_up
            card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
