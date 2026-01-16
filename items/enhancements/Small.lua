    BLINDSIDE.Blind({
    key = 'small',
    atlas = 'bld_blindrank',
    pos = {x = 9, y = 9},
    config = {
        extra = {
            value = 1,
            chips = 50,
            chipsup = 50,
        }},
    hues = {"Blue"},
    hidden = true,
    always_scores = true,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.main_scoring then
            return {
                chips = card.ability.extra.chips
            }
        end
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips
            }
        }
    end,
    upgrade = function(card) 
        if not card.ability.extra.upgraded then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipsup
            card.ability.extra.upgraded = true
        end
    end
})
----------------------------------------------
------------MOD CODE END----------------------
