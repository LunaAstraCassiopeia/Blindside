SMODS.Booster{
        key = 'filmcard_basic1',
        config = {extra = 3, choose = 1},
        discovered = false,
        get_weight = function(self)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return 0 end
                return 2
            else
                return 0
            end
        end,
        atlas = 'bld_booster',
        kind = 'channel',
        cost = 3,
        weight = 1,
        draw_hand = true,
        pos = { x = 0, y = 2 },
        loc_vars = function(self, info_queue, card)
            return {vars = {card.config.center.config.choose + (G.GAME.used_vouchers.v_bld_satellite and 1 or 0), card.ability.extra}}
        end,
        ease_background_colour = function(self)
            ease_colour(G.C.DYN_UI.MAIN, G.C.SECONDARY_SET.bld_obj_filmcard)
            ease_background_colour({ new_colour = G.C.SECONDARY_SET.bld_obj_filmcard, special_colour = G.C.BLACK, contrast = 1 })
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
            return {set = "bld_obj_filmcard", area = G.pack_cards, skip_materialize = true, soulable = card.soulable}
        end,
        group_key = "k_bld_filmcard_pack",
}
SMODS.Booster{
        key = 'filmcard_basic2',
        config = {extra = 3, choose = 1},
        discovered = false,
        get_weight = function(self)
            
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return 0 end
                return 2
            else
                return 0
            end
        end,
        atlas = 'bld_booster',
        kind = 'channel',
        cost = 3,
        weight = 1,
        draw_hand = true,
        pos = { x = 1, y = 2 },
        loc_vars = function(self, info_queue, card)
            return {vars = {card.config.center.config.choose + (G.GAME.used_vouchers.v_bld_satellite and 1 or 0), card.ability.extra}}
        end,
        ease_background_colour = function(self)
            ease_colour(G.C.DYN_UI.MAIN, G.C.SECONDARY_SET.bld_obj_filmcard)
            ease_background_colour({ new_colour = G.C.SECONDARY_SET.bld_obj_filmcard, special_colour = G.C.BLACK, contrast = 1 })
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
            return {set = "bld_obj_filmcard", area = G.pack_cards, skip_materialize = true, soulable = card.soulable}
        end,
        group_key = "k_bld_filmcard_pack",
}
SMODS.Booster{
        key = 'filmcard_basic3',
        config = {extra = 3, choose = 1},
        discovered = false,
        get_weight = function(self)
            
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return 0 end
                return 2
            else
                return 0
            end
        end,
        atlas = 'bld_booster',
        kind = 'channel',
        cost = 3,
        weight = 1,
        draw_hand = true,
        pos = { x = 2, y = 2 },
        loc_vars = function(self, info_queue, card)
            return {vars = {card.config.center.config.choose + (G.GAME.used_vouchers.v_bld_satellite and 1 or 0), card.ability.extra}}
        end,
        ease_background_colour = function(self)
            ease_colour(G.C.DYN_UI.MAIN, G.C.SECONDARY_SET.bld_obj_filmcard)
            ease_background_colour({ new_colour = G.C.SECONDARY_SET.bld_obj_filmcard, special_colour = G.C.BLACK, contrast = 1 })
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
            return {set = "bld_obj_filmcard", area = G.pack_cards, skip_materialize = true, soulable = card.soulable}
        end,
        group_key = "k_bld_filmcard_pack",
}
SMODS.Booster{
        key = 'filmcard_basic4',
        config = {extra = 3, choose = 1},
        discovered = false,
        get_weight = function(self)
            
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return 0 end
                return 2
            else
                return 0
            end
        end,
        atlas = 'bld_booster',
        kind = 'channel',
        cost = 3,
        weight = 1,
        draw_hand = true,
        pos = { x = 3, y = 2 },
        loc_vars = function(self, info_queue, card)
            return {vars = {card.config.center.config.choose + (G.GAME.used_vouchers.v_bld_satellite and 1 or 0), card.ability.extra}}
        end,
        ease_background_colour = function(self)
            ease_colour(G.C.DYN_UI.MAIN, G.C.SECONDARY_SET.bld_obj_filmcard)
            ease_background_colour({ new_colour = G.C.SECONDARY_SET.bld_obj_filmcard, special_colour = G.C.BLACK, contrast = 1 })
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
            return {set = "bld_obj_filmcard", area = G.pack_cards, skip_materialize = true, soulable = card.soulable}
        end,
        group_key = "k_bld_filmcard_pack",
}
SMODS.Booster{
        key = 'filmcard_jumbo1',
        config = {extra = 5, choose = 1},
        discovered = false,
        get_weight = function(self)
            
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return 0 end
                return 2
            else
                return 0
            end
        end,
        atlas = 'bld_booster',
        kind = 'channel',
        cost = 4,
        weight = 1,
        draw_hand = true,
        pos = { x = 0, y = 3 },
        loc_vars = function(self, info_queue, card)
            return {vars = {card.config.center.config.choose + (G.GAME.used_vouchers.v_bld_satellite and 1 or 0), card.ability.extra}}
        end,
        ease_background_colour = function(self)
            ease_colour(G.C.DYN_UI.MAIN, G.C.SECONDARY_SET.bld_obj_filmcard)
            ease_background_colour({ new_colour = G.C.SECONDARY_SET.bld_obj_filmcard, special_colour = G.C.BLACK, contrast = 1 })
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
            return {set = "bld_obj_filmcard", area = G.pack_cards, skip_materialize = true, soulable = card.soulable}
        end,
        group_key = "k_bld_filmcard_pack",
}

