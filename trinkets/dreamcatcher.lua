
    SMODS.Joker({
        key = 'dreamcatcher',
        atlas = 'bld_trinkets',
        pos = {x = 3, y = 5}, --replace with real sprite location
        rarity = 'bld_curio',
        config = {
            extra = {
                hands_played = 0,
                hands_target = 4,
            }
        },
        cost = 6,
        blueprint_compat = false,
        eternal_compat = true,
        loc_vars = function (self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.hands_target,
                    card.ability.extra.hands_played,
                }
            }
        end,
        credit = {
            art = "Monachrome",
            code = "AstraLuna",
            concept = "Monachrome"
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
            if context.after and not context.blueprint and not context.other_card and not context.repetition then
                card.ability.extra.hands_played = card.ability.extra.hands_played + 1
                if card.ability.extra.hands_played >= card.ability.extra.hands_target then
                    card.ability.extra.hands_played = 0
                    return {
                        message = localize("k_caught_dream"),
                        func = function ()
                            G.E_MANAGER:add_event(Event({
                                func = function ()
                                    card:juice_up(0.3, 0.7)
                                    ease_hands_played(1)
                                    return true
                                end                                
                            }))
                        end
                    }
                end
            end
        end
    })