    BLINDSIDE.Blind({
        key = 'bolt',
        atlas = 'bld_blindrank',
        pos = {x = 3, y = 8},
        config = {
            extra = {
                value = 100,
            }},
        hues = {"Purple", "Yellow"},
        rare = true,
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
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue + 1] = G.P_TAGS['tag_bld_debuff']
            return {
                key = card.ability.extra.upgraded and 'm_bld_bolt_upgraded' or 'm_bld_bolt',
            }
        end,
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.before and card.facing ~= 'back' then
                G.bolt_played_hand = context.scoring_name
                add_tag(Tag('tag_bld_debuff'))
                return {
                    card = card,
                    level_up = card.ability.extra.upgraded and 2 or 1,
                    message = localize('k_level_up_ex')
                }
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
