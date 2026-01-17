
    SMODS.Joker({
        key = 'toyrobot',
        atlas = 'bld_trinkets',
        pos = {x = 7, y = 4},
        rarity = 'bld_doodad',
        config = {
            extra = {
                retriggers = 1,
            }
        },
        cost = 10,
        blueprint_compat = true,
        eternal_compat = true,
        loc_vars = function (self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_SEALS['bld_tech']
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
                    if G.playing_cards then
                        for i = 1, #G.playing_cards do
                            if G.playing_cards[i].seal == 'bld_tech' then
                                return true
                            end
                        end
                    end
            else
            return false
            end
        end,
        calculate = function(self, card, context)
            if context.repetition and context.cardarea == G.play and context.other_card and context.other_card.seal == "bld_tech" and context.other_card.facing ~= "back" and context.other_card.ability.extra.rescore ~= 1 then
                return {
                    message = localize('k_again_ex'),
                    repetitions = card.ability.extra.retriggers,
                    card = card
                }
            end
        end
    })