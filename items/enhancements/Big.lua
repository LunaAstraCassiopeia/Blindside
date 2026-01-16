    BLINDSIDE.Blind({
    key = 'big',
    atlas = 'bld_blindrank',
    pos = {x = 8, y = 9},
    config = {
        extra = {
            value = 1,
            xmult = 2,
            xmultup = 1,
        }},
    hues = {"Yellow"},
    hidden = true,
    always_scores = true,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.main_scoring then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult
            }
        }
    end,
    upgrade = function(card) 
        if not card.ability.extra.upgraded then
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmultup
            card.ability.extra.upgraded = true
        end
    end
})
----------------------------------------------
------------MOD CODE END----------------------
