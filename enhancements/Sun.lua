    BLINDSIDE.Blind({
        key = 'sun',
        atlas = 'bld_blindrank',
        pos = {x = 2, y = 6},
        config = {
            h_x_mult = 1.3,
            extra = {
                money = 5,
                value = 10,
                money_up = 5,
                x_mult_up = 0.45,
                retain = true,
            }},
        hues = {"Yellow"},
        calculate = function(self, card, context)
            if context.cardarea == G.hand and context.end_of_round and context.other_card == card then
                return {
                    dollars = card.ability.extra.money
                }
            end
        end,
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue+1] = {key = 'bld_retain', set = 'Other'}
            return {
                vars = {
                    card.ability.h_x_mult,
                    card.ability.extra.money
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.extra.money = card.ability.extra.money + card.ability.extra.money_up
            card.ability.h_x_mult = card.ability.h_x_mult + card.ability.extra.x_mult_up
            card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
