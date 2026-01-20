
    SMODS.Joker({
        key = 'pirateship',
        atlas = 'bld_trinkets',
        pos = {x = 1, y = 5},
        rarity = 'bld_trinket',
        config = {
            extra = {
                mult = 2,
                mult_mod = 2,
            }
        },
        cost = 7,
        blueprint_compat = true,
        eternal_compat = true,
        in_pool = function(self, args)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
                return true
            else
            return false
            end
        end,
        credit = {
            art = "AstraLuna",
            code = "AstraLuna",
            concept = "AstraLuna"
        },
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.mult, card.ability.extra.mult_mod
                }
            }
        end,
        calculate = function(self, card, context)
            if context.pre_discard and not context.hook then
                local text, _ = G.FUNCS.get_poker_hand_info(G.hand.highlighted)
                if text == 'bld_blind_high' then
                    SMODS.scale_card(card, {
                        ref_table = card.ability.extra,
                        ref_value = "mult",
                        scalar_value = "mult_mod",
                        operation = '+',
                        message_colour = G.C.RED
                    })
                end
            end
            if context.joker_main then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    })