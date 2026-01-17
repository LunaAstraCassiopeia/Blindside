    BLINDSIDE.Blind({
        key = 'tablet',
        atlas = 'bld_blindrank',
        pos = {x = 3, y = 7},
        config = 
            {
            extra = {
                chips = 50,
                value = 4,
                retain = true,
            }},
        hues = {"Faded"},
        always_scores = true,
        hidden = true,
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue+1] = {key = 'bld_retain', set = "Other"}
            return {
                vars = {
                    card.ability.extra.chips
                }
            }
        end,
        calculate = function(self, card, context)
            if context.main_scoring and context.cardarea == G.play then
                return {
                    chips = card.ability.extra.chips
                }
            end         
            if context.end_of_round then
                card:start_dissolve()
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
