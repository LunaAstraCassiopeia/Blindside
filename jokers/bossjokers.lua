SMODS.Blind({
    key = 'photograph',
    atlas = 'bld_joker',
    pos = {x=0, y=12},
    boss_colour = HEX('5D8EA4'),
    mult = 3,
    dollars = 6,
    order = 12,
    boss = {min = 1},
    blindassist = G.P_BLINDS["bl_bld_chad"],
    active = true,
    config = {
        extra = {
            blindassist = G.P_BLINDS["bl_bld_chad"],
        }
    },
    in_pool = function(self, args)
        if G.GAME.selected_back.effect.center.config.extra then
            if not G.GAME.selected_back.effect.center.config.extra.blindside and G.GAME.round_resets.ante%6 ~= 0 then return false end
            return true
        else
        return false
        end
    end,
    set_blind = function(self)
        G.GAME.blind.active = true
        G.GAME.blindassist.states.visible = true
        G.GAME.blindassist:set_blind(G.P_BLINDS["bl_bld_chad"])
        G.GAME.blindassist:change_dim(1.5,1.5)
    end,
    load = function()
        G.GAME.blindassist.states.visible = true
        G.GAME.blindassist:set_blind(G.P_BLINDS["bl_bld_chad"])
        G.GAME.blindassist:change_dim(1.5,1.5)
    end,
    defeat = function(self)
        G.GAME.blindassist:defeat()
    end,
    calculate = function(self, blind, context)
        if context.after and not G.GAME.blind.disabled and G.GAME.blind.active and SMODS.calculate_round_score() - G.GAME.blind.chips <= 0 then
            G.GAME.blind.mult = G.GAME.blind.mult*8
            G.E_MANAGER:add_event(Event({trigger = 'before', delay = 0.5, func = function()
            G.GAME.blind:juice_up()
            G.hand_text_area.blind_mult_text:juice_up()
            G.GAME.blind.mult_text = number_format(G.GAME.blind.mult/4)
            if not silent then play_sound('multhit2') end
                return true
            end}))
            delay(1)
            joker_area_status_text(localize('k_again_ex'), G.C.FILTER)
            G.E_MANAGER:add_event(Event({trigger = 'before', delay = 0.5, func = function()
            G.GAME.blindassist:juice_up()
            G.hand_text_area.blind_mult_text:juice_up()
            G.GAME.blind.mult_text = number_format(G.GAME.blind.mult/2)
            if not silent then play_sound('multhit2') end
                return true
            end}))
            delay(1)
            joker_area_status_text(localize('k_again_ex'), G.C.FILTER)
            G.E_MANAGER:add_event(Event({trigger = 'before', delay = 0.5, func = function()
            G.GAME.blindassist:juice_up()
            G.hand_text_area.blind_mult_text:juice_up()
            G.GAME.blind.mult_text = number_format(G.GAME.blind.mult)
            if not silent then play_sound('multhit2') end
                return true
            end}))
            G.GAME.blind.active = false
        end
    end,
})

SMODS.Blind({
    key = 'chad',
    atlas = 'bld_joker',
    pos = {x=0, y=13},
    boss_colour = HEX('5D8EA4'),
    mult = 3,
    dollars = 6,
    boss = {min = 1},
    order = 13,
    in_pool = function(self, args)
        return false
    end,
})

SMODS.Blind({
    key = 'vagabond',
    atlas = 'bld_joker',
    pos = {x=0, y=11},
    boss_colour = HEX('C8B37C'),
    mult = 10,
    dollars = 8,
    order = 14,
    boss = {min = 1},
    config = {
        extra = {
            dollars = 4
        }
    },
    active = true,
    in_pool = function(self, args)
        if G.GAME.selected_back.effect.center.config.extra then
            if not G.GAME.selected_back.effect.center.config.extra.blindside and G.GAME.round_resets.ante%6 ~= 0 then return false end
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
        if context.after and not G.GAME.blind.disabled then
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            ease_dollars(-math.floor(G.GAME.dollars/2), true)
            blind:wiggle()
            return true end }))
        end
    end,
    load = function()
        G.GAME.blindassist.states.visible = false
        G.GAME.blindassist:change_dim(0,0)
    end
})

SMODS.Blind({
    key = 'stuntman',
    atlas = 'bld_joker',
    pos = {x=0, y=14},
    boss_colour = HEX('FD5F55'),
    mult = 6,
    dollars = 6,
    order = 15,
    boss = {min = 1},
    active = true,
    config = {
        extra = {
            handsize = 2
        }
    },
    in_pool = function(self, args)
        if G.GAME.selected_back.effect.center.config.extra then
            if not G.GAME.selected_back.effect.center.config.extra.blindside and G.GAME.round_resets.ante%6 ~= 0 then return false end
            return true
        else
        return false
        end
    end,
    set_blind = function(self)
        BLINDSIDE.chipsmodify(0, ((G.GAME.blind.basechips*(2))), 0, 0, true)
        BLINDSIDE.chipsupdate()
		G.hand:change_size(2)
        G.GAME.blindassist.states.visible = false
        G.GAME.blindassist:change_dim(0,0)
    end,
    defeat = function(self)
		G.hand:change_size(-2)
    end,
    load = function()
        G.GAME.blindassist.states.visible = false
        G.GAME.blindassist:change_dim(0,0)
    end
})


