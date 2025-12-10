    SMODS.Enhancement({
        key = 'dove',
        atlas = 'bld_blindrank',
        pos = {x = 5, y = 5},
        config = {
            extra = {
                value = 10,
                chips = 100,
                chipsup = 80,
                odds = 2,
                hues = {"Green"}
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
            ["bld_obj_blindcard_cool"] = true,
            ["bld_obj_blindcard_warm"] = true,
            ["bld_obj_blindcard_single"] = true,
            ["bld_obj_blindcard_green"] = true,
        },
        weight = 3,
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.before and card.facing ~= 'back' then
                if SMODS.pseudorandom_probability(card, pseudoseed("dove"), 1, card.ability.extra.odds, 'dove') and card.facing ~= "back" then
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
                        chips = card.ability.extra.chips
                    }
                else
                    return {
                        message = localize('k_nope_ex'),
                        colour = G.C.GREEN
                    }
                end
            end
            if context.cardarea == G.hand and context.main_scoring then
                if SMODS.pseudorandom_probability(card, pseudoseed("dove"), 1, card.ability.extra.odds, 'dove') then
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
            local chance, trigger = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'dove')
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
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipsup
            card.ability.extra.upgraded = true
            end
        end
    })
    
----------------------------------------------
------------MOD CODE END----------------------
