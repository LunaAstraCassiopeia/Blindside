    function BLINDSIDE.is_blindside(string)
        for _, v in ipairs(SMODS.ObjectTypes.bld_obj_blindside.cards) do
            if v == string or (G.P_CENTERS[string] and G.P_CENTERS[string].blindside_blind) or (G.P_BLINDS[string] and G.P_BLINDS[string].blindside_joker) then
                return true
            end
        end
    end

    function BLINDSIDE.is_relic(string)
        for _, v in ipairs(SMODS.ObjectTypes.bld_obj_relics.cards) do
            if v == string then
            return true
            end
        end
    end

    function BLINDSIDE.is_dupe(string)
        for _, v in ipairs(SMODS.ObjectTypes.bld_obj_excludejokers.cards) do
            if v == string then
            return true
            end
        end
    end

    function BLINDSIDE.set_up_blindside()
            G.GAME.blind_rate = 4
            G.GAME.tarot_rate = 0
            G.GAME.planet_rate = 0
            G.GAME.bld_inversions = 0
            G.GAME.playing_with_fire = 0
            G.GAME.playing_with_fire_num = 0
            SMODS.change_booster_limit(1)
            G.GAME.starting_params.reroll_cost = 3
            G.GAME.banned_keys['p_buffoon_normal_1'] = true
            G.GAME.hands['bld_blind_high'].visible = true
            G.GAME.hands['bld_blind_2oak'].visible = true
            G.GAME.hands['bld_blind_2pair'].visible = true
            G.GAME.hands['bld_blind_3oak'].visible = true
            G.GAME.hands['bld_blind_flush'].visible = true
            G.GAME.hands['bld_blind_fullhouse'].visible = true
            G.GAME.hands['bld_raise'].visible = true
            G.GAME.hands['bld_blind_4oak'].visible = true
            G.GAME.hands['High Card'].visible = false
            G.GAME.hands['Pair'].visible = false
            G.GAME.hands['Two Pair'].visible = false
            G.GAME.hands['Three of a Kind'].visible = false
            G.GAME.hands['Straight'].visible = false
            G.GAME.hands['Flush'].visible = false
            G.GAME.hands['Full House'].visible = false
            G.GAME.hands['Four of a Kind'].visible = false
            G.GAME.hands['Straight Flush'].visible = false
            G.GAME.bld_doodad_mod = 5
            G.GAME.bld_keepsake_mod = 2
            G.GAME.bld_curio_mod = 5
            G.GAME.bld_hobby_mod = 5
            G.GAME['common_mod'] = 0
            G.GAME['rare_mod'] = 0
            G.GAME['uncommon_mod'] = 0
            change_shop_size(2)
    end

    local reference_tallies = set_discover_tallies
    function set_discover_tallies()
        reference_tallies()
        G.DISCOVER_TALLIES.allblindcards = {tally = 0, of = 0}
        G.DISCOVER_TALLIES.allfilmcards = {tally = 0, of = 0}
        G.DISCOVER_TALLIES.allminerals = {tally = 0, of = 0}
        G.DISCOVER_TALLIES.allrituals = {tally = 0, of = 0}
        G.DISCOVER_TALLIES.allrunes = {tally = 0, of = 0}
        G.DISCOVER_TALLIES.blindeditions = {tally = 0, of = 0}
        G.DISCOVER_TALLIES.blindboosters = {tally = 0, of = 0}
        G.DISCOVER_TALLIES.blinddecks = {tally = 0, of = 0}
        G.DISCOVER_TALLIES.blindtrinkets = {tally = 0, of = 0}
        G.DISCOVER_TALLIES.blindjokers = {tally = 0, of = 0}
        G.DISCOVER_TALLIES.blindtags = {tally = 0, of = 0}
        G.DISCOVER_TALLIES.blindrelics = {tally = 0, of = 0}

        for _, v in pairs(G.P_CENTERS) do
            if v.set and v.set == 'Enhanced' and BLINDSIDE.is_blindside(v.key) and not v.omit  then
                G.DISCOVER_TALLIES.allblindcards.of = G.DISCOVER_TALLIES.allblindcards.of+1
                if v.discovered then 
                    G.DISCOVER_TALLIES.allblindcards.tally = G.DISCOVER_TALLIES.allblindcards.tally+1
                end
            end
            if v.set and v.set == 'bld_obj_filmcard' and BLINDSIDE.is_blindside(v.key) and not v.omit  then
                G.DISCOVER_TALLIES.allfilmcards.of = G.DISCOVER_TALLIES.allfilmcards.of+1
                if v.discovered then 
                    G.DISCOVER_TALLIES.allfilmcards.tally = G.DISCOVER_TALLIES.allfilmcards.tally+1
                end
            end
            if v.set and v.set == 'bld_obj_mineral' and BLINDSIDE.is_blindside(v.key) and not v.omit  then
                G.DISCOVER_TALLIES.allminerals.of = G.DISCOVER_TALLIES.allminerals.of+1
                if v.discovered then 
                    G.DISCOVER_TALLIES.allminerals.tally = G.DISCOVER_TALLIES.allminerals.tally+1
                end
            end
            if v.set and v.set == 'bld_obj_ritual' and BLINDSIDE.is_blindside(v.key) and not v.omit  then
                G.DISCOVER_TALLIES.allrituals.of = G.DISCOVER_TALLIES.allrituals.of+1
                if v.discovered then 
                    G.DISCOVER_TALLIES.allrituals.tally = G.DISCOVER_TALLIES.allrituals.tally+1
                end
            end
            if v.set and v.set == 'bld_obj_rune' and BLINDSIDE.is_blindside(v.key) and not v.omit  then
                G.DISCOVER_TALLIES.allrunes.of = G.DISCOVER_TALLIES.allrunes.of+1
                if v.discovered then 
                    G.DISCOVER_TALLIES.allrunes.tally = G.DISCOVER_TALLIES.allrunes.tally+1
                end
            end
            if v.set and v.set == 'Edition' and BLINDSIDE.is_blindside(v.key) and not v.omit then
                G.DISCOVER_TALLIES.blindeditions.of = G.DISCOVER_TALLIES.blindeditions.of+1
                if v.discovered then 
                    G.DISCOVER_TALLIES.blindeditions.tally = G.DISCOVER_TALLIES.blindeditions.tally+1
                end
            end
            if v.set and v.set == 'Back' and BLINDSIDE.is_blindside(v.key) and not v.omit then
                G.DISCOVER_TALLIES.blinddecks.of = G.DISCOVER_TALLIES.blinddecks.of+1
                if v.discovered then 
                    G.DISCOVER_TALLIES.blinddecks.tally = G.DISCOVER_TALLIES.blinddecks.tally+1
                end
            end
            if v.set and v.set == 'Booster' and BLINDSIDE.is_blindside(v.key) and not v.omit then
                G.DISCOVER_TALLIES.blindboosters.of = G.DISCOVER_TALLIES.blindboosters.of+1
                if v.discovered then 
                    G.DISCOVER_TALLIES.blindboosters.tally = G.DISCOVER_TALLIES.blindboosters.tally+1
                end
            end
            if v.set and v.set == 'Joker' and BLINDSIDE.is_blindside(v.key) and not v.omit then
                G.DISCOVER_TALLIES.blindtrinkets.of = G.DISCOVER_TALLIES.blindtrinkets.of+1
                if v.discovered then 
                    G.DISCOVER_TALLIES.blindtrinkets.tally = G.DISCOVER_TALLIES.blindtrinkets.tally+1
                end
            end
            if v.set and v.set == 'Voucher' and BLINDSIDE.is_blindside(v.key) and not v.omit then
                G.DISCOVER_TALLIES.blindrelics.of = G.DISCOVER_TALLIES.blindrelics.of+1
                if v.discovered then 
                    G.DISCOVER_TALLIES.blindrelics.tally = G.DISCOVER_TALLIES.blindrelics.tally+1
                end
            end
        end

        for _, v in pairs(G.P_BLINDS) do
            if BLINDSIDE.is_blindside(v.key) and not v.omit  then
                G.DISCOVER_TALLIES.blindjokers.of = G.DISCOVER_TALLIES.blindjokers.of+1
                if v.discovered then 
                    G.DISCOVER_TALLIES.blindjokers.tally = G.DISCOVER_TALLIES.blindjokers.tally+1
                end
            end
        end
        
        for _, v in pairs(G.P_TAGS) do
            if BLINDSIDE.is_blindside(v.key) and not v.omit and not BLINDSIDE.is_relic(v.key)  then
                G.DISCOVER_TALLIES.blindtags.of = G.DISCOVER_TALLIES.blindtags.of+1
                if v.discovered then 
                    G.DISCOVER_TALLIES.blindtags.tally = G.DISCOVER_TALLIES.blindtags.tally+1
                end
            end
        end

    end
    
    local blind_get_type = Blind.get_type
