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
            local keys_to_remove = {}
            local keys_to_alpha = {}
            local keys_to_beta = {}
            local keys_to_flip = {}
            local keys_to_hook = {}
            local keys_to_pot = {}
            local keys_to_snow = {}
            for k, v in pairs(G.playing_cards) do
                if (v.base.suit ~= 'Spades' and v.base.suit ~= 'Hearts') or v:is_face() then
                    table.insert(keys_to_remove, v)
                elseif v:get_id() >= 8 and v.base.suit == 'Spades' then
                    table.insert(keys_to_alpha, v)
                elseif v:get_id() <= 5 and v.base.suit == 'Spades' then
                    table.insert(keys_to_beta, v)
                elseif v:get_id() >= 8 and v.base.suit == 'Hearts' then
                    table.insert(keys_to_pot, v)
                elseif v:get_id() <= 5 and v.base.suit == 'Hearts' then
                    table.insert(keys_to_flip, v)
                elseif v:get_id() == 7 then
                    table.insert(keys_to_hook, v)
                else
                    table.insert(keys_to_snow, v)
                end
            end
            for i = 1, #keys_to_remove do
                keys_to_remove[i]:remove()
            end
            for i = 1, #keys_to_alpha do
                keys_to_alpha[i]:set_ability("m_bld_flip")
            end
            for i = 1, #keys_to_beta do
                keys_to_beta[i]:set_ability("m_bld_adder")
            end
            for i = 1, #keys_to_flip do
                keys_to_flip[i]:set_ability("m_bld_bite")
            end
            for i = 1, #keys_to_hook do
                keys_to_hook[i]:set_ability("m_bld_flint")
            end
            for i = 1, #keys_to_pot do
                keys_to_pot[i]:set_ability("m_bld_pot")
            end
            for i = 1, #keys_to_snow do
                keys_to_snow[i]:set_ability("m_bld_fire")
            end
            G.GAME.starting_deck_size = #G.playing_cards
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
