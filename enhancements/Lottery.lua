    BLINDSIDE.Blind({
        key = 'lottery',
        atlas = 'bld_blindrank',
        pos = {x = 9, y = 10},
        config = {
            extra = {
                value = 30,
                chance = 1000,
                newchance = -1,
                retain = true
            }},
        hues = {"Green"},
        curse = true,
        credit = {
            art = "AnneBean",
            code = "AstraLuna",
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
        loc_vars = function(self, info_queue, card)
            return {
                key = card.ability.extra.upgraded and 'm_bld_lottery_upgraded' or 'm_bld_lottery'
            }
        end,
        upgrade = function(card)
            if not card.ability.extra.upgraded then
                card.ability.extra.chance = card.ability.extra.newchance
                card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
