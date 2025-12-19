    BLINDSIDE.Blind({
        key = 'goad',
        atlas = 'bld_blindrank',
        pos = {x = 5, y = 1},
        config = {
            chips = 80,
            extra = {
                value = 11,
                chipsup = 80,
            }},
        hues = {"Purple"},
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
