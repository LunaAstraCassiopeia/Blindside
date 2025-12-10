    SMODS.Enhancement({
        key = 'adder',
        atlas = 'bld_blindrank',
        pos = {x = 4, y = 0},
        config = {
            extra = {
                value = 1,
                chips = 20,
                hues = {"Blue"},
                chipsup = 20,
            }
        },
        replace_base_card = true,
        no_rank = true,
        no_suit = true,
        overrides_base_rank = true,
        pools = {
            ["bld_obj_blindcard_single"] = true,
            ["bld_obj_blindcard_blue"] = true
        },
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
                    chips = card.ability.extra.chips
                }
            end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.chips
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
