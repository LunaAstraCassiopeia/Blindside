    BLINDSIDE.Blind({
        key = 'nil',
        atlas = 'bld_blindrank',
        pos = {x = 1, y = 10},
        config = {
            extra = {
                value = 30,
                set_mult = 0,
                set_multup = 20,
            }},
        hues = {"Faded"},
        curse = true,
        credit = {
            art = "Gud",
            code = "base4",
            concept = "base4"
        },
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.main_scoring then
                return {
                    mult = card.ability.extra.set_mult - mult
                }
            end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.set_mult
                }
            }
        end,
        upgrade = function(card)
            if not card.ability.extra.upgraded then
                card.ability.extra.set_mult = card.ability.extra.set_mult + card.ability.extra.set_multup
                card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
