SMODS.Tag {
    key = "debuff",
    config = {
        debuffed_hand = '['..localize('k_poker_hand')..']',
        debuff_text = localize('k_debuff_tag')
    },
    hide_ability = false,
    atlas = 'bld_tag',
    pos = {x = 0, y = 0},
    in_pool = function(self, args)
        return false
    end,
    loc_vars = function(self, info_queue, tag)
        return {
            vars = {
                (tag.ability and tag.ability.debuffed_hand and localize(tag.ability.debuffed_hand, 'poker_hands')) or ('['..localize('k_poker_hand')..']')
            }
        }
    end,
    apply = function(self, tag, context)
        if context.type == 'shop_start' and not (next(SMODS.find_card("j_bld_taglock")) and not (G.GAME.blind.boss or G.GAME.last_joker)) then
                tag:yep('+', G.C.DARK_EDITION, function() 
                    return true end)
                tag.triggered = true
        end
    end,
    set_ability = function(self, tag) 
        tag.ability.debuffed_hand = G.bolt_played_hand
        tag.ability.debuff_text = localize('k_debuff_tag') .. localize(tag.ability.debuffed_hand, 'poker_hands') 
    end
}