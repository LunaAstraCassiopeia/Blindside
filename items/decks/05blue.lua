SMODS.Back({
    key = 'bluedispenser',
    atlas = 'bld_blindback',
    config = {
        no_interest = true,
        hand_size = -1,
        discards = -2,
        hands = 2,
        extra = {
            blindside = true,
        },
        ante_scaling = 0.5,
        joker_slot = -1,
        extra_hand_bonus = 2,
    },
    unlocked = false,
    pos = { x = 4, y = 0 },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                self.config.extra.cash
            }
        }
    end,
    apply = function(self)
        BLINDSIDE.set_up_blindside()
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.8, func = function()
            BLINDSIDE.set_up_deck({"Yellow"}, {'m_bld_pile', 'm_bld_pile', 'm_bld_price', 'm_bld_price'}, {'m_bld_spent', 'm_bld_spent'})
            local ante = G.GAME.win_ante * 0.75 
            local int_part, frac_part = math.modf(ante)
            local rounded = int_part + (frac_part >= 0.5 and 1 or 0) 
            G.GAME.win_ante = rounded
        return true end }))
    end,
    calculate = function(self, back, context) 
        if context.after then
            for i = 1, #G.playing_cards do
                G.playing_cards[i]:set_debuff(false)
            end
        end
    end
})


----------------------------------------------
------------MOD CODE END----------------------
