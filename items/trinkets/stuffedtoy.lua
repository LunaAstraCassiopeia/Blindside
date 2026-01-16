
    SMODS.Joker({
        key = 'stuffedtoy',
        atlas = 'bld_trinkets',
        pos = {x = 6, y = 2},
        rarity = 'bld_hobby',
        config = {
            extra = {
                chipsreduc = 0.15,
            }
        },
        cost = 8,
        blueprint_compat = false,
        eternal_compat = true,
        loc_vars = function (self, info_queue, card)
            return {
                vars = {
                card.ability.extra.chipsreduc*100
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
        credit = {
            art = "AstraLuna",
            code = "AstraLuna",
            concept = "AstraLuna"
        },
        calculate = function(self, card, context)
            if context.joker_main then
                if #context.full_hand <= 3 then
                    BLINDSIDE.chipsmodify(0, -((G.GAME.blind.basechips*(card.ability.extra.chipsreduc))), 0, 0, true)
                    return {
                        extra = {focus = card, message = localize{type='variable',key='a_pchips',vars={card.ability.extra.chipsreduc*100}}, 
                        colour = G.C.DARK_EDITION, func = function()
                            G.E_MANAGER:add_event(Event({
                                trigger = 'before',
                                delay = 0.3,
                                func = (function()
                                    return true
                                end)}))
                        end},
                        colour = G.C.DARK_EDITION,
                        card = card
                    }
                end
            end
        end
    })