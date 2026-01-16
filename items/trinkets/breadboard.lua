
    SMODS.Joker({
        key = 'breadboard',
        atlas = 'bld_trinkets',
        pos = {x = 8, y = 4},
        rarity = 'bld_doodad',
        cost = 6,
        blueprint_compat = false,
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
    })