    SMODS.Enhancement({
        key = 'serpent',
        atlas = 'bld_blindrank',
        pos = {x = 7, y = 1},
        config = {
            extra = {
                value = 12,
                draw_extra = 3,
                draw_extra_more = 2,
                hues = {"Green"}
            }},
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
        pools = {
            ["bld_obj_blindcard_generate"] = true,
            ["bld_obj_blindcard_cool"] = true,
            ["bld_obj_blindcard_warm"] = true,
            ["bld_obj_blindcard_single"] = true,
            ["bld_obj_blindcard_green"] = true,
        },
        calculate = function(self, card, context)
                if context.cardarea == G.play and context.after and card.facing ~= 'back' then
                    G.E_MANAGER:add_event(Event({
                        blocking = false,
                        func = function()
                            if G.STATE == G.STATES.SELECTING_HAND then
                                G.FUNCS.blind_draw_from_deck_to_hand(card.ability.extra.draw_extra)
                                return true
                            end
                        end
                    }))
                end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.draw_extra
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.extra.draw_extra = card.ability.extra.draw_extra + card.ability.extra.draw_extra_more
            card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