function Blind:get_type()
    if self.small then 
        return 'Small'
    elseif self.big then 
        return 'Big'
    else return blind_get_type(self) end
end

function get_new_small(current)
    G.GAME.perscribed_small = G.GAME.perscribed_small or {
    }
    if G.GAME.perscribed_small and G.GAME.perscribed_small[G.GAME.round_resets.ante] then 
        local ret_boss = G.GAME.perscribed_small[G.GAME.round_resets.ante] 
        G.GAME.perscribed_small[G.GAME.round_resets.ante] = nil
        return ret_boss
    end
    if G.FORCE_SMALL then return G.FORCE_SMALL end

    local eligible_bosses = {bl_small = true}
    for k, v in pairs(G.P_BLINDS) do
        if not v.small then
        elseif k == current then
        elseif v.in_pool and type(v.in_pool) == 'function' then
            local res, options = v:in_pool()
            eligible_bosses[k] = res and true or nil
        elseif v.small.min <= math.max(1, G.GAME.round_resets.ante) then
            eligible_bosses[k] = true
        end
    end
    for k, v in pairs(G.GAME.banned_keys) do
        if eligible_bosses[k] then eligible_bosses[k] = nil end
    end

    if G.GAME.selected_back.effect.center.config.extra and G.GAME.selected_back.effect.center.config.extra.blindside then
        for k, v in pairs(eligible_bosses) do
            if v and not G.P_BLINDS[k].mod or G.P_BLINDS[k].mod.id ~= 'Blindside' then
                eligible_bosses[k] = nil
            end
        end
    end

    local _, boss = pseudorandom_element(eligible_bosses, pseudoseed('boss'))
    
    return boss
end

-- Get a new big blind
function get_new_big(current)
    G.GAME.perscribed_big = G.GAME.perscribed_big or {
    }
    if G.GAME.perscribed_big and G.GAME.perscribed_big[G.GAME.round_resets.ante] then 
        local ret_boss = G.GAME.perscribed_big[G.GAME.round_resets.ante] 
        G.GAME.perscribed_big[G.GAME.round_resets.ante] = nil
        return ret_boss
    end
    if G.FORCE_BIG then return G.FORCE_BIG end

    local eligible_bosses = {bl_big = true}
    for k, v in pairs(G.P_BLINDS) do
        if not v.big then
        elseif k == current then
        elseif v.in_pool and type(v.in_pool) == 'function' then
            local res, options = v:in_pool()
            eligible_bosses[k] = res and true or nil
        elseif v.big.min <= math.max(1, G.GAME.round_resets.ante) then
            eligible_bosses[k] = true
        end
    end
    for k, v in pairs(G.GAME.banned_keys) do
        if eligible_bosses[k] then eligible_bosses[k] = nil end
    end

    if G.GAME.selected_back.effect.center.config.extra and G.GAME.selected_back.effect.center.config.extra.blindside then
        for k, v in pairs(eligible_bosses) do
            if v and not G.P_BLINDS[k].mod or G.P_BLINDS[k].mod.id ~= 'Blindside' then
                eligible_bosses[k] = nil
            end
        end
    end

    local _, boss = pseudorandom_element(eligible_bosses, pseudoseed('boss'))
    
    return boss
end


function BLINDSIDE.chipsmodify(mult, originalchips, xmult, xchips, silent)
        if mult and mult ~= 0 then
            G.E_MANAGER:add_event(Event({trigger = 'before', delay = 0.3, func = function()
                if G.GAME.blind.mult ~= 1 or mult > 0 then
                    G.GAME.blind.mult = G.GAME.blind.mult + mult
                end
            G.hand_text_area.blind_mult_text:juice_up()
                G.GAME.blind.mult_text = number_format(G.GAME.blind.mult)
                if not silent then play_sound('multhit1') end
                return true
            end}))
        end
        if xmult and xmult ~= 0 then
            G.E_MANAGER:add_event(Event({trigger = 'before', delay = 0.3, func = function()
        if xmult and xmult > 0 then
            G.GAME.blind.mult = G.GAME.blind.mult*xmult
        end
            G.hand_text_area.blind_mult_text:juice_up()
                G.GAME.blind.mult_text = number_format(G.GAME.blind.mult)
                if not silent then play_sound('multhit2') end
                return true
            end}))
        end
        if xchips and xchips ~= 0 then
            G.E_MANAGER:add_event(Event({trigger = 'before', delay = 0.3, func = function()
        if xchips and xchips > 0 then
            G.GAME.blind.basechips = G.GAME.blind.basechips*xchips
        end
            G.hand_text_area.blind_chip_text:juice_up()
                G.GAME.blind.basechips_text = number_format(G.GAME.blind.basechips)
                if not silent then play_sound('xchips') end
                return true
            end}))
        end
        if originalchips and originalchips ~= 0 then
            G.E_MANAGER:add_event(Event({trigger = 'before', delay = 0.3, func = function()
            G.GAME.blind.basechips = G.GAME.blind.basechips + originalchips
            G.hand_text_area.blind_chip_text:juice_up()
                G.GAME.blind.basechips_text = number_format(G.GAME.blind.basechips)
                if not silent then play_sound('chips1') end
                return true
            end}))
        end
end

