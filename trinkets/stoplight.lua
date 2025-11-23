
    SMODS.Joker({
        key = 'stoplight',
        atlas = 'bld_trinkets',
        pos = {x = 2, y = 2},
        rarity = 'bld_doodad',
        config = {
            extra = {
                mult = 20,
                chips = 50,
                x_value = {x = 2, y = 2},
                queen = false
            }
        },
        cost = 6,
        blueprint_compat = true,
        eternal_compat = true,
        loc_vars = function (self, info_queue, card)
            return {
                key = (card.ability.extra.x_value.x == 3 and "j_bld_stoplight_yellow") or (card.ability.extra.x_value.x == 4 and "j_bld_stoplight_green") or card.config.center.key,
                vars = {
                card.ability.extra.mult,
                card.ability.extra.chips
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
        reload = function(self, card, card_table, other_card)
            card.children.center:set_sprite_pos(card_table.ability.extra.x_value)
        end,
        calculate = function(self, card, context)
            if context.joker_main and card.ability.extra.x_value.x == 2 then
                return {
                    mult = card.ability.extra.mult
                }
            end
            if context.joker_main and card.ability.extra.x_value.x == 3 then
                return {
                    chips = card.ability.extra.chips
                }
            end
            if context.repetition and card.ability.extra.x_value.x == 4 and context.cardarea == G.play and context.other_card and context.other_card.facing ~= "back" then
                return {
                    message = localize('k_again_ex'),
                    repetitions = 1,
                    card = card,
                    colour = G.C.GREEN
                }
            end
            if context.after and not context.blueprint then
                if card.ability.extra.x_value.x == 2 then
                    card.ability.extra.x_value.x = 4 
                else
                    card.ability.extra.x_value.x = card.ability.extra.x_value.x - 1
                end
                G.E_MANAGER:add_event(Event({trigger = 'after', func = function()
                card.children.center:set_sprite_pos(card.ability.extra.x_value)
                    return true end }))
                if card.ability.extra.x_value.x == 2 then
                    return {
                        message = localize('k_stop_ex'),
                        color = G.C.RED
                    }
                elseif card.ability.extra.x_value.x == 3 then
                    return {
                        message = localize('k_slow_ex'),
                        color = G.C.MONEY
                    }
                elseif card.ability.extra.x_value.x == 4 then
                    return {
                        message = localize('k_go_ex'),
                        color = G.C.GREEN
                    }
                end
            end
        end
    })