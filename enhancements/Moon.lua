    SMODS.Enhancement({
        key = 'moon',
        atlas = 'bld_blindrank',
        pos = {x = 1, y = 6},
        config = {
            extra = {
                value = 141,
                mult = 2,
                mult_gain = 2,
                hues = {"Yellow"}
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
            ["bld_obj_blindcard_warm"] = true,
            ["bld_obj_blindcard_single"] = true,
            ["bld_obj_blindcard_yellow"] = true,
        },
        calculate = function(self, card, context)
            if context.discard and context.other_card == card and context.main_eval then
                return {
                    focus = card,
                    message = localize('k_tagged_ex'),
                    func = function()
                        local tag_key = get_next_tag_key()
                        while tag_key == 'tag_orbital' do
                            tag_key = get_next_tag_key()
                        end
                        add_tag(Tag(tag_key))
                    end,
                    card = card
                }
            end
            if context.main_scoring and context.cardarea == G.play and #G.GAME.tags > 0 then
                return {
                    mult = card.ability.extra.mult * #G.GAME.tags
                }
            end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.mult,
                    card.ability.extra.mult * #G.GAME.tags
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
            card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
