    SMODS.Enhancement({
        key = 'snow',
        atlas = 'bld_blindrank',
        pos = {x = 7, y = 5},
        config = {
            extra = {
                chips = 0,
                gain_chips = 40,
                value = 11,
                hues = {"Purple"}
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
            ["bld_obj_blindcard_purple"] = true,
        },
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.main_scoring then
                return {
                    chips = card.ability.extra.chips
                }
            end

            if context.cardarea == G.hand and context.main_scoring then
                card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.gain_chips
                return {
                    message = localize('k_upgrade_ex')
                }
            end

            if context.after and context.scoring_hand then
                local i_scored = false
                for key, value in pairs(context.scoring_hand) do
                    if value == card then
                        i_scored = true
                        break
                    end
                end

                if i_scored then
                    card.ability.extra.chips = 0
                    return {
                        message = localize('k_reset')
                    }
                end
            end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.chips,
                    card.ability.extra.gain_chips
                }
            }
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
