
    SMODS.Joker({
        key = 'bottle',
        atlas = 'bld_trinkets',
        pos = {x = 9, y = 6},
        rarity = 'bld_hobby',
        config = {
            extra = {
                d_size = 1
            }
        },
        cost = 7,
        blueprint_compat = true,
        eternal_compat = true,
        loc_vars = function (self, info_queue, card)
            return {
                vars = {
                card.ability.extra.xmult
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
        add_to_deck = function(self, card, from_debuff)
            G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.d_size
            ease_discard(card.ability.extra.d_size)
        end,
        remove_from_deck = function(self, card, from_debuff)
            G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.d_size
            ease_discard(-card.ability.extra.d_size)
        end,
    })