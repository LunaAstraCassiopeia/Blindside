SMODS.Tag {
    key = "mantle",
    hide_ability = false,
    atlas = 'bld_tag',
    pos = {x = 2, y = 4},
    in_pool = function(self, args)
        return false
    end,
    apply = function(self, tag, context)
        if context.type == 'after_hand' then
            local cards = choose_stuff(G.play.cards, 1, pseudoseed('mantle'))
            G.E_MANAGER:add_event(Event({
                func = function ()
                    destroy_blinds_and_calc(cards, tag)
                    G.E_MANAGER:add_event(Event({
                        func = function ()
                            G.E_MANAGER:add_event(Event({
                                func = function ()
                                    cards[1]:remove()
                                    return true
                                end
                            }))
                            return true
                        end
                    }))
                    return true
                end
            }))
        end

        if context.type == 'shop_start' and not (next(SMODS.find_card("j_bld_taglock")) and not (G.GAME.blind.boss or G.GAME.last_joker)) then
            tag:yep('+', G.C.MONEY, function() 
                return true end)
            tag.triggered = true
        end
    end,
}