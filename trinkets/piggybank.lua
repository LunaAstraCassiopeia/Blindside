SMODS.Joker({
    key = 'piggybank',
    atlas = 'bld_trinkets',
    pos = {x = 9, y = 2},
    rarity = 'bld_curio',
    config = {
        extra = {
            dollars = 6,
        }
    },
    cost = 5,
    blueprint_compat = false,
    eternal_compat = true,
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
            card.ability.extra.dollars
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
        if context.setting_blind and not context.getting_sliced then
            return {
                dollars = card.ability.extra.dollars,
            }
        end
        if context.buying_card and context.card ~= card and context.card.ability.set == "Joker" then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('tarot1')
                    card:start_dissolve()
                    return true
                end
            }))
            return {
                message = localize('k_broke_ex')
            }
        end
    end,
})