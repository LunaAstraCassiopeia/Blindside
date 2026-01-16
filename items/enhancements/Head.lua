    BLINDSIDE.Blind({
        key = 'head',
        atlas = 'bld_blindrank',
        pos = {x = 3, y = 2},
        config = {
            extra = {
                xmult = 1.5,
                fullmult = 0,
                xmult_gain = 1,
                value = 100,
            }},
        credit = {
            art = "pangaea47",
            code = "AstraLuna",
            concept = "AstraLuna"
        },
        hues = {"Purple", "Faded"},
        rare = true,
        calculate = function(self, card, context)
                if context.cardarea == G.play and context.before and card.facing ~= 'back' then
                    for i=1, #G.play.cards do
                        if G.play.cards[i]:is_color("Purple", true, false) and G.play.cards[i] ~= card then
                            G.play.cards[i].config.center.blind_debuff(G.play.cards[i], true)
                            card:juice_up()
                            card.ability.extra.fullmult = card.ability.extra.fullmult + card.ability.extra.xmult
                        end
                    end
                end
                if context.cardarea == G.play and context.main_scoring and card.ability.extra.fullmult > 1 then
                    return {
                        xmult = card.ability.extra.fullmult
                    }
                end
                if context.cardarea == G.play and context.after and card.facing ~= 'back' then
                    for i=1, #G.play.cards do
                        if G.play.cards[i]:is_color("Purple", true, false) and G.play.cards[i] ~= card then
                            G.play.cards[i]:set_debuff(false)
                        end
                    end
                    card.ability.extra.fullmult = 0
                end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.xmult
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain
            card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
