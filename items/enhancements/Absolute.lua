    BLINDSIDE.Blind({
        key = 'absolute',
        atlas = 'bld_blindrank',
        pos = {x = 2, y = 9},
        config = {
            extra = {
                value = 30,
                dollars = -2,
                dollarsup = 4,
                retain = true
            }},
        hues = {"Yellow"},
        curse = true,
        credit = {
            art = "Gud",
            code = "base4",
            concept = "base4"
        },
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.main_scoring then
                local count = 0
                for key, value in pairs(context.scoring_hand) do
                    if value.config.center.always_scores then
                        count = count + 1
                    end
                end
                return {
                    xchips = 1 + count
                }
            end
        end,
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue+1] = {key = 'bld_retain', set = 'Other'}
            return {
                vars = {
                    (card.ability.extra.dollars > 0 and ("+$" .. card.ability.extra.dollars) or ("-$" .. -card.ability.extra.dollars))
                }
            }
        end,
        upgrade = function(card)
            if not card.ability.extra.upgraded then
                card.ability.extra.dollars = card.ability.extra.dollars + card.ability.extra.dollarsup
                card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