SMODS.Booster{
        key = 'filmcard_jumbo2',
        config = {extra = 5, choose = 1},
        discovered = false,
        get_weight = function(self)
            
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return 0 end
                return 2
            else
                return 0
            end
        end,
        atlas = 'bld_booster',
        kind = 'channel',
        cost = 4,
        weight = 1,
        draw_hand = true,
        pos = { x = 1, y = 3 },
        loc_vars = function(self, info_queue, card)
            return {vars = {card.config.center.config.choose + (G.GAME.used_vouchers.v_bld_satellite and 1 or 0), card.ability.extra}}
        end,
        ease_background_colour = function(self)
            ease_colour(G.C.DYN_UI.MAIN, G.C.SECONDARY_SET.bld_obj_filmcard)
            ease_background_colour({ new_colour = G.C.SECONDARY_SET.bld_obj_filmcard, special_colour = G.C.BLACK, contrast = 1 })
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
            return {set = "bld_obj_filmcard", area = G.pack_cards, skip_materialize = true, soulable = card.soulable}
        end,
        group_key = "k_bld_filmcard_pack",
}

SMODS.Booster{
        key = 'filmcard_mega1',
        config = {extra = 5, choose = 2},
        discovered = false,
        get_weight = function(self)
            
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return 0 end
                return 2
            else
                return 0
            end
        end,
        atlas = 'bld_booster',
        kind = 'channel',
        cost = 6,
        weight = 1,
        draw_hand = true,
        pos = { x = 2, y = 3 },
        loc_vars = function(self, info_queue, card)
            return {vars = {card.config.center.config.choose + (G.GAME.used_vouchers.v_bld_satellite and 1 or 0), card.ability.extra}}
        end,
        ease_background_colour = function(self)
            ease_colour(G.C.DYN_UI.MAIN, G.C.SECONDARY_SET.bld_obj_filmcard)
            ease_background_colour({ new_colour = G.C.SECONDARY_SET.bld_obj_filmcard, special_colour = G.C.BLACK, contrast = 1 })
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
            return {set = "bld_obj_filmcard", area = G.pack_cards, skip_materialize = true, soulable = card.soulable}
        end,
        group_key = "k_bld_filmcard_pack",
}

SMODS.Booster{
        key = 'filmcard_mega2',
        config = {extra = 5, choose = 2},
        discovered = false,
        get_weight = function(self)
            
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return 0 end
                return 2
            else
                return 0
            end
        end,
        atlas = 'bld_booster',
        kind = 'channel',
        cost = 6,
        weight = 1,
        draw_hand = true,
        pos = { x = 3, y = 3 },
        loc_vars = function(self, info_queue, card)
            return {vars = {card.config.center.config.choose + (G.GAME.used_vouchers.v_bld_satellite and 1 or 0), card.ability.extra}}
        end,
        ease_background_colour = function(self)
            ease_colour(G.C.DYN_UI.MAIN, G.C.SECONDARY_SET.bld_obj_filmcard)
            ease_background_colour({ new_colour = G.C.SECONDARY_SET.bld_obj_filmcard, special_colour = G.C.BLACK, contrast = 1 })
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
            return {set = "bld_obj_filmcard", area = G.pack_cards, skip_materialize = true, soulable = card.soulable}
        end,
        group_key = "k_bld_filmcard_pack",
}