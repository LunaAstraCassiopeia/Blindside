BLINDSIDE.Joker({
    key = 'oddtodd',
    atlas = 'bld_joker',
    pos = {x=0, y=37},
    boss_colour = HEX("009CFD"),
    mult = 12,
    dollars = 6,
    order = 7,
    active = true,
    big = {min = 1},
    pool_override = function()
        return not G.GAME.modifiers.enable_bld_tough_jokers and G.GAME.round_resets.ante % 2 == 1
    end,
    calculate = function(self, blind, context)
        if context.setting_blind and G.GAME.modifiers.enable_bld_deplete_hands and G.GAME.current_round.hands_left > 1 then
            ease_hands_played(-1)
        end

        if context.scoring_name and G.STATE == G.STATES.SELECTING_HAND and not G.GAME.blind.disabled then
            if #G.hand.highlighted % 2 == 1 then
                BLINDSIDE.alert_debuff(self, true, "Hand is odd")
            else
                BLINDSIDE.alert_debuff(self, false)
            end
        end
        if context.pre_discard then
            BLINDSIDE.alert_debuff(self, false)
        end
        if context.before then
            BLINDSIDE.alert_debuff(self, false)
        end
        if context.setting_blind and not context.disabled then
            blind.active = true
        end
        if context.after and not G.GAME.blind.disabled and #G.play.cards % 2 == 1 then
            local hasWildCanvas = false
            for i = 1, #context.scoring_hand do
                if (context.scoring_hand[i].seal == "bld_wild" or #context.scoring_hand[i].ability.extra.hues >= 2) and context.scoring_hand[i].facing ~= "back" and next(SMODS.find_card('j_bld_canvas')) then
                    hasWildCanvas = true
                end
            end
            G.GAME.playing_with_fire_num = G.GAME.playing_with_fire_num + 1
            G.GAME.playing_with_fire_each = G.GAME.used_vouchers.v_bld_swearjar and "bld_playing_with_fire_each_3" or "bld_playing_with_fire_each_2"
            G.GAME.playing_with_fire = G.GAME.playing_with_fire + 2 + (G.GAME.used_vouchers.v_bld_swearjar and 1 or 0)
            BLINDSIDE.chipsmodify(0, 0, 0, 1 + (hasWildCanvas and 0.155 or 0.31))
        end
    end,
})

BLINDSIDE.Joker({
    key = 'evensteven',
    atlas = 'bld_joker',
    pos = {x=0, y=36},
    boss_colour = HEX("FD5F55"),
    mult = 12,
    dollars = 6,
    order = 7,
    active = true,
    big = {min = 1},
    pool_override = function()
        return not G.GAME.modifiers.enable_bld_tough_jokers and G.GAME.round_resets.ante % 2 == 0
    end,
    calculate = function(self, blind, context)
        if context.setting_blind and G.GAME.modifiers.enable_bld_deplete_hands and G.GAME.current_round.hands_left > 1 then
            ease_hands_played(-1)
        end

        if context.scoring_name and G.STATE == G.STATES.SELECTING_HAND and not G.GAME.blind.disabled then
            if #G.hand.highlighted > 0 and #G.hand.highlighted % 2 == 0 then
                BLINDSIDE.alert_debuff(self, true, "Hand is even")
            else
                BLINDSIDE.alert_debuff(self, false)
            end
        end
        if context.pre_discard then
            BLINDSIDE.alert_debuff(self, false)
        end
        if context.before then
            BLINDSIDE.alert_debuff(self, false)
        end
        if context.setting_blind and not context.disabled then
            blind.active = true
        end
        if context.after and not G.GAME.blind.disabled and #G.play.cards % 2 == 0 then
            local hasWildCanvas = false
            for i = 1, #context.scoring_hand do
                if (context.scoring_hand[i].seal == "bld_wild" or #context.scoring_hand[i].ability.extra.hues >= 2) and context.scoring_hand[i].facing ~= "back" and next(SMODS.find_card('j_bld_canvas')) then
                    hasWildCanvas = true
                end
            end
            G.GAME.playing_with_fire_num = G.GAME.playing_with_fire_num + 1
            G.GAME.playing_with_fire_each = G.GAME.used_vouchers.v_bld_swearjar and "bld_playing_with_fire_each_3" or "bld_playing_with_fire_each_2"
            G.GAME.playing_with_fire = G.GAME.playing_with_fire + 2 + (G.GAME.used_vouchers.v_bld_swearjar and 1 or 0)
            BLINDSIDE.chipsmodify(4 - (hasWildCanvas and 2 or 0), 0, 0)
        end
    end,
})

BLINDSIDE.Joker({
    key = 'slyjoker',
    atlas = 'bld_joker',
    pos = {x=0, y=6},
    boss_colour = HEX("7fa5b5"),
    mult = 12,
    dollars = 6,
    order = 7,
    active = true,
    big = {min = 1},
    pool_override = function()
        return not (G.GAME.modifiers.enable_bld_elites and G.GAME.round_resets.ante == 5) and G.GAME.modifiers.enable_bld_tough_jokers
    end,
    calculate = function(self, blind, context)
        if context.setting_blind and G.GAME.modifiers.enable_bld_deplete_hands and G.GAME.current_round.hands_left > 1 then
            ease_hands_played(-1)
        end

        if context.scoring_name and G.STATE == G.STATES.SELECTING_HAND and not G.GAME.blind.disabled and blind.active then
            if has_group_of(2, context.poker_hands) then
                BLINDSIDE.alert_debuff(self, true, "Hand contains Pair")
            else
                BLINDSIDE.alert_debuff(self, false)
            end
        end
        if context.pre_discard then
            BLINDSIDE.alert_debuff(self, false)
        end
        if context.before then
            BLINDSIDE.alert_debuff(self, false)
            if context.scoring_hand and not G.GAME.blind.disabled and G.GAME.modifiers.enable_bld_deadly_small_big and blind.active then
                if has_group_of(2, context.poker_hands) then
                    for key, value in pairs(context.scoring_hand) do
                        value.config.center.blind_debuff(value, true)
                    end
                end
            end
        end
        if context.setting_blind and not context.disabled then
            blind.active = true
        end
        if context.after and not G.GAME.blind.disabled and blind.active and has_group_of(2, context.poker_hands) then
            local hasWildCanvas = false
            for i = 1, #context.scoring_hand do
                if (context.scoring_hand[i].seal == "bld_wild" or #context.scoring_hand[i].ability.extra.hues >= 2) and context.scoring_hand[i].facing ~= "back" and next(SMODS.find_card('j_bld_canvas')) then
                    hasWildCanvas = true
                end
            end
            G.GAME.playing_with_fire_num = G.GAME.playing_with_fire_num + 1
            G.GAME.playing_with_fire_each = G.GAME.used_vouchers.v_bld_swearjar and "bld_playing_with_fire_each_big_joker_2" or "bld_playing_with_fire_each_big_joker_1"
            G.GAME.playing_with_fire = G.GAME.playing_with_fire + 2 * (G.GAME.used_vouchers.v_bld_swearjar and 2 or 1)
            BLINDSIDE.chipsmodify(0, 0, 0, 2- (hasWildCanvas and 0.5 or 0))
            blind.active = false
        end
    end,
})

BLINDSIDE.Joker({
    key = 'wilyjoker',
    atlas = 'bld_joker',
    pos = {x=0, y=7},
    boss_colour = HEX("83c4b4"),
    mult = 12,
    dollars = 6,
    order = 8,
    active = true,
    big = {min = 1},
    pool_override = function()
        return not (G.GAME.modifiers.enable_bld_elites and G.GAME.round_resets.ante == 5) and G.GAME.modifiers.enable_bld_tough_jokers
    end,
    calculate = function(self, blind, context)
        if context.setting_blind and G.GAME.modifiers.enable_bld_deplete_hands and G.GAME.current_round.hands_left > 1 then
            ease_hands_played(-1)
        end
        if context.scoring_name and G.STATE == G.STATES.SELECTING_HAND and not G.GAME.blind.disabled and blind.active then
            if has_group_of(3, context.poker_hands) then
                BLINDSIDE.alert_debuff(self, true, "Hand contains Three of a Blind")
            else
                BLINDSIDE.alert_debuff(self, false)
            end
        end
        if context.pre_discard then
            BLINDSIDE.alert_debuff(self, false)
        end
        if context.before then
            BLINDSIDE.alert_debuff(self, false)
            if context.scoring_hand and not G.GAME.blind.disabled and G.GAME.modifiers.enable_bld_deadly_small_big and blind.active then
                if has_group_of(3, context.poker_hands) then
                    for key, value in pairs(context.scoring_hand) do
                        value.config.center.blind_debuff(value, true)
                    end
                end
            end
        end
        if context.setting_blind and not context.disabled then
            blind.active = true
        end
        if context.after and not G.GAME.blind.disabled and blind.active and has_group_of(3, context.poker_hands) then
            local hasWildCanvas = false
            for i = 1, #context.scoring_hand do
                if (context.scoring_hand[i].seal == "bld_wild" or #context.scoring_hand[i].ability.extra.hues >= 2) and context.scoring_hand[i].facing ~= "back" and next(SMODS.find_card('j_bld_canvas')) then
                    hasWildCanvas = true
                end
            end
            G.GAME.playing_with_fire_num = G.GAME.playing_with_fire_num + 1
            G.GAME.playing_with_fire_each = G.GAME.used_vouchers.v_bld_swearjar and "bld_playing_with_fire_each_big_joker_2" or "bld_playing_with_fire_each_big_joker_1"
            G.GAME.playing_with_fire = G.GAME.playing_with_fire + 3 * (G.GAME.used_vouchers.v_bld_swearjar and 2 or 1)
            BLINDSIDE.chipsmodify(0, 0, 0, 3- (hasWildCanvas and 0.5 or 0))
            blind.active = false
        end
    end,
})

BLINDSIDE.Joker({
    key = 'cleverjoker',
    atlas = 'bld_joker',
    pos = {x=0, y=8},
    boss_colour = HEX("ad7e69"),
    mult = 12,
    dollars = 6,
    order = 9,
    active = true,
    big = {min = 1},
    pool_override = function()
        return not (G.GAME.modifiers.enable_bld_elites and G.GAME.round_resets.ante == 5) and G.GAME.modifiers.enable_bld_tough_jokers
    end,
    calculate = function(self, blind, context)
        if context.setting_blind and G.GAME.modifiers.enable_bld_deplete_hands and G.GAME.current_round.hands_left > 1 then
            ease_hands_played(-1)
        end
        if context.scoring_name and G.STATE == G.STATES.SELECTING_HAND and not G.GAME.blind.disabled and blind.active then
            if (next(context.poker_hands['bld_blind_2pair']) or next(context.poker_hands['bld_blind_fullhouse']) or next(context.poker_hands['bld_blind_quadruple_down'])) then
                BLINDSIDE.alert_debuff(self, true, "Hand contains Two Pair")
            else
                BLINDSIDE.alert_debuff(self, false)
            end
        end
        if context.pre_discard then
            BLINDSIDE.alert_debuff(self, false)
        end
        if context.before then
            BLINDSIDE.alert_debuff(self, false)
            if context.scoring_hand and not G.GAME.blind.disabled and G.GAME.modifiers.enable_bld_deadly_small_big and blind.active then
                if (next(context.poker_hands['bld_blind_2pair']) or next(context.poker_hands['bld_blind_fullhouse']) or next(context.poker_hands['bld_blind_quadruple_down'])) then
                    for key, value in pairs(context.scoring_hand) do
                        value.config.center.blind_debuff(value, true)
                    end
                end
            end
        end
        if context.setting_blind and not context.disabled then
            blind.active = true
        end
        if context.after and not G.GAME.blind.disabled and blind.active and (next(context.poker_hands['bld_blind_2pair']) or next(context.poker_hands['bld_blind_fullhouse']) or next(context.poker_hands['bld_blind_quadruple_down'])) then
            local hasWildCanvas = false
            for i = 1, #context.scoring_hand do
                if (context.scoring_hand[i].seal == "bld_wild" or #context.scoring_hand[i].ability.extra.hues >= 2) and context.scoring_hand[i].facing ~= "back" and next(SMODS.find_card('j_bld_canvas')) then
                    hasWildCanvas = true
                end
            end
            G.GAME.playing_with_fire_num = G.GAME.playing_with_fire_num + 1
            G.GAME.playing_with_fire_each = G.GAME.used_vouchers.v_bld_swearjar and "bld_playing_with_fire_each_big_joker_2" or "bld_playing_with_fire_each_big_joker_1"
            G.GAME.playing_with_fire = G.GAME.playing_with_fire + 3 * (G.GAME.used_vouchers.v_bld_swearjar and 2 or 1)
            BLINDSIDE.chipsmodify(0, 0, 0, 3- (hasWildCanvas and 0.5 or 0))
            blind.active = false
        end
    end,
})

BLINDSIDE.Joker({
    key = 'deviousjoker',
    atlas = 'bld_joker',
    pos = {x=0, y=9},
    boss_colour = HEX("62aebf"),
    mult = 12,
    dollars = 6,
    order = 10,
    active = true,
    big = {min = 1},
    pool_override = function()
        return not (G.GAME.modifiers.enable_bld_elites and G.GAME.round_resets.ante == 5) and G.GAME.modifiers.enable_bld_tough_jokers
    end,
    calculate = function(self, blind, context)
        if context.setting_blind and G.GAME.modifiers.enable_bld_deplete_hands and G.GAME.current_round.hands_left > 1 then
            ease_hands_played(-1)
        end
        if context.scoring_name and G.STATE == G.STATES.SELECTING_HAND and not G.GAME.blind.disabled and blind.active then
            if next(context.poker_hands['bld_raise']) then
                BLINDSIDE.alert_debuff(self, true, "Hand contains Raise")
            else
                BLINDSIDE.alert_debuff(self, false)
            end

        end
        if context.pre_discard then
            BLINDSIDE.alert_debuff(self, false)
        end
        if context.before then
            BLINDSIDE.alert_debuff(self, false)
            if context.scoring_hand and not G.GAME.blind.disabled and G.GAME.modifiers.enable_bld_deadly_small_big and blind.active then
                if next(context.poker_hands['bld_raise']) then
                    for key, value in pairs(context.scoring_hand) do
                        value.config.center.blind_debuff(value, true)
                    end
                end
            end
        end
        if context.setting_blind and not context.disabled then
            blind.active = true
        end
        if context.after and not G.GAME.blind.disabled and blind.active and next(context.poker_hands['bld_raise']) then
            local hasWildCanvas = false
            for i = 1, #context.scoring_hand do
                if (context.scoring_hand[i].seal == "bld_wild" or #context.scoring_hand[i].ability.extra.hues >= 2) and context.scoring_hand[i].facing ~= "back" and next(SMODS.find_card('j_bld_canvas')) then
                    hasWildCanvas = true
                end
            end
            G.GAME.playing_with_fire_num = G.GAME.playing_with_fire_num + 1
            G.GAME.playing_with_fire_each = G.GAME.used_vouchers.v_bld_swearjar and "bld_playing_with_fire_each_big_joker_2" or "bld_playing_with_fire_each_big_joker_1"
            G.GAME.playing_with_fire = G.GAME.playing_with_fire + 4 * (G.GAME.used_vouchers.v_bld_swearjar and 2 or 1)
            BLINDSIDE.chipsmodify(0, 0, 0, 4- (hasWildCanvas and 1 or 0))
            blind.active = false
        end
    end,
})


BLINDSIDE.Joker({
    key = 'craftyjoker',
    atlas = 'bld_joker',
    pos = {x=0, y=10},
    boss_colour = HEX("fd5f55"),
    mult = 12,
    dollars = 6,
    order = 11,
    active = true,
    big = {min = 1},
    pool_override = function()
        return not (G.GAME.modifiers.enable_bld_elites and G.GAME.round_resets.ante == 5) and G.GAME.modifiers.enable_bld_tough_jokers
    end,
    calculate = function(self, blind, context)
        if context.setting_blind and G.GAME.modifiers.enable_bld_deplete_hands and G.GAME.current_round.hands_left > 1 then
            ease_hands_played(-1)
        end
        if context.scoring_name and G.STATE == G.STATES.SELECTING_HAND and not G.GAME.blind.disabled and blind.active then
            if has_group_of(5, context.poker_hands) then
                BLINDSIDE.alert_debuff(self, true, "Hand contains Flush")
            else
                BLINDSIDE.alert_debuff(self, false)
            end
        end
        if context.pre_discard then
            BLINDSIDE.alert_debuff(self, false)
        end
        if context.before then
            BLINDSIDE.alert_debuff(self, false)
            if context.scoring_hand and not G.GAME.blind.disabled and G.GAME.modifiers.enable_bld_deadly_small_big and blind.active then
                if has_group_of(5, context.poker_hands) then
                    for key, value in pairs(context.scoring_hand) do
                        value.config.center.blind_debuff(value, true)
                    end
                end
            end
        end
        if context.setting_blind and not context.disabled then
            blind.active = true
        end
        if context.after and not G.GAME.blind.disabled and blind.active and has_group_of(5, context.poker_hands) then
            local hasWildCanvas = false
            for i = 1, #context.scoring_hand do
                if (context.scoring_hand[i].seal == "bld_wild" or #context.scoring_hand[i].ability.extra.hues >= 2) and context.scoring_hand[i].facing ~= "back" and next(SMODS.find_card('j_bld_canvas')) then
                    hasWildCanvas = true
                end
            end
            G.GAME.playing_with_fire_num = G.GAME.playing_with_fire_num + 1
            G.GAME.playing_with_fire_each = G.GAME.used_vouchers.v_bld_swearjar and "bld_playing_with_fire_each_big_joker_2" or "bld_playing_with_fire_each_big_joker_1"
            G.GAME.playing_with_fire = G.GAME.playing_with_fire + 4 * (G.GAME.used_vouchers.v_bld_swearjar and 2 or 1)
            BLINDSIDE.chipsmodify(0, 0, 0, 4- (hasWildCanvas and 1 or 0))
            blind.active = false
        end
    end,
})

BLINDSIDE.Joker({
    key = 'madjoker1',
    atlas = 'bld_joker',
    pos = {x=0, y=7},
    boss_colour = HEX("83c4b4"),
    mult = 12,
    dollars = 12,
    order = 7,
    active = true,
    big = {min = 1},
    pool_override = function()
        return G.GAME.modifiers.enable_bld_elites and G.GAME.round_resets.ante == 5
    end,
    calculate = function(self, blind, context)
        local cond1 = context.poker_hands and has_group_of(3, context.poker_hands)
        local cond2 = context.poker_hands and (next(context.poker_hands['bld_blind_2pair']) or next(context.poker_hands['bld_blind_fullhouse']) or next(context.poker_hands['bld_blind_quadruple_down']))

        if context.setting_blind and G.GAME.modifiers.enable_bld_deplete_hands and G.GAME.current_round.hands_left > 1 then
            ease_hands_played(-1)
        end
        if context.scoring_hand and context.poker_hands and G.STATE == G.STATES.SELECTING_HAND and not G.GAME.blind.disabled and blind.active then
            if cond1 then
                BLINDSIDE.alert_debuff(self, true, "Hand contains " .. "Three of a Blind")
            else
                if cond2 then
                    BLINDSIDE.alert_debuff(self, true, "Hand contains " .. "Two Pair")
                else
                    BLINDSIDE.alert_debuff(self, false)
                end
            end
        end

        if context.pre_discard then
            BLINDSIDE.alert_debuff(self, false)
        end
        if context.before then
            BLINDSIDE.alert_debuff(self, false)
            if context.scoring_hand and not G.GAME.blind.disabled and G.GAME.modifiers.enable_bld_deadly_small_big and blind.active then
                if cond1 or cond2 then
                    for key, value in pairs(context.scoring_hand) do
                        value.config.center.blind_debuff(value, true)
                    end
                end
            end
        end
        if context.setting_blind and not context.disabled then
            blind.active = true
        end
        if context.after and not G.GAME.blind.disabled and blind.active and (cond1 or cond2) then
            local hasWildCanvas = false
            for i = 1, #context.scoring_hand do
                if (context.scoring_hand[i].seal == "bld_wild" or #context.scoring_hand[i].ability.extra.hues >= 2) and context.scoring_hand[i].facing ~= "back" and next(SMODS.find_card('j_bld_canvas')) then
                    hasWildCanvas = true
                end
            end
            G.GAME.playing_with_fire_num = G.GAME.playing_with_fire_num + 1
            G.GAME.playing_with_fire_each = G.GAME.used_vouchers.v_bld_swearjar and "bld_playing_with_fire_each_big_joker_2" or "bld_playing_with_fire_each_big_joker_1"
            G.GAME.playing_with_fire = G.GAME.playing_with_fire + 3 * (G.GAME.used_vouchers.v_bld_swearjar and 2 or 1)
            BLINDSIDE.chipsmodify(0, 0, 0, 3 - (hasWildCanvas and 0.5 or 0))
            blind.active = false
        end
    end,
    get_assist = function(self)
        return G.P_BLINDS["bl_bld_madjoker2"]
    end,
})

BLINDSIDE.Joker({
    key = 'madjoker2',
    atlas = 'bld_joker',
    pos = {x=0, y=8},
    boss_colour = HEX("83c4b4"),
    mult = 12,
    dollars = 12,
    order = 23,
    small = {min = 1},
    active = true,
    is_assistant = true
})

BLINDSIDE.Joker({
    key = 'impracticaljoker1',
    atlas = 'bld_joker',
    pos = {x=0, y=9},
    boss_colour = HEX("62aebf"),
    mult = 12,
    dollars = 12,
    order = 7,
    active = true,
    big = {min = 1},
    pool_override = function()
        return G.GAME.modifiers.enable_bld_elites and G.GAME.round_resets.ante == 5
    end,
    calculate = function(self, blind, context)
        local cond2 = context.poker_hands and has_group_of(3, context.poker_hands)
        local cond1 = context.poker_hands and next(context.poker_hands['bld_raise'])

        if context.setting_blind and G.GAME.modifiers.enable_bld_deplete_hands and G.GAME.current_round.hands_left > 1 then
            ease_hands_played(-1)
        end
        if context.scoring_hand and context.poker_hands and G.STATE == G.STATES.SELECTING_HAND and not G.GAME.blind.disabled and blind.active then
            if cond1 then
                BLINDSIDE.alert_debuff(self, true, "Hand contains " .. "Raise")
            else
                if cond2 then
                    BLINDSIDE.alert_debuff(self, true, "Hand contains " .. "Three of a Blind")
                else
                    BLINDSIDE.alert_debuff(self, false)
                end
            end
        end

        if context.pre_discard then
            BLINDSIDE.alert_debuff(self, false)
        end
        if context.before then
            BLINDSIDE.alert_debuff(self, false)
            if context.scoring_hand and not G.GAME.blind.disabled and G.GAME.modifiers.enable_bld_deadly_small_big and blind.active then
                if cond1 or cond2 then
                    for key, value in pairs(context.scoring_hand) do
                        value.config.center.blind_debuff(value, true)
                    end
                end
            end
        end
        if context.setting_blind and not context.disabled then
            blind.active = true
        end
        if context.after and not G.GAME.blind.disabled and blind.active and (cond1 or cond2) then
            local hasWildCanvas = false
            for i = 1, #context.scoring_hand do
                if (context.scoring_hand[i].seal == "bld_wild" or #context.scoring_hand[i].ability.extra.hues >= 2) and context.scoring_hand[i].facing ~= "back" and next(SMODS.find_card('j_bld_canvas')) then
                    hasWildCanvas = true
                end
            end
            G.GAME.playing_with_fire_num = G.GAME.playing_with_fire_num + 1
            G.GAME.playing_with_fire_each = G.GAME.used_vouchers.v_bld_swearjar and "bld_playing_with_fire_each_big_joker_2" or "bld_playing_with_fire_each_big_joker_1"
            G.GAME.playing_with_fire = G.GAME.playing_with_fire + 4 * (G.GAME.used_vouchers.v_bld_swearjar and 2 or 1)
            BLINDSIDE.chipsmodify(0, 0, 0, 4 - (hasWildCanvas and 0.5 or 0))
            blind.active = false
        end
    end,
    get_assist = function(self)
        return G.P_BLINDS["bl_bld_impracticaljoker2"]
    end,
})

BLINDSIDE.Joker({
    key = 'impracticaljoker2',
    atlas = 'bld_joker',
    pos = {x=0, y=7},
    boss_colour = HEX("62aebf"),
    mult = 12,
    dollars = 12,
    order = 23,
    small = {min = 1},
    active = true,
    is_assistant = true
})

BLINDSIDE.Joker({
    key = 'schemingjoker1',
    atlas = 'bld_joker',
    pos = {x=0, y=8},
    boss_colour = HEX("ad7e69"),
    mult = 12,
    dollars = 12,
    order = 7,
    active = true,
    big = {min = 1},
    pool_override = function()
        return G.GAME.modifiers.enable_bld_elites and G.GAME.round_resets.ante == 5
    end,
    calculate = function(self, blind, context)
        local cond2 = context.poker_hands and has_group_of(5, context.poker_hands)
        local cond1 = context.poker_hands and (next(context.poker_hands['bld_blind_2pair']) or next(context.poker_hands['bld_blind_fullhouse']) or next(context.poker_hands['bld_blind_quadruple_down']))

        if context.setting_blind and G.GAME.modifiers.enable_bld_deplete_hands and G.GAME.current_round.hands_left > 1 then
            ease_hands_played(-1)
        end
        if context.scoring_hand and context.poker_hands and G.STATE == G.STATES.SELECTING_HAND and not G.GAME.blind.disabled and blind.active then
            if cond1 then
                BLINDSIDE.alert_debuff(self, true, "Hand contains " .. "Two Pair")
            else
                if cond2 then
                    BLINDSIDE.alert_debuff(self, true, "Hand contains " .. "Flush")
                else
                    BLINDSIDE.alert_debuff(self, false)
                end
            end
        end

        if context.pre_discard then
            BLINDSIDE.alert_debuff(self, false)
        end
        if context.before then
            BLINDSIDE.alert_debuff(self, false)
            if context.scoring_hand and not G.GAME.blind.disabled and G.GAME.modifiers.enable_bld_deadly_small_big and blind.active then
                if cond1 or cond2 then
                    for key, value in pairs(context.scoring_hand) do
                        value.config.center.blind_debuff(value, true)
                    end
                end
            end
        end
        if context.setting_blind and not context.disabled then
            blind.active = true
        end
        if context.after and not G.GAME.blind.disabled and blind.active and (cond1 or cond2) then
            local hasWildCanvas = false
            for i = 1, #context.scoring_hand do
                if (context.scoring_hand[i].seal == "bld_wild" or #context.scoring_hand[i].ability.extra.hues >= 2) and context.scoring_hand[i].facing ~= "back" and next(SMODS.find_card('j_bld_canvas')) then
                    hasWildCanvas = true
                end
            end
            G.GAME.playing_with_fire_num = G.GAME.playing_with_fire_num + 1
            G.GAME.playing_with_fire_each = G.GAME.used_vouchers.v_bld_swearjar and "bld_playing_with_fire_each_big_joker_2" or "bld_playing_with_fire_each_big_joker_1"
            G.GAME.playing_with_fire = G.GAME.playing_with_fire + 4 * (G.GAME.used_vouchers.v_bld_swearjar and 2 or 1)
            BLINDSIDE.chipsmodify(0, 0, 0, 4 - (hasWildCanvas and 0.5 or 0))
            blind.active = false
        end
    end,
    get_assist = function(self)
        return G.P_BLINDS["bl_bld_schemingjoker2"]
    end,
})

BLINDSIDE.Joker({
    key = 'schemingjoker2',
    atlas = 'bld_joker',
    pos = {x=0, y=10},
    boss_colour = HEX("ad7e69"),
    mult = 12,
    dollars = 12,
    order = 23,
    small = {min = 1},
    active = true,
    is_assistant = true
})

BLINDSIDE.Joker({
    key = 'maliciousjoker1',
    atlas = 'bld_joker',
    pos = {x=0, y=10},
    boss_colour = HEX("fd5f55"),
    mult = 12,
    dollars = 12,
    order = 7,
    active = true,
    big = {min = 1},
    pool_override = function()
        return G.GAME.modifiers.enable_bld_elites and G.GAME.round_resets.ante == 5
    end,
    calculate = function(self, blind, context)
        local cond1 = context.poker_hands and has_group_of(5, context.poker_hands)
        local cond2 = context.poker_hands and next(context.poker_hands['bld_raise'])

        if context.setting_blind and G.GAME.modifiers.enable_bld_deplete_hands and G.GAME.current_round.hands_left > 1 then
            ease_hands_played(-1)
        end
        if context.scoring_hand and context.poker_hands and G.STATE == G.STATES.SELECTING_HAND and not G.GAME.blind.disabled and blind.active then
            if cond1 then
                BLINDSIDE.alert_debuff(self, true, "Hand contains " .. "Flush")
            else
                if cond2 then
                    BLINDSIDE.alert_debuff(self, true, "Hand contains " .. "Raise")
                else
                    BLINDSIDE.alert_debuff(self, false)
                end
            end
        end

        if context.pre_discard then
            BLINDSIDE.alert_debuff(self, false)
        end
        if context.before then
            BLINDSIDE.alert_debuff(self, false)
            if context.scoring_hand and not G.GAME.blind.disabled and G.GAME.modifiers.enable_bld_deadly_small_big and blind.active then
                if cond1 or cond2 then
                    for key, value in pairs(context.scoring_hand) do
                        value.config.center.blind_debuff(value, true)
                    end
                end
            end
        end
        if context.setting_blind and not context.disabled then
            blind.active = true
        end
        if context.after and not G.GAME.blind.disabled and blind.active and (cond1 or cond2) then
            local hasWildCanvas = false
            for i = 1, #context.scoring_hand do
                if (context.scoring_hand[i].seal == "bld_wild" or #context.scoring_hand[i].ability.extra.hues >= 2) and context.scoring_hand[i].facing ~= "back" and next(SMODS.find_card('j_bld_canvas')) then
                    hasWildCanvas = true
                end
            end
            G.GAME.playing_with_fire_num = G.GAME.playing_with_fire_num + 1
            G.GAME.playing_with_fire_each = G.GAME.used_vouchers.v_bld_swearjar and "bld_playing_with_fire_each_big_joker_2" or "bld_playing_with_fire_each_big_joker_1"
            G.GAME.playing_with_fire = G.GAME.playing_with_fire + 4 * (G.GAME.used_vouchers.v_bld_swearjar and 2 or 1)
            BLINDSIDE.chipsmodify(0, 0, 0, 4 - (hasWildCanvas and 0.5 or 0))
            blind.active = false
        end
    end,
    get_assist = function(self)
        return G.P_BLINDS["bl_bld_maliciousjoker2"]
    end,
})

BLINDSIDE.Joker({
    key = 'maliciousjoker2',
    atlas = 'bld_joker',
    pos = {x=0, y=9},
    boss_colour = HEX("fd5f55"),
    mult = 12,
    dollars = 12,
    order = 23,
    small = {min = 1},
    active = true,
    is_assistant = true
})

BLINDSIDE.Joker({
    key = 'deceitfuljoker1',
    atlas = 'bld_joker',
    pos = {x=0, y=6},
    boss_colour = HEX("7fa5b5"),
    mult = 18,
    dollars = 12,
    order = 7,
    active = true,
    big = {min = 1},
    pool_override = function()
        return G.GAME.modifiers.enable_bld_elites and G.GAME.round_resets.ante == 5
    end,
    calculate = function(self, blind, context)
        local cond1 = context.poker_hands and has_group_of(2, context.poker_hands)
        local cond2 = cond1

        if context.setting_blind and G.GAME.modifiers.enable_bld_deplete_hands and G.GAME.current_round.hands_left > 1 then
            ease_hands_played(-1)
        end
        if context.scoring_hand and context.poker_hands and G.STATE == G.STATES.SELECTING_HAND and not G.GAME.blind.disabled and blind.active then
            if cond1 then
                BLINDSIDE.alert_debuff(self, true, "Hand contains " .. "Pair")
            else
                if cond2 then
                    BLINDSIDE.alert_debuff(self, true, "Hand contains " .. "Pair")
                else
                    BLINDSIDE.alert_debuff(self, false)
                end
            end
        end

        if context.pre_discard then
            BLINDSIDE.alert_debuff(self, false)
        end
        if context.before then
            BLINDSIDE.alert_debuff(self, false)
            if context.scoring_hand and not G.GAME.blind.disabled and G.GAME.modifiers.enable_bld_deadly_small_big and blind.active then
                if cond1 or cond2 then
                    for key, value in pairs(context.scoring_hand) do
                        value.config.center.blind_debuff(value, true)
                    end
                end
            end
        end
        if context.setting_blind and not context.disabled then
            blind.active = true
        end
        if context.after and not G.GAME.blind.disabled and blind.active and (cond1 or cond2) then
            local hasWildCanvas = false
            for i = 1, #context.scoring_hand do
                if (context.scoring_hand[i].seal == "bld_wild" or #context.scoring_hand[i].ability.extra.hues >= 2) and context.scoring_hand[i].facing ~= "back" and next(SMODS.find_card('j_bld_canvas')) then
                    hasWildCanvas = true
                end
            end
            G.GAME.playing_with_fire_num = G.GAME.playing_with_fire_num + 1
            G.GAME.playing_with_fire_each = G.GAME.used_vouchers.v_bld_swearjar and "bld_playing_with_fire_each_big_joker_2" or "bld_playing_with_fire_each_big_joker_1"
            G.GAME.playing_with_fire = G.GAME.playing_with_fire + 2 * (G.GAME.used_vouchers.v_bld_swearjar and 2 or 1)
            BLINDSIDE.chipsmodify(0, 0, 0, 2 - (hasWildCanvas and 0.5 or 0))
            blind.active = false
        end
    end,
    get_assist = function(self)
        return G.P_BLINDS["bl_bld_deceitfuljoker2"]
    end,
})

BLINDSIDE.Joker({
    key = 'deceitfuljoker2', -- eventually make this jolly joker
    atlas = 'bld_joker',
    pos = {x=0, y=6},
    boss_colour = HEX("7fa5b5"),
    mult = 18,
    dollars = 12,
    order = 23,
    small = {min = 1},
    active = true,
    is_assistant = true
})