function BLINDSIDE.chipsupdate()
    local final_chips = G.GAME.blind.basechips*G.GAME.blind.mult
    local chip_mod -- iterate over ~120 ticks
    if G.GAME.blind.chips then
        chip_mod = (final_chips - G.GAME.blind.chips) / 120
    else
        chip_mod = ((final_chips - G.GAME.blind.chips) / 120)
    end
    local step = 0
    local greater = false
    if final_chips > G.GAME.blind.chips then
        greater = true
    end
    if final_chips ~= G.GAME.blind.chips then
        G.E_MANAGER:add_event(Event({trigger = 'after', blocking = true, delay = 0.3, func = function()
            G.GAME.blind.chips = G.GAME.blind.chips + G.SETTINGS.GAMESPEED * chip_mod
            if G.GAME.blind.chips < final_chips and greater then
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                if step % 5 == 0 then
                    play_sound('chips1', 0.8 + (step * 0.005))
                end
                step = step + 1
            elseif G.GAME.blind.chips > final_chips and not greater then
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                if step % 5 == 0 then
                    play_sound('chips1', 1 - (step * 0.005))
                end
                step = step + 1
            else
                G.GAME.blind.chips = final_chips
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                G.GAME.blind:wiggle()
                return true
            end
        end}))
        delay(0.5)
        G.E_MANAGER:add_event(Event({trigger = 'after', blocking = true, delay = 0.3, func = function()
            G.GAME.chips_buffer = 0
            local chips_UI = G.hand_text_area.blind_chips
            G.FUNCS.blind_chip_UI_scale(G.hand_text_area.blind_chips)
            delay(0.5)
            if not silent then play_sound('generic1') end
            chips_UI:juice_up()
            return true
        end}))
    end
end


function joker_area_status_text(text, colour, silent, delay, scale)
    local delay = delay or 0.6
    G.E_MANAGER:add_event(Event({
    trigger = (delay==0 and 'immediate' or 'before'),
    delay = delay,
    func = function()
        attention_text({
            text = text,
            scale = scale or 1, 
            hold = 0.9,
            backdrop_colour = colour,
            align = 'tl',
            offset = {x = 1, y = -2},
            major = G.play
        })
        if not silent then 
            G.ROOM.jiggle = G.ROOM.jiggle + 2
            play_sound('cardFan2')
        end
      return true
    end
    }))
end


function tag_area_status_text(tag, text, colour, silent, delay, scale)
    percent = percent or (0.9 + 0.2*math.random())
    local delay = delay or 0.6
    G.E_MANAGER:add_event(Event({
    trigger = (delay==0 and 'immediate' or 'before'),
    delay = delay,
    func = function()
        attention_text({
            text = text,
            scale = scale or 1, 
            hold = 0.45,
            backdrop_colour = colour,
            align = 'cl',
            offset = {x=-0.7,y=0},
            major = tag.HUD_tag
        })
        if not silent then 
            play_sound('generic1', 0.8+percent*0.2, 1)
        end
      return true
    end
    }))
end
local set_cosumeable_ref = set_consumeable_usage
function set_consumeable_usage(card)
    set_cosumeable_ref(card)
    if card.config.center_key and card.ability.consumeable then
      if card.config.center.set == 'bld_obj_filmcard' then 
        G.E_MANAGER:add_event(Event({
          trigger = 'immediate',
          func = function()
            G.E_MANAGER:add_event(Event({
              trigger = 'immediate',
              func = function()
                G.GAME.last_channel = card.config.center_key
                  return true
              end
            }))
              return true
          end
        }))
      end
    end
end

local debug_print = false

local draw_hook = G.FUNCS.draw_from_deck_to_hand
function G.FUNCS.draw_from_deck_to_hand(...)
    if debug_print then print("base-drawing: " .. tostring(...)) end
    if BLINDSIDE.draw_queued then
        if debug_print then print("base-draw: declined") end
        return
    end
    return draw_hook(...)
end

local emplace_hook = CardArea.emplace

function CardArea:emplace(card, ...)
    for _,c in pairs(self.cards) do
        if card == c then
            -- you're already here twin, get out
            return
        end
    end
    return emplace_hook(self,card,...)
end

G.FUNCS.blind_draw_from_deck_to_hand = function(e)
    if debug_print then print("blind-drawing: " .. tostring(e)) end
    BLINDSIDE.draw_queued = true
    local hand_space = e
    local cards_to_draw = {}
    if not hand_space then
        local limit = G.hand.config.card_limit - #G.hand.cards
        local unfixed = not G.hand.config.fixed_limit
        local n = 0
        while n < #G.deck.cards do
            local card = G.deck.cards[#G.deck.cards-n]
            local mod = unfixed and (card.ability.card_limit - card.ability.extra_slots_used) or 0
            if limit - 1 + mod < 0 then
            else    
                limit = limit - 1 + mod
                table.insert(cards_to_draw, card)
                if limit <= 0 then break end
            end
            n = n + 1
        end
        hand_space = #cards_to_draw
    end
    if G.GAME.blind.name == 'The Serpent' and
        not G.GAME.blind.disabled and
        (G.GAME.current_round.hands_played > 0 or
        G.GAME.current_round.discards_used > 0) then
            hand_space = math.min(#G.deck.cards, 3)
    end
    local flags = SMODS.calculate_context({drawing_cards = true, amount = hand_space})
    hand_space = math.min(#G.deck.cards, flags.cards_to_draw or hand_space)
    delay(0.3)
    SMODS.drawn_cards = {}
    for i=1, hand_space do --draw cards from deckL
        if G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK then 
            draw_card(G.deck,G.hand, i*100/hand_space,'up', true, cards_to_draw[i])
        else
            draw_card(G.deck,G.hand, i*100/hand_space,'up', true, cards_to_draw[i])
        end
    end
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.7,
        func = function()
            save_run()
            return true
        end
    }))
    delay(0.5)
    if #G.deck.cards < G.hand.config.card_limit - #G.hand.cards and G.hand.config.card_limit - #G.hand.cards >= 1 then
        local discard_count = #G.discard.cards
        for i=1, discard_count do --draw cards from deck
            draw_card(G.discard, G.deck, i*100/discard_count,'up', nil ,nil, 0.005, i%2==0, nil, math.max((21-i)/20,0.7))
        end
        SMODS.calculate_context({reshuffle = true})
        G.GAME.current_round.reshuffles_round = G.GAME.current_round.reshuffles_round + 1
        delay(0.5)
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.7,
        func = function()
            G.deck:shuffle('beta'..G.GAME.round_resets.ante, true)
            return true
        end
    }))
        G.E_MANAGER:add_event(Event({
            trigger = 'immediate',
            func = function()
                local cards_to_draw = {}
                local limit = G.hand.config.card_limit - #G.hand.cards
                local unfixed = not G.hand.config.fixed_limit
                local n = 0
                while n < #G.deck.cards do
                    local card = G.deck.cards[#G.deck.cards-n]
                    local mod = unfixed and (card.ability.card_limit - card.ability.extra_slots_used) or 0
                    if limit - 1 + mod < 0 then
                    else    
                        limit = limit - 1 + mod
                        table.insert(cards_to_draw, card)
                        if limit <= 0 then break end
                    end
                    n = n + 1
                end
                hand_space = #cards_to_draw
                for i=1, hand_space do --draw cards from deckL
                    if G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK then 
                        draw_card(G.deck,G.hand, i*100/hand_space,'up', true, cards_to_draw[i])
                    else
                        draw_card(G.deck,G.hand, i*100/hand_space,'up', true, cards_to_draw[i])
                    end
                end
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.7,
                    func = function()
                        save_run()
                        return true
                    end
                }))
                return true
            end
        }))

    end
    G.E_MANAGER:add_event(Event({
        trigger = 'before',
        delay = 0.4,
        func = function()
            if #SMODS.drawn_cards > 0 then
                if not G.GAME.current_round.any_hand_drawn and G.GAME.facing_blind then
                for i = 1, #G.GAME.tags do
                    G.GAME.tags[i]:apply_to_run({type = 'real_round_start'})
                end
                end
                G.hand:sort()
                SMODS.calculate_context({first_hand_drawn = not G.GAME.current_round.any_hand_drawn and G.GAME.facing_blind,
                                        hand_drawn = G.GAME.facing_blind and SMODS.drawn_cards,
                                        other_drawn = not G.GAME.facing_blind and SMODS.drawn_cards})
                SMODS.drawn_cards = {}
                if G.GAME.facing_blind then G.GAME.current_round.any_hand_drawn = true end
            end
            return true
        end
    }))

    G.E_MANAGER:add_event(Event({
        func = function()
            BLINDSIDE.draw_queued = nil --????????
            return true
        end
    }))
