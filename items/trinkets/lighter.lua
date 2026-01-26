    SMODS.Joker({
        key = 'lighter',
        atlas = 'bld_trinkets',
        pos = {x = 2, y = 6},
        rarity = 'bld_trinket',
        cost = 7,
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue+1] = {key = 'bld_burn', set = 'Other'}
        end,
        blueprint_compat = true,
        eternal_compat = true,
        calculate = function(self, card, context)
            if context.discard then
                return {
                    burn = true
                }
            end
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