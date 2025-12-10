    SMODS.Enhancement({
        key = 'sharp',
        atlas = 'bld_blindrank',
        pos = {x = 5, y = 0},
        config = 
            {extra = {
                value = 1,
                mult = 2,
                hues = {"Red"},
                multup = 4,
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
            ["bld_obj_blindcard_single"] = true,
            ["bld_obj_blindcard_red"] = true,
        },
        calculate = function(self, card, context) 
            if context.cardarea == G.play and context.main_scoring then
                return {
                    mult = card.ability.extra.mult
                }
            end
            if context.burn_card and context.cardarea == G.play and context.burn_card == card and card.ability.extra.upgraded then
                return { remove = true }
            end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                key = card.ability.extra.upgraded and 'm_bld_sharp_burn' or 'm_bld_sharp',
                vars = {
                    card.ability.extra.mult
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.multup
            card.ability.extra.upgraded = true
            end
        end
    })
    
----------------------------------------------
------------MOD CODE END----------------------
