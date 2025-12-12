    BLINDSIDE.Blind({
        key = 'butterfly',
        atlas = 'bld_blindrank',
        pos = {x = 6, y = 8},
        config = {
            extra = {
                value = 100,
                xchips = 2,
                xchipsup = 0.5,
                odds = 2,
            }
        },
        hues = {"Green", "Blue"},
        rare = true,
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
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.before and card.facing ~= 'back' then
                if SMODS.pseudorandom_probability(card, pseudoseed("butterfly"), 1, card.ability.extra.odds, 'butterfly') and card.facing ~= "back" then
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
                        xchips = card.ability.extra.xchips
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
            local chance, trigger = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'flip')
            return {
                vars = {
                    card.ability.extra.xchips,
                    chance,
                    trigger
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.extra.xchips = card.ability.extra.xchips + card.ability.extra.xchipsup
            card.ability.extra.upgraded = true
            end
        end
    })
    
----------------------------------------------
------------MOD CODE END----------------------
