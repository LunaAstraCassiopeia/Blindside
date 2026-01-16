    BLINDSIDE.Blind({
        key = 'grate',
        atlas = 'bld_blindrank',
        pos = {x = 1, y = 7},
        config = {
            extra = {
                value = 10,
                mult_gain = 1,
            }},
        hues = {"Red"},
        credit = {
            art = "AnneBean",
            code = "base4",
            concept = "base4"
        },
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.main_scoring then
                local cards = card.ability.extra.upgraded and #G.playing_cards or #G.playing_cards - 16
                if cards >= 2 then
                    return {
                        mult = math.floor(cards/2)
                    }
                end
            end
        end,
        loc_vars = function(self, info_queue, card)
            local cards = G.playing_cards and (card.ability.extra.upgraded and #G.playing_cards or #G.playing_cards - 16) or 0
            return {
                key = card.ability.extra.upgraded and 'm_bld_grate_upgraded' or 'm_bld_grate',
                vars = {
                    card.ability.extra.mult_gain, math.max(0, math.floor(cards/2))
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
