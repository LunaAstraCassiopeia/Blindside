--- STEAMODDED HEADER
--- MOD_NAME: Blindside
--- MOD_ID: Blindside
--- PREFIX: bld
--- MOD_AUTHOR: [LunaAstraCassiopeia]
--- MOD_DESCRIPTION: Some Dumb Project
--- BADGE_COLOR: 3F6AA4
--- VERSION: 0.0.0

----------------------------------------------
------------MOD CODE -------------------------

    SMODS.Atlas({
        key = 'bld_blindback',
        path = 'backs.png',
        px = 71,
        py = 95
    })
    SMODS.Atlas({
        key = 'bld_blindrank',
        path = 'blinds.png',
        px = 71,
        py = 95
    })
    SMODS.Atlas({
        key = 'bld_booster',
        path = 'booster.png',
        px = 71,
        py = 95
    })
    SMODS.Atlas({
        key = 'bld_color',
        path = 'colors.png',
        px = 18,
        py = 18
    })
    SMODS.Atlas({
        key = 'bld_trinkets',
        path = 'trinkets.png',
        px = 71,
        py = 95
    })
    SMODS.Atlas({
        key = 'bld_enhance',
        path = 'enhancements.png',
        px = 71,
        py = 95,
        disable_mipmap = true,
    })
    SMODS.Atlas({
        key = 'bld_consumable',
        path = 'consumables.png',
        px = 71,
        py = 95,
    })
    SMODS.Atlas({
        key = 'bld_tag',
        path = 'tags.png',
        px = 34,
        py = 34
    })
    SMODS.Atlas({
        key = 'bld_joker',
        path = 'jokers.png',
        px = 34,
        py = 34,
        atlas_table = 'ANIMATION_ATLAS',
        frames = 21
    })
    SMODS.Atlas({
        key = 'bld_voucher',
        path = 'voucher.png',
        px = 71,
        py = 95,
    })
    SMODS.Atlas({
        key = 'bld_relic',
        path = 'relics.png',
        px = 34,
        py = 34,
    })
    
BLINDSIDE = {}

SMODS.current_mod.optional_features = {
    retrigger_joker = true,
    cardareas = {
        discard = true,
        deck = true
    }
}

 G.C.SUITS['Red'] = HEX('EA6158')
 G.C.SUITS['Blue'] = HEX('39B1FC')
 G.C.SUITS['Green'] = HEX('56A786')
 G.C.SUITS['Yellow'] = HEX('FDA200')
 G.C.SUITS['Purple'] = HEX('8A71E1')
 G.C.SUITS['Faded'] = HEX('4F6367')


local card_list = {
        "Sharp",
        "Flip",
        "Adder",
        "Pot",
        "Blank",
        "Hook",
        "Ox",
        "House",
        "Wall",
        "Wheel",
        "Arm",
        "Fish",
        "Psychic",
        "Goad",
        "Window",
        "Manacle",
        "Eye",
        "Mouth",
        "Plant",
        "Serpent",
        "Pillar",
        "Needle",
        "Tooth",
        "Flint",
        "Mark",
        "Vast",
        "Deck",
        "Pile",
        "Wedge",
        "Cell",
        "Skull",
        "Blend",
        "Hoard",
        "Blood",
        "Fire",
        "Price",
        "Ore",
        "Paint",
        "Fruit",
        "Water",
        "Bones",
        "Club",
        "Head",
        "Top",
        "Path",
        "Thorn",
        "Bolt",
        "Clover",
        "Beta",
        "Meteor",
        "Lantern",
        "Peace",
        "Hat",
        "Joy",
        "Air",
        -- "Atomic",
        "Hammer",
        "Sun",
        "Alert",
        "Bronze",
        "Butterfly",
        "Cloth",
        "Moon",
        "Ghost",
        "Earth",
        "Dove",
        "Staff",
        "Bite",
        "Snow",
        "Clay",
        "Lock",
        "Key",
        "Door",
        "Bell",
        "Wound",
        "Claw",
        "Ball",
        "Spear",
        "Line",
        "Tears",
        "Way",
}

