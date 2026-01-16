BLINDSIDE = {}
BLINDSIDE.current_mod = SMODS.current_mod

SMODS.current_mod.optional_features = {
    retrigger_joker = true,
    cardareas = {
        discard = true,
        deck = true
    }
}

local path = SMODS.current_mod.path .. 'lib/utils/'
for _, v in pairs(NFS.getDirectoryItems(path)) do
    assert(SMODS.load_file('lib/utils/' .. v))()
end
assert(SMODS.load_file('lib/gameobject.lua'))()
assert(SMODS.load_file('lib/atlas.lua'))()
assert(SMODS.load_file('lib/misc.lua'))()