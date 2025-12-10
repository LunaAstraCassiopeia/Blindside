
    SMODS.Joker({
        key = 'cellphone',
        atlas = 'bld_trinkets',
        pos = {x = 8, y = 2},
        rarity = 'bld_doodad',
        config = {
            extra = {
                xmult = 2.5,
            }
        },
        cost = 12,
        blueprint_compat = true,
        eternal_compat = true,
        loc_vars = function (self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.xmult
            },
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
            if context.burn_card and context.cardarea == G.hand then
                return {remove = true}
            end
            if context.joker_main then
                return {
                    xmult = card.ability.extra.xmult
                }
            end
        end
    })