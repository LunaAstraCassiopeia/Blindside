    SMODS.Enhancement({
        key = 'flip',
        atlas = 'bld_blindrank',
        pos = {x = 3, y = 0},
        config = {
            extra = {
                value = 1,
                mult = 6,
                chips = 12,
                chance = 1,
                trigger = 2,
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
            ["bld_obj_blindcard_single"] = true,
            ["bld_obj_blindcard_green"] = true,
        },
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
            local chance, trigger = SMODS.get_probability_vars(card, card.ability.extra.chance, card.ability.extra.trigger, 'flip')
            return {
                vars = {
                    card.ability.extra.mult,
                    chance,
                    trigger,
                    card.ability.extra.chips
                }
            }
        end
    })
    
----------------------------------------------
------------MOD CODE END----------------------
