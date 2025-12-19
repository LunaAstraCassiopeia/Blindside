    BLINDSIDE.Blind({
        key = 'moon',
        atlas = 'bld_blindrank',
        pos = {x = 1, y = 6},
        config = {
            extra = {
                value = 141,
                mult = 2,
                mult_gain = 2,
            }},
        hues = {"Yellow"},
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
