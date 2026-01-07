
    SMODS.Joker({
        key = 'bookmark',
        atlas = 'bld_trinkets',
        pos = {x = 3, y = 4},
        rarity = 'bld_keepsake',
        config = {
            extra = {
                xmult = 3,
                at_most = 7,
            }
        },
        cost = 15,
        credit = {
            art = "AstraLuna",
            code = "base4",
            concept = "AstraLuna"
        },
        blueprint_compat = true,
        eternal_compat = true,
        loc_vars = function (self, info_queue, card)
            return {
                vars = {
                card.ability.extra.xmult,
                card.ability.extra.at_most
            }
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
            if context.joker_main and #G.deck.cards <= card.ability.extra.at_most then
                return {
                    xmult = card.ability.extra.xmult
                }
            end
        end
    })