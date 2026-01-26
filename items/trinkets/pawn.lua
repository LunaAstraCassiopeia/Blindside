
    SMODS.Joker({
        key = 'pawn',
        atlas = 'bld_trinkets',
        pos = {x = 8, y = 0},
        rarity = 'bld_trinket',
        config = {
            extra = {
                mult = 2,
                xmult = 2.5,
                hand_count = 0,
                x_value = {x = 8, y = 0},
                queen = false
            }
        },
        cost = 6,
        blueprint_compat = true,
        eternal_compat = true,
        loc_vars = function (self, info_queue, card)
            return {
                key = (card.ability.extra.queen and "j_bld_queen") or card.config.center.key,
                vars = {
                card.ability.extra.mult,
                card.ability.extra.xmult,
                card.ability.extra.hand_count,
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
        reload = function(self, card, card_table, other_card)
            if card_table.ability.extra and card_table.ability.extra.queen then
                card.children.center:set_sprite_pos({x = 9, y = 0})
            end
        end,
        calculate = function(self, card, context)
            if context.end_of_round and not context.repetition and not context.individual and not context.blueprint and not card.ability.extra.queen then
                card.ability.extra.hand_count = card.ability.extra.hand_count+1

                if card.ability.extra.hand_count >= 8 then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                        play_sound('tarot1')
                        card:juice_up(0.3, 0.4)
                        card.ability.extra.queen = true
                        card.ability.extra.x_value = {x = 9, y = 0}
                        card.children.center:set_sprite_pos(card.ability.extra.x_value)
                        return true
                        end
                    }))
                    return {
                        message = localize("k_promote_ex"),
                        colour = G.C.MULT,
                        card = card
                    }
                end
                return {
                    message = card.ability.extra.hand_count.."/8"
                }
            end
            if context.joker_main and not card.ability.extra.queen then
                return {
                    mult = card.ability.extra.mult
                }
            end
            if context.joker_main and card.ability.extra.queen then
                return {
                    xmult = card.ability.extra.xmult
                }
            end
        end
    })