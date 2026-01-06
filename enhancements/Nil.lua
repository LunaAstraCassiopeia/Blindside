    BLINDSIDE.Blind({
        key = 'nil',
        atlas = 'bld_blindrank',
        pos = {x = 1, y = 10},
        config = {
            extra = {
                value = 30,
            }},
        hues = {"Faded"},
        curse = true,
        credit = {
            art = "Gud",
            code = "base4",
            concept = "base4"
        },
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.main_scoring then
                return {
                    mult = -mult
                }
            end
        end,
        upgrade = function(card)
            if not card.ability.extra.upgraded then
                card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
