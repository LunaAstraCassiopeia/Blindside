SMODS.Consumable {
    key = 'alexandrite',
    set = 'bld_obj_mineral',
    atlas = 'bld_consumable',
    pos = {x=5, y=2},
    config = {
        hand_type = 'bld_allin',
    },
    in_pool = function(self, args)
        if G.GAME.hands[self.config.hand_type].played > 0 then
            return true
        else
            return false
        end
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.hand_type].level,
                localize(card.ability.hand_type, 'poker_hands'), 
                G.GAME.hands[card.ability.hand_type].l_mult, 
                G.GAME.hands[card.ability.hand_type].l_chips,
            colours = {(G.GAME.hands[card.ability.hand_type].level==1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)])}
            }
        }
    end
}