SMODS.Blind({
    key = 'council',
    atlas = 'bld_joker',
    pos = {x=0, y=15},
    boss_colour = HEX('4F6367'),
    mult = 6,
    dollars = 6,
    order = 16,
    boss = {min = 1},
    active = true,
    in_pool = function(self, args)
        if G.GAME.selected_back.effect.center.config.extra then
            if not G.GAME.selected_back.effect.center.config.extra.blindside and G.GAME.round_resets.ante < 3 and G.GAME.round_resets.ante%6 ~= 0 then return false end
            return true
        else
        return false
        end
    end,
    set_blind = function(self)
        G.GAME.blindassist.states.visible = false
        G.GAME.blindassist:change_dim(0,0)
    end,
    loc_vars = function(self)
        return { vars = { localize(G.GAME.current_round.most_played_poker_hand, 'poker_hands') } }
    end,
    collection_loc_vars = function(self)
        return { vars = { localize('ph_most_played') } }
    end,
    calculate = function(self, blind, context)
        if not blind.disabled and context.after and context.scoring_name == G.GAME.current_round.most_played_poker_hand then
            BLINDSIDE.chipsmodify(0, 0, 2)
            BLINDSIDE.chipsupdate()
        end
    end,
    load = function()
        G.GAME.blindassist.states.visible = false
        G.GAME.blindassist:change_dim(0,0)
    end
})

SMODS.Blind({
    key = 'hittheroad',
    atlas = 'bld_joker',
    pos = {x=0, y=16},
    boss_colour = HEX('92836A'),
    mult = 6,
    dollars = 6,
    order = 17,
    boss = {min = 1},
    active = true,
    in_pool = function(self, args)
        if G.GAME.selected_back.effect.center.config.extra then
            if not G.GAME.selected_back.effect.center.config.extra.blindside and G.GAME.round_resets.ante%6 ~= 0 then return false end
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
        if not blind.disabled and context.discard and context.hook ~= true then
            BLINDSIDE.chipsmodify(1, 0, 0)
            blind:wiggle()
            BLINDSIDE.chipsupdate()
        end
    end,
    load = function()
        G.GAME.blindassist.states.visible = false
        G.GAME.blindassist:change_dim(0,0)
    end
})

SMODS.Blind({
    key = 'vampire',
    atlas = 'bld_joker',
    pos = {x=0, y=17},
    boss_colour = HEX('DD463C'),
    mult = 8,
    dollars = 8,
    order = 18,
    boss = {min = 1},
    active = true,
    in_pool = function(self, args)
        if G.GAME.selected_back.effect.center.config.extra then
            if not G.GAME.selected_back.effect.center.config.extra.blindside and G.GAME.round_resets.ante > 4 and G.GAME.round_resets.ante%6 ~= 0  then return false end
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
        if not blind.disabled and context.before then
            for _, scored_card in ipairs(context.scoring_hand) do
                if (scored_card):get_seal() and not scored_card.vampired then
                    scored_card.vampired = true
                    scored_card:set_seal(nil, nil, true)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            scored_card:juice_up()
                            scored_card.vampired = nil
                            BLINDSIDE.chipsmodify(0.5, 0, 0)
                            return true
                        end
                    }))
                end
            end
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            BLINDSIDE.chipsupdate()
            blind:wiggle()
            return true end }))
        end
    end,
    load = function()
        G.GAME.blindassist.states.visible = false
        G.GAME.blindassist:change_dim(0,0)
    end
})

SMODS.Blind({
    key = 'campfire',
    atlas = 'bld_joker',
    pos = {x=0, y=18},
    boss_colour = HEX('FA940B'),
    mult = 12,
    dollars = 10,
    order = 19,
    boss = {min = 1},
    active = true,
    in_pool = function(self, args)
        if G.GAME.selected_back.effect.center.config.extra then
            if not G.GAME.selected_back.effect.center.config.extra.blindside and G.GAME.round_resets.ante > 3 and G.GAME.round_resets.ante%6 ~= 0 then return false end
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
        if not blind.disabled and context.selling_card and blind.active then
            BLINDSIDE.chipsmodify(-8, 0, 0)
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            BLINDSIDE.chipsupdate()
            blind.active = false
            blind:wiggle()
            return true end }))
        end
    end,
    load = function()
        G.GAME.blindassist.states.visible = false
        G.GAME.blindassist:change_dim(0,0)
    end
})

