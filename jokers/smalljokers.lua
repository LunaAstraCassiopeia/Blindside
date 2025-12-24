BLINDSIDE.Joker({
    key = 'joker',
    atlas = 'bld_joker',
    pos = {x=0, y=0},
    boss_colour = G.C.RED,
    mult = 6,
    dollars = 4,
    small = {min = 1},
    order = 1,
    pool_override =function ()
        return G.GAME.round_resets.ante == 1
    end,
    calculate = function(self, blind, context)
        if context.setting_blind and G.GAME.modifiers.enable_bld_deplete_hands and G.GAME.current_round.hands_left > 1 then
            ease_hands_played(-1)
        end
        if context.after and not G.GAME.blind.disabled then
            local hasWildCanvas = false
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i].seal == "bld_wild" and context.scoring_hand[i].facing ~= "back" and next(SMODS.find_card('j_bld_canvas')) then
                    hasWildCanvas = true
                end
            end
            G.GAME.playing_with_fire_each = "bld_playing_with_fire_each_boss_joker"
            G.GAME.playing_with_fire = G.GAME.playing_with_fire + 1
            BLINDSIDE.chipsmodify(2 - (hasWildCanvas and 1 or 0), 0, 0)
        end
    end,
})

BLINDSIDE.Joker({
    key = 'lustyjoker',
    atlas = 'bld_joker',
    pos = {x=0, y=2},
    boss_colour = G.C.RED,
    mult = 6,
    dollars = 4,
    order = 2,
    small = {min = 1},
    pool_override = function()
        return G.GAME.round_resets.ante ~= 1
    end,
    calculate = function(self, blind, context)
        if context.setting_blind and G.GAME.modifiers.enable_bld_deplete_hands and G.GAME.current_round.hands_left > 1 then
            ease_hands_played(-1)
        end
        if context.scoring_hand and context.poker_hands and G.STATE == G.STATES.SELECTING_HAND and not G.GAME.blind.disabled then
            local red = false
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:is_color("Red") and context.scoring_hand[i].facing ~= "back" then
                    red = true
                end
            end
            if red then
                BLINDSIDE.alert_debuff(self, true, "Hand contains a Red Blind")
            else
                BLINDSIDE.alert_debuff(self, false)
            end
        end

        if context.before then
            BLINDSIDE.alert_debuff(self, false)
            if context.scoring_hand and not G.GAME.blind.disabled and G.GAME.modifiers.enable_bld_deadly_small_big then
                for key, value in pairs(context.scoring_hand) do
                    if value:is_color("Red") then
                        value.config.center.blind_debuff(value, true)
                    end
                end
            end
        end

        if context.after and not G.GAME.blind.disabled then            
            local hasWildCanvas = false
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i].seal == "bld_wild" and context.scoring_hand[i].facing ~= "back" and next(SMODS.find_card('j_bld_canvas')) then
                    hasWildCanvas = true
                end
            end
            local changed = false
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:is_color("Red") then
                    changed = true
                end
            end
            if changed then
                G.GAME.playing_with_fire_each = "bld_playing_with_fire_each_small_joker"
                G.GAME.playing_with_fire = G.GAME.playing_with_fire + 2
                BLINDSIDE.chipsmodify(4 - (hasWildCanvas and 2 or 0), 0, 0)
            end
        end
    end,
})



