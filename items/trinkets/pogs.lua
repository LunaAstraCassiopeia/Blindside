
    SMODS.Joker({
        key = 'pogs',
        atlas = 'bld_trinkets',
        pos = {x = 8, y = 5},
        rarity = 'bld_hobby',
        cost = 10,
        blueprint_compat = true,
        eternal_compat = true,
        loc_vars = function (self, info_queue, card)
            return {
                vars = {
                    G.GAME.dollars
                }
            }
        end,
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
        end,
        calculate = function(self, card, context)
            if context.individual and context.cardarea == G.play and (context.other_card:is_color("Yellow") or context.other_card:is_color("Red")) then
                return {
                    chips = G.GAME.dollars
                }
            end
        end
    })