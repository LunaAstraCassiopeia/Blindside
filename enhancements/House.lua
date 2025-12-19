    BLINDSIDE.Blind({
        key = 'house',
        atlas = 'bld_blindrank',
        pos = {x = 2, y = 0},
        config = {
            extra = {
                value = 11,
                chips = 40,
                xchips = 1.5,
                cards_to_hand = {},
                flipped = true,
            }},
        hues = {"Blue"},
        always_scores = true,
        loc_vars = function(self, info_queue, card)
            return {
                key = card.ability.extra.upgraded and 'm_bld_house_upgraded' or 'm_bld_house',
                vars = {
                    card.ability.extra.chips,
                    card.ability.extra.xchips
                }
            }
        end,
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.main_scoring then
                if card.ability.extra.upgraded then
                    return {
                        chips = card.ability.extra.chips,
                        xchips = card.ability.extra.xchips
                    }
                else
                    return {
                        chips = card.ability.extra.chips
                    }
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
