
    SMODS.Joker({
        key = 'paycheck',
        atlas = 'bld_trinkets',
        pos = {x = 0, y = 0},
        rarity = 'bld_trinket',
        config = {
            extra = {
                money = 0,
                money_mod = 1
            }
        },
        cost = 8,
        blueprint_compat = false,
        eternal_compat = true,
        loc_vars = function (self, info_queue, card)
            return {
                vars = {
                card.ability.extra.money,
                card.ability.extra.money_mod

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
        credit = {
            art = "AstraLuna",
            code = "AstraLuna",
            concept = "AstraLuna"
        },
        calculate = function(self, card, context)
            if context.after and next(context.poker_hands['bld_raise']) and not context.blueprint then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "money",
                    scalar_value = "money_mod",
                    operation = '+',
                    scaling_message = {
                        message = localize('k_chaching_ex'),
                        colour = G.C.MONEY
                    }
                })
            end
        end,
        calc_dollar_bonus = function(self, card)
            if card.ability.extra.money > 0 then
                local dollar_bonus = card.ability.extra.money
                return dollar_bonus
            end
        end
    })