SMODS.Blind({
    key = 'obelisk',
    atlas = 'bld_joker',
    pos = {x=0, y=19},
    boss_colour = HEX('B27EC6'),
    mult = 8,
    dollars = 6,
    order = 20,
    boss = {min = 1},
    active = true,
    in_pool = function(self, args)
        if G.GAME.selected_back.effect.center.config.extra then
            if not G.GAME.selected_back.effect.center.config.extra.blindside and G.GAME.round_resets.ante%6 ~= 0 then return false end
            return true
        else
        return false
        end
    end,
    set_blind = function(self)
        G.GAME.blindassist.states.visible = false
        G.GAME.blindassist:change_dim(0,0)
        self.hands = {}
        for _, poker_hand in ipairs(G.handlist) do
            self.hands[poker_hand] = false
        end
    end,
    calculate = function(self, blind, context)
        if context.setting_blind and not context.disabled then
        for _, poker_hand in ipairs(G.handlist) do
        blind.hands = {}
            blind.hands[poker_hand] = false
        end
        end
        if not blind.disabled and context.after and blind.hands[context.scoring_name] then
            BLINDSIDE.chipsmodify(2, 0, 0)
            blind:wiggle()
            BLINDSIDE.chipsupdate()
        end
        if context.after then     
            blind.hands[context.scoring_name] = true
        end
    end,
    load = function()
        G.GAME.blindassist.states.visible = false
        G.GAME.blindassist:change_dim(0,0)
    end
})

SMODS.Blind({
    key = 'pareidolia',
    atlas = 'bld_joker',
    pos = {x=0, y=20},
    boss_colour = HEX('52957B'),
    mult = 8,
    dollars = 6,
    order = 21,
    boss = {min = 1},
    active = true,
    loc_vars = function(self)
        local numerator, denominator = SMODS.get_probability_vars(self, 1, 2, 'pareidolia')
        return { vars = { numerator, denominator } }
    end,
    collection_loc_vars = function(self)
        return { vars = { '1', '2' } }
    end,
    in_pool = function(self, args)
        if G.GAME.selected_back.effect.center.config.extra then
            if not G.GAME.selected_back.effect.center.config.extra.blindside and G.GAME.round_resets.ante%6 ~= 0 then return false end
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
        if not blind.disabled then
            if context.stay_flipped and context.to_area == G.hand and
                SMODS.pseudorandom_probability(blind, 'pareidolia', 1, 2) then
                return {
                    stay_flipped = true
                }
            end
        end
    end,
    load = function()
        G.GAME.blindassist.states.visible = false
        G.GAME.blindassist:change_dim(0,0)
    end
})

SMODS.Blind({
    key = 'baron',
    atlas = 'bld_joker',
    pos = {x=0, y=21},
    boss_colour = HEX('8368E1'),
    mult = 6,
    dollars = 8,
    order = 22,
    boss = {min = 1},
    active = true,
    in_pool = function(self, args)
        if G.GAME.selected_back.effect.center.config.extra then
            if not G.GAME.selected_back.effect.center.config.extra.blindside and G.GAME.round_resets.ante%6 ~= 0 then return false end
            return true
        else
        return false
        end
    end,
    set_blind = function(self)
        G.GAME.blindassist.states.visible = true
        G.GAME.blindassist:set_blind(G.P_BLINDS["bl_bld_mime"])
        G.GAME.blindassist:change_dim(1.5,1.5)
    end,
    load = function()
        G.GAME.blindassist.states.visible = true
        G.GAME.blindassist:set_blind(G.P_BLINDS["bl_bld_mime"])
        G.GAME.blindassist:change_dim(1.5,1.5)
    end,
    defeat = function(self)
        G.GAME.blindassist:defeat()
    end,
    calculate = function(self, blind, context)
        if not blind.disabled and context.after then
            BLINDSIDE.chipsmodify(0.5*#G.hand.cards, 0, 0)
            blind:wiggle()
            BLINDSIDE.chipsupdate()
        end
    end,
})

SMODS.Blind({
    key = 'mime',
    atlas = 'bld_joker',
    pos = {x=0, y=22},
    boss_colour = HEX('8368E1'),
    mult = 6,
    dollars = 8,
    order = 23,
    boss = {min = 1},
    active = true,
    in_pool = function(self, args)
        return false
    end,
})


SMODS.Blind({
    key = 'burglar',
    atlas = 'bld_joker',
    pos = {x=0, y=23},
    boss_colour = HEX('537A82'),
    mult = 4,
    dollars = 6,
    order = 24,
    boss = {min = 1},
    active = true,
    in_pool = function(self, args)
        if G.GAME.selected_back.effect.center.config.extra then
            if not G.GAME.selected_back.effect.center.config.extra.blindside and G.GAME.round_resets.ante%6 ~= 0 then return false end
            return true
        else
        return false
        end
    end,
    set_blind = function(self)
        G.GAME.blind.hands_sub = G.GAME.round_resets.hands - 1
        ease_hands_played(-G.GAME.blind.hands_sub)
        ease_discard(5)
        G.GAME.blindassist.states.visible = false
        G.GAME.blindassist:change_dim(0,0)
    end,
    load = function()
        G.GAME.blindassist.states.visible = false
        G.GAME.blindassist:change_dim(0,0)
    end
})