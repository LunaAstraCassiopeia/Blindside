    BLINDSIDE.Blind({
        key = 'ore',
        atlas = 'bld_blindrank',
        pos = {x = 1, y = 4},
        config = {
            extra = {
                value = 14,
                money = 3,
                money_up = 5,
            }},
        hues = {"Yellow"},
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue + 1] = G.P_TAGS['tag_bld_maxim']
            info_queue[#info_queue+1] = {key = 'bld_burn', set = 'Other'}
            return {
                vars = {
                    card.ability.extra.money
                }
            }
        end,
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.before and card.facing ~= 'back' then
                add_tag(Tag('tag_bld_maxim'))
            end
            if context.cardarea == G.play and context.main_scoring then
                return {
                    dollars = card.ability.extra.money
                }
            end
            if context.burn_card and context.cardarea == G.play and context.burn_card == card then
                return { remove = true }
            end
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.extra.money = card.ability.extra.money + card.ability.extra.money_up
            card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
