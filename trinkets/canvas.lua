
    SMODS.Joker({
        key = 'canvas',
        atlas = 'bld_trinkets',
        pos = {x = 2, y = 0},
        rarity = 'bld_hobby',
        config = {
            extra = {
                mult_mod = 8
            }
        },
        cost = 7,
        blueprint_compat = true,
        eternal_compat = true,
        loc_vars = function (self, info_queue, card)
            info_queue[#info_queue + 1] = G.P_SEALS["bld_wild"]
        end,
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