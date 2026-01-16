SMODS.Back({
    key = 'golddispenser',
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
    },
    unlocked = false,
    pos = { x = 2, y = 1 },
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
            BLINDSIDE.set_up_deck({"Yellow"}, {'m_bld_hammer', 'm_bld_hammer', 'm_bld_ore', 'm_bld_ore'}, {'m_bld_silence', 'm_bld_silence'})
            local ante = G.GAME.win_ante * 0.75 
            local int_part, frac_part = math.modf(ante)
            local rounded = int_part + (frac_part >= 0.5 and 1 or 0) 
            G.GAME.win_ante = rounded
        return true end }))
    end,
    calculate = function(self, back, context)
        if context.after then
            G.GAME.gold_last_played = context.scoring_name
            for i = 1, #G.playing_cards do
                G.playing_cards[i]:set_debuff(false)
            end
        end

        if context.blind_defeated then
            ease_dollars(-3)

            if not context.beat_boss and G.GAME.gold_last_played and not G.GAME.last_joker then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.8,
                    func = function ()
                        SMODS.upgrade_poker_hands({
                            hands = G.GAME.gold_last_played,
                            func = function(base, hand, parameter)
                                    return base + G.GAME.hands[G.GAME.gold_last_played]['l_' .. parameter] * 1
                            end,
                            level_up = 1
                        })
                        return true
                    end
                }))
            end
        end
    end
})

SMODS.DrawStep {
    key = 'bld_gold_shiny',
    order = 21,
    func = function (self, layer)
        if self.area and self.area.config then
            local current_back = not self.params.galdur_selector
                and ((Galdur and Galdur.config.use and type(self.params.galdur_back) == "table" and self.params.galdur_back) or type(self.params.viewed_back) == "table" and self.params.viewed_back or (self.params.viewed_back and G.GAME.viewed_back or G.GAME.selected_back) or Back(G.P_CENTERS["b_red"]))
            if current_back and (current_back.effect.center.key == 'b_bld_golddispenser' or current_back.effect.center.key == 'b_bld_yellowdispenser') and self.sprite_facing == 'back' then
                self.children.back:draw_shader('voucher', nil, self.ARGS.send_to_shader, true)
            end
        end
    end
}
----------------------------------------------
------------MOD CODE END----------------------
