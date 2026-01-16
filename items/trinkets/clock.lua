
    SMODS.Joker({
        key = 'clock',
        atlas = 'bld_trinkets',
        pos = {x = 0, y = 1},
        rarity = 'bld_keepsake',
        config = {
            extra = {
                xmult = 3,
                count = 4,
            }
        },
        cost = 15,
        blueprint_compat = true,
        eternal_compat = true,
        loc_vars = function (self, info_queue, card)
            return {
                vars = {
                card.ability.extra.xmult,
                card.ability.extra.count
            }
        }
        end,
        credit = {
            art = "AstraLuna",
            code = "base4",
            concept = "AstraLuna"
        },
        in_pool = function(self, args)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
                return true
            else
            return false
            end
        end,
        calculate = function(self, card, context)
            if context.joker_main and card.ability.extra.count == 4 then
                return {
                    xmult = card.ability.extra.xmult,
                    message = localize('k_reset')
                }
            end
            if context.before and not context.blueprint then
                card.ability.extra.count = card.ability.extra.count - 1
                if card.ability.extra.count == 1 then
                    juice_card_until(card, function ()
                        return card.ability.extra.count == 1
                    end)
                    return {
                        message = "1!"
                    }
                elseif card.ability.extra.count == 0 then
                    card.ability.extra.count = 4
                else
                    return {
                        message = card.ability.extra.count .. "..."
                    }
                end
            end
            if context.pre_discard then
                card.ability.extra.count = card.ability.extra.count - 1
                if card.ability.extra.count == 1 then
                    juice_card_until(card, function ()
                        return card.ability.extra.count == 1
                    end)
                    return {
                        message = "1!"
                    }
                elseif card.ability.extra.count == 0 then
                    card.ability.extra.count = 4
                    return {
                        message = localize('k_reset')
                    }
                else
                    return {
                        message = card.ability.extra.count .. "..."
                    }
                end
            end
        end
    })