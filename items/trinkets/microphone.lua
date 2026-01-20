
    SMODS.Joker({
        key = 'microphone',
        atlas = 'bld_trinkets',
        pos = {x = 7, y = 2},
        rarity = 'bld_trinket',
        config = {
            extra = {
                last_chips = 0,
            }
        },
        cost = 9,
        blueprint_compat = false,
        eternal_compat = true,
        loc_vars = function (self, info_queue, card)
            return {
                vars = {
                card.ability.extra.last_chips
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
            if context.after and not context.blueprint and not context.other_card and not context.repetition then
                local hand_chips = hand_chips
                card.ability.extra.last_chips = hand_chips*0.5
            card_eval_status_text(card, 'extra', nil, nil, nil, {
                message = localize {
                    type = 'variable',
                    key = 'a_chips',
                    vars = {card.ability.extra.last_chips}
                },
                colour = G.C.CHIPS
            });
            end
            if context.joker_main then
                if card.ability.extra.last_chips > 0 then
                    return {
                        chips = card.ability.extra.last_chips
                    }
                end
            end
            if context.end_of_round and not context.blueprint and not context.other_card and not context.repetition then
                card.ability.extra.last_chips = 0
            end

        end,
    })