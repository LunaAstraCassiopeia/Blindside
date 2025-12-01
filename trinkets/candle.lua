
    SMODS.Joker({
        key = 'candle',
        atlas = 'bld_trinkets',
        pos = {x = 5, y = 5},
        rarity = 'bld_curio',
        config = {
            extra = {
                mult_gain = 3,
            }
        },
        cost = 7,
        blueprint_compat = false,
        eternal_compat = true,
        loc_vars = function (self, info_queue, card)
            info_queue[#info_queue+1] = {key = 'bld_burn', set = 'Other'}
            return {
                vars = {
                card.ability.extra.mult_gain,
                card.ability.extra.mult_gain * ((G.exhaust and G.exhaust.cards) and #G.exhaust.cards or 0)
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
                if #G.exhaust.cards > 0 then
                    return {
                        mult = card.ability.extra.mult_gain * #G.exhaust.cards
                    }
                end
            end
        end
    })