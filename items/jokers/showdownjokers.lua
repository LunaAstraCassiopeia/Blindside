function copy3(obj, seen)
    -- Handle non-tables and previously-seen tables.
    if type(obj) ~= 'table' then return obj end
    if seen and seen[obj] then return seen[obj] end
  
    -- New table; mark it as seen and copy recursively.
    local s = seen or {}
    local res = {}
    s[obj] = res
    for k, v in pairs(obj) do res[copy3(k, s)] = copy3(v, s) end
    return setmetatable(res, getmetatable(obj))
end

SMODS.Blind({
    key = 'yorick',
    atlas = 'bld_joker',
    pos = {x=0, y=39},
    boss_colour = HEX('e8b867'),
    mult = 16,
    base_dollars = 10,
    boss = {min = 1, showdown = true},
    in_pool = function(self, args)
        if G.GAME.selected_back.effect.center.config.extra then
            if not G.GAME.selected_back.effect.center.config.extra.blindside and G.GAME.round_resets.ante%6 == 0 then return false end
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
        if not blind.disabled and context.reshuffle then
            BLINDSIDE.chipsmodify(0, 0, 2)
        end
    end,
    load = function()
        G.GAME.blindassist.states.visible = false
        G.GAME.blindassist:change_dim(0,0)
    end
})

local can_discardref = G.FUNCS.can_discard
G.FUNCS.can_discard = function(e)
    for key, value in pairs(G.hand.highlighted) do
        if value.config.center and value.config.center.config.extra and value.config.center.config.extra.stubborn then
            e.config.colour = G.C.UI.BACKGROUND_INACTIVE
            e.config.button = nil
            return
        end
    end
    can_discardref(e)
end

BLINDSIDE.Joker({
    key = 'triboulet',
    atlas = 'bld_joker',
    pos = {x=0, y=41},
    boss_colour = HEX('009CFD'),
    mult = 16,
    base_dollars = 10,
    boss = {min = 1, showdown = true},
    in_pool = function(self, args)
        if G.GAME.selected_back.effect.center.config.extra then
            if not G.GAME.selected_back.effect.center.config.extra.blindside and G.GAME.round_resets.ante%6 == 0 then return false end
            return true
        else
        return false
        end
    end,
    joker_set = function ()
        for i, v in pairs(G.GAME.tags) do
            if v:apply_to_run({type = 'real_round_before_start', card = card}) then break end
        end
        if not G.GAME.blind.disabled then
            for i = 1, 8, 1 do
                local enhancement = 'm_bld_king'
                local card = SMODS.create_card { set = "Base", enhancement = enhancement, area = G.discard }
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                card.playing_card = G.playing_card
                table.insert(G.playing_cards, card)
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.3,
                    func = function()
                            card:start_materialize({ G.C.SECONDARY_SET.Enhanced })
                            G.deck:emplace(card)
                        return true
                    end
                }))
            end
            for i = 1, 8, 1 do
                local enhancement = 'm_bld_queen'
                local card = SMODS.create_card { set = "Base", enhancement = enhancement, area = G.discard }
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                card.playing_card = G.playing_card
                table.insert(G.playing_cards, card)
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.3,
                    func = function()
                            card:start_materialize({ G.C.SECONDARY_SET.Enhanced })
                            G.deck:emplace(card)
                        return true
                    end
                }))
            end
        end
    end,
})

