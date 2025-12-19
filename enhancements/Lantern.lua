    BLINDSIDE.Blind({
        key = 'lantern',
        atlas = 'bld_blindrank',
        pos = {x = 8, y = 4},
        config = {
            extra = {
                value = 17,
                xchips = 1.75,
                xchips_gain = 0.5,
            }},
        hues = {"Blue"},
        calculate = function(self, card, context) 
            if context.before and context.cardarea == G.play and not context.blueprint and not next(context.poker_hands['bld_blind_3oak']) and card.facing ~= 'back' then
                --[[SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "xchips",
                    scalar_value = "xchip_mod",
                    operation = '+',
                    message_colour = G.C.BLUE
                })]]
            end
            if context.cardarea == G.play and context.main_scoring then
                if not has_group_of(3, context.poker_hands) then
                    return {
                        xchips = card.ability.extra.xchips
                    }
                else
                    return {
                        message = localize('k_nope_ex'),
                        colour = G.C.BLUE
                    }
                end
            end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.xchips, card.ability.extra.xchip_mod
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.extra.xchips = card.ability.extra.xchips + card.ability.extra.xchips_gain
            card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
