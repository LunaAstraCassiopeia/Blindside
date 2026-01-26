
    SMODS.Joker({
        key = 'pocketwatch',
        atlas = 'bld_trinkets',
        pos = {x = 6, y = 5},
        rarity = 'bld_trinket',
        cost = 12,
        config = {
            extra = {
                multreduc = 2
            }
        },
        loc_vars = function (self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.multreduc
                }
            }
        end,
        credit = {
            art = "AstraLuna",
            code = "AstraLuna",
            concept = "AstraLuna"
        },
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
            if context.reshuffle and G.GAME.blind.mult > 1 then
                return {
                    extra = {focus = card, message = localize{type='variable',key='a_rmult',vars={card.ability.extra.multreduc}}, 
                    colour = G.C.RED, func = function()
                        G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            delay = 0.5,
                            func = (function()
                                BLINDSIDE.chipsmodify(-card.ability.extra.multreduc, 0 , 0)
                                G.E_MANAGER:add_event(Event({
                                    trigger = 'before',
                                    delay = 0.5,
                                    func = (function()
                                        BLINDSIDE.chipsupdate()
                                        G.E_MANAGER:add_event(Event({
                                            func = (function()
                                                if (G.GAME.chips - G.GAME.blind.basechips*G.GAME.blind.mult >= 0 and not next(SMODS.find_card('j_bld_breadboard'))) and G.GAME.blind.in_blind and G.STATE == G.STATES.SELECTING_HAND then
                                                    G.STATE = G.STATES.NEW_ROUND
                                                    G.STATE_COMPLETE = false
                                                end
                                                return true
                                            end)}))
                                        return true
                                    end)}))
                                return true
                            end)}))
                    end},
                    colour = G.C.RED,
                    card = card
                }
            end
        end
    })