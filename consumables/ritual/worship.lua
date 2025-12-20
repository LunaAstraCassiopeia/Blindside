SMODS.Consumable {
    key = 'worship',
    set = 'bld_obj_ritual',
    atlas = 'bld_consumable',
    can_use = function (self, card)
        for key, value in pairs(G.jokers.cards) do
            if not value.edition then
                return true
            end
        end
        return false
    end,
    pos = {x=7, y=3},
    use = function(self, card, area)
        local pool = {}
        for key, value in pairs(G.jokers.cards) do
            if not value.edition then
                table.insert(pool, value)
            end
        end
        local chosen_cards = choose_stuff(pool, 1, 'worship')
        G.E_MANAGER:add_event(Event({
            func = function ()
                chosen_cards[1]:set_edition('e_bld_shiny', true)
                return true
            end
        }))
        delay(0.6)
        G.E_MANAGER:add_event(Event({
            func = function ()
                add_tag(Tag('tag_bld_awe'))
                play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                return true
            end
        }))
    end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_TAGS['tag_bld_awe']
        info_queue[#info_queue + 1] = G.P_CENTERS['e_bld_shiny']
        return {
            vars = {
                G.GAME.bld_inversions + 1,
                G.GAME.bld_inversions > 0 and "hands" or "hand"
            }
        }
    end
}