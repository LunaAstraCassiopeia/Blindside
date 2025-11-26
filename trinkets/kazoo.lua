
    SMODS.Joker({
        key = 'kazoo',
        atlas = 'bld_trinkets',
        pos = {x = 7, y = 3},
        rarity = 'bld_doodad',
        config = {
            extra = {
                reds = 0,
                ikeeptrackofdiscards = 0,
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
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue + 1] = G.P_TAGS['tag_bld_maxim']
        end,
        calculate = function(self, card, context)
            if context.discard and context.other_card:is_color("Red") then
                card.ability.extra.reds = card.ability.extra.reds + 1
            end
            if context.discard and context.other_card == context.full_hand[#context.full_hand] and card.ability.extra.reds >= 3 then
                    print(card.ability.extra.ikeeptrackofdiscards)
                    print(G.GAME.current_round.discards_left)
                if card.ability.extra.ikeeptrackofdiscards ~= G.GAME.current_round.discards_left then
                    print(card.ability.extra.reds)
                    add_tag(Tag('tag_bld_maxim'))
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_tagged_ex'), colour = G.C.MULT, card = card})
                end
            end
            if context.discard and context.other_card == context.full_hand[#context.full_hand] then
                card.ability.extra.ikeeptrackofdiscards = G.GAME.current_round.discards_left
            end
            if context.discard and context.other_card == context.full_hand[#context.full_hand] then
                print(card.ability.extra.reds .. "removed")
                card.ability.extra.reds = 0
            end
        end
    })