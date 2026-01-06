    BLINDSIDE.Blind({
        key = 'lottery',
        atlas = 'bld_blindrank',
        pos = {x = 9, y = 10},
        config = {
            extra = {
                value = 30,
                chance = 1000,
                retain = true
            }},
        hues = {"Green"},
        curse = true,
        credit = {
            art = "AnneBean",
            code = "base4",
            concept = "base4"
        },
        calculate = function(self, card, context)
            if (context.cardarea == G.hand or (card.ability.extra.upgraded and context.cardarea == G.hand)) and context.before then
                G.GAME.probabilities.normal = G.GAME.probabilities.normal - card.ability.extra.chance
            end
            if (context.cardarea == G.hand or (card.ability.extra.upgraded and context.cardarea == G.hand)) and context.after then
                G.GAME.probabilities.normal = G.GAME.probabilities.normal + card.ability.extra.chance
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
