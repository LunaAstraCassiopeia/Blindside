SMODS.Stake{
    key = 'magic_deck',

    above_stake = 'bld_anaglyph_deck',
    applied_stakes = {'bld_black_deck'},
    prefix_config = {above_stake = {mod = false}, applied_stakes = {mod = false}, unlocked_stake = {mod = false}},
    
    modifiers = function()
        G.GAME.modifiers.enable_bld_starting_curses = true
        G.GAME.modifiers.enable_shop_curses = true
        --G.GAME.modifiers.enable_bld_deadly_small_big = true
    end,

    --colour = ,

    pos = {x = 3, y = 0},
    --sticker_pos = {x = 0, y = 0},
    atlas = 'bld_stakes',
    --sticker_atlas = 
}