BLINDSIDE.Joker({
    key = 'greedyjoker',
    atlas = 'bld_joker',
    pos = {x=0, y=1},
    boss_colour = G.C.MONEY,
    mult = 6,
    dollars = 4,
    order = 3,
    small = {min = 1},
    pool_override = function()
        return G.GAME.round_resets.ante ~= 1
    end,
    calculate = function(self, blind, context)
        if context.setting_blind and G.GAME.modifiers.enable_bld_deplete_hands and G.GAME.current_round.hands_left > 1 then
            ease_hands_played(-1)
        end
        if context.scoring_hand and context.poker_hands and G.STATE == G.STATES.SELECTING_HAND and not G.GAME.blind.disabled then
            local red = false
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:is_color("Yellow") and context.scoring_hand[i].facing ~= "back" then
                    red = true
                end
            end
            if red then
                BLINDSIDE.alert_debuff(self, true, "Hand contains a Yellow Blind")
            else
                BLINDSIDE.alert_debuff(self, false)
            end
        end

        if context.before then
            BLINDSIDE.alert_debuff(self, false)
            if context.scoring_hand and not G.GAME.blind.disabled and G.GAME.modifiers.enable_bld_deadly_small_big then
                for key, value in pairs(context.scoring_hand) do
                    if value:is_color("Yellow") then
                        value.config.center.blind_debuff(value, true)
                    end
                end
            end
        end        

        if context.after and not G.GAME.blind.disabled then
            local hasWildCanvas = false
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i].seal == "bld_wild" and context.scoring_hand[i].facing ~= "back" and next(SMODS.find_card('j_bld_canvas')) then
                    hasWildCanvas = true
                end
            end
            local changed = false
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:is_color("Yellow") then
                    changed = true
                end
            end
            if changed then
                G.GAME.playing_with_fire = G.GAME.playing_with_fire + 2
                G.GAME.playing_with_fire_each = "bld_playing_with_fire_each_small_joker"
                G.GAME.playing_with_fire = G.GAME.playing_with_fire + 2
                BLINDSIDE.chipsmodify(4 - (hasWildCanvas and 2 or 0), 0, 0)
            end
        end
    end,
})



BLINDSIDE.Joker({
    key = 'wrathfuljoker',
    atlas = 'bld_joker',
    pos = {x=0, y=3},
    boss_colour = G.C.PURPLE,
    mult = 6,
    dollars = 4,
    order = 4,
    small = {min = 1},
    pool_override = function()
        return G.GAME.round_resets.ante ~= 1
    end,
    calculate = function(self, blind, context)
        if context.setting_blind and G.GAME.modifiers.enable_bld_deplete_hands and G.GAME.current_round.hands_left > 1 then
            ease_hands_played(-1)
        end
        if context.scoring_hand and context.poker_hands and G.STATE == G.STATES.SELECTING_HAND and not G.GAME.blind.disabled then
            local red = false
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:is_color("Purple") and context.scoring_hand[i].facing ~= "back" then
                    red = true
                end
            end
            if red then
                BLINDSIDE.alert_debuff(self, true, "Hand contains a Purple Blind")
            else
                BLINDSIDE.alert_debuff(self, false)
            end
        end

                if context.before then
            BLINDSIDE.alert_debuff(self, false)
            if context.scoring_hand and not G.GAME.blind.disabled and G.GAME.modifiers.enable_bld_deadly_small_big then
                for key, value in pairs(context.scoring_hand) do
                    if value:is_color("Purple") then
                        value.config.center.blind_debuff(value, true)
                    end
                end
            end
        end

        if context.after and not G.GAME.blind.disabled then
            local hasWildCanvas = false
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i].seal == "bld_wild" and context.scoring_hand[i].facing ~= "back" and next(SMODS.find_card('j_bld_canvas')) then
                    hasWildCanvas = true
                end
            end
            local changed = false
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:is_color("Purple") then
                    changed = true
                end
            end
            if changed then
                G.GAME.playing_with_fire = G.GAME.playing_with_fire + 2
                G.GAME.playing_with_fire_each = "bld_playing_with_fire_each_small_joker"
                G.GAME.playing_with_fire = G.GAME.playing_with_fire + 2
                BLINDSIDE.chipsmodify(4 - (hasWildCanvas and 2 or 0), 0, 0)
            end
        end
    end,
})

