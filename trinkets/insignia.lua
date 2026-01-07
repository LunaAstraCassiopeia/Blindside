    SMODS.Joker({
        key = 'insignia',
        atlas = 'bld_trinkets',
        pos = {x = 1, y = 1},
        rarity = 'bld_curio',
        cost = 10,
        blueprint_compat = false,
        eternal_compat = true,
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
        end
    })