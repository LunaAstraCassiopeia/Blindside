    BLINDSIDE.Blind({
        key = 'flip',
        atlas = 'bld_blindrank',
        pos = {x = 3, y = 0},
        config = {
            extra = {
                value = 1,
                mult = 6,
                chips = 20,
                chance = 1,
                trigger = 2,
                chipsup = 20,
                multup = 6,
            }
        },
        hues = {"Green"},
        always_scores = true,
        basic = true,
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
                if pseudorandom('flip') < 1*(card.ability.extra.chance/card.ability.extra.trigger) then
                    return {
                        mult = card.ability.extra.mult
                    }
                else
                    return {
                        chips = card.ability.extra.chips
                    }
                end
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
                    card.ability.extra.mult,
                    chance,
                    trigger,
                    card.ability.extra.chips
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then

            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipsup
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.multup
            card.ability.extra.upgraded = true
            end
        end
    })
    
----------------------------------------------
------------MOD CODE END----------------------
