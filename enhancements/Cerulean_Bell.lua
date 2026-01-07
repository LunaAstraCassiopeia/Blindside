    BLINDSIDE.Blind({
        key = 'cerulean_bell',
        atlas = 'bld_blindrank',
        pos = {x = 3, y = 12},
        config = {
            extra = {
                value = 1,
                chips = 1000,
                chipsup = 1000,
            }
        },
        hues = {"Blue"},
        hidden = true,
        calculate = function(self, card, context) 
            if context.cardarea == G.play and context.main_scoring then
                return {
                    chips = card.ability.extra.chips
                }
            end

            if tableContains(card, G.hand.cards) and not tableContains(card, G.hand.highlighted) and #G.hand.highlighted < 5 and G.STATE ~= G.STATES.SMODS_BOOSTER_OPENED then
                card.ability.forced_selection = true
                G.hand:add_to_highlighted(card, true)
            end

            if context.after then
                card.ability.forced_selection = false
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
