SMODS.Consumable {
    key = 'invert',
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
    pos = {x=0, y=4},
    use = function(self, card, area)
        local pool = {}
        for key, value in pairs(G.jokers.cards) do
            if not value.edition then
                table.insert(pool, value)
            end
        end
        local chosen_cards = choose_stuff(pool, 1, 'invert')
        G.E_MANAGER:add_event(Event({
            func = function ()
                chosen_cards[1]:set_edition('e_negative', true)
                return true
            end
        }))
        delay(0.6)
        G.E_MANAGER:add_event(Event({
            func = function ()
                G.GAME.round_resets.hands = G.GAME.round_resets.hands - G.GAME.bld_inversions - 1
                ease_hands_played(- G.GAME.bld_inversions - 1)
                G.GAME.bld_inversions = G.GAME.bld_inversions + 1
                return true
            end
        }))
        delay(0.6)
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.bld_inversions + 1,
                G.GAME.bld_inversions > 0 and "hands" or "hand"
            }
        }
    end
}