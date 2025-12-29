    BLINDSIDE.Blind({
        key = 'path',
        atlas = 'bld_blindrank',
        pos = {x = 2, y = 8},
        config = {
            mult = 10,
            chips = 20,
            extra = {
                value = 100,
                poker_hand = "bld_blind_2pair",
            }},
        hues = {"Red", "Blue"},
        rare = true,
        calculate = function(self, card, context)
            if context.modify_hand and context.cardarea == G.hand and context.scoring_hand and context.main_eval then
                if next(context.poker_hands[card.ability.extra.poker_hand]) or (card.ability.extra.upgraded and has_group_of(2, context.poker_hands)) then
                    return {
                        mult = card.ability.mult,
                        chips = card.ability.chips,
                    }
                end
            end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                key = card.ability.extra.upgraded and 'm_bld_path_upgraded' or 'm_bld_path',
                vars = {
                    card.ability.mult,
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
