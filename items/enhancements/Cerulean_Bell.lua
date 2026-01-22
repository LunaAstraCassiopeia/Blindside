    BLINDSIDE.Blind({
        key = 'cerulean_bell',
        atlas = 'bld_blindrank',
        pos = {x = 3, y = 12},
        config = {
            extra = {
                value = 1,
                chips = 1000,
                chipsup = 1000,
                give = false,
            }
        },
        hues = {"Blue"},
        hidden = true,
        legendary = true,
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.main_scoring then
                return {
                    chips = card.ability.extra.chips
                }
            end

            if tableContains(card, G.hand.cards) and not tableContains(card, G.hand.highlighted) and G.STATE ~= G.STATES.SMODS_BOOSTER_OPENED then
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
        highlight = function(self, card, is_highlighted)
            if is_highlighted and not card.ability.extra.give then
                print(is_highlighted)
                card.ability.extra.give = true
                SMODS.change_play_limit(1)
                SMODS.change_discard_limit(1)
            else
                if card.ability.extra.give then
                    print(is_highlighted)
                    card.ability.extra.give = false
                    SMODS.change_play_limit(-1)
                    SMODS.change_discard_limit(-1)
                end
            end
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