end


function update_joker_hand_text(config, vals)
    G.E_MANAGER:add_event(Event({--This is the Hand name text for the poker hand
    trigger = 'before',
    blockable = not config.immediate,
    delay = config.delay or 0.8,
    func = function()
        local col = G.C.GREEN
        if vals.chips then
            local delta = (vals.chips - G.GAME.blind.basechips) or 0
            if delta < 0 then delta = number_format(delta); col = G.C.RED
            elseif delta > 0 then delta = '-'..number_format(delta)
            else delta = number_format(delta)
            end
            if type(vals.chips) == 'string' then delta = vals.chips end
            if type(delta) == 'string' and string.sub(delta, 1, 1) == '-' then col = G.C.RED end
            G.GAME.blind.basechips = vals.chips
            G.hand_text_area.blind_chips:update(0)
            G.GAME.blind.basechips_text = number_format(G.GAME.blind.basechips)
            if vals.StatusText then 
                attention_text({
                    text =delta,
                    scale = 0.3*2.3, 
                    hold = 1,
                    cover = G.hand_text_area.blind_chip_text.parent,
                    cover_colour = mix_colours(G.C.CHIPS, col, 0.1),
                    emboss = 0.05,
                    align = 'cm',
                    cover_align = 'cr'
                })
            end
        end
        if vals.mult then
            local delta = (vals.mult - G.GAME.blind.mult) or 0
            if delta < 0 then delta = number_format(delta); col = G.C.RED
            elseif delta > 0 then delta = '+'..number_format(delta)
            else delta = number_format(delta)
            end
            if type(vals.mult) == 'string' then delta = vals.mult end
            if type(delta) == 'string' and string.sub(delta, 1, 1) == '-' then col = G.C.RED end
            G.GAME.blind.mult = vals.mult
            G.GAME.blind.mult_text = number_format(G.GAME.blind.mult)
            G.hand_text_area.mult:update(0)
            if vals.StatusText then 
                attention_text({
                    text =delta,
                    scale = 0.3*2.3, 
                    hold = 1,
                    cover = G.hand_text_area.blind_mult_text.parent,
                    cover_colour = mix_colours(G.C.MULT, col, 0.1),
                    emboss = 0.05,
                    align = 'cm',
                    cover_align = 'cl'
                })
            end
            if not G.TAROT_INTERRUPT then G.hand_text_area.blind_mult_text:juice_up() end
        end
        if vals.chip_total then G.GAME.current_round.current_hand.chip_total = vals.chip_total;G.hand_text_area.chip_total.config.object:pulse(0.5) end
        if config.sound and not config.modded then play_sound(config.sound, config.pitch or 1, config.volume or 1) end
        	if config.modded then 
        		SMODS.juice_up_blind(config.modded)
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.06*G.SETTINGS.GAMESPEED, blockable = false, blocking = false, func = function()
                play_sound('tarot2', 0.76, 0.4);return true end}))
            play_sound('tarot2', 1, 0.4)
        end
        return true
    end}))
end

function Card:start_burn(cardarea, cell_fix, dissolve_colours, silent, dissolve_time_fac, no_juice)
    if not self.destroyed then
    if next(find_joker('j_bld_crane')) and SMODS.pseudorandom_probability(self, pseudoseed('bld_crane'), 1, 2, 'bld_crane') then
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        blockable = false,
        delay =  1.05,
        func = (function()
        if self then 
            play_sound('card1', 0.85 + percent*0.2/100, 0.6*(vol or 1))
            if cardarea then self = cardarea:remove_card(self) end
            if self then drawn = true end
            local stay_flipped = G.GAME and G.GAME.blind and G.GAME.blind:stay_flipped(G.exhaust, self, G.play)
            if not stay_flipped then
                stay_flipped = G.GAME and G.GAME.blindassist and G.GAME.blindassist:stay_flipped(G.exhaust, self, G.play)
            end
            if G.GAME.modifiers.flipped_cards and to == G.hand then
                if pseudorandom(pseudoseed('flipped_card')) < 1/G.GAME.modifiers.flipped_cards then
                    stay_flipped = true
                end
            end
            G.discard:emplace(self, nil, stay_flipped)
        else
            print("an error has occured")
            play_sound('card1', 0.85 + percent*0.2/100, 0.6*(vol or 1))
            if self then drawn = true end
        end
        return true
        end
        )}))
        return
    end

    dissolve_colours = dissolve_colours or (type(self.destroyed) == 'table' and self.destroyed.colours) or nil
    dissolve_time_fac = dissolve_time_fac or (type(self.destroyed) == 'table' and self.destroyed.time) or nil
    local dissolve_time = 0.7*(dissolve_time_fac or 1)
    self.dissolve = 0
    self.dissolve_colours = dissolve_colours
        or {G.C.BLACK, G.C.ORANGE, G.C.RED, G.C.GOLD, G.C.JOKER_GREY}
    if not no_juice then self:juice_up() end
    if cardarea and cell_fix then self = cardarea:remove_card(self) end
    
    G.E_MANAGER:add_event(Event({
        trigger = 'before',
        delay = 0.1,
        func = function()
    local childParts = Particles(0, 0, 0,0, {
        timer_type = 'TOTAL',
        timer = 0.01*dissolve_time,
        scale = 0.1,
        speed = 2,
        lifespan = 0.7*dissolve_time,
        attach = self,
        colours = self.dissolve_colours,
        fill = true
    })
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        blockable = false,
        delay =  0.7*dissolve_time,
        func = (function() childParts:fade(0.3*dissolve_time) return true end)
    }))
    if not silent then 
        G.E_MANAGER:add_event(Event({
            blockable = false,
            func = (function()
                    play_sound('whoosh2', math.random()*0.2 + 0.9,0.5)
                    play_sound('crumple'..math.random(1, 5), math.random()*0.2 + 0.9,0.5)
                return true end)
        }))
    end
    G.E_MANAGER:add_event(Event({
        trigger = 'ease',
        blockable = false,
        ref_table = self,
        ref_value = 'dissolve',
        ease_to = 1,
        delay =  1*dissolve_time,
        func = (function(t) return t end)
    }))
    local drawn = nil
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        blockable = false,
        delay =  1.05*dissolve_time,
        func = (function()
        if self then 
            if cardarea then self = cardarea:remove_card(self) end
            if self then drawn = true end
            local stay_flipped = G.GAME and G.GAME.blind and G.GAME.blind:stay_flipped(G.exhaust, self, G.play)
            if G.GAME.modifiers.flipped_cards and to == G.hand then
                if pseudorandom(pseudoseed('flipped_card')) < 1/G.GAME.modifiers.flipped_cards then
                    stay_flipped = true
                end
            end
            G.exhaust:emplace(self, nil, stay_flipped)
        else
            print("an error has occured")
            if self then drawn = true end
        end
        if not mute and drawn then
            if cardarea == G.deck or cardarea == G.hand or cardarea == cardarea or cardarea == G.jokers or cardarea == G.consumeables or cardarea == G.discard then
                G.VIBRATION = G.VIBRATION + 0.6
            end
            play_sound('card1', 0.85 + #G.hand.cards*0.2, 0.6*1)
        end
        if true then
            G.exhaust:sort()
        end
        SMODS.drawn_cards = SMODS.drawn_cards or {}
        if self and self.playing_card then SMODS.drawn_cards[#SMODS.drawn_cards+1] = self end
        return true end)
    }))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        blockable = false,
        delay =  1.5*dissolve_time,
        func = (function() self:start_rematerialize() return true end)
    }))
    
