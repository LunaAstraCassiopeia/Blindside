SMODS.Back({
    key = 'blackdispenser',
    atlas = 'bld_blindback',
    config = {
        no_interest = true,
        hand_size = -1,
        hands = 1,
        discards = -1,
        extra = {
            cash = 8,
            blindside = true,
        },
        ante_scaling = 0.5,
    },
    unlocked = false,
    pos = { x = 3, y = 0 },
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
            BLINDSIDE.set_up_deck({"Red"}, {'m_bld_fire', 'm_bld_fire', 'm_bld_flint', 'm_bld_flint'}, {'m_bld_hunger', 'm_bld_hunger'})
            local ante = G.GAME.win_ante * 0.75 
            local int_part, frac_part = math.modf(ante)
            local rounded = int_part + (frac_part >= 0.5 and 1 or 0) 
            G.GAME.win_ante = rounded
        return true end }))
        --[[G.E_MANAGER:add_event(Event({func = function()
            G.E_MANAGER:add_event(Event({func = function()
                ease_dollars(self.config.extra.cash)
            return true end }))
        return true end }))]]
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
