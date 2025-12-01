
    SMODS.Joker({
        key = 'pocketwatch',
        atlas = 'bld_trinkets',
        pos = {x = 6, y = 5},
        rarity = 'bld_hobby',
        cost = 9,
        config = {
            extra = {
                multreduc = 1
            }
        },
        loc_vars = function (self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.multreduc
                }
            }
        end,
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
            if context.reshuffle then
                return {
                    extra = {focus = card, message = localize{type='variable',key='a_rmult',vars={card.ability.extra.multreduc}}, 
                    colour = G.C.RED, func = function()
                        G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            delay = 0.5,
                            func = (function()
                                BLINDSIDE.chipsmodify(-card.ability.extra.multreduc, 0 , 0)
                                BLINDSIDE.chipsupdate()
                                return true
                            end)}))
                    end},
                    colour = G.C.RED,
                    card = card
                }
            end
        end
    })