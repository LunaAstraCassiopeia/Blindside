SMODS.Joker({
    key = 'porcelaindoll',
    atlas = 'bld_trinkets',
    pos = {x = 1, y = 3},
    rarity = 'bld_trinket',
    config = {
        extra = {
            sell_value = 3,
            broken = false,
            xmult = 2
        }
    },
    cost = 10,
    blueprint_compat = false,
    eternal_compat = true,
    loc_vars = function (self, info_queue, card)
        return {
            key = (card.ability.extra.broken and "j_bld_porcelaindoll_broken") or card.config.center.key,
            vars = {
            card.ability.extra.sell_value,
            card.ability.extra.xmult
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
        if card.ability.extra.broken then
            card.children.center:set_sprite_pos({X = 3, y = 6})
        end
    end,
    calculate = function(self, card, context)
        if context.end_of_round and not context.blueprint and not context.other_card and not context.repetition and not card.ability.extra.broken then
            card.ability.extra_value = card.ability.extra_value + card.ability.extra.sell_value
            card:set_cost()
            return {
                message = localize('k_val_up'),
                colour = G.C.MONEY
            }
        end
        if context.joker_main and not card.ability.extra.broken then
            return {
                xmult = card.ability.extra.xmult
            }
        end
        if context.after and context.scoring_hand and not context.blueprint and not context.other_card and not card.ability.extra.broken then
            if #context.scoring_hand >= 5 then
                G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('tarot1')
                    card:juice_up()
                    card.children.center:set_sprite_pos({x = 3, y = 6})
                    card.ability.extra.broken = true
                    return true
                end
                })) 
                return {
                    message = localize('k_broke_ex')
                }
            end
        end
    end,
})