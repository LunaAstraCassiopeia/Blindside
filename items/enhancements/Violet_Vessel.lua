    BLINDSIDE.Blind({
        key = 'violet_vessel',
        atlas = 'bld_blindrank',
        pos = {x = 1, y = 12},
        config = {
            extra = {
                value = 1,
                jokerxchips = 0.5,
                jokerxchipsup = -0.2,
            }
        },
        hues = {"Purple"},
        hidden = true,
        legendary = true,
        calculate = function(self, card, context)
            if context.burn_card and context.cardarea == G.play and context.burn_card == card then
                return { remove = true }
            end
            if context.cardarea == G.play and context.main_scoring then
                BLINDSIDE.chipsmodify(0, 0, 0, card.ability.extra.jokerxchips)
                return {
                    message = "X" .. card.ability.extra.jokerxchips .. " JChips",
                    colour = G.C.L_BLACK
                }
            end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.jokerxchips,
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.extra.jokerxchips = card.ability.extra.jokerxchips + card.ability.extra.jokerxchipsup
            card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
