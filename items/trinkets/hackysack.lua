
    SMODS.Joker({
        key = 'hackysack',
        atlas = 'bld_trinkets',
        pos = {x = 8, y = 6},
        rarity = 'bld_hobby',
        config = {
            extra = {
                handsize = 1,
            }
        },
        cost = 10,
        blueprint_compat = false,
        eternal_compat = true,
        loc_vars = function (self, info_queue, card)
            return {
                vars = {
                card.ability.extra.money
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
        remove_from_deck = function(self, card, from_debuff)
            G.hand:change_size(-card.ability.extra.handsize)
        end,
        add_to_deck = function(self, card, from_debuff)
            G.hand:change_size(card.ability.extra.handsize)
        end,
    })