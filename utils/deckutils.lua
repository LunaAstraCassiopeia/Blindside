--- Sets up the deck by changing everything to known blinds and obeying the rules of Big Blind and Small Blind.
--- @param removed_hues hue[] Hues to remove the default blinds for.
--- @param blinds string[] Blinds to add.
--- @param curses? string[] Curses to add if starting curses are enabled.
function BLINDSIDE.set_up_deck(removed_hues, blinds, curses)
    if not tableContains("Red", removed_hues) then
        for i = 1, 4, 1 do
            table.insert(blinds, "m_bld_sharp")
        end
    end
    if not tableContains("Yellow", removed_hues) then
        for i = 1, 4, 1 do
            table.insert(blinds, "m_bld_pot")
        end
    end
    if not tableContains("Green", removed_hues) then
        for i = 1, 4, 1 do
            table.insert(blinds, "m_bld_flip")
        end
    end
    if not tableContains("Blue", removed_hues) then
        for i = 1, 4, 1 do
            table.insert(blinds, "m_bld_adder")
        end
    end
    if not tableContains("Purple", removed_hues) then
        for i = 1, 4, 1 do
            table.insert(blinds, "m_bld_bite")
        end
    end

    if G.GAME.modifiers.enable_bld_starting_curses and curses then
        for key, value in pairs(curses) do
            table.insert(blinds, value)
        end
    end

    local keys_to_remove = {}
    local blind_index = 1
    for k, v in pairs(G.playing_cards) do
        if v:is_face() then
            table.insert(keys_to_remove, v)
        elseif blinds[blind_index] then
            v:set_ability(blinds[blind_index])
            blind_index = blind_index + 1
        else
            table.insert(keys_to_remove, v)
        end
    end

    for key, value in pairs(keys_to_remove) do
        value:remove()
    end

    G.GAME.starting_deck_size = #G.playing_cards
end

function BLINDSIDE.get_most_common_blind()
    local blinds_list = {}
    for _, card in pairs(G.playing_cards) do
        local key = card.config.center.key

        if not blinds_list[key] then
            blinds_list[key] = card.base.times_played
        else
            blinds_list[key] = blinds_list[key] + card.base.times_played
        end
    end

    local max = "m_bld_sharp"
    for key, value in pairs(blinds_list) do
        if not blinds_list[max] or blinds_list[max] < value then
            max = key
        end
    end

    return max
end