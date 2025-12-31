    BLINDSIDE.Blind({
        key = 'famous',
        atlas = 'bld_blindrank',
        pos = {x = 1, y = 11},
        config = {
            forced_selection = true,
            extra = {
                value = 30,
            }},
        hues = {"Blue"},
        curse = true,
        calculate = function(self, card, context)

        end,
        loc_vars = function(self, info_queue, card)

        end,
        upgrade = function(card)
            if not card.ability.extra.upgraded then
                card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
