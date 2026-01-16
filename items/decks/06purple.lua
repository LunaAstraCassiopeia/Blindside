SMODS.Back({
    key = 'purpledispenser',
    atlas = 'bld_blindback',
    config = {
        no_interest = true,
        hand_size = -2,
        discards = -1,
        hands = 2,
        extra = {
            blindside = true,
        },
        ante_scaling = 0.5,
        joker_slot = -1,
    },
    unlocked = false,
    pos = { x = 0, y = 1 },
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
            BLINDSIDE.set_up_deck({"Green"}, {'m_bld_goad', 'm_bld_goad', 'm_bld_needle', 'm_bld_needle'}, {'m_bld_sick', 'm_bld_sick'})
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

        if context.setting_blind and context.blind.big then
            for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                    if G.consumeables.config.card_limit > #G.consumeables.cards then
                        play_sound('timpani')
                        SMODS.add_card({ set = 'bld_obj_ritual' })
                    end
                return true end }))
            end
            delay(0.3)
        end
    end
})


----------------------------------------------
------------MOD CODE END----------------------
