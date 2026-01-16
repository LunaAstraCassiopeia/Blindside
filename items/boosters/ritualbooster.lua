SMODS.Booster{
        key = 'ritual_basic1',
        config = {extra = 3, choose = 1},
        discovered = false,
        get_weight = function(self)
            
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return 0 end
                return 1.75 --prior tested value is 0.8
            else
                return 0
            end
        end,
        atlas = 'bld_booster',
        kind = 'ritual',
        cost = 3,
        weight = 1.75,
        draw_hand = true,
        pos = { x = 0, y = 7 },
        loc_vars = function(self, info_queue, card)
            return {vars = {card.config.center.config.choose, card.ability.extra}}
        end,
        ease_background_colour = function(self)
            ease_colour(G.C.DYN_UI.MAIN, G.C.SECONDARY_SET.bld_obj_ritual)
            ease_background_colour({ new_colour = G.C.SECONDARY_SET.bld_obj_ritual, special_colour = G.C.BLACK, contrast = 1 })
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
            return {set = "bld_obj_ritual", area = G.pack_cards, skip_materialize = true, soulable = card.soulable}
        end,
        group_key = "k_bld_ritual_pack",
}
SMODS.Booster{
        key = 'ritual_basic2',
        config = {extra = 3, choose = 1},
        discovered = false,
        get_weight = function(self)
            
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return 0 end
                return 1.75 --prior tested value is 0.8
            else
                return 0
            end
        end,
        atlas = 'bld_booster',
        kind = 'ritual',
        cost = 3,
        weight = 1.75,
        draw_hand = true,
        pos = { x = 1, y = 7 },
        loc_vars = function(self, info_queue, card)
            return {vars = {card.config.center.config.choose, card.ability.extra}}
        end,
        ease_background_colour = function(self)
            ease_colour(G.C.DYN_UI.MAIN, G.C.SECONDARY_SET.bld_obj_ritual)
            ease_background_colour({ new_colour = G.C.SECONDARY_SET.bld_obj_ritual, special_colour = G.C.BLACK, contrast = 1 })
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
            return {set = "bld_obj_ritual", area = G.pack_cards, skip_materialize = true, soulable = card.soulable}
        end,
        group_key = "k_bld_ritual_pack",
}
SMODS.Booster{
        key = 'ritual_jumbo1',
        config = {extra = 5, choose = 1},
        discovered = false,
        get_weight = function(self)
            
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return 0 end
                return 1.75--0.4
            else
                return 0
            end
        end,
        atlas = 'bld_booster',
        kind = 'ritual',
        cost = 4,
        weight = 1.75,
        draw_hand = true,
        pos = { x = 2, y = 7 },
        loc_vars = function(self, info_queue, card)
            return {vars = {card.config.center.config.choose, card.ability.extra}}
        end,
        ease_background_colour = function(self)
            ease_colour(G.C.DYN_UI.MAIN, G.C.SECONDARY_SET.bld_obj_ritual)
            ease_background_colour({ new_colour = G.C.SECONDARY_SET.bld_obj_ritual, special_colour = G.C.BLACK, contrast = 1 })
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
            return {set = "bld_obj_ritual", area = G.pack_cards, skip_materialize = true, soulable = card.soulable}
        end,
        group_key = "k_bld_ritual_pack",
}

SMODS.Booster{
        key = 'ritual_mega1',
        config = {extra = 5, choose = 2},
        discovered = false,
        get_weight = function(self)
            
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return 0 end
                return 0.75--0.2
            else
                return 0
            end
        end,
        atlas = 'bld_booster',
        kind = 'ritual',
        cost = 6,
        weight = 0.75,
        draw_hand = true,
        pos = { x = 3, y = 7 },
        loc_vars = function(self, info_queue, card)
            return {vars = {card.config.center.config.choose, card.ability.extra}}
        end,
        ease_background_colour = function(self)
            ease_colour(G.C.DYN_UI.MAIN, G.C.SECONDARY_SET.bld_obj_ritual)
            ease_background_colour({ new_colour = G.C.SECONDARY_SET.bld_obj_ritual, special_colour = G.C.BLACK, contrast = 1 })
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
            return {set = "bld_obj_ritual", area = G.pack_cards, skip_materialize = true, soulable = card.soulable}
        end,
        group_key = "k_bld_ritual_pack",
}