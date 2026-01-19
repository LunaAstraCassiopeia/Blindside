SMODS.Booster{
        key = 'trinket_basic1',
        config = {extra = 2, choose = 1},
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
        kind = 'trinket',
        cost = 6,
        weight = 1,
        pos = { x = 1, y = 8 },
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
            return {set = "Joker", area = G.pack_cards, rarity = pseudorandom_element({'bld_curio', 'bld_doodad', 'bld_hobby'}, pseudoseed('trinket_pack')), skip_materialize = true, soulable = false}
        end,
        group_key = "k_bld_trinket_pack",
}

SMODS.Booster{
        key = 'trinket_basic2',
        config = {extra = 2, choose = 1},
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
        kind = 'trinket',
        cost = 6,
        weight = 1,
        pos = { x = 2, y = 8 },
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
            return {set = "Joker", area = G.pack_cards, rarity = pseudorandom_element({'bld_curio', 'bld_doodad', 'bld_hobby'}, pseudoseed('trinket_pack')), skip_materialize = true, soulable = false}
        end,
        group_key = "k_bld_trinket_pack",
}

SMODS.Booster{
        key = 'trinket_jumbo1',
        config = {extra = 4, choose = 1},
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
        kind = 'trinket',
        cost = 8,
        weight = 1,
        pos = { x = 3, y = 8 },
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
            return {set = "Joker", area = G.pack_cards, rarity = pseudorandom_element({'bld_curio', 'bld_doodad', 'bld_hobby'}, pseudoseed('trinket_pack')), skip_materialize = true, soulable = false}
        end,
        group_key = "k_bld_trinket_pack",
}

SMODS.Booster{
        key = 'trinket_mega1',
        config = {extra = 4, choose = 2},
        discovered = false,
        get_weight = function(self)
            
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return 0 end
                return 1
            else
                return 0
            end
        end,
        atlas = 'bld_booster',
        kind = 'trinket',
        cost = 10,
        weight = 1,
        pos = { x = 0, y = 9 },
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
            return {set = "Joker", area = G.pack_cards, rarity = pseudorandom_element({'bld_curio', 'bld_doodad', 'bld_hobby'}, pseudoseed('trinket_pack')), skip_materialize = true, soulable = false}
        end,
        group_key = "k_bld_trinket_pack",
}