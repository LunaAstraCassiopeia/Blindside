
    SMODS.Joker({
        key = 'bingoball',
        atlas = 'bld_trinkets',
        pos = {x = 2, y = 7},
        rarity = 'bld_hobby',
        config = {
            extra = {
                num_retriggered = 2,
                tracked_cards = {}
            }
        },
        cost = 12,
        blueprint_compat = true,
        eternal_compat = true,
        loc_vars = function (self, info_queue, card)
            return {
                vars = {
                card.ability.extra.xmult
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
        calculate = function (self, card, context)
            if context.before and context.scoring_hand then
                card.ability.extra.tracked_cards = choose_stuff(context.scoring_hand, card.ability.extra.num_retriggered, pseudoseed('bld_bingoball'))
            end

            if context.repetition and tableContains(context.other_card, card.ability.extra.tracked_cards) then
                return {
                    repetitions = 1,
                    func = function ()
                        G.E_MANAGER:add_event(Event({
                            func = function ()
                                card:juice_up(0.3, 0.6)
                                return true
                            end
                        }))
                    end
                }
            end
        end
    })