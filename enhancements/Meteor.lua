    SMODS.Enhancement({
        key = 'meteor',
        atlas = 'bld_blindrank',
        pos = {x = 5, y = 4},
        config = {
            extra = {
                value = 16,
                chips_mod = 300,
                chips_up = 50,
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
        weight = 3,
        pools = {
            ["bld_obj_blindcard_generate"] = true,
            ["bld_obj_blindcard_cool"] = true,
            ["bld_obj_blindcard_single"] = true,
            ["bld_obj_blindcard_blue"] = true,
        },
        calculate = function(self, card, context) 
            if context.cardarea == G.play and context.main_scoring then
            if context.scoring_name == 'bld_blind_high' or (context.scoring_name == 'bld_blind_2oak' and card.ability.extra.upgraded) then
                return {
                    chips = card.ability.extra.chips_mod
                }
            else 
                if card.facing ~= 'back' then 
                card:flip()
                end
                return {
                    message = localize('k_nope_ex'),
                    colour = G.C.BLUE
                }
            end
        end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                key = card.ability.extra.upgraded and 'm_bld_meteor_upgraded' or 'm_bld_meteor',
                vars = {
                    card.ability.extra.chips_mod
                }
            }
        end,
        upgrade = function(card)
            if not card.ability.extra.upgraded then
                card.ability.extra.chips_mod = card.ability.extra.chips_mod + card.ability.extra.chipsup
                card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
