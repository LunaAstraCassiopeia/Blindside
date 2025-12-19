    SMODS.Enhancement({
        key = 'goad',
        atlas = 'bld_blindrank',
        pos = {x = 5, y = 1},
        config = {
            chips = 80,
            extra = {
                value = 11,
                chipsup = 80,
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
                    G.bolt_played_hand = context.scoring_name
                    add_tag(Tag('tag_bld_debuff'))
                    return {
                        chips = card.ability.chips
                    }
                end
        end,
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue + 1] = G.P_TAGS['tag_bld_debuff']
            return {
                vars = {
                    card.ability.chips
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.chips = card.ability.chips + card.ability.extra.chipsup
            card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
