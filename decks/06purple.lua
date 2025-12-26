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
                keys_to_alpha[i]:set_ability("m_bld_pot")
            end
            for i = 1, #keys_to_beta do
                keys_to_beta[i]:set_ability("m_bld_sharp")
            end
            for i = 1, #keys_to_flip do
                keys_to_flip[i]:set_ability("m_bld_bite")
            end
            for i = 1, #keys_to_hook do
                keys_to_hook[i]:set_ability("m_bld_goad")
            end
            for i = 1, #keys_to_pot do
                keys_to_pot[i]:set_ability("m_bld_adder")
            end
            for i = 1, #keys_to_snow do
                keys_to_snow[i]:set_ability("m_bld_needle")
            end
            G.GAME.starting_deck_size = #G.playing_cards
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
