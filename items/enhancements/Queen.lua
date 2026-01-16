    BLINDSIDE.Blind({
        key = 'queen',
        atlas = 'bld_blindrank',
        pos = {x = 7, y = 9},
        config = {
            extra = {
                value = 30,
                jokerxmult = 1.5,
            }},
        hues = {"Faded"},
        curse = true,
        hidden = true,
        calculate = function(self, card, context)
            if context.discard and context.other_card == card then
                BLINDSIDE.chipsmodify(0, 0, card.ability.extra.jokerxmult)
                return {
                    message = "X" .. card.ability.extra.jokerxmult .. " JMult",
                    colour = G.C.BLACK
                }
            end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.jokerxmult,
                }
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
