SMODS.Booster{
        key = 'symbol_basic1',
        kind = 'symbol',
        config = {extra = 3, choose = 1},
        discovered = false,
        get_weight = function(self)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return 0 end
                return 0.8
            else
                return 0
            end
        end,
        atlas = 'bld_booster',
        cost = 3,
        weight = 4,
        pos = { x = 0, y = 0 },
        loc_vars = function(self, info_queue, card)
            return {vars = {card.config.center.config.choose, card.ability.extra}}
        end,
        ease_background_colour = function(self)
            ease_colour(G.C.DYN_UI.MAIN, HEX("46aa71"))
            ease_background_colour({ new_colour = HEX("46aa71"), special_colour = HEX("46aaa4"), contrast = 1 })
        end,
        in_pool = function(self, args)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
                return true
            else
                return false
            end
        end,
        create_card = function(self, card)
            local enhancement = nil
            local args = {}
            args.guaranteed = true
            args.options = G.P_CENTER_POOLS.bld_obj_blindcard_generate
            local cardtype = BLINDSIDE.poll_enhancement(args)
            local enhancement_poll = pseudorandom(pseudoseed('booster'..G.GAME.round_resets.ante))
            if enhancement_poll > 0.8 then
                enhancement = pseudorandom_element(SMODS.ObjectTypes.bld_obj_enhancements.enhancements, 'booster')
            end
            return SMODS.create_card({ set = 'Base', seal = enhancement, enhancement = cardtype, soulable = card.soulable })
        end,
        group_key = "k_bld_symbol_pack",
}
SMODS.Booster{
        key = 'symbol_basic2',
        kind = 'symbol',
        config = {extra = 3, choose = 1},
        discovered = false,
        get_weight = function(self)
            
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return 0 end
                return 0.8
            else
                return 0
            end
        end,
        atlas = 'bld_booster',
        cost = 3,
        weight = 4,
        pos = { x = 1, y = 0 },
        loc_vars = function(self, info_queue, card)
            return {vars = {card.config.center.config.choose, card.ability.extra}}
        end,
        ease_background_colour = function(self)
            ease_colour(G.C.DYN_UI.MAIN, HEX("594d9e"))
            ease_background_colour({ new_colour = HEX("594d9e"), special_colour = HEX("814d9e"), contrast = 1 })
        end,
        create_card = function(self, card)
            local enhancement = nil
            local args = {}
            args.guaranteed = true
            args.options = G.P_CENTER_POOLS.bld_obj_blindcard_cool
            local cardtype = BLINDSIDE.poll_enhancement(args)
            local enhancement_poll = pseudorandom(pseudoseed('booster'..G.GAME.round_resets.ante))
            if enhancement_poll > 0.8 then
                enhancement = pseudorandom_element(SMODS.ObjectTypes.bld_obj_enhancements.enhancements, 'booster')
            end
            return SMODS.create_card({ set = 'Playing Card', seal = enhancement, enhancement = cardtype, soulable = card.soulable })
        end,
        group_key = "k_bld_symbol_pack",
}
SMODS.Booster{
        key = 'symbol_basic3',
        kind = 'symbol',
        config = {extra = 3, choose = 1},
        discovered = false,
        get_weight = function(self)
            
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return 0 end
                return 0.4
            else
                return 0
            end
        end,
        atlas = 'bld_booster',
        cost = 3,
        weight = 4,
        pos = { x = 2, y = 0 },
        loc_vars = function(self, info_queue, card)
            return {vars = {card.config.center.config.choose, card.ability.extra}}
        end,
        ease_background_colour = function(self)
            ease_colour(G.C.DYN_UI.MAIN, HEX("7d4a8e"))
            ease_background_colour({ new_colour = HEX("7d4a8e"), special_colour = HEX("8e4a5b"), contrast = 1 })
        end,
        create_card = function(self, card)
            local enhancement = nil
            local args = {}
            args.guaranteed = true
            args.options = G.P_CENTER_POOLS.bld_obj_blindcard_generate
            local cardtype = BLINDSIDE.poll_enhancement(args)
            local enhancement_poll = pseudorandom(pseudoseed('booster'..G.GAME.round_resets.ante))
            if enhancement_poll > 0.8 then
                enhancement = pseudorandom_element(SMODS.ObjectTypes.bld_obj_enhancements.enhancements, 'booster')
            end
            return SMODS.create_card({ set = 'Playing Card', seal = enhancement, enhancement = cardtype, soulable = card.soulable })
        end,
        group_key = "k_bld_symbol_pack",
}
SMODS.Booster{
        key = 'symbol_basic4',
        kind = 'symbol',
        config = {extra = 3, choose = 1},
        discovered = false,
        get_weight = function(self)
            
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return 0 end
                return 0.4
            else
                return 0
            end
        end,
        atlas = 'bld_booster',
        cost = 3,
        weight = 4,
        pos = { x = 3, y = 0 },
        loc_vars = function(self, info_queue, card)
            return {vars = {card.config.center.config.choose, card.ability.extra}}
        end,
        ease_background_colour = function(self)
            ease_colour(G.C.DYN_UI.MAIN, HEX("937a42"))
            ease_background_colour({ new_colour = HEX("937a42"), special_colour = HEX("935142"), contrast = 1 })
        end,
        create_card = function(self, card)
            local enhancement = nil
            local args = {}
            args.guaranteed = true
            args.options = G.P_CENTER_POOLS.bld_obj_blindcard_warm
            local cardtype = BLINDSIDE.poll_enhancement(args)
            local enhancement_poll = pseudorandom(pseudoseed('booster'..G.GAME.round_resets.ante))
            if enhancement_poll > 0.8 then
                enhancement = pseudorandom_element(SMODS.ObjectTypes.bld_obj_enhancements.enhancements, 'booster')
            end
            return SMODS.create_card({ set = 'Playing Card', seal = enhancement, enhancement = cardtype, soulable = card.soulable })
        end,
        group_key = "k_bld_symbol_pack",
}

