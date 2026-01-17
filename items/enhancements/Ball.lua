    BLINDSIDE.Blind({
        key = 'ball',
        atlas = 'bld_blindrank',
        pos = {x = 4, y = 4},
        config = {
            extra = {
                value = 17,
            }},
        replace_base_card = true,
        no_rank = true,
        no_suit = true,
        hues = {"Purple"},
        overrides_base_rank = true,
        in_pool = function(self, args)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
                return true
            else
            return false
            end
        end,
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue + 1] = G.P_TAGS['tag_bld_toss']
            if not card.ability.extra.upgraded then
                info_queue[#info_queue+1] = {key = 'bld_burn', set = 'Other'}
            end
            return {
                key = card.ability.extra.upgraded and 'm_bld_ball_upgraded' or 'm_bld_ball',
            }
        end,
            calculate = function(self, card, context)
                if context.cardarea == G.play and context.before and card.facing ~= 'back' then
                    add_tag(Tag('tag_bld_toss'))
                    return {
                        card = card,
                        message = localize('k_tagged_ex')
                    }
                end
                if context.burn_card and context.cardarea == G.play and context.burn_card == card and not card.ability.extra.upgraded then
                    return { remove = true }
                end
            end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