return true
end
    }))
end
end


function Card:start_rematerialize(dissolve_colours, silent, timefac)
    local dissolve_time = 0.6*(timefac or 1)
    self.states.visible = true
    self.states.hover.can = false
    self.dissolve = 1
    self.dissolve_colours = dissolve_colours or
    (self.ability.set == 'Joker' and {G.C.RARITY[self.config.center.rarity]}) or
    (self.ability.set == 'Planet'  and {G.C.SECONDARY_SET.Planet}) or
    (self.ability.set == 'Tarot' and {G.C.SECONDARY_SET.Tarot}) or
    (self.ability.set == 'Spectral' and {G.C.SECONDARY_SET.Spectral}) or
    (self.ability.set == 'Booster' and {G.C.BOOSTER}) or
    (self.ability.set == 'Voucher' and {G.C.SECONDARY_SET.Voucher, G.C.CLEAR}) or 
    {G.C.GREEN}
    self:juice_up()
    self.children.particles = Particles(0, 0, 0,0, {
        timer_type = 'TOTAL',
        timer = 0.025*dissolve_time,
        scale = 0.25,
        speed = 3,
        lifespan = 0.7*dissolve_time,
        attach = self,
        colours = self.dissolve_colours,
        fill = true
    })
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        blockable = false,
        delay =  0.5*dissolve_time,
        func = (function() if self.children.particles then self.children.particles.max = 0 end return true end)
    }))
    G.E_MANAGER:add_event(Event({
        trigger = 'ease',
        blockable = false,
        ref_table = self,
        ref_value = 'dissolve',
        ease_to = 0,
        delay =  1*dissolve_time,
        func = (function(t) return t end)
    }))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        blockable = false,
        delay =  1.05*dissolve_time,
        func = (function() self.states.hover.can = true; if self.children.particles then self.children.particles:remove(); self.children.particles = nil end return true end)
    }))
end


