    BLINDSIDE.Blind({
    key = 'beta',
    atlas = 'bld_blindrank',
    pos = {x = 0, y = 7},
    config = {
        extra = {
            value = 1,
            chips = 100,
            chipsup = 50,
        }},
    replace_base_card = true,
    no_rank = true,
    no_suit = true,
    hues = {"Blue"},
    hidden = true,
    always_scores = true,
    overrides_base_rank = true,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.main_scoring then
            return {
                chips = card.ability.extra.chips
            }
        end
        if context.end_of_round then
            card:start_dissolve()
        end
    end,
    in_pool = function(self, args)
        if G.GAME.selected_back.effect.center.config.extra then
            if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
            return true
        else
        return false
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
