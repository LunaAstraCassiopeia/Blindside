
    SMODS.Joker({
        key = 'hourglass',
        atlas = 'bld_trinkets',
        pos = {x = 0, y = 7},
        rarity = 'bld_doodad',
        config = {
            extra = {
                hands = 2,
                gave = false
            }
        },
        cost = 8,
        blueprint_compat = false,
        eternal_compat = true,
        loc_vars = function (self, info_queue, card)
            return {
                vars = {
                card.ability.extra.hands,
                card.ability.extra.gave and "Given!" or "Not Given"
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
            if context.joker_main then
                if G.GAME.current_round.hands_left < G.GAME.current_round.discards_left and not card.ability.extra.gave then
                    card.ability.extra.gave = true
                    return {
                        message = "Flipped!",
                        func = function ()
                            ease_hands_played(card.ability.extra.hands)
                        end
                    }
                end
            end

            if context.starting_shop then
                card.ability.extra.gave = false
            end
        end
    })