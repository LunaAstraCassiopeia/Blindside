    BLINDSIDE.Blind({
        key = 'cloth',
        atlas = 'bld_blindrank',
        pos = {x = 9, y = 5},
        config = {
            extra = {
                value = 17,
                ikeeptrackofdiscards = 0,
                text = nil,
            }},
        hues = {"Red"},
        replace_base_card = true,
        no_rank = true,
        no_suit = true,
        overrides_base_rank = true,
        in_pool = function(self, args)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
                return true
            else
            return false
            end
        end,
        calculate = function(self, card, context)
            if context.pre_discard and not context.hook then
                card.ability.extra.text = nil
                for i = 1, #context.full_hand do
                    if context.full_hand[i] == card and card.ability.extra.ikeeptrackofdiscards ~= G.GAME.current_round.discards_left then
                        card.ability.extra.text, _ = G.FUNCS.get_poker_hand_info(G.hand.highlighted)
                    end
                end
            end
            if context.pre_discard then
                card.ability.extra.ikeeptrackofdiscards = G.GAME.current_round.discards_left
                if card.ability.extra.text then
                    return {
                        level_up = true,
                        level_up_hand = card.ability.extra.text
                    }   
                end
            end
            if context.discard and context.other_card == card then
                return {
                    burn = true
                }
            end
        end,
        rare = true,
        loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {key = 'bld_burn', set = 'Other'}
        end,
    })
----------------------------------------------
------------MOD CODE END----------------------
