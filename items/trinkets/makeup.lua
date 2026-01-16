
    SMODS.Joker({
        key = 'makeup',
        atlas = 'bld_trinkets',
        pos = {x = 1, y = 8},
        rarity = 'bld_keepsake',
        cost = 12,
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
            art = "Gappie",
            code = "base4",
            concept = "AstraLuna"
        },
        calculate = function(self, card, context)
            if context.repetition and context.cardarea == G.hand then
                return {
                    repetitions = 1
                }
            end
        end
    })