local function get_new_perkeo_boss()
    G.GAME.perscribed_bosses = G.GAME.perscribed_bosses or {
    }
    if G.GAME.perscribed_bosses and G.GAME.perscribed_bosses[G.GAME.round_resets.ante] then 
        local ret_boss = G.GAME.perscribed_bosses[G.GAME.round_resets.ante] 
        G.GAME.perscribed_bosses[G.GAME.round_resets.ante] = nil
        G.GAME.bosses_used[ret_boss] = G.GAME.bosses_used[ret_boss] + 1
        return ret_boss
    end
    if G.FORCE_BOSS then return G.FORCE_BOSS end
    
    local eligible_bosses = {}
    for k, v in pairs(G.P_BLINDS) do
        local res, options = SMODS.add_to_pool(v)
        options = options or {}
        if not v.boss then
        
        elseif options.ignore_showdown_check then
            eligible_bosses[k] = res and true or nil
        elseif v.in_pool and type(v.in_pool) == 'function' and not v.boss.showdown then
            eligible_bosses[k] = res and true or nil
        end
    end
    for k, v in pairs(G.GAME.banned_keys) do
        if eligible_bosses[k] then eligible_bosses[k] = nil end
    end

    if G.GAME.selected_back.effect.center.config.extra and G.GAME.selected_back.effect.center.config.extra.blindside then
        for k, v in pairs(eligible_bosses) do
            if eligible_bosses[k] and not G.P_BLINDS[k].mod or G.P_BLINDS[k].mod.id ~= 'Blindside' then
                eligible_bosses[k] = nil
            end
        end
    end
    local min_use = 100
    for k, v in pairs(G.GAME.bosses_used) do
        if eligible_bosses[k] then
            eligible_bosses[k] = v
            if eligible_bosses[k] <= min_use then 
                min_use = eligible_bosses[k]
            end
        end
    end
    for k, v in pairs(eligible_bosses) do
        if eligible_bosses[k] then
            if eligible_bosses[k] > min_use then 
                eligible_bosses[k] = nil
            end
        end
    end
    local _, boss = pseudorandom_element(eligible_bosses, pseudoseed('boss'))
    G.GAME.bosses_used[boss] = G.GAME.bosses_used[boss] + 1
    
    return boss
end

BLINDSIDE.Joker({
    key = 'perkeo',
    atlas = 'bld_joker',
    pos = {x=0, y=43},
    boss_colour = HEX('56A786'),
    mult = 12,
    base_dollars = 10,
    hands = {},
    boss = {min = 1, showdown = true},
    joker_set = function(self)
        self.hands = {}
        for _, poker_hand in ipairs(G.handlist) do
            self.hands[poker_hand] = false
        end
    end,
    in_pool = function(self, args)
        if G.GAME.selected_back.effect.center.config.extra then
            if not G.GAME.selected_back.effect.center.config.extra.blindside and G.GAME.round_resets.ante%6 == 0 then return false end
            return true
        else
        return false
        end
    end,
    calculate = function(self, blind, context)
        if context.setting_blind and not blind.disabled then
            for _, poker_hand in ipairs(G.handlist) do
                blind.hands = blind.hands or {}
                blind.hands[poker_hand] = false
            end
        end
        if context.after and not blind.disabled then
            blind.blindassist = get_new_perkeo_boss()
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                G.GAME.blindassist:set_assist_blind(G.P_BLINDS[blind.blindassist])
                G.GAME.blindassist.states.visible = true
                G.GAME.blindassist:change_dim(1.5,1.5)
                G.GAME.blindassist.negative = true
                play_sound('negative', 1.5, 0.4)
                SMODS.calculate_context({setting_blind = true, blind = G.GAME.round_resets.blind})
            return true end }))
            blind.hands[context.scoring_name] = true
        end
    end,
    joker_defeat = function(self)
        if G.GAME.blindassist then
            G.GAME.blindassist:defeat()
        end
    end,
    joker_load = function(self)
        if G.GAME.blind.blindassist then
            G.GAME.blindassist.states.visible = true
            G.GAME.blindassist:set_assist_blind(G.P_BLINDS[G.GAME.blind.blindassist])
            G.GAME.blindassist:change_dim(1.5,1.5)
            G.GAME.blindassist.negative = true
        end
    end
})

