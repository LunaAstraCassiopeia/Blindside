SMODS.Consumable {
    key = 'journey',
    set = 'bld_obj_ritual',
    atlas = 'bld_consumable',
    pos = {x=6, y=3},
    config = {
        extra = {
            affected = 3
        }
    },
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
    use = function(self, card, area)
        local choices = {}
        for key, value in pairs(G.hand.cards) do
            if not value.edition then
                table.insert(choices, value)
            end
        end

        local cards = choose_stuff(choices, card.ability.extra.affected, pseudoseed('bld_journey'))
        for key, value in pairs(cards) do
            G.E_MANAGER:add_event(Event({
                trigger = "before",
                delay = 0.4,
                func = function ()
                    value:set_edition('e_bld_mint', true)
                    return true
                end
            }))
        end
        delay(0.6)
        G.E_MANAGER:add_event(Event({
            func = function ()
                add_tag(Tag('tag_bld_burden'))
                play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                return true
            end
        }))
    end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_TAGS['tag_bld_burden']
        info_queue[#info_queue + 1] = G.P_CENTERS['e_bld_mint']
        return {
            vars = {
                card.ability.extra.affected
            }
        }
    end
}