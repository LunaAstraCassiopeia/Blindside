SMODS.Stake{
    key = 'plasma_deck',

    above_stake = 'bld_ghost_deck',
    applied_stakes = {'bld_zodiac_deck'},
    prefix_config = {above_stake = {mod = false}, applied_stakes = {mod = false}, unlocked_stake = {mod = false}},
    
    modifiers = function()
        G.GAME.modifiers.enable_bld_skip_costs_money = true
        --G.GAME.modifiers.enable_bld_starting_curses = true
        --G.GAME.modifiers.enable_bld_deadly_small_big = true
    end,

    --colour = ,

    pos = {x = 2, y = 1},
    --sticker_pos = {x = 0, y = 0},
    atlas = 'bld_stakes',
    --sticker_atlas = 
}