    SMODS.Enhancement({
        key = 'peace',
        atlas = 'bld_blindrank',
        pos = {x = 7, y = 4},
        config = {
            extra = {
                value = 18,
                chips_mod = 15,
                chips_up = 10,
                hues = {"Blue"}
            }},
        replace_base_card = true,
        no_rank = true,
        no_suit = true,
        overrides_base_rank = true,
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
            ["bld_obj_blindcard_single"] = true,
            ["bld_obj_blindcard_blue"] = true,
        },
        calculate = function(self, card, context) 
            if context.cardarea == G.hand and context.main_scoring then
                return {
                    chips = card.ability.extra.chips_mod * #G.hand.cards
                }
            end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.chips_mod
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.extra.chips_mod = card.ability.extra.chips_mod + card.ability.extra.chips_up
            card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
