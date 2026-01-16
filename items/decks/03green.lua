SMODS.Back({
    key = 'greendispenser',
    atlas = 'bld_blindback',
    config = {
        no_interest = true,
        hand_size = -1,
        discards = -1,
        hands = 2,
        extra = {
            blindside = true,
        },
        ante_scaling = 0.5,
        joker_slot = -1,
        consumable_slot = 1,
        vouchers = {
            'v_bld_television',
            'v_bld_coolrock'
        },
    },
    unlocked = false,
    pos = { x = 2, y = 0 },
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
            BLINDSIDE.set_up_deck({"Blue"}, {'m_bld_eye', 'm_bld_eye', 'm_bld_bell', 'm_bld_bell'}, {'m_bld_thirst', 'm_bld_thirst'})
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
