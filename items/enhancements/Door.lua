    BLINDSIDE.Blind({
        key = 'door',
        atlas = 'bld_blindrank',
        pos = {x = 9, y = 7},
        config = 
            {x_mult = 1.75,
            extra = {
                value = 4,
                chips = 60,
                x_multup = 0.25,
                chipsup = 40,
            }},
        hues = {"Faded", "Red", "Green", "Blue", "Purple", "Yellow"},
        replace_base_card = true,
        no_rank = true,
        no_suit = true,
        always_scores = true,
        overrides_base_rank = true,
        hidden = true,
        in_pool = function(self, args)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
                    for _, playing_card in ipairs(G.playing_cards or {}) do
                        if SMODS.has_enhancement(playing_card, 'm_bld_door') then
                            return true
                        end
                    end
                    return false
            else
            return false
            end
        end,
        rare = true,
        calculate = function(self, card, context)
            if context.main_scoring and context.cardarea == G.play then
                return {
                    chips = card.ability.extra.chips
                }
            end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.x_mult, card.ability.extra.chips
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.x_mult = card.ability.x_mult + card.ability.extra.x_multup
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipsup
            card.ability.extra.upgraded = true
            end
        end
    })
    
----------------------------------------------
------------MOD CODE END----------------------
