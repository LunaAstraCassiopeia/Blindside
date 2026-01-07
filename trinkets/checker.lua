
    SMODS.Joker({
        key = 'checker',
        atlas = 'bld_trinkets',
        pos = {x = 7, y = 6},
        rarity = 'bld_keepsake',
        cost = 12,
        blueprint_compat = false,
        eternal_compat = true,
        loc_vars = function (self, info_queue, card)
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
            art = "TarkanTheDragonBird",
            code = "base4",
            concept = "TarkanTheDragonBird"
        },
    })