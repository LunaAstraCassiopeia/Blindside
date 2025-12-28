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
        key = 'bld_price_tag',
        path = 'price_tag.png',
        px = 71,
        py = 95,
    })
    SMODS.Atlas({
        key = 'bld_relic',
        path = 'relics.png',
        px = 34,
        py = 34,
    })
    SMODS.Atlas({
        key = 'bld_stakes',
        path = 'stakes.png',
        px = 29,
        py = 29,
    })

function tableContains(value, tbl)
  for _, v in ipairs(tbl) do
    if v == value then
      return true
    end
  end
  return false
end

BLINDSIDE = {}

---@alias hue "Red" | "Green" | "Blue" | "Yellow" | "Purple" | "Faded"

---@ class BLINDSIDE.Blind : SMODS.Enhancement
---@ field upgrade fun(self: BLINDSIDE.Blind, card: Card): nil Function to define how a blind's config.extra table changes when it becomes upgraded. Not technically required, but upgrades fail otherwise. Must set card.ability.extra.upgraded = true.
---@ field hues hue[] Table of hues. 99% of blinds have 1 or 2 hues. Required.
---@ field basic? boolean Whether this blind is basic and should be excluded from generation.
---@ field rare? boolean Whether this blind is rare and should generate less often.
---@ field curse? boolean Whether this blind is a curse and should be excluded from non-curse pools.
---@ field hidden? boolean Whether this blind is excluded from generation (not required for basic blinds).
BLINDSIDE.Blind = SMODS.Enhancement:extend {
    in_pool = function(self, args)
        if G.GAME.selected_back.effect.center.config.extra then
            if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
            return true
        else
        return false
        end
    end,
    replace_base_card = true,
    no_rank = true,
    no_suit = true,
    overrides_base_rank = true,
    blind_debuff = function(card, external)
        if not (external and card.seal == 'bld_wild') then
            if card.facing ~= 'back' then 
                card:flip()
            end
            card:set_debuff(true)
        end
    end
}

function BLINDSIDE.Blind:set_params()
    self.pools = {}

    for key, hue in pairs(self.hues) do
        self.pools['bld_obj_blindcard_' .. string.lower(hue)] = true
    end

    if #self.hues > 1 then
        self.pools["bld_obj_blindcard_dual"] = true
    else
        self.pools["bld_obj_blindcard_single"] = true
    end

    if self.curse then
        self.pools["bld_obj_blindcard_curse"] = true
    end

    if not self.basic and not self.hidden and not self.curse then
        self.pools["bld_obj_blindcard_generate"] = true

        if tableContains("Red", self.hues) or tableContains("Yellow", self.hues) or tableContains("Green", self.hues) then
            self.pools["bld_obj_blindcard_warm"] = true
        end

        if tableContains("Green", self.hues) or tableContains("Blue", self.hues) or tableContains("Purple", self.hues) then
            self.pools["bld_obj_blindcard_cool"] = true
        end
    end

    if not self.config then
        self.config = {}
    end

    if not self.config.extra then
        self.config.extra = {}
    end

    -- necessary to pass it down to SMODS.Enhancement
    self.config.extra.hues = self.hues

    if self.rare then
        self.weight = 3 -- secret code for "i am rare"
    end

    return self
end

local meta = getmetatable(BLINDSIDE.Blind)
local oldcall = meta.__call

meta.__call = function (...)
    local this = oldcall(...)
    return this:set_params()
end

