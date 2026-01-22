    BLINDSIDE.Blind({
        key = 'serpent',
        atlas = 'bld_blindrank',
        pos = {x = 7, y = 1},
        config = {
            extra = {
                value = 12,
                draw_extra = 3,
                draw_extra_more = 2,
            }},
        hues = {"Green"},
        always_scores = true,
        calculate = function(self, card, context)
                if context.cardarea == G.play and context.main_scoring and card.facing ~= 'back' then
                    G.serpent_draw = card.ability.extra.draw_extra
                    return {
                        focus = card,
                        message = localize('k_tagged_ex'),
                        func = function()
                            G.serpent_draw = card.ability.extra.draw_extra
                            add_tag(Tag('tag_bld_hiss'))
                        end,
                        card = card,
                        money = card.ability.extra.dollars
                    }
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
