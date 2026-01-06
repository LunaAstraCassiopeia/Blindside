    BLINDSIDE.Blind({
        key = 'hurt',
        atlas = 'bld_blindrank',
        pos = {x = 9, y = 11},
        config = {
            extra = {
                value = 30,
                mult = -10,
                mult_each = 2
            }},
        hues = {"Red"},
        curse = true,
        credit = {
            art = "Gud",
            code = "base4",
            concept = "base4"
        },
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.main_scoring then
                local curses = 0
                for key, value in pairs(G.playing_cards) do
                    if value.config.center.weight == 67 then
                        curses = curses + 1
                    end
                end

                return {
                    mult = card.ability.extra.mult + card.ability.extra.mult_each * curses
                }
            end
        end,
        loc_vars = function(self, info_queue, card)
            local curses = 0
            if G.playing_cards then
                for key, value in pairs(G.playing_cards) do
                    if value.config.center.weight == 67 then
                        curses = curses + 1
                    end
                end
            end
            
            local total_mult = card.ability.extra.mult + card.ability.extra.mult_each * curses
            return {
                vars = {
                    card.ability.extra.mult,
                    card.ability.extra.mult_each,
                    total_mult >= 0 and "+"..total_mult or total_mult
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
