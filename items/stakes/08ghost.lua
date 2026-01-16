SMODS.Stake{
    key = 'ghost_deck',

    applied_stakes = {'bld_plasma_deck'},
    prefix_config = {above_stake = {mod = false}, applied_stakes = {mod = false}, unlocked_stake = {mod = false}},
    
    modifiers = function()
        G.GAME.modifiers.enable_bld_elites = true
    end,

    --colour = ,

    pos = {x = 3, y = 1},
    --sticker_pos = {x = 0, y = 0},
    atlas = 'bld_stakes',
    --sticker_atlas = 
}