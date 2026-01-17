SMODS.Consumable {
    key = 'monsoon',
    set = 'bld_obj_ritual',
    atlas = 'bld_consumable',
    can_use = function (self, card)
        if #G.hand.cards > 0 then
            for key, value in pairs(G.hand.cards) do
                if not value.edition then
                    return true
                end
            end
        end
        return false
    end,
    pos = {x=10, y=3},
    use = function(self, card, area)
        for key, value in pairs(G.hand.cards) do
            if not value.edition and SMODS.pseudorandom_probability(card, pseudoseed('bld_rain'), 1, 3, 'bld_rain') then
                local edition = poll_edition(pseudoseed('bld_rain'), nil, true, true, {'e_bld_enameled', 'e_bld_finish', 'e_bld_mint', 'e_bld_shiny'})
                G.E_MANAGER:add_event(Event({
                    trigger = "before",
                    delay = 0.4,
                    func = function ()
                        value:set_edition(edition, true)
                        return true
                    end
                }))
            end
        end
        delay(0.6)
        G.E_MANAGER:add_event(Event({
            func = function ()
                add_tag(Tag('tag_bld_downpour'))
                play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                return true
            end
        }))
    end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_TAGS['tag_bld_downpour']
        local n,d = SMODS.get_probability_vars(card, 1, 3)
        return {
            vars = {
                n,
                d,
            }
        }
    end
}