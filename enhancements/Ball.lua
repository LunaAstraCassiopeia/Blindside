    SMODS.Enhancement({
        key = 'ball',
        atlas = 'bld_blindrank',
        pos = {x = 4, y = 4},
        config = {
            extra = {
                value = 17,
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
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_TAGS['tag_bld_toss']
        info_queue[#info_queue+1] = {key = 'bld_burn', set = 'Other'}
    end,
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.before and card.facing ~= 'back' then
                add_tag(Tag('tag_bld_debuff'))
                return {
                    card = card,
                    message = localize('k_tagged_ex')
                }
            end
            if context.burn_card and context.cardarea == G.play and context.burn_card == card then
                return { remove = true }
            end
        end,
    })
----------------------------------------------
------------MOD CODE END----------------------
