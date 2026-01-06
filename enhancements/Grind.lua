    BLINDSIDE.Blind({
        key = 'grind',
        atlas = 'bld_blindrank',
        pos = {x = 0, y = 12},
        config = {
            extra = {
                value = 30,
                money = -8,
                money_gain = 8,
                stubborn = true,
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
                local curses = -1 -- essentially does not count self
                for key, value in pairs(G.play.cards) do
                    if value.config.center.weight == 67 then
                        curses = curses + 1
                    end
                end
                return {
                    dollars = card.ability.extra.money + curses * card.ability.extra.money_gain
                }
            end
        end,
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue+1] = {key = 'bld_stubborn', set = 'Other'}
            return {
                vars = {
                    -card.ability.extra.money,
                    card.ability.extra.money_gain,
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
