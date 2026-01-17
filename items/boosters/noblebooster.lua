SMODS.Booster{
        key = 'noble_basic1',
        config = {extra = 2, choose = 1},
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
        kind = 'noble',
        cost = 3,
        weight = 0.8,
        pos = { x = 0, y = 6 },
        loc_vars = function(self, info_queue, card)
            return {vars = {card.config.center.config.choose, card.ability.extra}}
        end,
        ease_background_colour = function(self)
            ease_colour(G.C.DYN_UI.MAIN, G.C.SECONDARY_SET.bld_obj_rune)
            ease_background_colour({ new_colour = G.C.SECONDARY_SET.bld_obj_rune, special_colour = G.C.BLACK, contrast = 1 })
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
            return {set = "bld_obj_rune", area = G.pack_cards, skip_materialize = true, soulable = false}
        end,
        select_card = 'consumeables',
        group_key = "k_bld_noble_pack",
}
SMODS.Booster{
        key = 'noble_basic2',
        config = {extra = 2, choose = 1},
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
        kind = 'noble',
        cost = 3,
        weight = 0.8,
        pos = { x = 0, y = 6 },
        loc_vars = function(self, info_queue, card)
            return {vars = {card.config.center.config.choose, card.ability.extra}}
        end,
        ease_background_colour = function(self)
            ease_colour(G.C.DYN_UI.MAIN, G.C.SECONDARY_SET.bld_obj_rune)
            ease_background_colour({ new_colour = G.C.SECONDARY_SET.bld_obj_rune, special_colour = G.C.BLACK, contrast = 1 })
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
            return {set = "bld_obj_rune", area = G.pack_cards, skip_materialize = true, soulable = false}
        end,
        select_card = 'consumeables',
        group_key = "k_bld_noble_pack",
}
SMODS.Booster{
        key = 'noble_jumbo1',
        config = {extra = 4, choose = 1},
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
        kind = 'noble',
        cost = 4,
        weight = 0.8,
        pos = { x = 2, y = 6 },
        loc_vars = function(self, info_queue, card)
            return {vars = {card.config.center.config.choose, card.ability.extra}}
        end,
        ease_background_colour = function(self)
            ease_colour(G.C.DYN_UI.MAIN, G.C.SECONDARY_SET.bld_obj_rune)
            ease_background_colour({ new_colour = G.C.SECONDARY_SET.bld_obj_rune, special_colour = G.C.BLACK, contrast = 1 })
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
            return {set = "bld_obj_rune", area = G.pack_cards, skip_materialize = true, soulable = false}
        end,
        select_card = 'consumeables',
        group_key = "k_bld_noble_pack",
}

SMODS.Booster{
        key = 'noble_mega1',
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
        kind = 'noble',
        cost = 6,
        weight = 0.8,
        pos = { x = 3, y = 6 },
        loc_vars = function(self, info_queue, card)
            return {vars = {card.config.center.config.choose, card.ability.extra}}
        end,
        ease_background_colour = function(self)
            ease_colour(G.C.DYN_UI.MAIN, G.C.SECONDARY_SET.bld_obj_rune)
            ease_background_colour({ new_colour = G.C.SECONDARY_SET.bld_obj_rune, special_colour = G.C.BLACK, contrast = 1 })
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
            return {set = "bld_obj_rune", area = G.pack_cards, skip_materialize = true, soulable = false}
        end,
        select_card = 'consumeables',
        group_key = "k_bld_noble_pack",
}