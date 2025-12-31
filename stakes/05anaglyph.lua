SMODS.Stake{
    key = 'anaglyph_deck',

    above_stake = 'bld_zodiac_deck',
    applied_stakes = {'bld_magic_deck'},
    prefix_config = {above_stake = {mod = false}, applied_stakes = {mod = false}, unlocked_stake = {mod = false}},
    
    modifiers = function()
        G.GAME.modifiers.enable_voodoo_pack = true
    end,

    calculate = function (self, context)
        if G.GAME.modifiers.enable_voodoo_pack and context.ante_end and context.ante_change and context.main_eval then
            G.E_MANAGER:add_event(Event({
                func = function ()
                    add_tag(Tag('tag_bld_voodoo'))
                    return true
                end
            }))
        end
    end,
    --colour = ,

    pos = {x = 0, y = 1},
    --sticker_pos = {x = 0, y = 0},
    atlas = 'bld_stakes',
    --sticker_atlas = 
}