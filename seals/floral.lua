SMODS.Seal {
    key = "floral",
    atlas = 'bld_enhance', 
    pos = { x = 2, y = 0 },
    config = { 
        extra = { 
            chips = 50,
            chancechips = 1,
            triggerchips = 4,
            retrigger = 2,
            chanceretrigger = 1,
            triggeretrigger = 10,
        } 
    },
    badge_colour = HEX('757CDC'),
    in_pool = function(self, args)
        if G.GAME.selected_back.effect.center.config.extra then
            if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
            return true
        else
        return false
        end
    end,
    pools = {
        ["bld_obj_enhancements"] = true,
    },
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play and card.facing ~= 'back' then
            if SMODS.pseudorandom_probability(card, 'floral', 1 + (#SMODS.find_card("j_bld_bracelet")), card.ability.seal.extra.triggerchips) then
                return {
                    chips = card.ability.seal.extra.chips
                }
            end
        end
        if context.repetition and card.facing ~= 'back' then
            if SMODS.pseudorandom_probability(card, 'floral', 1 + (#SMODS.find_card("j_bld_bracelet")), card.ability.seal.extra.triggeretrigger) then
            return {
                repetitions = card.ability.seal.extra.retrigger
            }
        end
        end
    end,
    loc_vars = function(self, info_queue, card)
        local chancechips, triggerchips = SMODS.get_probability_vars(card, card.ability.seal.extra.chancechips, card.ability.seal.extra.triggerchips,
            'floral')
        local chanceretrigger, triggeretrigger = SMODS.get_probability_vars(card, card.ability.seal.extra.chanceretrigger, card.ability.seal.extra.triggeretrigger, 'floral')
        return { vars = { chancechips, triggerchips, card.ability.seal.extra.chips, chanceretrigger, triggeretrigger, card.ability.seal.extra.retrigger } }
    end
}