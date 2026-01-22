    BLINDSIDE.Blind({
        key = 'spear',
        atlas = 'bld_blindrank',
        pos = {x = 9, y = 8},
        config = {
            extra = {
                value = 100,
                dollars = 8,
            }},
        hues = {"Red", "Yellow"},
        rare = true,
        always_scores = true,
        calculate = function(self, card, context)
            if context.main_scoring and context.cardarea == G.play and card.ability.extra.upgraded then
                return {
                    dollars = card.ability.extra.dollars
                }
            end
            if context.before and tableContains(card, context.scoring_hand) then
                if #context.scoring_hand >= 3 then
                    return {
                        focus = card,
                        message = localize('k_tagged_ex'),
                        func = function()
                            add_tag(Tag('tag_bld_strike'))
                        end,
                        card = card
                    }
                else
                    return {
                        message = localize('k_nope_ex'),
                        colour = G.C.MONEY
                    }
                end
            end
            --[[if context.burn_card == card and #context.scoring_hand >= 3 then
                return {
                    remove = true,
                }
            end]]
        end,
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue+1] = G.P_TAGS['tag_bld_strike']
            if card.ability.extra.upgraded then
                return {
                    key = 'm_bld_spear_upgraded',
                    vars = {
                        card.ability.extra.dollars
                    }
                }
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
