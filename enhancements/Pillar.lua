    SMODS.Enhancement({
        key = 'pillar',
        atlas = 'bld_blindrank',
        pos = {x = 8, y = 1},
        config = {
            extra = {
                value = 13,
                x_mult = 3,
                mult = 5,
                status = "Active!",
                hues = {"Faded"}
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
            ["bld_obj_blindcard_single"] = true,
            ["bld_obj_blindcard_faded"] = true,
        },
        calculate = function(self, card, context)
                if context.cardarea == G.play and context.main_scoring then
                    if card.ability.extra.status == "Active!" then
                            return {
                                xmult = card.ability.extra.x_mult
                            }
                        else
                            return {
                                mult = card.ability.extra.mult
                            }
                    end
                end
            if context.after and context.cardarea == G.play then
                card.ability.extra.status = "Inactive"
            end
            if context.beat_boss then
                card.ability.extra.status = "Active!"
            end
            if context.burn_card and context.cardarea == G.play and context.burn_card == card and context.burn_card.facing ~= 'back' and card.ability.extra.status == "Inactive" then
                return { remove = true }
            end
        end,
        loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {key = 'bld_burn', set = 'Other'}
            return {
                key = card.ability.extra.status == "Active!" and 'm_bld_pillar' or 'm_bld_pillar_inactive',
                vars = {
                    card.ability.extra.x_mult, card.ability.extra.status, card.ability.extra.mult
                }
            }
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
