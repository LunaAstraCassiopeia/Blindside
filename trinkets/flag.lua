
    SMODS.Joker({
        key = 'flag',
        atlas = 'bld_trinkets',
        pos = {x = 3, y = 0},
        rarity = 'bld_keepsake',
        config = {
            extra = {
                repetitions = 1,
            }
        },
        cost = 12,
        blueprint_compat = true,
        eternal_compat = true,
        loc_vars = function (self, info_queue, card)
            return {
                vars = {
                card.ability.extra.repetitions,
            }
        }
        end,
        in_pool = function(self, args)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
                return true
            else
            return false
            end
        end,
        calculate = function(self, card, context)
            if context.repetition and context.other_card and context.other_card:is_color("Red") and context.other_card.facing ~= "back" and context.other_card.ability.extra.rescore ~= 1 then
                return {
                    repetitions = card.ability.extra.repetitions
                }
            end
            if context.burn_card and context.cardarea == G.play and context.burn_card:is_color("Red") and context.burn_card.facing ~= "back" then
                for key, value in pairs(context.scoring_hand) do
                    if value == context.burn_card then
                        return {
                            remove = true
                        }
                    end
                end
            end
        end
    })