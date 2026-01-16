
    SMODS.Joker({
        key = 'standard',
        atlas = 'bld_trinkets',
        pos = {x = 5, y = 0},
        rarity = 'bld_keepsake',
        cost = 15,
        blueprint_compat = true,
        eternal_compat = true,
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
            if context.mod_probability and not context.blueprint then
                return {
                    numerator = context.numerator * 2
                }
            end
        end,
    })