SMODS.Back({
    key = 'reddispenser',
    atlas = 'bld_blindback',
    config = {
        no_interest = true,
        hand_size = -1,
        discards = -1,
        hands = 2,
        extra = {
            blindside = true
        },
        ante_scaling = 0.5,
        joker_slot = -1,
    },
    unlocked = false,
    pos = { x = 0, y = 0 },
    apply = function(self)
        BLINDSIDE.set_up_blindside()
        G.E_MANAGER:add_event(Event({func = function()
            BLINDSIDE.set_up_deck({"Purple"}, {"m_bld_snow", "m_bld_snow", "m_bld_hook", "m_bld_hook"}, {'m_bld_daze', 'm_bld_daze'})
            local ante = G.GAME.win_ante * 0.75 
            local int_part, frac_part = math.modf(ante)
            local rounded = int_part + (frac_part >= 0.5 and 1 or 0) 
            G.GAME.win_ante = rounded
            G.E_MANAGER:add_event(Event({func = function()
                SMODS.change_discard_limit(2)
            return true end }))
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
