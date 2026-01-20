
    SMODS.Joker({
        key = 'marble',
        atlas = 'bld_trinkets',
        pos = {x = 0, y = 4},
        rarity = 'bld_trinket',
        config = {
            extra = {
                retriggers = 1,
            }
        },
        cost = 10,
        blueprint_compat = true,
        eternal_compat = true,
        loc_vars = function (self, info_queue, card)
            return {
                vars = {
                card.ability.extra.retriggers,
            }
        }
        end,
        credit = {
            art = "AstraLuna",
            code = "AstraLuna",
            concept = "AstraLuna"
        },
        in_pool = function(self, args)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
                return true
            else
            return false
            end
        end,
        calculate = function(self, card, context)
            if context.repetition and context.cardarea == G.play and context.other_card and #context.other_card.config.center.config.extra.hues > 1 and context.other_card.facing ~= "back" and context.other_card.ability.extra.rescore ~= 1 then
                return {
                    message = localize('k_again_ex'),
                    repetitions = card.ability.extra.retriggers,
                    card = card
                }
            end
        end
    })