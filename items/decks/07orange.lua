SMODS.Back({
    key = 'orangedispenser',
    atlas = 'bld_blindback',
    config = {
        no_interest = true,
        hand_size = -1,
        hands = 2,
        extra = {
            blindside = true,
        },
        ante_scaling = 0.5,
        joker_slot = -1,
    },
    unlocked = false,
    pos = { x = 1, y = 1 },
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
            BLINDSIDE.set_up_deck({"Blue"}, {'m_bld_deck', 'm_bld_deck', 'm_bld_grate', 'm_bld_grate'}, {'m_bld_sad', 'm_bld_sad'})
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

        if context.burn_card and context.cardarea == G.play then
            return {remove = true}
        end

        if context.playing_card_added then
            if not G.GAME.orange_blind_added then
                G.GAME.orange_blind_added = 0
            end

            G.GAME.orange_blind_added = G.GAME.orange_blind_added + 1

            if G.GAME.orange_blind_added >= 10 then
                G.GAME.orange_blind_added = 0
                G.GAME.round_resets.discards = G.GAME.round_resets.discards + 1
                ease_discard(1)
            end
        end
    end
})


----------------------------------------------
------------MOD CODE END----------------------
