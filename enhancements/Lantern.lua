    SMODS.Enhancement({
        key = 'lantern',
        atlas = 'bld_blindrank',
        pos = {x = 8, y = 4},
        config = {
            extra = {
                value = 17,
                xchips = 1.75,
                --xchip_mod = 0.15,
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
            if context.before and context.cardarea == G.play and not context.blueprint and not next(context.poker_hands['bld_blind_3oak']) and card.facing ~= 'back' then
                --[[SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "xchips",
                    scalar_value = "xchip_mod",
                    operation = '+',
                    message_colour = G.C.BLUE
                })]]
            end
            if context.cardarea == G.play and context.main_scoring then
                if not has_group_of(3, context.poker_hands) then
                    return {
                        xchips = card.ability.extra.xchips
                    }
                else
                    return {
                        message = localize('k_nope_ex'),
                        colour = G.C.BLUE
                    }
                end
            end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.xchips, card.ability.extra.xchip_mod
                }
            }
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
