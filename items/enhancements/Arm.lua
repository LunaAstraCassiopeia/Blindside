    BLINDSIDE.Blind({
        key = 'arm',
        atlas = 'bld_blindrank',
        pos = {x = 3, y = 1},
        config = {
            extra = {
                value = 10,
                chance = 1,
                trigger = 2,
            }},
        replace_base_card = true,
        no_rank = true,
        no_suit = true,
        hues = {"Purple"},
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
                if context.cardarea == G.play and context.before then
                    if SMODS.pseudorandom_probability(card, pseudoseed("flip"), card.ability.extra.chance, card.ability.extra.trigger, 'flip') and card.facing ~= 'back' or card.ability.extra.upgraded then
                            card:flip()
                            card:flip()
                        return {
                            card = card,
                            level_up = true,
                            message = localize('k_level_up_ex')
                        }
                    else
                    if card.facing ~= 'back' then 
                    card:flip()
                    end
                    return {
                        message = "Nope!",
                        colour = G.C.GREEN
                    }
                end
            end
        end,
        loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {key = 'bld_self_scoring', set = 'Other'}
            local chance, trigger = SMODS.get_probability_vars(card, card.ability.extra.chance, card.ability.extra.trigger, 'flip')
            return {
                key = card.ability.extra.upgraded and 'm_bld_arm_upgrade' or 'm_bld_arm',
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
