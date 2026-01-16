    BLINDSIDE.Blind({
        key = 'window',
        atlas = 'bld_blindrank',
        pos = {x = 8, y = 0},
        config = {
            extra = {
                value = 11,
                money = 10,
                money_up = 10,
            }},
        hues = {"Faded"},
        rare = true,
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.before and card.facing ~= 'back' then
                for i=1, #G.play.cards do
                    if G.play.cards[i]:is_color("Yellow", true, false) and G.play.cards[i] ~= card then
                        G.play.cards[i].config.center.blind_debuff(G.play.cards[i], true)
                    end
                end
            end
            if context.cardarea == G.play and context.main_scoring then
                return {
                    dollars = card.ability.extra.money
                }
            end
            if context.cardarea == G.play and context.after and card.facing ~= 'back' then
                for i=1, #G.play.cards do
                    if G.play.cards[i]:is_color("Yellow", true, false) and G.play.cards[i] ~= card then
                        G.play.cards[i]:set_debuff(false)
                    end
                end
            end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.money
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.extra.money = card.ability.extra.money + card.ability.extra.money_up
            card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
