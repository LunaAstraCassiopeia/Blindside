
    SMODS.Joker({
        key = 'snowglobe',
        atlas = 'bld_trinkets',
        pos = {x = 5, y = 2},
        rarity = 'bld_keepsake',
        config = {
            extra = {
                xchips = 1.5,
            }
        },
        cost = 12,
        blueprint_compat = true,
        eternal_compat = true,
        loc_vars = function (self, info_queue, card)
            return {
                vars = {
                card.ability.extra.xchips
            }
        }
        end,
        calculate = function(self, card, context)
            if context.individual and context.cardarea == G.play and context.other_card and context.other_card.facing ~= "back" and not context.end_of_round then
                if (context.other_card == context.scoring_hand[1] or context.other_card == context.scoring_hand[#context.scoring_hand]) and G.GAME.current_round.hands_left%2 == 0 then
                    return {
                        xchips = card.ability.extra.xchips,
                        card = card,
                    }
                end
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