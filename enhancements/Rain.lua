    BLINDSIDE.Blind({
        key = 'rain',
        atlas = 'bld_blindrank',
        pos = {x = 3, y = 11},
        config = {
            extra = {
                value = 30,
                xchips_gain = 0.5,
            }},
        hues = {"Blue"},
        curse = true,
        credit = {
            art = "pangaea47",
            code = "base4",
            concept = "base4"
        },
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.main_scoring then
                local blues = -1
                for key, value in pairs(G.play.cards) do
                    if value:is_color("Blue") then
                        blues = blues + 1
                    end
                end
                for key, value in pairs(G.hand.cards) do
                    if value:is_color("Blue") then
                        blues = blues + 1
                    end
                end
                return {
                    xchips = card.ability.extra.xchips_gain * blues
                }
            end
        end,
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue+1] = {key = 'bld_burn', set = 'Other'}
            return {
                vars = {
                    card.ability.extra.xchips_gain
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
