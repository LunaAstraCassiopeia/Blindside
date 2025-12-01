    SMODS.Joker({
        key = 'miniature',
        atlas = 'bld_trinkets',
        pos = {x = 5, y = 4},
        rarity = 'bld_hobby',
        cost = 9,
        config = {
            extra = {
                discardcard = nil,
            }
        },
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue+1] = {key = 'bld_burn', set = 'Other'}
        end,
        blueprint_compat = true,
        eternal_compat = true,
        calculate = function(self, card, context)
            if context.discard and #context.full_hand == 1 then
                card.ability.extra.discardcard = context.full_hand[1]
            end
            if context.burn_card and context.cardarea == G.play and context.burn_card == card.ability.extra.discardcard then
                return { remove = true }
            end
        end,
        in_pool = function(self, args)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
                return true
            else
            return false
            end
        end,
    })