function Blind:set_assist_blind(blind, reset, silent)
    if not reset then
        self.config.blind = blind or {}
        self.effect = type(self.config.blind.config) == "table" and copy_table(self.config.blind.config) or {}
        self.name = blind and blind.name or ''
        self.small = blind and not not blind.small
        self.big = blind and not not blind.big
        self.base_dollars = blind and blind.dollars or 0
        self.sound_pings = self.base_dollars + 2
        if G.GAME.modifiers.no_blind_reward and G.GAME.modifiers.no_blind_reward[self:get_type()] then self.base_dollars = 0 end
        self.debuff = blind and blind.debuff or {}
        self.pos = blind and blind.pos
        self.mult = blind and blind.mult or 0
        self.disabled = false
        self.discards_sub = nil
        self.hands_sub = nil
        self.boss = blind and not not blind.boss
        self.blind_set = false
        self.triggered = nil
        self.prepped = true
        self:set_text()

        local obj = self.config.blind
        self.children.animatedSprite = AnimatedSprite(self.T.x, self.T.y, self.T.w, self.T.h, G.ANIMATION_ATLAS[obj.config.atlas] or G.ANIMATION_ATLAS['bld_joker'],  obj.config.pos)
        self.children.animatedSprite.states = self.states
        G.GAME.last_blind = G.GAME.last_blind or {}
        G.GAME.last_blind.boss = self.boss
        G.GAME.last_blind.name = self.name

        if blind and blind.name then
            self:change_colour()
            local obj = self.config.blind
            if obj.load and type(obj.load) == 'function' then
                obj:load()
            end
        else
            self:change_colour(G.C.BLACK)
        end
        if not reset and obj.set_blind and type(obj.set_blind) == 'function' then
            obj:set_blind()
        end

        self.original_mult = self.mult
        self.active = self.active
        self.small = self.small
        self.big = self.big
        self.extra = self.extra
        self.original_chips = get_blind_amount(G.GAME.round_resets.ante)*G.GAME.starting_params.ante_scaling
        self.basechips = get_blind_amount(G.GAME.round_resets.ante)*G.GAME.starting_params.ante_scaling
        self.basechips_text = number_format(self.basechips)
        self.mult_text = number_format(self.mult)
        self.blindassist = blind and blind.blindassist or {}
        
        self.chips = get_blind_amount(G.GAME.round_resets.ante)*self.mult*G.GAME.starting_params.ante_scaling
        self.chip_text = number_format(self.chips)

        if not blind then self.chips = 0 end
        G.HUD_blind:recalculate(false)

        if blind and blind.name and blind.name ~= '' then 
            self:alert_debuff(true)

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.05,
                blockable = false,
                func = (function()
                        G.HUD_blind:get_UIE_by_ID("HUD_blind_name").states.visible = false
                        G.HUD_blind:get_UIE_by_ID("dollars_to_be_earned").parent.parent.states.visible = false
                        G.HUD_blind.alignment.offset.y = 0
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.15,
                        blockable = false,
                        func = (function()
                            G.HUD_blind:get_UIE_by_ID("HUD_blind_name").states.visible = true
                            G.HUD_blind:get_UIE_by_ID("dollars_to_be_earned").parent.parent.states.visible = true
                            G.HUD_blind:get_UIE_by_ID("dollars_to_be_earned").config.object:pop_in(0)
                            G.HUD_blind:get_UIE_by_ID("HUD_blind_name").config.object:pop_in(0)
                            G.HUD_blind:get_UIE_by_ID("HUD_blind_count"):juice_up()
                            self.dissolve = 0
                            self.children.animatedSprite:set_sprite_pos(self.config.blind.pos)
                            self.blind_set = true
                            if not reset and not silent then
                                self:juice_up()
                                if blind then play_sound('chips1', math.random()*0.1 + 0.55, 0.42);--play_sound('cancel')
                                end
                            end
                            return true
                        end)
                    }))
                    return true
                end)
            }))
        end


        self.config.h_popup_config ={align="tm", offset = {x=0,y=-0.1},parent = self}
    end

    if blind then
        self.in_blind = true
    end
end

local blind_draw_hook = Blind.draw
function Blind:draw()
    blind_draw_hook(self)

    if self.negative then
        self.children.animatedSprite:draw_shader("negative_shine", nil, self.ARGS.send_to_shader)
        self.children.animatedSprite:draw_shader("negative", nil, self.ARGS.send_to_shader)
    end
end

