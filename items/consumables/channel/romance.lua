SMODS.Consumable {
    key = 'romance',
    set = 'bld_obj_filmcard',
    atlas = 'bld_consumable',
    pos = {x=1, y=1},
    use = function(self, card, area)
        local cards = {}
        for k, v in ipairs(G.hand.cards) do
            if not v.edition then cards[#cards + 1] = v end
          end
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.1, func = function()
                local _card = pseudorandom_element(cards, pseudoseed('romance'))
                local edition = poll_edition(pseudoseed('romance'), nil, true, true, BLINDSIDE.get_blindside_editions())
                _card:set_edition(edition, true)
            return true end }))
        card:juice_up(0.3, 0.5)
    end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.e_bld_enameled
        info_queue[#info_queue+1] = G.P_CENTERS.e_bld_finish
        info_queue[#info_queue+1] = G.P_CENTERS.e_bld_mint
    end,
    can_use = function(self, card)
        if G.hand and G.hand.cards and #G.hand.cards > 0 then
            for k, v in ipairs(G.hand.cards) do
            if not v.edition then 
                return true 
            end
        end
        else
            return false
        end
    end

}
