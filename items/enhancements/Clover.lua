    BLINDSIDE.Blind({
        key = 'clover',
        atlas = 'bld_blindrank',
        pos = {x = 0, y = 8},
        config = {
            extra = {
                value = 100,
                chance = 1,
                trigger = 5,
                xmult = 2,
                xmultup = 1,
            }
        },
        hues = {"Yellow", "Green"},
        replace_base_card = true,
        no_rank = true,
        no_suit = true,
        always_scores = true,
        overrides_base_rank = true,
        in_pool = function(self, args)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
                return true
            else
            return false
            end
        end,
        rare = true,
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.before then
                if SMODS.pseudorandom_probability(card, pseudoseed("flip"), card.ability.extra.chance+#G.GAME.tags, card.ability.extra.trigger, 'flip') and card.facing ~= "back" then
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
                        xmult = card.ability.extra.xmult
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
            local chance, trigger = SMODS.get_probability_vars(card, card.ability.extra.chance+#G.GAME.tags, card.ability.extra.trigger, 'flip')
            return {
                vars = {
                    card.ability.extra.xmult,
                    chance,
                    trigger
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmultup
            card.ability.extra.upgraded = true
            end
        end
    })
    
----------------------------------------------
------------MOD CODE END----------------------
