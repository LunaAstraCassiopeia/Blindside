    BLINDSIDE.Blind({
        key = 'silence',
        atlas = 'bld_blindrank',
        pos = {x = 2, y = 10},
        config = {
            extra = {
                value = 999
            }
        },
        hues = {"Faded"},
        curse = true,
        credit = {
            art = "Gud",
            code = "base4",
            concept = "base4"
        },
        upgrade = function(card)
            if not card.ability.extra.upgraded then
                card.ability.extra.upgraded = true
            end
        end,
        calculate = function(self, card, context)
            if context.before and context.main_eval then
                for key, value in pairs(G.hand.cards) do
                    if value == card then
                        local progress = 0
                        for key, value2 in pairs(G.hand.cards) do
                            local this_progress = progress
                            progress = progress + 1
                            G.E_MANAGER:add_event(Event({
                                trigger = 'before',
                                delay = 0.4,
                                func = function ()
                                    card:juice_up()
                                    play_sound('card1', 0.8 + 0.05 * this_progress, 0.9)
                                    value2.config.center.blind_debuff(value2, true)
                                    return true
                                end
                            }))
                        end
                        break
                    end
                end
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
