SMODS.Joker({
    key = 'inkandquill',
    atlas = 'bld_trinkets',
    pos = {x = 0, y = 8},
    rarity = 'bld_doodad',
    config = {
        extra = {
            xmult = 2,
            poker_hand = 'bld_blind_down'
        }
    },
    cost = 12,
    blueprint_compat = false,
    eternal_compat = true,
    loc_vars = function (self, info_queue, card)
        info_queue[#info_queue+1] = {key = 'bld_down', set = 'Other'}
        return {
            vars = {
                card.ability.extra.xmult,
            }
        }
    end,
    credit = {
        art = "Huycorn",
        code = "base4",
        concept = "base4"
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
        if context.joker_main and next(context.poker_hands[card.ability.extra.poker_hand]) then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end
})