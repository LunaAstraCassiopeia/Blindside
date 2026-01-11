    BLINDSIDE.Blind({
        key = 'trench',
        atlas = 'bld_blindrank',
        pos = {x = 6, y = 12},
        config = {
            extra = {
                value = 30,
                xchips = 1.5,
                xchipsbase = 1.5,
                xchipsbaseup = 0.75,
                xchips_gain = 0.5,
                xchips_gainup = 0.25,
            }},
        hues = {"Blue"},
        rare = true,
        credit = {
            art = "Gappie",
            code = "base4",
            concept = "base4"
        },
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.main_scoring then
                card.ability.extra.xchips = card.ability.extra.xchips + card.ability.extra.xchips_gain
                return {
                    xchips = card.ability.extra.xchips - card.ability.extra.xchips_gain
                }
            end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.xchips_gain,
                    card.ability.extra.xchips,
                    card.ability.extra.xchipsbase
                }
            }
        end,
        upgrade = function(card)
            if not card.ability.extra.upgraded then
                card.ability.extra.xchipsbase = card.ability.extra.xchipsbase + card.ability.extra.xchipsbaseup
                card.ability.extra.xchips_gain = card.ability.extra.xchips_gain + card.ability.extra.xchips_gainup
                card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