local trinket_list = {
        "canvas",
        "paycheck",
        "taglock",
        "pawn",
        "flag",
        "standard",
        "crest",
        "ensign",
        "pennant",
        "insignia",
        "sunset",
        "doubloon",
        "award",
        "discount",
        "clock",
        "pendant",
        "actionfigure",
        "stuffedtoy",
        "porcelaindoll",
        "bracelet",
        "statuette",
        "miniature",
        "toyrobot",
        "snowglobe",
        "microphone",
        "cellphone",
        "piggybank",
        "scratchticket",
        "bedazzler",
        "pickaxe",
        "mask",
        "glasses",
        "toysoldier",
        "pumpkin",
        "kazoo",
        "whiteout",
        "fridgemagnet",
        "saltlamp",
        "marble",
        "stoplight",
        "fineart",
        "dicejail",
        "bookmark",
        "cowskull",
        "glasseye",
        "pirateship",
        "talkingfish",
        "dreamcatcher",
        "microchip",
        "breadboard",
        "barrel",
        "candle",
        "pogs",
        "crane",
        "matryoshka",
        "sewingkit",
        "pocketwatch",
        "bottle",
        "hackysack",
        "checker",
        "necronomicon",
}

local joker_list = {
        "smalljokers",
        "bigjokers",
        "bossjokers",
        "showdownjokers",
}

local booster_list = {
        "symbolbooster",
        "channelbooster",
        "mineralbooster",
        "noblebooster",
}

local channel_list = {
        "horror",
        "action",
        "scifi",
        "adventure",
        "fantasy",
        "comedy",
        "superhero",
        "noir",
        "musical",
        "mystery",
        "drama",
        "romance",
        "western",
        "historical",
        "speculative",
        "crime",
        "thriller",
        "experimental",
}

local mineral_list = {
        "stibnite",
        "cinnabar",
        "platinum",
        "malachite",
        "erythrite",
        "hematite",
        "cassiterite",
        "pyromorphite",
        "scheelite",
        "alexandrite",
}
local rune_list = {
        "betaexe",
        "orbit",
        "arengee",
        "exmega",
        "halcyon",
        "montain",
        "joker404",
}


local path = SMODS.current_mod.path .. 'seals/'
for _, v in pairs(NFS.getDirectoryItems(path)) do
    assert(SMODS.load_file('seals/' .. v))()
end
for _, key in ipairs(booster_list) do
    assert(SMODS.load_file('boosters/'..key..'.lua'))()
end
local path = SMODS.current_mod.path .. 'decks/'
for _, v in pairs(NFS.getDirectoryItems(path)) do
    assert(SMODS.load_file('decks/' .. v))()
end
local path = SMODS.current_mod.path .. 'vouchers/'
for _, v in pairs(NFS.getDirectoryItems(path)) do
    assert(SMODS.load_file('vouchers/' .. v))()
end
local path = SMODS.current_mod.path .. 'relics/'
for _, v in pairs(NFS.getDirectoryItems(path)) do
    assert(SMODS.load_file('relics/' .. v))()
end
local path = SMODS.current_mod.path .. 'tags/'
for _, v in pairs(NFS.getDirectoryItems(path)) do
    assert(SMODS.load_file('tags/' .. v))()
end
for _, key in ipairs(channel_list) do
    assert(SMODS.load_file('consumables/channel/' .. key .. '.lua'))()
end
for _, key in ipairs(mineral_list) do
    assert(SMODS.load_file('consumables/mineral/' .. key .. '.lua'))()
end
for _, key in ipairs(rune_list) do
    assert(SMODS.load_file('consumables/rune/' .. key .. '.lua'))()
end
for _, key in ipairs(card_list) do
    assert(SMODS.load_file('enhancements/'..key..'.lua'))()
end
for _, key in ipairs(trinket_list) do
    assert(SMODS.load_file('trinkets/'..key..'.lua'))()
end
local path = SMODS.current_mod.path .. 'utils/'
for _, v in pairs(NFS.getDirectoryItems(path)) do
    assert(SMODS.load_file('utils/' .. v))()
end
local path = SMODS.current_mod.path .. 'editions/'
for _, v in pairs(NFS.getDirectoryItems(path)) do
    assert(SMODS.load_file('editions/' .. v))()
end
for _, key in ipairs(joker_list) do
    assert(SMODS.load_file('jokers/'..key..'.lua'))()
end
----------------------------------------------
------------MOD CODE END----------------------
