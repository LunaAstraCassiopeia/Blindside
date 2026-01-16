    BLINDSIDE.Blind({
        key = 'hearth',
        atlas = 'bld_blindrank',
        pos = {x = 9, y = 12},
        config = {
            extra = {
                value = 1,
                xmult = 2,
                xmult_up = 1,
            }
        },
        hues = {"Red"},
        rare = true,
        calculate = function(self, card, context)
            if context.main_scoring and context.cardarea == G.play then
                return {
                    xmult = card.ability.extra.xmult
                }
            end

            if context.cardarea == G.play and context.burn_card and tableContains(card, context.scoring_hand) then
                if not SMODS.has_enhancement(context.burn_card, 'm_bld_hearth') then
                    return {
                        remove = true
                    }
                end
            end
        end,
        credit = {
            art = "Gud",
            code = "base4",
            concept = "base4"
        },
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.xmult
                }
            }
        end,
        upgrade = function(card)
            if not card.ability.extra.upgraded then
                card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_up
                card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
