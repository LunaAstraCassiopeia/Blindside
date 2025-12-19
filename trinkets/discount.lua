
    SMODS.Joker({
        key = 'discount',
        atlas = 'bld_trinkets',
        pos = {x = 5, y = 1},
        rarity = 'bld_curio',
        cost = 8,
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
        calculate = function(self, card, context)
            if context.starting_shop and not context.blueprint and G.GAME.last_joker then
                if G.shop then
                    for i = 1, #G.shop_booster.cards do
                        G.shop_booster.cards[i].ability.couponed = true
                        G.shop_booster.cards[i]:set_cost()
                    end
                end
                return {
                    message = localize('k_tryfree_ex'),
                }
            end
        end,
        loc_vars = function (self, info_queue, card)
            info_queue[#info_queue+1] = {key = 'bld_boss_shop', set = 'Other'}
        end
    })