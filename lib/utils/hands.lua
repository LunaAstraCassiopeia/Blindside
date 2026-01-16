    SMODS.Suit{
        key = "Red",
        card_key = "Red",
        atlas = 'bld_blindrank',
        lc_ui_atlas = 'bld_color',
        lc_colour = HEX('EA6158'),
        hc_colour = HEX('EA6158'),
        pos = {y= 0},
        ui_pos = {x = 0, y = 0},
        in_pool = function(self, args)
            return false
        end
    }
    SMODS.Suit{
        key = "Green",
        card_key = "Green",
        atlas = 'bld_blindrank',
        lc_ui_atlas = 'bld_color',
        lc_colour = HEX('56A786'),
        hc_colour = HEX('56A786'),
        pos = {y= 0},
        ui_pos = {x = 2, y = 0},
        in_pool = function(self, args)
            return false
        end
    }
    SMODS.Suit{
        key = "Blue",
        card_key = "Blue",
        atlas = 'bld_blindrank',
        lc_ui_atlas = 'bld_color',
        lc_colour = HEX('39B1FC'),
        hc_colour = HEX('39B1FC'),
        pos = {y= 0},
        ui_pos = {x = 3, y = 0},
        in_pool = function(self, args)
            return false
        end
    }
    SMODS.Suit{
        key = "Yellow",
        card_key = "Yellow",
        atlas = 'bld_blindrank',
        lc_ui_atlas = 'bld_color',
        lc_colour = HEX('FDA200'),
        hc_colour = HEX('FDA200'),
        pos = {y= 0},
        ui_pos = {x = 1, y = 0},
        in_pool = function(self, args)
            return false
        end
    }
    SMODS.Suit{
        key = "Purple",
        card_key = "Purple",
        atlas = 'bld_blindrank',
        lc_ui_atlas = 'bld_color',
        lc_colour = HEX('8A71E1'),
        hc_colour = HEX('8A71E1'),
        pos = {y= 0},
        ui_pos = {x = 0, y = 1},
        in_pool = function(self, args)
            return false
        end
    }
    SMODS.Suit{
        key = "Faded",
        card_key = "Faded",
        atlas = 'bld_blindrank',
        lc_ui_atlas = 'bld_color',
        lc_colour = HEX('4F6367'),
        hc_colour = HEX('4F6367'),
        pos = {y= 0},
        ui_pos = {x = 1, y = 1},
        in_pool = function(self, args)
            return false
        end
    }

    function has_group_of(num, hands)
        if num <= 5 and next(hands['bld_blind_flush']) then
            return true
        end

        if num <= 4 and next(hands['bld_blind_4oak']) then
            return true
        end

        if num <= 3 and (next(hands['bld_blind_3oak']) or next(hands['bld_blind_fullhouse'])) then
            return true
        end

        if num <= 2 and next(hands['bld_blind_2oak']) then
            return true
        end

        return false
    end
    
    function get_blind_groups(num, hand, or_more)
        local vals = {}
        local fadeds = {}
        local highest = {}
        local fadedblind = false
        local fadedsOnly = true
        if next(SMODS.find_card("j_bld_insignia")) then
            fadedblind = true
        end
        if fadedblind then
            for i=#hand, 1, -1 do
                if hand[i]:is_color("Faded") and fadedblind then
                    table.insert(fadeds, hand[i])
                end
            end
        end
        for i=#hand, 1, -1 do
            if not (hand[i]:is_color("Faded") and fadedblind) then
                fadedsOnly = false
                local curr = {}
                table.insert(curr, hand[i])
                for j=1, #hand do
                    local i_enh = hand[i].config.center.key
                    local j_enh = hand[j].config.center.key
                    if i_enh == j_enh and i ~= j and not (not hand[j]:is_color("Faded") and fadedblind) then
                        table.insert(curr, hand[j])
                    end
                end
                if #highest < #curr then
                    highest = curr
                end
                if or_more and (#curr >= num) or (#curr == num) then
                    vals[curr[1].config.center.key] = curr
                end
            end
        end
        for i=1, #fadeds do
            table.insert(highest, fadeds[i])
        end
        if (or_more and (#fadeds >= num) or (#fadeds == num)) and fadedsOnly then
            vals[20] = fadeds
        end
        if (or_more and (#highest >= num) or (#highest == num)) and not fadedsOnly then
            vals[highest[1].config.center.key] = highest
        end
        local ret = {}
        for k, v in pairs(vals) do
            table.insert(ret, vals[k])
        end
        return ret
    end

    function get_contained_in_down(hand)
        local part_4ob = get_X_blind_same(4, hand)
        local part_3ob = get_X_blind_same(3, hand)
        local part_pair = get_X_blind_same(2, hand)

        local all_combos = {}

        for _, value in pairs(part_pair) do
            table.insert(all_combos, value)
        end
        for _, value in pairs(part_3ob) do
            table.insert(all_combos, value)
        end
        for _, value in pairs(part_4ob) do
            table.insert(all_combos, value)
        end

        local overlaps = {}
        for _, pair1 in pairs(all_combos) do
            for _, pair2 in pairs(all_combos) do
                if pair1 ~= pair2 then
                    for _, card1 in pairs(pair1) do
                        for _, card2 in pairs(pair2) do
                            if card1 == card2 then
                                for _, value in pairs(pair1) do
                                    if not tableContains(value, overlaps) then
                                        table.insert(overlaps, value)
                                    end
                                end
                                for _, value in pairs(pair2) do
                                    if not tableContains(value, overlaps) then
                                        table.insert(overlaps, value)
                                    end
                                end
                                break
                            end
                        end
                    end
                end
            end
        end

        return overlaps
    end

    function get_X_blind_same(num, hand, color_data, get_all_pairs)
        local colors = {"Red", "Green", "Blue", "Purple", "Yellow", "Faded"}

        local all_pairs = {}
        local toks = {}
        local foks = {}
        local flush = {}

        local function considered_colors(blind)
            local considered = {}
            for i = 1, #colors do
                local c = colors[i]
                if blind:is_color(c) then
                    considered[#considered+1] = c
                end
            end
            return considered
        end

        local hand_colors = {}
        for i = 1, #hand do
            hand_colors[i] = considered_colors(hand[i])
        end

        local seen_pairs = {}
        local seen_toks = {}
        local seen_foks = {}
        local seen_flush = {}

        local function ensure_color_map(map, color)
            local cm = map[color]
            if not cm then
                cm = {}
                map[color] = cm
            end
            return cm
        end

        local function add_combination(size, indices, color)
            local target_list
            local seen_map

            if size == 2 then
                target_list = all_pairs
                seen_map = seen_pairs
            elseif size == 3 then
                target_list = toks
                seen_map = seen_toks
            elseif size == 4 then
                target_list = foks
                seen_map = seen_foks
            else
                target_list = flush
                seen_map = seen_flush
            end

            local color_map = ensure_color_map(seen_map, color)
            local key = table.concat(indices, ",")

            if color_map[key] then
                return
            end
            color_map[key] = true

            local blints = {}
            for i = 1, #indices do
                blints[i] = hand[indices[i]]
            end

            target_list[#target_list+1] = {blints, color}
        end

        local function generate_combinations_for_color(index_table, desired_size, color)
            local current = {}

            local function rec(start_idx, depth)
                if depth > desired_size then
                    add_combination(desired_size, current, color)
                    return
                end

                local remaining_needed = desired_size - depth + 1
                for i = start_idx, #index_table - remaining_needed + 1 do
                    current[depth] = index_table[i]
                    rec(i + 1, depth + 1)
                end
            end

            rec(1, 1)
        end

        local choices = {}

        local function walk(pos)
            if pos > #hand then
                local inverse_table = {}
                for idx = 1, #choices do
                    local color = choices[idx]
                    local bucket = inverse_table[color]
                    if not bucket then
                        bucket = {}
                        inverse_table[color] = bucket
                    end
                    bucket[#bucket+1] = idx
                end

                for color, index_table in pairs(inverse_table) do
                    local count = #index_table
                    if count > 1 then
                        for desired_size = 2, count do
                            generate_combinations_for_color(index_table, desired_size, color)
                        end
                    end
                end

                return
            end

            local blind_colors = hand_colors[pos]
            for i = 1, #blind_colors do
                choices[pos] = blind_colors[i]
                walk(pos + 1)
            end
        end

        walk(1)

        local ret = {}
        local source_list

        if num == 2 then
            source_list = all_pairs
        elseif num == 3 then
            source_list = toks
        elseif num == 4 then
            source_list = foks
        else
            source_list = flush
        end

        local max_size_by_color = {}
        local function register_max(list, size)
            for i = 1, #list do
                local entry = list[i]
                local color = entry[2]
                local cur = max_size_by_color[color]
                if not cur or size > cur then
                    max_size_by_color[color] = size
                end
            end
        end

        register_max(all_pairs, 2)
        register_max(toks, 3)
        register_max(foks, 4)
        register_max(flush, 5)

        local colors_so_far = {}

        local function color_seen(color)
            for i = 1, #colors_so_far do
                if colors_so_far[i] == color then return true end
            end
            return false
        end

        for i = 1, #source_list do
            local entry = source_list[i]
            local blints = entry[1]
            local color  = entry[2]
            local group_size = #blints

            if group_size == max_size_by_color[color] or (get_all_pairs and group_size == 2) then
                if color_data then
                    if not color_seen(color) then
                        colors_so_far[#colors_so_far+1] = color
                        ret[#ret+1] = blints
                    end
                else
                    ret[#ret+1] = blints
                end
            end
        end

        return ret
    end

    
    local get_cool_highest = get_highest
    function get_highest(hand)
            if G.GAME.selected_back.effect.center.config.extra then
                if G.GAME.selected_back.effect.center.config.extra.blindside then return {} end
            else
                return get_cool_highest(hand)
            end
    end

    SMODS.PokerHandPart{
        key = 'blind_flush',
        func = function(hand)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return {} end
                local ret = {}
                local four_fingers = SMODS.four_fingers('flush')
                local suits = {'Red', 'Green', 'Blue', 'Yellow', 'Purple', 'Faded'}
                if #hand < four_fingers then return ret else
                    for j = 1, #suits do
                    local t = {}
                    local suit = suits[j]
                    local flush_count = 0
                    for i=1, #hand do
                        if hand[i]:is_color(suit, nil, true) then flush_count = flush_count + 1;  t[#t+1] = hand[i] end 
                    end
                    if flush_count >= four_fingers then
                        table.insert(ret, t)
                        return ret
                    end
                    end
                    return {}
                end
            end
        end
    }
    SMODS.PokerHandPart {
        key = 'blind_highest',
        func = function(hand)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return {} end
                local highest = nil
                    highest = hand[1]
                if #hand > 0 then return {highest} else return {} end
            end
        end
    }

    SMODS.PokerHandPart {
        key = 'blind_down_prt',
        func = function(hand)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return {} end
                return get_contained_in_down(hand)
            end
        end
    }

    SMODS.PokerHandPart {
        key = 'blind_hand',
        func = function(hand)
            if G.GAME.selected_back.effect.center.config.extra then
            if not G.GAME.selected_back.effect.center.config.extra.blindside then return {} end
                return hand
            else
                return {}
            end
        end
    }

    SMODS.PokerHandPart {
        key = 'blind_all_pairs',
        func = function(hand)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return {} end
                local _2 = get_X_blind_same(2, hand, false, true)
                if not next(_2) then return {} end
                return {SMODS.merge_lists(_2)}
            else
                return {}
            end
        end
    }

    for i = 2, 5 do
        SMODS.PokerHandPart {
            key = 'blind_'..i,
            func = function(hand)
                if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return {} end
                return get_X_blind_same(i, hand, false)
                else
                    return {}
                end
            end
        }
    end

    for i = 2, 5 do
        SMODS.PokerHandPart {
            key = 'blind_paired_'..i,
            func = function(hand)
                if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return {} end
                return get_blind_groups(i, hand, true) 
                else
                    return {}
                end
            end
        }
    end

    function Card:is_color(suit, bypass_debuff, flush_calc)
        local allFaded = false
        if G.consumeables then
                if next(SMODS.find_card("c_bld_montain")) and SMODS.find_card("c_bld_montain")[1].ability.extra.active then
                    allFaded = true
                end
        end
        if G.GAME.blind.name == 'bl_bld_smeared' and not G.GAME.blind.disabled or G.GAME.blindassist.name == 'bl_bld_smeared' and not G.GAME.blindassist.disabled then
            allFaded = true
        end
        if not allFaded then
        if flush_calc then
        if self.seal and self.seal == "bld_wild" and suit ~= "Bleh" then
                return true
            end
            for i=1, #self.config.center.config.extra.hues do
                if (self.config.center.config.extra.hues[i] == suit  or "bld_" .. self.config.center.config.extra.hues[i] == suit or (self.config.center.config.extra.hues[i] == "Faded" and next(SMODS.find_card("j_bld_insignia")))) and suit ~= "Bleh" then
                    return true
                end
            end
            for i=1, #self.config.center.config.extra.hues do
                if (next(find_joker('j_bld_sunset')) and 
                (((self.config.center.config.extra.hues[i] == "Red" or "bld_" .. self.config.center.config.extra.hues[i] == "bld_Red") or (self.config.center.config.extra.hues[i] == "Yellow" or "bld_" .. self.config.center.config.extra.hues[i] == "bld_Yellow")) and
                 (suit == "Red" or suit == "Yellow" or suit == "bld_Red" or suit == "bld_Yellow"))) then
                    return true
                end
                if (next(find_joker('j_bld_sunset')) and 
                (((self.config.center.config.extra.hues[i] == "Blue" or "bld_" .. self.config.center.config.extra.hues[i] == "bld_Blue") or (self.config.center.config.extra.hues[i] == "Purple" or "bld_" .. self.config.center.config.extra.hues[i] == "bld_Purple")) and
                 (suit == "Blue" or suit == "Purple" or suit == "bld_Blue" or suit == "bld_Purple"))) then
                    return true
                end
            end
            return false
        else
            if self.seal and self.seal == "bld_wild" and not self.debuff and suit ~= "Bleh" then
                return true
            end
            for i=1, #self.config.center.config.extra.hues do
                if (self.config.center.config.extra.hues[i] == suit or "bld_" .. self.config.center.config.extra.hues[i] == suit or (self.config.center.config.extra.hues[i] == "Faded" and next(SMODS.find_card("j_bld_insignia")))) and suit ~= "Bleh"  then
                    return true
                end
            end
            for i=1, #self.config.center.config.extra.hues do
                if (next(find_joker('j_bld_sunset')) and 
                (((self.config.center.config.extra.hues[i] == "Red" or "bld_" .. self.config.center.config.extra.hues[i] == "bld_Red") or (self.config.center.config.extra.hues[i] == "Yellow" or "bld_" .. self.config.center.config.extra.hues[i] == "bld_Yellow")) and
                 (suit == "Red" or suit == "Yellow" or suit == "bld_Red" or suit == "bld_Yellow"))) then
                    return true
                end
                if (next(find_joker('j_bld_sunset')) and 
                (((self.config.center.config.extra.hues[i] == "Blue" or "bld_" .. self.config.center.config.extra.hues[i] == "bld_Blue") or (self.config.center.config.extra.hues[i] == "Purple" or "bld_" .. self.config.center.config.extra.hues[i] == "bld_Purple")) and
                 (suit == "Blue" or suit == "Purple" or suit == "bld_Blue" or suit == "bld_Purple"))) then
                    return true
                end
            end
            return false
        end
    else
        if "Faded" == suit  or "bld_Faded" == suit or (next(SMODS.find_card("j_bld_insignia")))then
            return true
        end
    end
    end
    function Card:get_color()
            return self.config.center.config.extra.hues[1]
        end
        

    SMODS.PokerHandPart{ -- Spectrum base (Referenced from SixSuits) (and then from Bunco)
    key = 'allin',
    func = function(hand)
        if G.GAME.selected_back.effect.center.config.extra then
        if not G.GAME.selected_back.effect.center.config.extra.blindside then return {} end
        local colorsuits = {}
        local colors = {'Red', 'Green', 'Blue', 'Yellow', 'Purple', 'Faded'}
        for _, v in ipairs(colors) do
            colorsuits[v] = true
        end

        local checker = false
        if next(find_joker('j_bld_checker', true)) then
            checker = true
        end

        -- < 5 hand cant be a spectrum
        if (#hand < 5 and not checker) or #hand < 3 then return {} end

        local nonwilds = {}
        for i = 1, #hand do
            local cardcolors = {}
            for _, v in ipairs(colors) do
                -- determine table of suits for each card (for future faster calculations)
                if hand[i]:is_color(v, nil, true) then
                    table.insert(cardcolors, v)
                end
            end
            -- if somehow no suits: spectrum is impossible
            if #cardcolors == 0 then
                return {}
            -- if only 1 suit: can be handled immediately
            elseif #cardcolors == 1 then
                -- if suit is already present, not a spectrum, otherwise remove suit from "not yet used suits"
                if colorsuits[cardcolors[1]] == false then return {} end
                colorsuits[cardcolors[1]] = false
            -- add all cards with 2-4 suits to a table to be looked at
            elseif #cardcolors < 8 then
                table.insert(nonwilds, cardcolors)
            end
        end

        -- recursive function for iterating over combinations
        local isSpectrum 
        isSpectrum = function(i, remaining)
            -- traversed all the cards, found spectrum
            if i == #nonwilds + 1 then
                return true
            end

            -- copy remaining suits
            local newremaining = {}
            for k, v in pairs(remaining) do
                newremaining[k] = v
            end

            -- for every suit of the current card: 
            for _, suit in ipairs(nonwilds[i]) do
                -- do nothing if suit has already been used
                if remaining[suit] == true then
                    -- use up suit on this card and check next card
                    newremaining[suit] = false
                    if isSpectrum(i + 1, newremaining) then
                        return true
                    end
                    -- reset suit before continuing
                    newremaining[suit] = true
                end
            end
            return false
        end

        -- begin iteration from first (not already considered) card
        if isSpectrum(1, colorsuits) then
            return {hand}
        else
            return {}
        end
    else
        return {}
    end
    end
}
SMODS.PokerHand{ -- high
    key = 'blind_high',
    visible = false,
    chips = 5,
    mult = 1,
    l_chips = 25,
    l_mult = 3,
    example = {
        { 'C_3',    true, enhancement = "m_bld_pot" },
        { 'C_3',    false, enhancement = "m_bld_bite" },
        { 'C_3',    false, enhancement = "m_bld_sharp" },
        { 'C_3',    false, enhancement = "m_bld_adder" },

    },
    evaluate = function(parts)
        return parts.bld_blind_highest
    end
}

SMODS.PokerHand{ -- 2oak
    key = 'blind_2oak',
    visible = false,
    chips = 20,
    mult = 2,
    l_chips = 20,
    l_mult = 3,
    example = {
        { 'C_3',    false, enhancement = "m_bld_fish" },
        { 'C_3',    true, enhancement = "m_bld_sharp" },
        { 'C_3',    true, enhancement = "m_bld_mark" },
        { 'C_3',    false, enhancement = "m_bld_needle" },
        { 'C_3',    false, enhancement = "m_bld_club" },

    },
    evaluate = function(parts)
        return #parts.bld_blind_2 >= 1 and parts.bld_blind_all_pairs or nil
    end,
}

SMODS.PokerHand{ -- 3oak
    key = 'blind_3oak',
    visible = false,
    chips = 25,
    mult = 3,
    l_chips = 15,
    l_mult = 3,
    example = {
        { 'C_3',    false, enhancement = "m_bld_adder" },
        { 'S_2',    true, enhancement = "m_bld_goad" },
        { 'S_2',    true, enhancement = "m_bld_bite" },
        { 'S_2',    true, enhancement = "m_bld_blend" },
        { 'C_3',    false, enhancement = "m_bld_pot" },
    },
    evaluate = function(parts)
        return parts.bld_blind_3
    end
}

SMODS.PokerHand{ -- 2pair
    key = 'blind_2pair',
    visible = false,
    chips = 30,
    mult = 3,
    l_chips = 15,
    l_mult = 2,
    example = {
        { 'C_3',    true, enhancement = "m_bld_wall" },
        { 'C_3',    true, enhancement = "m_bld_mouth" },
        { 'C_3',    true, enhancement = "m_bld_hook" },
        { 'C_3',    true, enhancement = "m_bld_tooth" },
        { 'C_3',    false, enhancement = "m_bld_adder" },
    },
    evaluate = function(parts)
        local diagnostic = true
        for key, value in pairs(parts.bld_blind_all_pairs) do
            if #value < 4 then
                diagnostic = false
            end
        end
        if (#parts.bld_blind_2 < 2 and #parts.bld_blind_3 == 0) or not diagnostic then return {} end
        return parts.bld_blind_all_pairs
    end,
}

SMODS.PokerHand{ -- flush
    key = 'blind_flush',
    visible = false,
    chips = 70,
    mult = 7,
    l_chips = 20,
    l_mult = 1,
    example = {
        { 'C_3',    true, enhancement = "m_bld_adder" },
        { 'S_2',    true, enhancement = "m_bld_eye" },
        { 'S_2',    true, enhancement = "m_bld_deck" },
        { 'S_2',    true, enhancement = "m_bld_eye" },
        { 'C_3',    true, enhancement = "m_bld_pile" },
    },
    evaluate = function(parts)
        return parts.bld_blind_flush
    end
}

SMODS.PokerHand{ -- full house
    key = 'blind_fullhouse',
    visible = false,
    chips = 40,
    mult = 4,
    l_chips = 20,
    l_mult = 1,
    example = {
        { 'C_3',    true, enhancement = "m_bld_arm" },
        { 'S_2',    true, enhancement = "m_bld_mouth" },
        { 'S_2',    true, enhancement = "m_bld_wall" },
        { 'S_2',    true, enhancement = "m_bld_wedge" },
        { 'C_3',    true, enhancement = "m_bld_flip" },
    },
    evaluate = function(parts)
        local diagnostic = true
        for key, value in pairs(parts.bld_blind_all_pairs) do
            if #value < 5 then
                diagnostic = false
            end
        end
        -- if it has a down then it's not a full house
        if (#parts.bld_blind_down_prt > 0) or (#parts.bld_blind_3 == 0) or (#parts.bld_blind_3 < 2 and #parts.bld_blind_2 == 0) or not diagnostic then return {} end
        return parts.bld_blind_all_pairs
    end,
}

SMODS.PokerHand{ -- Spectrum (Referenced from SixSuits) (ty Bunco)
    key = 'raise',
    visible = false,
    chips = 70,
    mult = 6,
    l_chips = 25,
    l_mult = 1,
    example = {
        { 'S_2',    true, enhancement = "m_bld_adder" },
        { 'D_7',    true, enhancement = "m_bld_psychic" },
        { 'C_3',    true, enhancement = "m_bld_arm" },
        { 'S_2',    true, enhancement = "m_bld_wheel" },
        { 'H_K',    true, enhancement = "m_bld_hook" },
    },
    evaluate = function(parts)
        return parts.bld_allin
    end
}

SMODS.PokerHand{ -- four of a kind
    key = 'blind_4oak',
    visible = false,
    chips = 50,
    mult = 5,
    l_chips = 15,
    l_mult = 2,
    example = {
        { 'C_3',    true, enhancement = "m_bld_plant" },
        { 'S_2',    true, enhancement = "m_bld_wheel" },
        { 'S_2',    true, enhancement = "m_bld_serpent" },
        { 'S_2',    true, enhancement = "m_bld_cell" },
        { 'C_3',    false, enhancement = "m_bld_sharp" },
    },
    evaluate = function(parts)
        return #parts.bld_blind_4 > 0 and parts.bld_blind_all_pairs or nil
    end,
}

SMODS.PokerHand{ -- down
    key = 'blind_down',
    visible = false,
    chips = 25,
    mult = 2,
    l_chips = 25,
    l_mult = 3,
    example = {
        { 'C_3',    true, enhancement = "m_bld_pot" },
        { 'S_2',    true, enhancement = "m_bld_spear" },
        { 'S_2',    true, enhancement = "m_bld_sharp" },
        { 'S_2',    false, enhancement = "m_bld_bite" },
        { 'C_3',    false, enhancement = "m_bld_adder" },
    },
    evaluate = function(parts)
        return #parts.bld_blind_down_prt > 0 and parts.bld_blind_all_pairs or nil
    end
}

SMODS.PokerHand{ -- double down
    key = 'blind_double_down',
    visible = false,
    chips = 35,
    mult = 4,
    l_chips = 20,
    l_mult = 2,
    example = {
        { 'C_3',    true, enhancement = "m_bld_pot" },
        { 'S_2',    true, enhancement = "m_bld_joy" },
        { 'S_2',    true, enhancement = "m_bld_adder" },
        { 'S_2',    true, enhancement = "m_bld_adder" },
        { 'C_3',    false, enhancement = "m_bld_bite" },
    },
    evaluate = function(parts)
        return (#parts.bld_blind_down_prt > 0 and (#parts.bld_blind_2 >= 3 or #parts.bld_blind_3 >= 1) and #parts.bld_blind_hand >= 4) and parts.bld_blind_all_pairs or nil
    end
}

SMODS.PokerHand{ -- triple down
    key = 'blind_triple_down',
    visible = false,
    chips = 50,
    mult = 5,
    l_chips = 25,
    l_mult = 1,
    example = {
        { 'C_3',    true, enhancement = "m_bld_adder" },
        { 'S_2',    true, enhancement = "m_bld_adder" },
        { 'S_2',    true, enhancement = "m_bld_path" },
        { 'S_2',    true, enhancement = "m_bld_sharp" },
        { 'C_3',    true, enhancement = "m_bld_sharp" },
    },
    evaluate = function(parts)
        return (#parts.bld_blind_down_prt > 0 and #parts.bld_blind_3 >= 2 and #parts.bld_blind_hand >= 5) and parts.bld_blind_all_pairs or nil
    end
}

SMODS.PokerHand{ -- quadruple down
    key = 'blind_quadruple_down',
    visible = false,
    chips = 60,
    mult = 6,
    l_chips = 30,
    l_mult = 1,
    example = {
        { 'C_3',    true, enhancement = "m_bld_sharp" },
        { 'S_2',    true, enhancement = "m_bld_thorn" },
        { 'S_2',    true, enhancement = "m_bld_flip" },
        { 'S_2',    true, enhancement = "m_bld_flip" },
        { 'C_3',    true, enhancement = "m_bld_flip" },
    },
    evaluate = function(parts)
        return (#parts.bld_blind_down_prt > 0 and #parts.bld_blind_4 >= 1 and #parts.bld_blind_hand >= 5) and parts.bld_blind_all_pairs or nil
    end
}

SMODS.PokerHand{ -- five of a kind
    key = 'allin',
    visible = false,
    chips = 120,
    mult = 12,
    l_chips = 30,
    l_mult = 1,
    example = {
        { 'C_3',    true, enhancement = "m_bld_psychic" },
        { 'C_3',    true, enhancement = "m_bld_psychic" },
        { 'C_3',    true, enhancement = "m_bld_psychic" },
        { 'C_3',    true, enhancement = "m_bld_psychic" },
        { 'C_3',    true, enhancement = "m_bld_psychic" },
    },
    evaluate = function(parts)
        return parts.bld_blind_paired_5
    end
}
----------------------------------------------
------------MOD CODE END----------------------
