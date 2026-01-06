BLINDSIDE.Blind({
    key = 'bill',
    atlas = 'bld_blindrank',
    pos = {x = 6, y = 11},
    config = {
        extra = {
            value = 30,
            dollars = -4,
            stubborn = true,
        }},
    hues = {"Yellow"},
    curse = true,
    credit = {
        art = "Gud",
        code = "base4",
        concept = "base4"
    },
    calculate = function(self, card, context)
        if context.burn_card and context.cardarea == G.play and context.burn_card == card then
            return { remove = true }
        end
        if context.cardarea == G.play and context.main_scoring then
            return {
                dollars = card.ability.extra.dollars
            }
        end
    end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {key = 'bld_burn', set = 'Other'}
        info_queue[#info_queue+1] = {key = 'bld_stubborn', set = 'Other'}
        return {
            vars = {
                -card.ability.extra.dollars
            }
        }
    end,
    upgrade = function(card)
        if not card.ability.extra.upgraded then
            card.ability.extra.upgraded = true
        end
    end
})
----------------------------------------------
------------MOD CODE END----------------------
