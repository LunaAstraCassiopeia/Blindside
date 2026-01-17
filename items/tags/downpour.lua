SMODS.Tag {
    key = "downpour",
    hide_ability = false,
    atlas = 'bld_tag',
    config = {
        extra = {
            odds = 2
        }
    },
    loc_vars = function (self, info_queue, tag)
        info_queue[#info_queue + 1] = {key = 'bld_modifiers', set = 'Other'}
        local n,d = SMODS.get_probability_vars(tag, 1, 2)
        return {
            vars = {
                n,
                d,
            }
        }
    end,
    pos = {x = 3, y = 4},
    in_pool = function(self, args)
        return false
    end,
    apply = function(self, tag, context)
        if context.type == 'shop_start' and not (next(SMODS.find_card("j_bld_taglock")) and not (G.GAME.blind.boss or G.GAME.last_joker)) then
            tag:yep('+', G.C.RED, function() 
                return true end)
            tag.triggered = true
        end
        if context.type == 'after_hand' then
            for key, value in pairs(G.play.cards) do
                if (value.edition or value.seal) and SMODS.pseudorandom_probability(tag, pseudoseed('bld_downpour'), 1, 2, 'bld_downpour') then
                    G.E_MANAGER:add_event(Event({
                        trigger = 'before',
                        delay = 0.4,
                        func = function()
                            value:set_edition(nil)
                            value:set_seal(nil)
                            play_sound('cardFan2')
                            value:juice_up()
                            return true
                        end
                    }))
                end
            end
        end
    end,
}