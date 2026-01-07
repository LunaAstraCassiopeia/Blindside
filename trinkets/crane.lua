
    SMODS.Joker({
        key = 'crane',
        atlas = 'bld_trinkets',
        pos = {x = 1, y = 6},
        rarity = 'bld_hobby',
        config = {
            extra = {
                odds = 2, -- updating this doesnt do shit lol
            }
        },
        cost = 8,
        blueprint_compat = true,
        eternal_compat = true,
        loc_vars = function (self, info_queue, card)
            local n,d = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
            return {
                vars = {
                    n,
                    d
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
    })