---@ class BLINDSIDE.Joker : SMODS.Blind
---@ field get_assist? fun(self: BLINDSIDE.Joker) Returns an assistant Joker object.
---@ field is_assistant? boolean Whether this Joker should be excluded from the pool because it is an assistant.
---@ field set_joker? fun(self: BLINDSIDE.Joker) Will be called after set_blind. Use as if it were set_blind.
---@ field load_joker? fun(self: BLINDSIDE.Joker) Will be called after load. Use as if it were load.
---@ field defeat_joker? fun(self: BLINDSIDE.Joker) Will be called after defeat. Use as if it were defeat.
---@ field pool_override? fun(self: BLINDSIDE.Joker) Will be called in the middle of in_pool. Use as if it were in_pool.
BLINDSIDE.Joker = SMODS.Blind:extend {
    in_pool = function(self, args)
        if self.is_assistant then
            return false
        end

        local is_blindside = G.GAME.selected_back.effect.center.config.extra and G.GAME.selected_back.effect.center.config.extra.blindside
        if not is_blindside then
            return false
        end

        if self.pool_override then
            return self:pool_override()
        end

        local min = -99
        if self.small and self.small.min then
            min = self.small.min
        end
        if self.big and self.big.min then
            min = self.big.min
        end
        if self.boss and self.boss.min then
            min = self.boss.min
        end

        if G.GAME.round_resets.ante < min then
            return false
        end

        if self.boss and self.boss.showdown then
            if G.GAME.round_resets.ante % 6 ~= 0 then
                return false
            end
        end

        -- all checks passed
        return true
    end,
    set_blind = function(self, reset, silent)
        if self.is_assistant then
            return
        end

        local assistant = self.get_assist and self:get_assist()
        if assistant then
            G.GAME.blindassist.states.visible = true
            G.GAME.blindassist:set_blind(assistant)
            G.GAME.blindassist:change_dim(1.5,1.5)
        else
            G.GAME.blindassist.states.visible = false
            G.GAME.blindassist:change_dim(0,0)
        end

        if self.set_joker then
            self:set_joker()
        end
    end,
    load = function(self)
        if self.is_assistant then
            return
        end

        local assistant = self.get_assist and self:get_assist()
        if assistant then
            G.GAME.blindassist.states.visible = true
            G.GAME.blindassist:set_blind(assistant)
            G.GAME.blindassist:change_dim(1.5,1.5)
        else
            G.GAME.blindassist.states.visible = false
            G.GAME.blindassist:change_dim(0,0)
        end

        if self.load_joker then
            self:load_joker()
        end
    end,
    defeat = function(self)
        local assistant = self.get_assist and self:get_assist()
        if assistant then
            G.GAME.blindassist:defeat()
        end
        
        if self.defeat_joker then
            self:defeat_joker()
        end
    end,
}

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
    "Bite",
    "Blank",
    
    "Hook",
    "Ox",
    "House",
    "Wheel",
    "Arm",
    "Goad",
    "Eye",
    "Mouth",
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
    "Fire",
    "Hoard",
    "Price",
    "Ore",
    "Paint",
    "Lantern",
    "Peace",
    "Hat",
    "Sun",
    "Moon",
    "Snow",
    "Lock",
    "Key",
    "Bell",
    "Ball",
    "Way",
    "Fossil",
    "Grate",

    "Wall",
    "Fish",
    "Window",
    "Psychic",
    "Manacle",
    "Plant",
    "Cell",
    "Skull",
    "Blend",
    "Blood",
    "Meteor",
    "Hammer",
    "Air",
    "Alert",
    "Bronze",
    "Cloth",
    "Earth",
    "Dove",
    "Staff",
    "Clay",
    "Line",
    "Tears",
    "Vault",
    "Rich",
    "Template",
    "Bank",

    "Top",
    "Path",
    "Thorn",
    "Bolt",
    "Clover",
    "Joy",
    "Butterfly",
    "Ghost",
    "Claw",
    "Spear",
    "Fruit",
    "Water",
    "Bones",
    "Club",
    "Head",
    "Door",

    "Beta",
    "Tablet",
    
    -- "Atomic",
    
    "Wound",
    "Curse",
    "Daze",
    "Thirst",
    "Spent",
    "Sick",
    "Sad",
    "Silence",
    "Mold",
    "Stress",
    "Hunger",
    "Lottery",
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
        "lighter",
        "dentures",
        "giftbox",
        "hourglass",
        "snaketotem",
        "bingoball",
        "sockpuppet",
        "nixietubes",
        "prayerwheel",
        "geode",
        "peppermintcandycane",
        "fruitycandycane"
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
        "ritualbooster",
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
        "sports",
        "variety",
        "telenovela",
        "cartoon",
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

local ritual_list = {
    "prayer",
    "pentagram",
    "sacrifice",
    "intervene",
    "evoke",
    "invert",
    "assimilate",
    "exorcise",
    "eruption",
    "worship",
    "funeral",
    "monsoon",
    "journey",
    "purify",
    "banish",
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
local path = SMODS.current_mod.path .. 'stakes/'
for _, v in pairs(NFS.getDirectoryItems(path)) do
    assert(SMODS.load_file('stakes/' .. v))()
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
for _, key in ipairs(ritual_list) do
    assert(SMODS.load_file('consumables/ritual/' .. key .. '.lua'))()
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
