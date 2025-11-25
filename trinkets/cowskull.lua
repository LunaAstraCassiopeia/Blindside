
    SMODS.Joker({
        key = 'cowskull',
        atlas = 'bld_trinkets',
        pos = {x = 9, y = 4},
        rarity = 'bld_curio',
        config = {
            extra = {
                hunterbonus = 2,
            }
        },
        cost = 8,
        blueprint_compat = false,
        eternal_compat = true,
        loc_vars = function (self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_SEALS['bld_hunter']
            return {
                vars = {
                card.ability.extra.hunterbonus,
            }
        }
        end,
        in_pool = function(self, args)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
                    if G.playing_cards then
                        for i = 1, #G.playing_cards do
                            if G.playing_cards[i].seal == 'bld_hunter' then
                                return true
                            end
                        end
                    end
            else
            return false
            end
        end,
        calculate = function(self, card, context)
            if context.individual and context.cardarea == G.play then 
                if context.other_card.seal == 'bld_hunter' and context.other_card.facing ~= "back" then
                    return {
                        dollars = card.ability.extra.hunterbonus
                    }
                end
            end
        end
    })