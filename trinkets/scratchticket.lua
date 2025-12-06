
    SMODS.Joker({
        key = 'scratchticket',
        atlas = 'bld_trinkets',
        pos = {x = 0, y = 3},
        rarity = 'bld_keepsake',
        config = {
            extra = {
                chance = 1,
                trigger = 10,
                money = 10,
                chanceadd = 0,
                colorsplayed = {}
            }
        },
        cost = 8,
        blueprint_compat = true,
        eternal_compat = true,
        loc_vars = function (self, info_queue, card)
            local chance, trigger = SMODS.get_probability_vars(card, card.ability.extra.chance + card.ability.extra.chanceadd, card.ability.extra.trigger, 'flag')
            return {
                vars = {
                card.ability.extra.money,
                chance,
                trigger,
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
            if context.individual and context.cardarea == G.play and context.other_card.facing ~= "back" and not context.blueprint then
                if context.other_card:is_color("Green") then
                    card.ability.extra.chanceadd = card.ability.extra.chanceadd + 1
                end
            end
            if context.joker_main then
                if SMODS.pseudorandom_probability(card, pseudoseed("scratchticket"), card.ability.extra.chance+card.ability.extra.chanceadd, card.ability.extra.trigger, 'scratchticket') then
                    card.ability.extra.chanceadd = 0
                    return {
                        dollars = card.ability.extra.money,
                        message = localize('k_reset')
                    }
                else
                    return {
                        message = localize('k_nope_ex')
                    }
                end
            end
        end
    })