function BLINDSIDE.calculate_burning_cards(context, cards_burned, scoring_hand)
    for i,card in ipairs(context.cardarea.cards) do
        local burned = nil
        --un-highlight all cards
        local in_scoring = scoring_hand and SMODS.in_scoring(card, context.scoring_hand)
        if scoring_hand and in_scoring and not (card.destroyed or card.burned) then 
            -- Use index of card in scoring hand to determine pitch
            local m = 1
            for j, _card in pairs(scoring_hand) do
                if card == _card then m = j break end
            end
            highlight_card(card,(m-0.999)/(#scoring_hand-0.998),'down')
        end

        -- context.burning_card calculations
        context.burn_card = card
        context.burning_card = nil
        if scoring_hand then
            if in_scoring then
                context.cardarea = G.play
                context.burning_card = card
            else
                context.cardarea = 'unscored'
            end
        end
        local flags = SMODS.calculate_context(context)
        if flags.remove then burned = true end

        -- TARGET: card destroyed

        if burned then
            card.burned = true
            cards_burned[#cards_burned+1] = card
        else
            card.burned = false
        end
    end
end


local cardareasortref = CardArea.sort

function CardArea:sort(method)
    self.config.sort = method or self.config.sort
    if self.config.sort == 'color desc' then
        table.sort(self.cards, function (a, b) return a:get_blind_nominal('color') > b:get_blind_nominal('color') end )
    elseif self.config.sort == 'color asc' then
        table.sort(self.cards, function (a, b) return a:get_blind_nominal('color') < b:get_blind_nominal('color') end )
    else
        cardareasortref(self, method)
    end
end

G.FUNCS.sort_hand_color = function(e)
    G.hand:sort('color desc')
    play_sound('paper1')
end

function BLINDSIDE.get_next_trinket(trinkets)
    trinkets = trinkets or {spawn = {}}
    for i=#trinkets+1, G.GAME.shop.joker_max do
    local _pool, _pool_key = get_current_pool('Joker')
        local center = pseudorandom_element(_pool, pseudoseed(_pool_key))
        local it = 1
        while center == 'UNAVAILABLE' or trinkets.spawn[center] do
            it = it + 1
            center = pseudorandom_element(_pool, pseudoseed(_pool_key..'_resample'..it))
        end

        trinkets[#trinkets+1] = center
        trinkets.spawn[center] = true
    end
    return trinkets
end

function get_next_trinket_key(_from_tag)
    local _pool, _pool_key = get_current_pool('Joker')
    if _from_tag then _pool_key = 'Joker_fromtag' end
    local center = pseudorandom_element(_pool, pseudoseed(_pool_key))
    local it = 1
    while center == 'UNAVAILABLE' do
        it = it + 1
        center = pseudorandom_element(_pool, pseudoseed(_pool_key..'_resample'..it))
    end

    return center
end

function BLINDSIDE.add_trinket_to_shop(key, dont_save)
    if key then assert(G.P_CENTERS[key], "Invalid trinket key: "..key) else
        key = get_next_voucher_key()
        if not dont_save then
            G.GAME.current_round.trinket.spawn[key] = true
            G.GAME.current_round.trinket[#G.GAME.current_round.trinket + 1] = key
        end
    end
    local card = Card(G.shop_jokers.T.x + G.shop_jokers.T.w/2,
    G.shop_jokers.T.y, G.CARD_W, G.CARD_H, G.P_CARDS.empty, G.P_CENTERS[key],{bypass_discovery_center = true, bypass_discovery_ui = true})
    create_shop_card_ui(card, 'Voucher', G.shop_jokers)
    card.shop_voucher = true
    card:start_materialize()
    G.shop_jokers:emplace(card)
    G.shop_jokers.config.card_limit = #G.shop_jokers.cards
    local price_mod = 1
    if G.GAME.used_vouchers.v_bld_souvenir then
        price_mod = price_mod - 0.33
    end
    if G.GAME.used_vouchers.v_bld_mementomori then
        price_mod = price_mod - 0.33
    end

    card.cost = math.floor(card.cost*price_mod)
    return card
end

G.FUNCS.shop_trinket_empty = function(e)
  if (G.shop_jokers and G.shop_jokers.cards and G.shop_jokers.cards[1]) then
    e.states.visible = false
  else
    e.states.visible = true
  end
end


function BLINDSIDE.poll_enhancement(args)
    args = args or {}
    local key = args.key or 'std_enhance'
    local mod = args.mod or 1
    local guaranteed = args.guaranteed or false
    local options1 = args.options or get_current_pool("Enhanced")

    local options = {}

    for key, value in pairs(options1) do
        options[key] = value
    end

    if args.colors then
        for i, k in ipairs(options) do
            if k.config and k.config.extra and k.config.extra.hues then
                local good = false
                for key, value in pairs(args.colors) do
                    if tableContains(value, k.config.extra.hues) then
                        good = true
                        break
                    end
                end
                if not good then
                    options[i] = 'UNAVAILABLE'
                end
            else
                options[i] = 'UNAVAILABLE'
            end
        end
    end
    local type_key = args.type_key or key.."type"..G.GAME.round_resets.ante
    key = key..G.GAME.round_resets.ante

    local rarity = 0

    local rand = pseudorandom(pseudoseed('bld_blind_rarity'))

    if args.shop then
        if G.GAME.modifiers.enable_shop_curses and pseudorandom(pseudoseed('bld_blind_curse_in_shop')) > 0.9 then
            rarity = 3
        else
            if (rand < 0.85) then
                rarity = 0
            elseif rand <= 1 then --(rand < 0.999) then
                rarity = 1
            else
                rarity = 2
            end
        end
    elseif args.cursed then
        rarity = 3
    elseif args.legendary then
        rarity = 4
    else
        if (rand < 0.85) then
        rarity = 0
        elseif rand <= 1 then --(rand < 0.999) then
            rarity = 1
        else
            rarity = 2
        end
    end

    local available_enhancements = {}
    local total_weight = 0
    for k, v in ipairs(options) do
        if v ~= "UNAVAILABLE" then
            local enhance_option = {}
            local skip = false
            if type(k) == 'string' then
                assert(G.P_CENTERS[v], ("Could not find enhancement \"%s\"."):format(v))
                local wght = G.P_CENTERS[v].weight or 5
                local multicolor = #G.P_CENTERS[v].config.extra.hues > 1
                local good_rarity = (wght == 5 and rarity == 0) or (wght == 3 and rarity == 1) or (wght == 1 and rarity == 2) or (wght == 67 and rarity == 3) or (wght == 99 and rarity == 4)
                local good_colors = rarity == 0 or (multicolor and rand >= 0.95) or (not multicolor and rand < 0.95) or rarity == 3 or rarity == 4

                if good_colors and good_rarity then
                    enhance_option = { key = v, weight = 5 }
                else
                    skip = true
                end
            elseif type(v) == 'table' then
                assert(G.P_CENTERS[v.key], ("Could not find enhancement \"%s\"."):format(v.key))
                local wght = v.weight or 5
                local multicolor = #v.config.extra.hues > 1
                local good_rarity = (wght == 5 and rarity == 0) or (wght == 3 and rarity == 1) or (wght == 1 and rarity == 2) or (wght == 67 and rarity == 3) or (wght == 99 and rarity == 4)
                local good_colors = rarity == 0 or (multicolor and rand >= 0.95) or (not multicolor and rand < 0.95) or rarity == 3 or rarity == 4

                if good_colors and good_rarity then
                    enhance_option = { key = v.key, weight = 5 }
                else
                    skip = true
                end
            end
            if not skip then
                table.insert(available_enhancements, enhance_option)
                total_weight = total_weight + enhance_option.weight
            end
        end
    end
    total_weight = total_weight + (total_weight / 40 * 60) -- set base rate to 40%

    local type_weight = 0 -- modified weight total
    for _,v in ipairs(available_enhancements) do
        v.weight = G.P_CENTERS[v.key].get_weight and G.P_CENTERS[v.key]:get_weight() or v.weight
        type_weight = type_weight + v.weight
    end

    local enhance_poll = pseudorandom(pseudoseed(key))
    if enhance_poll > 1 - (type_weight*mod / total_weight) or guaranteed then -- is an enhancement selected
        local seal_type_poll = pseudorandom(pseudoseed(type_key)) -- which enhancement is selected
        local weight_i = 0
        for k, v in ipairs(available_enhancements) do
            weight_i = weight_i + v.weight
            if seal_type_poll > 1 - (weight_i / type_weight) then
                return v.key
            end
        end
    end
end

  G.FUNCS.reroll_small = function(e) 
  if not G.blind_select_opts then
      G.GAME.round_resets.boss_rerolled = true
      if not G.from_boss_tag then ease_dollars(-10) end
      G.from_boss_tag = nil
      G.GAME.round_resets.blind_choices.Small = get_new_small()
      for i = 1, #G.GAME.tags do
          if G.GAME.tags[i]:apply_to_run({type = 'new_blind_choice'}) then break end
      end
      return true
  end
    stop_use()
    G.GAME.round_resets.boss_rerolled = true
    if not G.from_boss_tag then ease_dollars(-10) end
    G.from_boss_tag = nil
    G.CONTROLLER.locks.boss_reroll = true
    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = function()
          play_sound('other1')
          G.blind_select_opts.small:set_role({xy_bond = 'Weak'})
          G.blind_select_opts.small.alignment.offset.y = 20
          return true
        end
      }))
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.3,
      func = (function()
        local par = G.blind_select_opts.small.parent
        G.GAME.round_resets.blind_choices.Small = get_new_small()

        G.blind_select_opts.small:remove()
        G.blind_select_opts.small = UIBox{
          T = {par.T.x, 0, 0, 0, },
          definition =
            {n=G.UIT.ROOT, config={align = "cm", colour = G.C.CLEAR}, nodes={
              UIBox_dyn_container({create_UIBox_blind_choice('Small')},false,get_blind_main_colour('Small'), mix_colours(G.C.BLACK, get_blind_main_colour('Small'), 0.8))
            }},
          config = {align="bmi",
                    offset = {x=0,y=G.ROOM.T.y + 9},
                    major = par,
                    xy_bond = 'Weak'
                  }
        }
        par.config.object = G.blind_select_opts.small
        par.config.object:recalculate()
        G.blind_select_opts.small.parent = par
        G.blind_select_opts.small.alignment.offset.y = 0
        
        G.E_MANAGER:add_event(Event({blocking = false, trigger = 'after', delay = 0.5,func = function()
            G.CONTROLLER.locks.boss_reroll = nil
            return true
          end
        }))

        save_run()
        for i = 1, #G.GAME.tags do
          if G.GAME.tags[i]:apply_to_run({type = 'new_blind_choice'}) then break end
        end
          return true
      end)
    }))
  end

  G.FUNCS.reroll_big = function(e) 
  if not G.blind_select_opts then
      G.GAME.round_resets.boss_rerolled = true
      if not G.from_boss_tag then ease_dollars(-10) end
      G.from_boss_tag = nil
      G.GAME.round_resets.blind_choices.Big = get_new_big()
      for i = 1, #G.GAME.tags do
          if G.GAME.tags[i]:apply_to_run({type = 'new_blind_choice'}) then break end
      end
      return true
  end
    stop_use()
    G.GAME.round_resets.boss_rerolled = true
    if not G.from_boss_tag then ease_dollars(-10) end
    G.from_boss_tag = nil
    G.CONTROLLER.locks.boss_reroll = true
    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = function()
          play_sound('other1')
          G.blind_select_opts.big:set_role({xy_bond = 'Weak'})
          G.blind_select_opts.big.alignment.offset.y = 20
          return true
        end
      }))
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.3,
      func = (function()
        local par = G.blind_select_opts.big.parent
        G.GAME.round_resets.blind_choices.Big = get_new_big()

        G.blind_select_opts.big:remove()
        G.blind_select_opts.big = UIBox{
          T = {par.T.x, 0, 0, 0, },
          definition =
            {n=G.UIT.ROOT, config={align = "cm", colour = G.C.CLEAR}, nodes={
              UIBox_dyn_container({create_UIBox_blind_choice('Big')},false,get_blind_main_colour('Big'), mix_colours(G.C.BLACK, get_blind_main_colour('Big'), 0.8))
            }},
          config = {align="bmi",
                    offset = {x=0,y=G.ROOM.T.y + 9},
                    major = par,
                    xy_bond = 'Weak'
                  }
        }
        par.config.object = G.blind_select_opts.big
        par.config.object:recalculate()
        G.blind_select_opts.big.parent = par
        G.blind_select_opts.big.alignment.offset.y = 0
        
        G.E_MANAGER:add_event(Event({blocking = false, trigger = 'after', delay = 0.5,func = function()
            G.CONTROLLER.locks.boss_reroll = nil
            return true
          end
        }))

        save_run()
        for i = 1, #G.GAME.tags do
          if G.GAME.tags[i]:apply_to_run({type = 'new_blind_choice'}) then break end
        end
          return true
      end)
    }))
  end

  local refGameupdate = Game.update_hand_played
  function Game:update_hand_played(dt)
    if G.playing_cards and type(G.playing_cards) == 'table' and #G.playing_cards > 0 and #G.playing_cards <= 18 then
        unlock_card(G.P_CENTERS['b_bld_buttondispenser'])
    end

    if G.GAME.selected_back.effect.center.config.extra and G.GAME.selected_back.effect.center.config.extra.blindside then
    if self.buttons then self.buttons:remove(); self.buttons = nil end
    if self.shop then self.shop:remove(); self.shop = nil end

    if not G.STATE_COMPLETE then
        G.STATE_COMPLETE = true
        G.E_MANAGER:add_event(Event({
            trigger = 'immediate',
            func = function()
        if (G.GAME.chips - G.GAME.blind.basechips*G.GAME.blind.mult >= 0 and not next(SMODS.find_card('j_bld_breadboard'))) or G.GAME.current_round.hands_left < 1 then
            G.STATE = G.STATES.NEW_ROUND
        else
            G.STATE = G.STATES.DRAW_TO_HAND
        end
        G.STATE_COMPLETE = false
        return true
        end
        }))
    end
