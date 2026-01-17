
    SMODS.Joker({
        key = 'pendant',
        atlas = 'bld_trinkets',
        pos = {x = 1, y = 2},
        rarity = 'bld_curio',
        config = {
            extra = {
                x_mult = 0.1
            }
        },
        cost = 12,
        blueprint_compat = false,
        eternal_compat = true,
        loc_vars = function (self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_SEALS['bld_astral']
            return {
                vars = {
                    card.ability.extra.x_mult,
                }
            }
        end,
        calculate = function (self, card, context)
            if context.joker_main then
                return {
                    xmult = 1 + G.GAME.hands[context.scoring_name].level*card.ability.extra.x_mult
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
        end
    })