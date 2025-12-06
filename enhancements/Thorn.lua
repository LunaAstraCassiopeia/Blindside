    SMODS.Enhancement({
        key = 'thorn',
        atlas = 'bld_blindrank',
        pos = {x = 1, y = 8},
        config = {
            extra = {
                value = 100,
                multreduc = 1,
                chance = 1,
                trigger = 2,
                hues = {"Green", "Red"}
            }
        },
        replace_base_card = true,
        no_rank = true,
        no_suit = true,
        overrides_base_rank = true,
        always_scores = true,
        in_pool = function(self, args)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
                return true
            else
            return false
            end
        end,
        pools = {
            ["bld_obj_blindcard_generate"] = true,
            ["bld_obj_blindcard_warm"] = true,
            ["bld_obj_blindcard_dual"] = true,
            ["bld_obj_blindcard_green"] = true,
            ["bld_obj_blindcard_red"] = true,
        },
        weight = 3,
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
            if context.cardarea == G.play and context.main_scoring then
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
        end
    })
    
----------------------------------------------
------------MOD CODE END----------------------
