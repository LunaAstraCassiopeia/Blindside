
    SMODS.Joker({
        key = 'actionfigure',
        atlas = 'bld_trinkets',
        pos = {x = 9, y = 3},
        rarity = 'bld_keepsake',
        config = {
            extra = {
                xmult = 1.3,
            }
        },
        cost = 12,
        blueprint_compat = true,
        eternal_compat = true,
        credit = {
            art = "AstraLuna",
            code = "base4",
            concept = "AstraLuna"
        },
        loc_vars = function (self, info_queue, card)
            return {
                vars = {
                card.ability.extra.xmult
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
            if context.individual and context.cardarea == G.hand and not context.end_of_round then
                if context.other_card:is_color("Red") and not context.other_card.debuff then
                    return {
                        xmult = card.ability.extra.xmult,
                        card = card
                    }
                end
            end
        end
    })