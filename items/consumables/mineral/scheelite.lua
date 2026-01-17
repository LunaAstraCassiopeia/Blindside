SMODS.Consumable {
    key = 'scheelite',
    set = 'bld_obj_mineral',
    atlas = 'bld_consumable',
    pos = {x=9, y=2},
    config = {},
    in_pool = function(self, args)
        if G.GAME.hands['bld_blind_down'].played > 0 then
            return true
        else
            return false
        end
    end,
    can_use = function()
        return true
    end,
    use = function(self, card, area)
        for key, value in pairs({'bld_blind_double_down', 'bld_blind_triple_down', 'bld_blind_quadruple_down'}) do
            SMODS.smart_level_up_hand(card, value, true, 1)
        end

        level_up_hand(card, 'bld_blind_down', false, 1)
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                localize('bld_blind_down', 'poker_hands'),
            }
        }
    end
}