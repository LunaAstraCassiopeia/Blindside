    SMODS.Joker({
        key = 'taglock',
        atlas = 'bld_trinkets',
        pos = {x = 1, y = 0},
        rarity = 'bld_keepsake',
        cost = 5,
        blueprint_compat = true,
        eternal_compat = true,
        credit = {
            art = "AstraLuna",
            code = "AstraLuna",
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
    })