SMODS.Booster{
        key = 'symbol_jumbo1',
        kind = 'symbol',
        config = {extra = 5, choose = 1},
        discovered = false,
        get_weight = function(self)
            
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return 0 end
                return 0.4
            else
                return 0
            end
        end,
        atlas = 'bld_booster',
        cost = 3,
        weight = 3,
        pos = { x = 0, y = 1 },
        loc_vars = function(self, info_queue, card)
            return {vars = {card.config.center.config.choose, card.ability.extra}}
        end,
        ease_background_colour = function(self)
            ease_colour(G.C.DYN_UI.MAIN, HEX("a83c87"))
            ease_background_colour({ new_colour = HEX("a83c87"), special_colour = HEX("5c3ca8"), contrast = 1 })
        end,
        create_card = function(self, card)
            local enhancement = nil
            local args = {}
            args.guaranteed = true
            args.options = G.P_CENTER_POOLS.bld_obj_blindcard_cool
            local cardtype = BLINDSIDE.poll_enhancement(args)
            local enhancement_poll = pseudorandom(pseudoseed('booster'..G.GAME.round_resets.ante))
            if enhancement_poll > 0.8 then
                enhancement = pseudorandom_element(SMODS.ObjectTypes.bld_obj_enhancements.enhancements, 'booster')
            end
            return SMODS.create_card({ set = 'Playing Card', seal = enhancement, enhancement = cardtype, soulable = card.soulable })
        end,
        group_key = "k_bld_symbol_pack",
}

