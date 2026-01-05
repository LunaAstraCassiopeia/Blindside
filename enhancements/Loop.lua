    BLINDSIDE.Blind({
        key = 'loop',
        atlas = 'bld_blindrank',
        pos = {x = 6, y = 7},
        config = {
            extra = {
                value = 100,
                chance = 1,
                trigger = 2,
            }},
        hues = {"Green"},
        rare = true,
        always_scores = true,
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.before and card.facing ~= 'back' then
                if SMODS.pseudorandom_probability(card, pseudoseed("flip"), card.ability.extra.chance, card.ability.extra.trigger, 'flip') or card.ability.extra.upgraded then
                    card:flip()
                    card:flip()
                    add_tag(Tag('tag_bld_symmetry'))
                    return {
                        focus = card,
                        message = localize('k_tagged_ex'),
                        card = card,
                    }
                else
                    if card.facing ~= 'back' then 
                        card:flip()
                    end

                    return {
                        message = localize('k_nope_ex'),
                        colour = G.C.GREEN
                    }
                end
            end
        end,
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue+1] = G.P_TAGS['tag_bld_symmetry']
            info_queue[#info_queue+1] = {key = 'bld_self_scoring', set = 'Other'}
            local chance, trigger = SMODS.get_probability_vars(card, card.ability.extra.chance, card.ability.extra.trigger, 'flip')
            return {
                key = card.ability.extra.upgraded and 'm_bld_loop_upgraded' or 'm_bld_loop',
                vars = {
                    chance,
                    trigger
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