else
    refGameupdate(self, dt)
    end
end

function upgrade_blinds(cards, flipped, silent)
    if silent then
        for key, card in pairs(cards) do
            if card.config and card.config.center and card.config.center.upgrade then
                SMODS.Stickers['bld_upgrade']:apply(card, true)
            else
                print("no upgrade function")
            end
        end
        return
    end

    if not flipped then
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.4,func = function() 
            for k, card in ipairs(cards) do
                card:flip()
                play_sound('tarot1')
                card:juice_up(0.3, 0.3)
            end 
        return true end }))
    end
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.4,func = function() 
            for k, card in ipairs(cards) do
                play_sound('bld_clang', 1.1, 1)
                card:juice_up(0.8, 0.5)
            end
        return true end }))
        delay(0.4)
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.4,func = function()
            for k, card in ipairs(cards) do
                play_sound('bld_clang', 0.9, 0.8)
                card:juice_up(0.8, 0.5)
            end 
        return true end }))
        delay(0.3)
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.4,func = function()
            for k, card in ipairs(cards) do
                play_sound('bld_clang', 1, 0.9)
                card:juice_up(0.8, 0.5)
            end
        return true end }))
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.2,func = function() 
        for k, card in ipairs(cards) do
            if card and card.config and card.config.center and card.config.center.upgrade then
                SMODS.Stickers['bld_upgrade']:apply(card, true)
            else
                print("no upgrade function")
            end
        end
        return true end }))
    if not flipped then
        delay(0.3)
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.4,func = function()
            for k, card in ipairs(cards) do
                card:flip();play_sound('tarot2', 1, 0.6)
                card:juice_up(0.3, 0.3)
            end 
        return true end }))
    end
        --play_sound('seal')
end

function choose_stuff(pool, number, seed)
    local chosen_stuff = {}
    local choices = {}
    for key, value in pairs(pool) do
        table.insert(choices, value)
    end
    while #chosen_stuff < number and #choices > 0 do
        local choices2 = {}
        for key, value in pairs(choices) do
            table.insert(choices2, value)
        end

        local card = pseudorandom_element(choices, pseudoseed(seed))
        table.insert(chosen_stuff, card)

        choices = {}
        for key, value in pairs(choices2) do
            if value ~= card then
                table.insert(choices, value)
            end
        end
    end

    return chosen_stuff
end

function destroy_blinds_and_calc(destroyed_cards, card)
    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
        play_sound('tarot1')
        card:juice_up(0.3, 0.5)
        return true end }))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.2,
        func = function() 
            for i=#destroyed_cards, 1, -1 do
                local card = destroyed_cards[i]
                if card.ability.name == 'Glass Card' then 
                    card:shatter()
                else
                    card:start_dissolve(nil, i == #destroyed_cards)
                end
            end
            return true end }))
    delay(0.3)
    for i = 1, #G.jokers.cards do
        G.jokers.cards[i]:calculate_joker({remove_playing_cards = true, removed = destroyed_cards})
    end
end

function BLINDSIDE.find_and_juice_duplicates(area)
    local cards = area.cards

    for i,c1 in ipairs(cards) do

        for j,c2 in ipairs(cards) do
           
            if i ~= j and c1 == c2 then
                juice_card(c1)
            end
        end
    end
end

function BLINDSIDE.alert_debuff(joker, add, text)
    if add and not joker.boss_warning_text then
        joker.get_loc_debuff_text = function ()
            return text
        end
        joker.boss_warning_text = UIBox{
        definition = 
            {n=G.UIT.ROOT, config = {align = 'cm', colour = G.C.CLEAR, padding = 0.2}, nodes={
            {n=G.UIT.R, config = {align = 'cm', maxw = 1}, nodes={
                {n=G.UIT.O, config={object = DynaText({scale = 0.7, string = text, maxw = 9, colours = {G.C.WHITE},float = true, shadow = true, silent = true, pop_in = 0, pop_in_rate = 6})}},
            }},
            --[[{n=G.UIT.R, config = {align = 'cm', maxw = 1}, nodes={
                {n=G.UIT.O, config={func = "update_blind_debuff_text", object = DynaText({scale = 0.6, string = text, maxw = 9, colours = {G.C.WHITE},float = true, shadow = true, silent = true, pop_in = 0, pop_in_rate = 6})}},
            }}]]
        }},
        config = {
            align = 'cm',
            offset ={x=0,y=-3.1}, 
            major = G.play,
            }
        }
        joker.boss_warning_text.attention_text = true
        joker.boss_warning_text.states.collide.can = false
        if SMODS.hand_debuff_source then
            SMODS.hand_debuff_source:juice_up(0.05, 0.1)
        else
            G.GAME.blind.children.animatedSprite:juice_up(0.05, 0.02)
        end
        play_sound('chips1', math.random()*0.1 + 0.55, 0.12)
    elseif not add then
        if joker.boss_warning_text then 
            joker.boss_warning_text:remove()
            joker.boss_warning_text = nil
        end
    end
end

function BLINDSIDE.get_first_enhancement_with_exact_colors(colors)
    for key, value in pairs(G.P_CENTER_POOLS.bld_obj_blindcard_generate) do
        -- basically checks table equality
        local good = true
        for key, color in pairs(colors) do
            if not tableContains(color, value.config.extra.hues) then
                good = false
                break
            end
        end
        if good then
            for key, color in pairs(value.config.extra.hues) do
                if not tableContains(color, colors) then
                    good = false
                    break
                end
            end
            if good then
                return value
            end
        end
    end
end

