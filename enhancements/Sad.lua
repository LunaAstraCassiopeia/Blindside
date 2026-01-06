    BLINDSIDE.Blind({
        key = 'sad',
        atlas = 'bld_blindrank',
        pos = {x = 4, y = 10},
        config = {
            extra = {
                value = 30,
            }},
        hues = {"Blue"},
        curse = true,
        credit = {
            art = "Gud",
            code = "base4",
            concept = "base4"
        },
        calculate = function(self, card, context)
            if not card.ability.extra.upgraded and context.cardarea == G.play and context.before and card.facing ~= 'back' then
                local self_pos = nil
                for i=1, #G.play.cards do
                    if G.play.cards[i] == card then
                        self_pos = i
                    end
                end
                if G.play.cards[self_pos-1] then
                    G.play.cards[self_pos-1].config.center.blind_debuff(G.play.cards[self_pos-1], true)
                end
                if G.play.cards[self_pos+1] then
                    G.play.cards[self_pos+1].config.center.blind_debuff(G.play.cards[self_pos+1], true)
                end
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
