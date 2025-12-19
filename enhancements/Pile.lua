    SMODS.Enhancement({
        key = 'pile',
        atlas = 'bld_blindrank',
        pos = {x = 1, y = 3},
        config = {
            extra = {
                value = 15,
                nonblue = 4,
                chips = 50,
                chips_up = 25,
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
            if context.before and context.cardarea == G.play then
                for k, v in ipairs(G.hand.cards) do
                    v.retain = true
                end
            end
            if context.cardarea == G.play and context.main_scoring then
                return {
                    chips = card.ability.extra.chips
                }
            end
        end,
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue+1] = {key = 'bld_retain', set = 'Other'}
            return {
                key = card.ability.extra.upgraded and 'm_bld_pile_upgraded' or 'm_bld_pile',
                vars = {
                    card.ability.extra.nonblue, card.ability.extra.chips
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_up
            card.ability.extra.upgraded = true
            card.ability.extra.retain = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
