
    SMODS.Joker({
        key = 'toysoldier',
        atlas = 'bld_trinkets',
        pos = {x = 8, y = 3},
        rarity = 'bld_trinket',
        config = {
            extra = {
                mult_mod = 3
            }
        },
        cost = 6,
        blueprint_compat = true,
        eternal_compat = true,
        loc_vars = function (self, info_queue, card)
            return {
                vars = {
                card.ability.extra.mult_mod,
                card.ability.extra.mult_mod*G.GAME.current_round.hands_left
            }
        }
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
        calculate = function(self, card, context)
            if context.joker_main then
                return {
                    mult = card.ability.extra.mult_mod*G.GAME.current_round.hands_left
                }
            end
        end
    })