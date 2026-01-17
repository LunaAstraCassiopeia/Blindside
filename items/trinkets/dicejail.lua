
    SMODS.Joker({
        key = 'dicejail',
        atlas = 'bld_trinkets',
        pos = {x = 4, y = 4},
        rarity = 'bld_hobby',
        config = {
            extra = {
                money = 2,
            }
        },
        cost = 9,
        blueprint_compat = true,
        eternal_compat = true,
        loc_vars = function (self, info_queue, card)
            return {
                vars = {
                card.ability.extra.money,
            }
        }
        end,
        credit = {
            art = "AnneBean",
            code = "base4",
            concept = "AnneBean"
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
            if context.pseudorandom_result and not context.result
            and context.trigger_obj
            and context.trigger_obj.config
            and context.trigger_obj.config.center
            and context.trigger_obj.config.center.config
            and context.trigger_obj.config.center.config.extra
            and context.trigger_obj.config.center.config.extra.hues then
                return {
                    dollars = card.ability.extra.money,
                    juice_card = context.blueprint_card or card
                }
            end
        end
    })