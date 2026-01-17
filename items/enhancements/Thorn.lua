    BLINDSIDE.Blind({
        key = 'thorn',
        atlas = 'bld_blindrank',
        pos = {x = 1, y = 8},
        config = {
            extra = {
                value = 100,
                multreduc = 1,
                mult_up = 1,
                chance = 1,
                trigger = 2,
            }
        },
        hues = {"Green", "Red"},
        always_scores = true,
        rare = true,
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.before then
                if SMODS.pseudorandom_probability(card, pseudoseed("flip"), card.ability.extra.chance, card.ability.extra.trigger, 'flip') and card.facing ~= "back" then
                    card:flip()
                    card:flip()
                else
                    if card.facing ~= 'back' then 
                    card:flip()
                    end
                end
            end
            if context.cardarea == G.play and context.main_scoring and G.GAME.blind.mult > 1 then
                if card.facing ~= 'back' then
                    return {
                        extra = {focus = card, message = localize{type='variable',key='a_rmult',vars={card.ability.extra.multreduc}}, 
                        colour = G.C.RED, func = function()
                            BLINDSIDE.chipsmodify(-card.ability.extra.multreduc, 0 , 0)
                        end},
                        colour = G.C.RED,
                        card = card
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
                    card.ability.extra.multreduc,
                    chance,
                    trigger
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.extra.multreduc = card.ability.extra.multreduc + card.ability.extra.mult_up
            card.ability.extra.upgraded = true
            end
        end
    })
    
----------------------------------------------
------------MOD CODE END----------------------