function BLINDSIDE.rescore_card(card, context)
        if card and context then
        context.main_scoring = true
        local effects = { eval_card(card, context) }
        SMODS.calculate_quantum_enhancements(card, effects, context)
        context.main_scoring = nil
        context.individual = true
        context.other_card = card

        if next(effects) then
            SMODS.calculate_card_areas('jokers', context, effects, { main_scoring = true })
            SMODS.calculate_card_areas('individual', context, effects, { main_scoring = true })
        end

        local flags = SMODS.trigger_effects(effects, card)

        context.individual = nil
        context.other_card = nil
        card.lucky_trigger = nil
        end
end

-- borrowed from lucky rabbit
local shuffle_ref = CardArea.shuffle
function CardArea:shuffle(_seed, reshuffle)
    reshuffle = reshuffle or false
    local g = shuffle_ref(self, _seed)
    if self == G.deck then
        local priorities = {}
        local others = {}
        for k, v in pairs(self.cards) do
            if (v.seal == 'bld_ruin' and not reshuffle) or (v.ability.extra and v.ability.extra.upgraded and G.GAME.used_vouchers["v_bld_thingamajig"] and reshuffle) then
                table.insert(priorities, v)
            else
                table.insert(others, v)
            end
        end
        for _, card in ipairs(priorities) do
            table.insert(others, card)
        end
        self.cards = others
        self:set_ranks()
    end
    return g
end

G.FUNCS.blind_reroll_boss_button = function(e)
    if ((G.GAME.round_resets.hands) - 1 > 0) and
      (G.GAME.used_vouchers["v_bld_film_reel"] or
      (G.GAME.used_vouchers["v_bld_clapper"])) then 
        e.config.colour = G.C.RED
        e.config.button = 'blind_reroll_boss'
        e.children[1].children[1].config.shadow = true
        if e.children[2] then e.children[2].children[1].config.shadow = true end 
    else
      e.config.colour = G.C.UI.BACKGROUND_INACTIVE
      e.config.button = nil
      e.children[1].children[1].config.shadow = false
      if e.children[2] then e.children[2].children[1].config.shadow = false end 
    end
  end

  G.FUNCS.blind_reroll_boss = function(e) 
  if not G.blind_select_opts then
      G.GAME.round_resets.boss_rerolled = true
      if not G.from_boss_tag then 
        ease_hands_played(-1)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - 1
        G.GAME.round_resets.hands_removed = (G.GAME.round_resets.hands_removed or 0) + 1
       end
      G.from_boss_tag = nil
      G.GAME.round_resets.blind_choices.Boss = get_new_boss()
      for i = 1, #G.GAME.tags do
          if G.GAME.tags[i]:apply_to_run({type = 'new_blind_choice'}) then break end
      end
      return true
  end
    if G.GAME.used_vouchers["v_bld_film_reel"] and G.GAME.round_resets.blind_states.Small ~= 'Defeated' then
        G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.3,
        func = (function()
            local par = G.blind_select_opts.small.parent
            G.GAME.round_resets.blind_choices.Small = get_new_small()

            G.blind_select_opts.small:remove()
            G.blind_select_opts.small = UIBox{
            T = {par.T.x, 0, 0, 0, },
            definition =
                {n=G.UIT.ROOT, config={align = "cm", colour = G.C.CLEAR}, nodes={
                UIBox_dyn_container({create_UIBox_blind_choice('Small')},false,get_blind_main_colour('Small'), mix_colours(G.C.BLACK, get_blind_main_colour('Small'), 0.8))
                }},
            config = {align="bmi",
                        offset = {x=0,y=G.ROOM.T.y + 9},
                        major = par,
                        xy_bond = 'Weak'
                    }
            }
            par.config.object = G.blind_select_opts.small
            par.config.object:recalculate()
            G.blind_select_opts.small.parent = par
            G.blind_select_opts.small.alignment.offset.y = 0
            
            G.E_MANAGER:add_event(Event({blocking = false, trigger = 'after', delay = 0.5,func = function()
                G.CONTROLLER.locks.boss_reroll = nil
                return true
            end
            }))

            save_run()
            return true
        end)
        }))
    end
    if G.GAME.used_vouchers["v_bld_film_reel"] and G.GAME.round_resets.blind_states.Big ~= 'Defeated' then
        G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.3,
        func = (function()
            local par = G.blind_select_opts.big.parent
            G.GAME.round_resets.blind_choices.Big = get_new_big()

            G.blind_select_opts.big:remove()
            G.blind_select_opts.big = UIBox{
            T = {par.T.x, 0, 0, 0, },
            definition =
                {n=G.UIT.ROOT, config={align = "cm", colour = G.C.CLEAR}, nodes={
                UIBox_dyn_container({create_UIBox_blind_choice('Big')},false,get_blind_main_colour('Big'), mix_colours(G.C.BLACK, get_blind_main_colour('Big'), 0.8))
                }},
            config = {align="bmi",
                        offset = {x=0,y=G.ROOM.T.y + 9},
                        major = par,
                        xy_bond = 'Weak'
                    }
            }
            par.config.object = G.blind_select_opts.big
            par.config.object:recalculate()
            G.blind_select_opts.big.parent = par
            G.blind_select_opts.big.alignment.offset.y = 0
            
            G.E_MANAGER:add_event(Event({blocking = false, trigger = 'after', delay = 0.5,func = function()
                G.CONTROLLER.locks.boss_reroll = nil
                return true
            end
            }))

            save_run()
            return true
        end)
        }))
    end
    stop_use()
    G.GAME.round_resets.boss_rerolled = true
      if not G.from_boss_tag then 
        ease_hands_played(-1)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - 1
        G.GAME.round_resets.hands_removed = (G.GAME.round_resets.hands_removed or 0) + 1
       end
    G.from_boss_tag = nil
    G.CONTROLLER.locks.boss_reroll = true
    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = function()
          play_sound('other1')
          G.blind_select_opts.boss:set_role({xy_bond = 'Weak'})
          G.blind_select_opts.boss.alignment.offset.y = 20
          return true
        end
      }))
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.3,
      func = (function()
        local par = G.blind_select_opts.boss.parent
        G.GAME.round_resets.blind_choices.Boss = get_new_boss()

        G.blind_select_opts.boss:remove()
        G.blind_select_opts.boss = UIBox{
          T = {par.T.x, 0, 0, 0, },
          definition =
            {n=G.UIT.ROOT, config={align = "cm", colour = G.C.CLEAR}, nodes={
              UIBox_dyn_container({create_UIBox_blind_choice('Boss')},false,get_blind_main_colour('Boss'), mix_colours(G.C.BLACK, get_blind_main_colour('Boss'), 0.8))
            }},
          config = {align="bmi",
                    offset = {x=0,y=G.ROOM.T.y + 9},
                    major = par,
                    xy_bond = 'Weak'
                  }
        }
        par.config.object = G.blind_select_opts.boss
        par.config.object:recalculate()
        G.blind_select_opts.boss.parent = par
        G.blind_select_opts.boss.alignment.offset.y = 0
        
        G.E_MANAGER:add_event(Event({blocking = false, trigger = 'after', delay = 0.5,func = function()
            G.CONTROLLER.locks.boss_reroll = nil
            return true
          end
        }))

        save_run()
        for i = 1, #G.GAME.tags do
          if G.GAME.tags[i]:apply_to_run({type = 'new_blind_choice'}) then break end
        end
          return true
      end)
    }))
  end

--HOOK FOR CROSSMOD
function BLINDSIDE.get_blindside_editions()
    return {'e_bld_enameled', 'e_bld_finish', 'e_bld_mint'}
end

----------------------------------------------
------------MOD CODE END----------------------