BLINDSIDE.Joker({
    key = 'chicot',
    atlas = 'bld_joker',
    pos = {x=0, y=42},
    boss_colour = HEX('FD5F55'),
    mult = 16,
    base_dollars = 10,
    hands = {},
    boss = {min = 1, showdown = true},
    in_pool = function(self, args)
        if G.GAME.selected_back.effect.center.config.extra then
            if not G.GAME.selected_back.effect.center.config.extra.blindside and G.GAME.round_resets.ante%6 == 0 then return false end
            return true
        else
        return false
        end
    end,
    calculate = function(self, blind, context)
        if context.after and not blind.disabled then
            local transformed = false
            for _, scored_card in ipairs(context.scoring_hand) do
                if not scored_card.original then
                    scored_card.original = copy3(scored_card.ability)
                    transformed = true
                    local new_type = 'm_bld_big'
                    if scored_card:is_color("Red") or scored_card:is_color("Yellow") then
                        new_type = 'm_bld_big'
                    elseif scored_card:is_color("Blue") or scored_card:is_color("Purple") then
                        new_type = 'm_bld_small'
                    else
                        if pseudorandom('flip') < 1/2 then
                            new_type = 'm_bld_big'
                        else
                            new_type = 'm_bld_small'
                        end
                    end
                    scored_card:set_ability(new_type, nil, true)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            scored_card:juice_up()
                            play_sound('tarot2', percent, 0.6)
                            return true
                        end
                    }))
                end
            end
            if transformed then    
                G.GAME.playing_with_fire_num = G.GAME.playing_with_fire_num + 1
            G.GAME.playing_with_fire_each = G.GAME.used_vouchers.v_bld_swearjar and "bld_playing_with_fire_each_2" or "bld_playing_with_fire_each_1"
                G.GAME.playing_with_fire = G.GAME.playing_with_fire + 1 + (G.GAME.used_vouchers.v_bld_swearjar and 1 or 0)
            end
        end
    end,
    joker_defeat = function()
        for key, value in pairs(G.playing_cards) do
            if value.original then
                value:set_ability(value.original.config.center)
                value.ability = copy3(value.original)
                value.original = nil
            end
        end
    end
})

BLINDSIDE.Joker({
    key = 'canio',
    atlas = 'bld_joker',
    pos = {x=0, y=40},
    boss_colour = HEX('FFFFFF'),
    mult = 16,
    base_dollars = 10,
    hands = {},
    boss = {min = 1, showdown = true},
    in_pool = function(self, args)
        if G.GAME.selected_back.effect.center.config.extra then
            if not G.GAME.selected_back.effect.center.config.extra.blindside and G.GAME.round_resets.ante%6 == 0 then return false end
            return true
        else
        return false
        end
    end,
    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.debuff_card and context.debuff_card.area == G.jokers then
                if context.debuff_card.ability.canio_debuffed then
                    return {
                        debuff = true
                    }
                end
            end
            if context.press_play and G.jokers.cards[1] then
                blind.prepped = true
            end
            if context.hand_drawn then
                if blind.prepped and G.jokers.cards[1] then
                    local prev_chosen_set = {}
                    local fallback_jokers = {}
                    local jokers = {}
                    for i = 1, #G.jokers.cards do
                        if G.jokers.cards[i].ability.canio_debuffed then
                            prev_chosen_set[G.jokers.cards[i]] = true
                            if G.jokers.cards[i].debuff then SMODS.recalc_debuff(G.jokers.cards[i]) end
                        end
                    end
                    for i = 1, #G.jokers.cards do
                        if not G.jokers.cards[i].debuff then
                            if not prev_chosen_set[G.jokers.cards[i]] then
                                jokers[#jokers + 1] = G.jokers.cards[i]
                            end
                            table.insert(fallback_jokers, G.jokers.cards[i])
                        end
                    end
                    if #jokers == 0 then jokers = fallback_jokers end
                    local _card = pseudorandom_element(jokers, 'vremade_crimson_heart')
                    if _card then
                        _card.ability.canio_debuffed = true
                        SMODS.recalc_debuff(_card)
                        _card:juice_up()
                        blind:wiggle()
                    end
                end
            end
        if context.hand_drawn then
            blind.prepped = nil
        end
        end
    end,
    disable = function(self)
        for _, joker in ipairs(G.jokers.cards) do
            joker.ability.canio_debuffed = nil
        end
    end,
    joker_defeat = function()
        for _, joker in ipairs(G.jokers.cards) do
            joker.ability.canio_debuffed = nil
        end
    end
})
