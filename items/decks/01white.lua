SMODS.Back({
    key = 'whitedispenser',
    atlas = 'bld_blindback',
    config = {
        no_interest = true,
        discards = -1,
        hands = 2,
        extra = {
            blindside = true
        },
        ante_scaling = 0.5,
        joker_slot = -1
    },
    unlocked = true,
    pos = { x = 1, y = 0 },
    apply = function(self)
        BLINDSIDE.set_up_blindside()
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.8, func = function()
            BLINDSIDE.set_up_deck({}, {'m_bld_blank', 'm_bld_blank'}, {'m_bld_curse', 'm_bld_curse'})
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