SMODS.Booster{
        key = 'symbol_jumbo2',
        kind = 'symbol',
        config = {extra = 5, choose = 1},
        discovered = false,
        get_weight = function(self)
            
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return 0 end
                return 0.4
            else
                return 0
            end
        end,
        atlas = 'bld_booster',
        cost = 3,
        weight = 3,
        pos = { x = 1, y = 1 },
        loc_vars = function(self, info_queue, card)
            return {vars = {card.config.center.config.choose, card.ability.extra}}
        end,
        ease_background_colour = function(self)
            ease_colour(G.C.DYN_UI.MAIN, HEX("937f48"))
            ease_background_colour({ new_colour = HEX("937f48"), special_colour = HEX("935a48"), contrast = 1 })
        end,
        create_card = function(self, card)
            local enhancement = nil
            local args = {}
            args.guaranteed = true
            args.options = G.P_CENTER_POOLS.bld_obj_blindcard_warm
            local cardtype = BLINDSIDE.poll_enhancement(args)
            local enhancement_poll = pseudorandom(pseudoseed('booster'..G.GAME.round_resets.ante))
            if enhancement_poll > 0.8 then
                enhancement = pseudorandom_element(SMODS.ObjectTypes.bld_obj_enhancements.enhancements, 'booster')
            end
            return SMODS.create_card({ set = 'Playing Card', seal = enhancement, enhancement = cardtype, soulable = card.soulable })
        end,
        group_key = "k_bld_symbol_pack",
}
SMODS.Booster{
        key = 'symbol_mega1',
        kind = 'symbol',
        config = {extra = 5, choose = 2},
        discovered = false,
        get_weight = function(self)
            
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return 0 end
                return 0.8
            else
                return 0
            end
        end,
        atlas = 'bld_booster',
        cost = 6,
        weight = 2,
        pos = { x = 2, y = 1 },
        loc_vars = function(self, info_queue, card)
            return {vars = {card.config.center.config.choose, card.ability.extra}}
        end,
        ease_background_colour = function(self)
            ease_colour(G.C.DYN_UI.MAIN, HEX("583c87"))
            ease_background_colour({ new_colour = HEX("583c87"), special_colour = HEX("873b6b"), contrast = 1 })
        end,
        create_card = function(self, card)
            local enhancement = nil
            local args = {}
            args.guaranteed = true
            args.options = G.P_CENTER_POOLS.bld_obj_blindcard_generate
            local cardtype = BLINDSIDE.poll_enhancement(args)
            local enhancement_poll = pseudorandom(pseudoseed('booster'..G.GAME.round_resets.ante))
            if enhancement_poll > 0.8 then
                enhancement = pseudorandom_element(SMODS.ObjectTypes.bld_obj_enhancements.enhancements, 'booster')
            end
            return SMODS.create_card({ set = 'Playing Card', seal = enhancement, enhancement = cardtype, soulable = card.soulable })
        end,
        group_key = "k_bld_symbol_pack",
}
SMODS.Booster{
        key = 'symbol_mega2',
        kind = 'symbol',
        config = {extra = 5, choose = 2},
        discovered = false,
        get_weight = function(self)
            
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return 0 end
                return 0.8
            else
                return 0
            end
        end,
        atlas = 'bld_booster',
        cost = 6,
        weight = 2,
        pos = { x = 3, y = 1 },
        loc_vars = function(self, info_queue, card)
            return {vars = {card.config.center.config.choose, card.ability.extra}}
        end,
        ease_background_colour = function(self)
            ease_colour(G.C.DYN_UI.MAIN, HEX("8e4349"))
            ease_background_colour({ new_colour = HEX("8e4349"), special_colour = HEX("43498e"), contrast = 1 })
        end,
        create_card = function(self, card)
            local enhancement = nil
            local args = {}
            args.guaranteed = true
            args.options = G.P_CENTER_POOLS.bld_obj_blindcard_generate
            local cardtype = BLINDSIDE.poll_enhancement(args)
            local enhancement_poll = pseudorandom(pseudoseed('booster'..G.GAME.round_resets.ante))
            if enhancement_poll > 0.8 then
                enhancement = pseudorandom_element(SMODS.ObjectTypes.bld_obj_enhancements.enhancements, 'booster')
            end
            return SMODS.create_card({ set = 'Playing Card', seal = enhancement, enhancement = cardtype, soulable = card.soulable })
        end,
        group_key = "k_bld_symbol_pack",
}