BLINDSIDE.Joker({
    key = 'gluttonousjoker',
    atlas = 'bld_joker',
    pos = {x=0, y=4},
    boss_colour = G.C.GREEN,
    mult = 6,
    dollars = 4,
    order = 5,
    small = {min = 1},
    pool_override = function()
        return G.GAME.round_resets.ante ~= 1
    end,
    calculate = function(self, blind, context)
        if context.setting_blind and G.GAME.modifiers.enable_bld_deplete_hands and G.GAME.current_round.hands_left > 1 then
            ease_hands_played(-1)
        end
        if context.scoring_hand and context.poker_hands and G.STATE == G.STATES.SELECTING_HAND and not G.GAME.blind.disabled then
            local red = false
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:is_color("Green") and context.scoring_hand[i].facing ~= "back" then
                    red = true
                end
            end
            if red then
                BLINDSIDE.alert_debuff(self, true, "Hand contains a Green Blind")
            else
                BLINDSIDE.alert_debuff(self, false)
            end
        end

        if context.before then
            BLINDSIDE.alert_debuff(self, false)
            if context.scoring_hand and not G.GAME.blind.disabled and G.GAME.modifiers.enable_bld_deadly_small_big then
                for key, value in pairs(context.scoring_hand) do
                    if value:is_color("Green") then
                        value.config.center.blind_debuff(value, true)
                    end
                end
            end
        end

        if context.after and not G.GAME.blind.disabled then
            local hasWildCanvas = false
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i].seal == "bld_wild" and context.scoring_hand[i].facing ~= "back" and next(SMODS.find_card('j_bld_canvas')) then
                    hasWildCanvas = true
                end
            end
            local changed = false
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:is_color("Green") then
                    changed = true
                end
            end
            if changed then
                G.GAME.playing_with_fire_each = "bld_playing_with_fire_each_small_joker"
                G.GAME.playing_with_fire = G.GAME.playing_with_fire + 2
                BLINDSIDE.chipsmodify(4 - (hasWildCanvas and 2 or 0), 0, 0)
            end
        end
    end,
})

BLINDSIDE.Joker({
    key = 'slothfuljoker',
    atlas = 'bld_joker',
    pos = {x=0, y=5},
    boss_colour = G.C.CHIPS,
    mult = 6,
    dollars = 4,
    small = {min = 1},
    order = 6,
    pool_override = function()
        return G.GAME.round_resets.ante ~= 1
    end,
    calculate = function(self, blind, context)
        if context.setting_blind and G.GAME.modifiers.enable_bld_deplete_hands and G.GAME.current_round.hands_left > 1 then
            ease_hands_played(-1)
        end
        if context.scoring_hand and context.poker_hands and G.STATE == G.STATES.SELECTING_HAND and not G.GAME.blind.disabled then
            local red = false
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:is_color("Blue") and context.scoring_hand[i].facing ~= "back" then
                    red = true
                end
            end
            if red then
                BLINDSIDE.alert_debuff(self, true, "Hand contains a Blue Blind")
            else
                BLINDSIDE.alert_debuff(self, false)
            end
        end

        if context.before then
            BLINDSIDE.alert_debuff(self, false)
            if context.scoring_hand and not G.GAME.blind.disabled and G.GAME.modifiers.enable_bld_deadly_small_big then
                for key, value in pairs(context.scoring_hand) do
                    if value:is_color("Blue") then
                        value.config.center.blind_debuff(value, true)
                    end
                end
            end
        end

        if context.after and not G.GAME.blind.disabled then
            local hasWildCanvas = false
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i].seal == "bld_wild" and context.scoring_hand[i].facing ~= "back" and next(SMODS.find_card('j_bld_canvas')) then
                    hasWildCanvas = true
                end
            end
            local changed = false
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:is_color("Blue") then
                    changed = true
                end
            end
            if changed then
                G.GAME.playing_with_fire_each = "bld_playing_with_fire_each_small_joker"
                G.GAME.playing_with_fire = G.GAME.playing_with_fire + 2
                BLINDSIDE.chipsmodify(4 - (hasWildCanvas and 2 or 0), 0, 0)
            end
        end
    end,
})

