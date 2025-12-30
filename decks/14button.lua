SMODS.Back({
    key = 'buttondispenser',
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
    pos = { x = 0, y = 2 },
    apply = function(self)
        BLINDSIDE.set_up_blindside()
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.8, func = function()
            BLINDSIDE.set_up_deck({"Yellow", "Red"}, {"m_bld_needle", "m_bld_needle", "m_bld_eye", "m_bld_eye", "m_bld_cloth", "m_bld_sun", "m_bld_sun", "m_bld_sun"}, {})
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

        if context.blind_defeated or not G.GAME.bld_button_discards then
            G.GAME.bld_button_discards = 0
        end
        if context.reshuffle and G.GAME.bld_button_discards < 2 then
            ease_discard(1)
            G.GAME.bld_button_discards = G.GAME.bld_button_discards + 1
        end
    end
})

----------------------------------------------
------------MOD CODE END----------------------
