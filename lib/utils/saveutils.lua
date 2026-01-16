-- Increments and sets blindside-related custom career stats.
BLINDSIDE.inc_stats = function(stat, key, val, set)
    BLINDSIDE.stats_setup()
    local stats_func_table = {
        ["small_joker_defeat"] = function (key, val, _)
            G.PROFILES[G.SETTINGS.profile].career_stats.bld_small_joker_defeat[key] = val
        end
    }

    stats_func_table[stat](key, val, set)
end

-- Checks blindside-related custom career stats.
BLINDSIDE.check_stats = function(stat, val)
    local stats = G.PROFILES[G.SETTINGS.profile].career_stats
    BLINDSIDE.stats_setup()
    local stats_func_table = {
        ["small_jokers_defeated"] = function (val)
            local total = 0
            for key, value in pairs(stats.bld_small_joker_defeat) do
                if value then
                    total = total + 1
                end
            end
            return total >= val
        end
    }

    return stats_func_table[stat](val)
end

BLINDSIDE.stats_setup = function()
    if not G.PROFILES[G.SETTINGS.profile].career_stats.bld_small_joker_defeat then
        G.PROFILES[G.SETTINGS.profile].career_stats.bld_small_joker_defeat = {}
        --[[for key, value in pairs({'joker', 'lustyjoker', 'wrathfuljoker', 'gluttonousjoker', 'greedyjoker', 'slothfuljoker'}) do
            G.PROFILES[G.SETTINGS.profile].career_stats.bld_small_joker_defeat[value] = false
        end]] -- unnecessary code
    end
end

local ease_anteRef = ease_ante
function ease_ante(mod, ante_end)
	ease_anteRef(mod, ante_end)
    if mod > 0 then
        -- gotta be 1 less since ease_ante changes ante on an event
        if G.GAME.selected_back.effect.center.key == 'b_bld_whitedispenser' and G.GAME.round_resets.ante >= 3 then
            unlock_card(G.P_CENTERS.b_bld_reddispenser)
        elseif G.GAME.selected_back.effect.center.key == 'b_bld_reddispenser' and G.GAME.round_resets.ante >= 4 then
            unlock_card(G.P_CENTERS.b_bld_greendispenser)
        elseif G.GAME.selected_back.effect.center.key == 'b_bld_greendispenser' and G.GAME.round_resets.ante >= 5 then
            unlock_card(G.P_CENTERS.b_bld_blackdispenser)
        elseif G.GAME.selected_back.effect.center.key == 'b_bld_blackdispenser' and G.GAME.round_resets.ante >= 5 then
            unlock_card(G.P_CENTERS.b_bld_bluedispenser)
        elseif G.GAME.selected_back.effect.center.key == 'b_bld_bluedispenser' and G.GAME.round_resets.ante >= 6 then
            unlock_card(G.P_CENTERS.b_bld_purpledispenser)
        elseif G.GAME.selected_back.effect.center.key == 'b_bld_purpledispenser' and G.GAME.round_resets.ante >= 6 then
            unlock_card(G.P_CENTERS.b_bld_orangedispenser)
        elseif G.GAME.selected_back.effect.center.key == 'b_bld_orangedispenser' and G.GAME.round_resets.ante >= 6 then
            unlock_card(G.P_CENTERS.b_bld_golddispenser)
        end
    end
end