BLINDSIDE.Joker({
    key = 'lustful1',
    atlas = 'bld_joker',
    pos = {x=0, y=2},
    boss_colour = G.C.RED,
    mult = 6,
    dollars = 4,
    small = {min = 1},
    order = 6,
    pool_override = function()
        return G.GAME.modifiers.enable_bld_double_up and G.GAME.round_resets.ante ~= 1 and pseudorandom(pseudoseed('bld_double_up' .. G.GAME.round_resets.ante)) > 0.65
    end,
    calculate = function(self, blind, context)
        local color1 = "Red"
        local color2 = "Blue"
        if context.setting_blind and G.GAME.modifiers.enable_bld_deplete_hands and G.GAME.current_round.hands_left > 1 then
            ease_hands_played(-1)
        end
        if context.scoring_hand and context.poker_hands and G.STATE == G.STATES.SELECTING_HAND and not G.GAME.blind.disabled then
            local has_color = false
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:is_color(color1) and context.scoring_hand[i].facing ~= "back" then
                    has_color = true
                end
            end
            if has_color then
                BLINDSIDE.alert_debuff(self, true, "Hand contains a " .. color1 .. " Blind")
            else
                for i = 1, #context.scoring_hand do
                    if context.scoring_hand[i]:is_color(color2) then
                        has_color = true
                    end
                end
                if has_color then
                    BLINDSIDE.alert_debuff(self, true, "Hand contains a " .. color2 .. " Blind")
                else
                    BLINDSIDE.alert_debuff(self, false)
                end
            end
        end

        if context.before then
            BLINDSIDE.alert_debuff(self, false)
            if context.scoring_hand and not G.GAME.blind.disabled and G.GAME.modifiers.enable_bld_deadly_small_big then
                for key, value in pairs(context.scoring_hand) do
                    if value:is_color(color1) or value:is_color(color2) then
                        value.config.center.blind_debuff(value, true)
                    end
                end
            end
        end

        if context.after and not G.GAME.blind.disabled then
            local hasWildCanvas = false
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i].seal == "bld_wild" and context.scoring_hand[i].facing ~= "back" and next(SMODS.find_card('j_bld_canvas')) then
                    hasWildCanvas = true
                end
            end
            local changed = false
            for i = 1, #context.scoring_hand do
                if (context.scoring_hand[i]:is_color(color1) or context.scoring_hand[i]:is_color(color2)) then
                    changed = true
                end
            end
            if changed then
                G.GAME.playing_with_fire_each = "bld_playing_with_fire_each_small_joker"
                G.GAME.playing_with_fire = G.GAME.playing_with_fire + 2
                BLINDSIDE.chipsmodify(4 - (hasWildCanvas and 2 or 0), 0, 0)
            end
        end
    end,
    get_assist = function(self)
        return G.P_BLINDS["bl_bld_lustful2"]
    end,
})


BLINDSIDE.Joker({
    key = 'lustful2',
    atlas = 'bld_joker',
    pos = {x=0, y=5},
    boss_colour = G.C.RED,
    mult = 6,
    dollars = 4,
    order = 23,
    small = {min = 1},
    active = true,
    is_assistant = true
})

