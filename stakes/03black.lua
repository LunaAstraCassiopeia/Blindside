SMODS.Stake{
    key = 'black_deck',

    applied_stakes = {'bld_green_deck'},
    above_stake = 'bld_magic_deck',
    prefix_config = {above_stake = {mod = false}, applied_stakes = {mod = false}, unlocked_stake = {mod = false}},
    
    modifiers = function()
        G.GAME.modifiers.enable_bld_deplete_hands = true
    end,


    --colour = ,

    pos = {x = 2, y = 0},
    --sticker_pos = {x = 0, y = 0},
    atlas = 'bld_stakes',
    --sticker_atlas = 
}