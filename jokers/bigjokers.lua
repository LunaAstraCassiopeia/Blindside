SMODS.Blind({
    key = 'slyjoker',
    atlas = 'bld_joker',
    pos = {x=0, y=6},
    boss_colour = HEX("7fa5b5"),
    mult = 6,
    dollars = 6,
    order = 7,
    active = true,
    big = {min = 1},
    in_pool = function(self, args)
        if G.GAME.selected_back.effect.center.config.extra then
            if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
            return true
        else
        return false
        end
    end,
    set_blind = function(self)
        G.GAME.blindassist.states.visible = false
        G.GAME.blindassist:change_dim(0,0)
    end,
    calculate = function(self, blind, context)
        if context.setting_blind and not context.disabled then
            blind.active = true
        end
        if context.after and not G.GAME.blind.disabled and blind.active and has_group_of(2, context.poker_hands) then
            local hasWildCanvas = false
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i].seal == "bld_wild" and context.scoring_hand[i].facing ~= "back" and next(SMODS.find_card('j_bld_canvas')) then
                    hasWildCanvas = true
                end
            end
            BLINDSIDE.chipsmodify(0, 0, 0, 2- (hasWildCanvas and 0.5 or 0))
            blind.active = false
        end
    end,
    load = function()
        G.GAME.blindassist.states.visible = false
        G.GAME.blindassist:change_dim(0,0)
    end,
})

SMODS.Blind({
    key = 'wilyjoker',
    atlas = 'bld_joker',
    pos = {x=0, y=7},
    boss_colour = HEX("83c4b4"),
    mult = 6,
    dollars = 6,
    order = 8,
    active = true,
    big = {min = 1},
    in_pool = function(self, args)
        if G.GAME.selected_back.effect.center.config.extra then
            if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
            return true
        else
        return false
        end
    end,
    set_blind = function(self)
        G.GAME.blindassist.states.visible = false
        G.GAME.blindassist:change_dim(0,0)
    end,
    calculate = function(self, blind, context)
        if context.setting_blind and not context.disabled then
            blind.active = true
        end
        if context.after and not G.GAME.blind.disabled and blind.active and has_group_of(3, context.poker_hands) then
            local hasWildCanvas = false
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i].seal == "bld_wild" and context.scoring_hand[i].facing ~= "back" and next(SMODS.find_card('j_bld_canvas')) then
                    hasWildCanvas = true
                end
            end
            BLINDSIDE.chipsmodify(0, 0, 0, 3- (hasWildCanvas and 0.5 or 0))
            blind.active = false
        end
    end,
    load = function()
        G.GAME.blindassist.states.visible = false
        G.GAME.blindassist:change_dim(0,0)
    end,
})

SMODS.Blind({
    key = 'cleverjoker',
    atlas = 'bld_joker',
    pos = {x=0, y=8},
    boss_colour = HEX("ad7e69"),
    mult = 6,
    dollars = 6,
    order = 9,
    active = true,
    big = {min = 1},
    in_pool = function(self, args)
        if G.GAME.selected_back.effect.center.config.extra then
            if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
            return true
        else
        return false
        end
    end,
    set_blind = function(self)
        G.GAME.blindassist.states.visible = false
        G.GAME.blindassist:change_dim(0,0)
    end,
    calculate = function(self, blind, context)
        if context.setting_blind and not context.disabled then
            blind.active = true
        end
        if context.after and not G.GAME.blind.disabled and blind.active and (next(context.poker_hands['bld_blind_2pair']) or next(context.poker_hands['bld_blind_fullhouse'])) then
            local hasWildCanvas = false
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i].seal == "bld_wild" and context.scoring_hand[i].facing ~= "back" and next(SMODS.find_card('j_bld_canvas')) then
                    hasWildCanvas = true
                end
            end
            BLINDSIDE.chipsmodify(0, 0, 0, 3- (hasWildCanvas and 0.5 or 0))
            blind.active = false
        end
    end,
    load = function()
        G.GAME.blindassist.states.visible = false
        G.GAME.blindassist:change_dim(0,0)
    end,
})

SMODS.Blind({
    key = 'deviousjoker',
    atlas = 'bld_joker',
    pos = {x=0, y=9},
    boss_colour = HEX("62aebf"),
    mult = 6,
    dollars = 6,
    order = 10,
    active = true,
    big = {min = 1},
    in_pool = function(self, args)
        if G.GAME.selected_back.effect.center.config.extra then
            if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
            return true
        else
        return false
        end
    end,
    set_blind = function(self)
        G.GAME.blindassist.states.visible = false
        G.GAME.blindassist:change_dim(0,0)
    end,
    calculate = function(self, blind, context)
        if context.setting_blind and not context.disabled then
            blind.active = true
        end
        if context.after and not G.GAME.blind.disabled and blind.active and next(context.poker_hands['bld_raise']) then
            local hasWildCanvas = false
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i].seal == "bld_wild" and context.scoring_hand[i].facing ~= "back" and next(SMODS.find_card('j_bld_canvas')) then
                    hasWildCanvas = true
                end
            end
            BLINDSIDE.chipsmodify(0, 0, 0, 4- (hasWildCanvas and 1 or 0))
            blind.active = false
        end
    end,
    load = function()
        G.GAME.blindassist.states.visible = false
        G.GAME.blindassist:change_dim(0,0)
    end,
})


SMODS.Blind({
    key = 'craftyjoker',
    atlas = 'bld_joker',
    pos = {x=0, y=10},
    boss_colour = HEX("fd5f55"),
    mult = 6,
    dollars = 6,
    order = 11,
    active = true,
    big = {min = 1},
    in_pool = function(self, args)
        if G.GAME.selected_back.effect.center.config.extra then
            if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
            return true
        else
        return false
        end
    end,
    set_blind = function(self)
        G.GAME.blindassist.states.visible = false
        G.GAME.blindassist:change_dim(0,0)
    end,
    calculate = function(self, blind, context)
        if context.setting_blind and not context.disabled then
            blind.active = true
        end
        if context.after and not G.GAME.blind.disabled and blind.active and has_group_of(5, context.poker_hands) then
            local hasWildCanvas = false
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i].seal == "bld_wild" and context.scoring_hand[i].facing ~= "back" and next(SMODS.find_card('j_bld_canvas')) then
                    hasWildCanvas = true
                end
            end
            BLINDSIDE.chipsmodify(0, 0, 0, 4- (hasWildCanvas and 1 or 0))
            blind.active = false
        end
    end,
    load = function()
        G.GAME.blindassist.states.visible = false
        G.GAME.blindassist:change_dim(0,0)
    end,
})