BLINDSIDE.Joker({
    key = 'hoarder1',
    atlas = 'bld_joker',
    pos = {x=0, y=5},
    boss_colour = G.C.CHIPS,
    mult = 6,
    dollars = 4,
    small = {min = 1},
    order = 6,
    pool_override = function()
        return G.GAME.modifiers.enable_bld_double_up and G.GAME.round_resets.ante ~= 1 and pseudorandom(pseudoseed('bld_double_up' .. G.GAME.round_resets.ante)) > 0.65
    end,
    calculate = function(self, blind, context)
        local color1 = "Blue"
        local color2 = "Yellow"
        if context.setting_blind and G.GAME.modifiers.enable_bld_deplete_hands and G.GAME.current_round.hands_left > 1 then
            ease_hands_played(-1)
        end
        if context.scoring_hand and context.poker_hands and G.STATE == G.STATES.SELECTING_HAND and not G.GAME.blind.disabled then
            local has_color = false
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:is_color(color1) and context.scoring_hand[i].facing ~= "back" then
                    has_color = true
                end
            end
            if has_color then
                BLINDSIDE.alert_debuff(self, true, "Hand contains a " .. color1 .. " Blind")
            else
                for i = 1, #context.scoring_hand do
                    if context.scoring_hand[i]:is_color(color2) then
                        has_color = true
                    end
                end
                if has_color then
                    BLINDSIDE.alert_debuff(self, true, "Hand contains a " .. color2 .. " Blind")
                else
                    BLINDSIDE.alert_debuff(self, false)
                end
            end
        end

        if context.before then
            BLINDSIDE.alert_debuff(self, false)
            if context.scoring_hand and not G.GAME.blind.disabled and G.GAME.modifiers.enable_bld_deadly_small_big then
                for key, value in pairs(context.scoring_hand) do
                    if value:is_color(color1) or value:is_color(color2) then
                        value.config.center.blind_debuff(value, true)
                    end
                end
            end
        end

        if context.after and not G.GAME.blind.disabled then
            local hasWildCanvas = false
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i].seal == "bld_wild" and context.scoring_hand[i].facing ~= "back" and next(SMODS.find_card('j_bld_canvas')) then
                    hasWildCanvas = true
                end
            end
            local changed = false
            for i = 1, #context.scoring_hand do
                if (context.scoring_hand[i]:is_color(color1) or context.scoring_hand[i]:is_color(color2)) then
                    changed = true
                end
            end
            if changed then
                G.GAME.playing_with_fire_each = "bld_playing_with_fire_each_small_joker"
                G.GAME.playing_with_fire = G.GAME.playing_with_fire + 2
                BLINDSIDE.chipsmodify(4 - (hasWildCanvas and 2 or 0), 0, 0)
            end
        end
    end,
    get_assist = function(self)
        return G.P_BLINDS["bl_bld_hoarder2"]
    end,
})


BLINDSIDE.Joker({
    key = 'hoarder2',
    atlas = 'bld_joker',
    pos = {x=0, y=1},
    boss_colour = G.C.CHIPS,
    mult = 6,
    dollars = 4,
    order = 23,
    small = {min = 1},
    active = true,
    is_assistant = true
})

BLINDSIDE.Joker({
    key = 'hedonist1',
    atlas = 'bld_joker',
    pos = {x=0, y=4},
    boss_colour = G.C.GREEN,
    mult = 6,
    dollars = 4,
    small = {min = 1},
    order = 6,
    pool_override = function()
        return G.GAME.modifiers.enable_bld_double_up and G.GAME.round_resets.ante ~= 1 and pseudorandom(pseudoseed('bld_double_up' .. G.GAME.round_resets.ante)) > 0.65
    end,
    calculate = function(self, blind, context)
        local color1 = "Green"
        local color2 = "Red"
        if context.setting_blind and G.GAME.modifiers.enable_bld_deplete_hands and G.GAME.current_round.hands_left > 1 then
            ease_hands_played(-1)
        end
        if context.scoring_hand and context.poker_hands and G.STATE == G.STATES.SELECTING_HAND and not G.GAME.blind.disabled then
            local has_color = false
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:is_color(color1) and context.scoring_hand[i].facing ~= "back" then
                    has_color = true
                end
            end
            if has_color then
                BLINDSIDE.alert_debuff(self, true, "Hand contains a " .. color1 .. " Blind")
            else
                for i = 1, #context.scoring_hand do
                    if context.scoring_hand[i]:is_color(color2) then
                        has_color = true
                    end
                end
                if has_color then
                    BLINDSIDE.alert_debuff(self, true, "Hand contains a " .. color2 .. " Blind")
                else
                    BLINDSIDE.alert_debuff(self, false)
                end
            end
        end

        if context.before then
            BLINDSIDE.alert_debuff(self, false)
            if context.scoring_hand and not G.GAME.blind.disabled and G.GAME.modifiers.enable_bld_deadly_small_big then
                for key, value in pairs(context.scoring_hand) do
                    if value:is_color(color1) or value:is_color(color2) then
                        value.config.center.blind_debuff(value, true)
                    end
                end
            end
        end

        if context.after and not G.GAME.blind.disabled then
            local hasWildCanvas = false
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i].seal == "bld_wild" and context.scoring_hand[i].facing ~= "back" and next(SMODS.find_card('j_bld_canvas')) then
                    hasWildCanvas = true
                end
            end
            local changed = false
            for i = 1, #context.scoring_hand do
                if (context.scoring_hand[i]:is_color(color1) or context.scoring_hand[i]:is_color(color2)) then
                    changed = true
                end
            end
            if changed then
                G.GAME.playing_with_fire_each = "bld_playing_with_fire_each_small_joker"
                G.GAME.playing_with_fire = G.GAME.playing_with_fire + 2
                BLINDSIDE.chipsmodify(4 - (hasWildCanvas and 2 or 0), 0, 0)
            end
        end
    end,
    get_assist = function(self)
        return G.P_BLINDS["bl_bld_hedonist2"]
    end,
})


