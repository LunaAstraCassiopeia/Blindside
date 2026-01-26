
    SMODS.Joker({
        key = 'pumpkin',
        atlas = 'bld_trinkets',
        pos = {x = 7, y = 1},
        rarity = 'bld_trinket',
        cost = 8,
        config = {
            extra = {
                chance = 1,
                trigger = 10,
                multreduc = 1,
                chanceadd = 0,
                colorsplayed = {}
            }
        },
        blueprint_compat = true,
        eternal_compat = true,
        loc_vars = function (self, info_queue, card)
            info_queue[#info_queue + 1] = G.P_SEALS["bld_spooky"]
            local chance, trigger = SMODS.get_probability_vars(card, card.ability.extra.chance + card.ability.extra.chanceadd, card.ability.extra.trigger, 'flag')
            return {
                vars = {
                card.ability.extra.multreduc,
                chance,
                trigger,
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
            if context.individual and context.cardarea == G.play and not context.blueprint then
                if context.other_card.seal == "bld_spooky" then
                    card.ability.extra.chanceadd = card.ability.extra.chanceadd + 1
                end
            end
            if context.joker_main then
                if SMODS.pseudorandom_probability(card, pseudoseed("pumpkin"), card.ability.extra.chance+card.ability.extra.chanceadd, card.ability.extra.trigger, 'pumpkin') then
                    card.ability.extra.chanceadd = 0
                    return {
                        extra = {focus = card, message = localize{type='variable',key='a_rmult',vars={card.ability.extra.multreduc}}, 
                        colour = G.C.RED, func = function()
                            BLINDSIDE.chipsmodify(-card.ability.extra.multreduc, 0 , 0)
                        end},
                        colour = G.C.RED,
                        card = card
                    }
                else
                    return {
                        message = localize('k_nope_ex')
                    }
                end
            end
        end
    })