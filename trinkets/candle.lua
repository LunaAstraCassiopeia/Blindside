
    SMODS.Joker({
        key = 'candle',
        atlas = 'bld_trinkets',
        pos = {x = 5, y = 5},
        rarity = 'bld_keepsake',
        config = {
            extra = {
                mult_gain = 0.25,
                additional_mult = 0,
                burned = false
            }
        },
        cost = 15,
        blueprint_compat = false,
        eternal_compat = true,
        loc_vars = function (self, info_queue, card)
            info_queue[#info_queue+1] = {key = 'bld_burn', set = 'Other'}
            return {
                vars = {
                card.ability.extra.mult_gain,
                1 + card.ability.extra.additional_mult
            }
        }
        end,
        in_pool = function(self, args)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
                return true
            else
            return false
            end
        end,
        calculate = function(self, card, context)
            if context.joker_main then
                if card.ability.extra.additional_mult > 0 then
                    return {
                        xmult = 1 + card.ability.extra.additional_mult
                    }
                end
            end
            if context.after and card.ability.extra.burned > 0 then
                card.ability.extra.additional_mult = card.ability.extra.additional_mult + card.ability.extra.mult_gain-- * (card.ability.extra.burned)
                return {
                    message = localize('k_upgrade_ex'),
                }
            end
            if context.cards_burned then
                card.ability.extra.burned = #context.cards_burned
            end
            if context.cards_burned and #context.cards_burned == 0 then
                card.ability.extra.additional_mult = 0
                card.ability.extra.burned = 0
                return {
                    message = localize('k_reset')
                }
            end
        end
    })