BLINDSIDE.Joker({
    key = 'hedonist2',
    atlas = 'bld_joker',
    pos = {x=0, y=2},
    boss_colour = G.C.GREEN,
    mult = 6,
    dollars = 4,
    order = 23,
    small = {min = 1},
    active = true,
    is_assistant = true
})

BLINDSIDE.Joker({
    key = 'covetous1',
    atlas = 'bld_joker',
    pos = {x=0, y=1},
    boss_colour = G.C.MONEY,
    mult = 6,
    dollars = 4,
    small = {min = 1},
    order = 6,
    pool_override = function()
        return G.GAME.modifiers.enable_bld_double_up and G.GAME.round_resets.ante ~= 1 and pseudorandom(pseudoseed('bld_double_up' .. G.GAME.round_resets.ante)) > 0.65
    end,
    calculate = function(self, blind, context)
        local color1 = "Yellow"
        local color2 = "Green"
        if context.setting_blind and G.GAME.modifiers.enable_bld_deplete_hands and G.GAME.current_round.hands_left > 1 then
            ease_hands_played(-1)
        end
        if context.scoring_hand and context.poker_hands and G.STATE == G.STATES.SELECTING_HAND and not G.GAME.blind.disabled then
            local has_color = false
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:is_color(color1) and context.scoring_hand[i].facing ~= "back" then
                    has_color = true
                end
            end
            if has_color then
                BLINDSIDE.alert_debuff(self, true, "Hand contains a " .. color1 .. " Blind")
            else
                for i = 1, #context.scoring_hand do
                    if context.scoring_hand[i]:is_color(color2) then
                        has_color = true
                    end
                end
                if has_color then
                    BLINDSIDE.alert_debuff(self, true, "Hand contains a " .. color2 .. " Blind")
                else
                    BLINDSIDE.alert_debuff(self, false)
                end
            end
        end

        if context.before then
            BLINDSIDE.alert_debuff(self, false)
            if context.scoring_hand and not G.GAME.blind.disabled and G.GAME.modifiers.enable_bld_deadly_small_big then
                for key, value in pairs(context.scoring_hand) do
                    if value:is_color(color1) or value:is_color(color2) then
                        value.config.center.blind_debuff(value, true)
                    end
                end
            end
        end

        if context.after and not G.GAME.blind.disabled then
            local hasWildCanvas = false
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i].seal == "bld_wild" and context.scoring_hand[i].facing ~= "back" and next(SMODS.find_card('j_bld_canvas')) then
                    hasWildCanvas = true
                end
            end
            local changed = false
            for i = 1, #context.scoring_hand do
                if (context.scoring_hand[i]:is_color(color1) or context.scoring_hand[i]:is_color(color2)) then
                    changed = true
                end
            end
            if changed then
                G.GAME.playing_with_fire_each = "bld_playing_with_fire_each_small_joker"
                G.GAME.playing_with_fire = G.GAME.playing_with_fire + 2
                BLINDSIDE.chipsmodify(4 - (hasWildCanvas and 2 or 0), 0, 0)
            end
        end
    end,
    get_assist = function(self)
        return G.P_BLINDS["bl_bld_covetous2"]
    end,
})


