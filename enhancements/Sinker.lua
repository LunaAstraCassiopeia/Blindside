    BLINDSIDE.Blind({
        key = 'sinker',
        atlas = 'bld_blindrank',
        pos = {x = 4, y = 9},
        config = {
            extra = {
                value = 30,
                retain = true
            }},
        hues = {"Red"},
        curse = true,
        credit = {
            art = "AnneBean",
            code = "base4",
            concept = "AnneBean"
        },
        calculate = function(self, card, context)
            if context.burn_card and context.cardarea == G.play and context.burn_card == card then
                return { remove = true }
            end
            if not card.ability.extra.upgraded and G.GAME.current_round.discards_left > 0 and context.cardarea == G.play and context.main_scoring then
                G.E_MANAGER:add_event(Event({
                    func = function ()
                        card:juice_up()
                        return true
                    end
                }))
                ease_discard(-1)
            end

            if card.ability.extra.upgraded and context.discard and context.other_card == card and context.main_eval then
                print(inspect(context))
                G.E_MANAGER:add_event(Event({
                    func = function ()
                        card:juice_up()
                        return true
                    end
                }))
                ease_discard(1)
                delay(0.6)
                return {
                    burn = true
                }
            end
        end,
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue+1] = {key = 'bld_burn', set = 'Other'}
            info_queue[#info_queue+1] = {key = 'bld_retain', set = 'Other'}
            return {
                key = card.ability.extra.upgraded and 'm_bld_sinker_upgraded' or 'm_bld_sinker'
            }
        end,
        upgrade = function(card)
            if not card.ability.extra.upgraded then
                card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
