SMODS.Booster{
        key = 'voodoo',
        kind = 'voodoo',
        config = {extra = 3, choose = 1},
        unskippable = true,
        discovered = false,
        get_weight = function(self)
            return 0
        end,
        atlas = 'bld_booster',
        cost = 3,
        weight = 0,
        pos = { x = 0, y = 8 },
        loc_vars = function(self, info_queue, card)
            return {vars = {card.ability.choose, card.ability.extra}}
        end,
        ease_background_colour = function(self)
            ease_colour(G.C.DYN_UI.MAIN, HEX("3c2d47"))
            ease_background_colour({ new_colour = HEX("3c2d47"), special_colour = HEX("3c2d47"), contrast = 1 })
        end,
        in_pool = function(self, args)
            return false
        end,
        create_card = function(self, card)
            local enhancement = nil
            local args = {}
            args.guaranteed = true
            args.options = G.P_CENTER_POOLS.bld_obj_blindcard_generate
            args.cursed = true
            local cardtype = BLINDSIDE.poll_enhancement(args)
            --local enhancement_poll = pseudorandom(pseudoseed('booster'..G.GAME.round_resets.ante))
            --if enhancement_poll > 0.8 then
                --enhancement = pseudorandom_element(SMODS.ObjectTypes.bld_obj_enhancements.enhancements, 'booster')
            --end
            return SMODS.create_card({ set = 'Base', seal = enhancement, enhancement = cardtype })
        end,
        group_key = "k_bld_voodoo_pack",
}

-- ty to picubed for pulling this snippet a few months ago
local can_skip_ref = G.FUNCS.can_skip_booster
G.FUNCS.can_skip_booster = function(e)
    if SMODS.OPENED_BOOSTER and SMODS.OPENED_BOOSTER.config.center.unskippable then
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    else
        return can_skip_ref(e)
    end
end
