
SMODS.Joker({
    key = 'snaketotem',
    atlas = 'bld_trinkets',
    pos = {x = 1, y = 7},
    rarity = 'bld_curio',
    cost = 10,
    blueprint_compat = true,
    eternal_compat = true,
    in_pool = function(self, args)
        if G.GAME.selected_back.effect.center.config.extra then
            if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
            return true
        else
        return false
        end
    end,
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.ability.extra.handsize
            }
        }
    end,
    config = {
        extra = {
            armed = false,
            handsize = 1
        }
    },
        credit = {
            art = "Gappie",
            code = "base4",
            concept = "AstraLuna"
        },
    calculate = function(self, card, context)
        if context.pre_discard then
            card.ability.extra.armed = true
        end

        if context.drawing_cards and card.ability.extra.armed then
            card.ability.extra.armed = false
            return {
                cards_to_draw = 3
            }
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-card.ability.extra.handsize)
        G.hand.config.fixed_limit = false
    end,
    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(card.ability.extra.handsize)
        G.hand.config.fixed_limit = true
    end,
})