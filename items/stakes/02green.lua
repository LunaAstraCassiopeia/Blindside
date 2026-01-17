SMODS.Stake{
    key = 'green_deck',

    applied_stakes = {'bld_red_deck'},
    above_stake = 'bld_black_deck',
    prefix_config = {above_stake = {mod = false}, applied_stakes = {mod = false}, unlocked_stake = {mod = false}},
    
    modifiers = function()
        G.GAME.modifiers.enable_bld_less_joker_reward = true
        -- 
    end,

    --colour = ,

    pos = {x = 1, y = 0},
    --sticker_pos = {x = 0, y = 0},
    atlas = 'bld_stakes',
    --sticker_atlas = 
}