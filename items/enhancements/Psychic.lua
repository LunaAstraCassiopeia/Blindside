    BLINDSIDE.Blind({
        key = 'psychic',
        atlas = 'bld_blindrank',
        pos = {x = 4, y = 1},
        config = {
            extra = {
                value = 12,
                dollars = 8,
                dollarsup = 5
            }},
        hues = {"Yellow"},
        rare = true,
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.main_scoring then
                if #context.scoring_hand == 5 or card.ability.extra.upgraded then
                    return {
                        focus = card,
                        message = localize('k_tagged_ex'),
                        func = function()
                            add_tag(Tag('tag_bld_wave'))
                        end,
                        card = card,
                        dollars = card.ability.extra.dollars
                    }
                else
                    if card.facing ~= 'back' and context.cardarea == G.play then
                        card:flip()
                    end
                    return {
                        message = localize('k_nope_ex'),
                        colour = G.C.MONEY
                    }
                end
            end

            if context.burn_card == card and context.cardarea == G.play and #context.scoring_hand == 5 or card.ability.extra.upgraded then
                return {
                    remove = true,
                }
            end
        end,
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue+1] = G.P_TAGS['tag_bld_wave']
            info_queue[#info_queue+1] = {key = 'bld_burn', set = 'Other'}
            return {
                key = card.ability.extra.upgraded and 'm_bld_psychic_upgraded' or 'm_bld_psychic',
                vars = {
                    card.ability.extra.dollars
                }
            }
        end,
        upgrade = function(card)
            if not card.ability.extra.upgraded then
            card.ability.extra.upgraded = true
            card.ability.extra.dollars = card.ability.extra.dollars + card.ability.extra.dollarsup
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
