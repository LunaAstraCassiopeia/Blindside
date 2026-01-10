    BLINDSIDE.Blind({
        key = 'meteor',
        atlas = 'bld_blindrank',
        pos = {x = 5, y = 4},
        config = {
            extra = {
                value = 16,
                chips_mod = 150,
                chips_up = 50,
                x_chips = 1.75,
                x_chips_up = 0.75,
            }},
        hues = {"Blue"},
        rare = true,
        calculate = function(self, card, context) 
            if context.cardarea == G.play and context.main_scoring then
            if context.scoring_name == 'bld_blind_high' or (context.scoring_name == 'bld_blind_2oak' and card.ability.extra.upgraded) then
                return {
                    chips = card.ability.extra.chips_mod,
                    xchips = card.ability.extra.x_chips
                }
            else 
                if card.facing ~= 'back' then 
                card:flip()
                end
                return {
                    message = localize('k_nope_ex'),
                    colour = G.C.BLUE
                }
            end
        end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                key = card.ability.extra.upgraded and 'm_bld_meteor_upgraded' or 'm_bld_meteor',
                vars = {
                    card.ability.extra.chips_mod,
                    card.ability.extra.x_chips
                }
            }
        end,
        upgrade = function(card)
            if not card.ability.extra.upgraded then
                card.ability.extra.chips_mod = card.ability.extra.chips_mod + card.ability.extra.chips_up
                card.ability.extra.x_chips = card.ability.extra.x_chips + card.ability.extra.x_chips_up
                card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