BLINDSIDE.Joker({
    key = 'covetous2',
    atlas = 'bld_joker',
    pos = {x=0, y=4},
    boss_colour = G.C.MONEY,
    mult = 6,
    dollars = 4,
    order = 23,
    small = {min = 1},
    active = true,
    is_assistant = true
})

BLINDSIDE.Joker({
    key = 'vengeful',
    atlas = 'bld_joker',
    pos = {x=0, y=3},
    boss_colour = G.C.PURPLE,
    mult = 6,
    dollars = 4,
    small = {min = 1},
    order = 6,
    pool_override = function()
        return G.GAME.modifiers.enable_bld_double_up and G.GAME.round_resets.ante ~= 1 and pseudorandom(pseudoseed('bld_double_up' .. G.GAME.round_resets.ante)) > 0.65
    end,
    calculate = function(self, blind, context)
        local color1 = "Purple"
        local color2 = "Purple"
        if context.setting_blind and G.GAME.modifiers.enable_bld_deplete_hands and G.GAME.current_round.hands_left > 1 then
            ease_hands_played(-1)
        end
        if context.scoring_hand and context.poker_hands and G.STATE == G.STATES.SELECTING_HAND and not G.GAME.blind.disabled then
            local has_color = false
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:is_color(color1) and context.scoring_hand[i].facing ~= "back" then
                    has_color = true
                end
            end
            if has_color then
                BLINDSIDE.alert_debuff(self, true, "Hand contains a " .. color1 .. " Blind")
            else
                for i = 1, #context.scoring_hand do
                    if context.scoring_hand[i]:is_color(color2) then
                        has_color = true
                    end
                end
                if has_color then
                    BLINDSIDE.alert_debuff(self, true, "Hand contains a " .. color2 .. " Blind")
                else
                    BLINDSIDE.alert_debuff(self, false)
                end
            end
        end

        if context.before then
            BLINDSIDE.alert_debuff(self, false)
            if context.scoring_hand and not G.GAME.blind.disabled and G.GAME.modifiers.enable_bld_deadly_small_big then
                for key, value in pairs(context.scoring_hand) do
                    if value:is_color(color1) or value:is_color(color2) then
                        value.config.center.blind_debuff(value, true)
                    end
                end
            end
        end

        if context.after and not G.GAME.blind.disabled then
            local hasWildCanvas = false
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i].seal == "bld_wild" and context.scoring_hand[i].facing ~= "back" and next(SMODS.find_card('j_bld_canvas')) then
                    hasWildCanvas = true
                end
            end
            local changed = false
            for i = 1, #context.scoring_hand do
                if (context.scoring_hand[i]:is_color(color1) or context.scoring_hand[i]:is_color(color2)) then
                    changed = true
                end
            end
            if changed then
                BLINDSIDE.chipsmodify(8 - (hasWildCanvas and 4 or 0), 0, 0)
            end
        end
    end,
    get_assist = function(self)
        return G.P_BLINDS["bl_bld_arrowhead"]
    end,
})


BLINDSIDE.Joker({
    key = 'arrowhead',
    atlas = 'bld_joker',
    pos = {x=0, y=3},
    boss_colour = G.C.PURPLE,
    mult = 6,
    dollars = 4,
    order = 23,
    small = {min = 1},
    active = true,
    is_assistant = true
})