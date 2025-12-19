    BLINDSIDE.Blind({
        key = 'wheel',
        atlas = 'bld_blindrank',
        pos = {x = 2, y = 1},
        config = {
            extra = {
                value = 10,
                chips = 75,
                chips_up = 75,
                chance = 1,
                trigger = 2,
                flipped = true,
            }
        },
        hues = {"Green"},
        always_scores = true,
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.before and card.facing ~= 'back' then
                if SMODS.pseudorandom_probability(card, pseudoseed("flip"), card.ability.extra.chance, card.ability.extra.trigger, 'flip') and card.facing ~= "back" then
                    card:flip()
                    card:flip()
                else
                    if card.facing ~= 'back' then 
                    card:flip()
                    end
                end
            end
            if context.cardarea == G.play and context.main_scoring then
                if card.facing ~= "back" then
                    return {
                        chips = card.ability.extra.chips
                    }
                else
                    return {
                        message = localize('k_nope_ex'),
                        colour = G.C.GREEN
                    }
                end
            end
        end,
        loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {key = 'bld_self_scoring', set = 'Other'}
            local chance, trigger = SMODS.get_probability_vars(card, card.ability.extra.chance, card.ability.extra.trigger, 'flip')
            return {
                vars = {
                    card.ability.extra.chips,
                    chance,
                    trigger
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_up
            card.ability.extra.upgraded = true
            end
        end
    })
    
----------------------------------------------
------------MOD CODE END----------------------
