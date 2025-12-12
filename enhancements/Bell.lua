    BLINDSIDE.Blind({
        key = 'bell',
        atlas = 'bld_blindrank',
        pos = {x = 6, y = 4},
        config = {
            extra = {
                value = 16,
                chips = 20,
                chips_mod = 40,
                chips_modup = 20,
            }
        },
        replace_base_card = true,
        no_rank = true,
        no_suit = true,
        hues = {"Green"},
        rare = true,
        overrides_base_rank = true,
        in_pool = function(self, args)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
                return true
            else
            return false
            end
        end,
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.main_scoring then
                return {
                    chips = card.ability.extra.chips + card.ability.extra.chips_mod*G.GAME.current_round.reshuffles_round
                }
            end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.chips_mod,
                    card.ability.extra.chips + card.ability.extra.chips_mod*G.GAME.current_round.reshuffles_round
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
                card.ability.extra.chips_mod =card.ability.extra.chips_mod + card.ability.extra.chips_modup
            card.ability.extra.upgraded = true
            end
        end
    })
    
----------------------------------------------
------------MOD CODE END----------------------
