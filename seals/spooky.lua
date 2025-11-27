SMODS.Seal {
    key = "spooky",
    atlas = 'bld_enhance', 
    pos = { x = 1, y = 0 },
    config = { 
        extra = { 
            chipsreduc = 0.10,
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
            local chipsReduc = -(G.GAME.blind.basechips + G.GAME.chips_buffer)*(card.ability.seal.extra.chipsreduc*(1+#SMODS.find_card("j_bld_pumpkin")))
            G.GAME.chips_buffer = G.GAME.chips_buffer + chipsReduc
            return {
                extra = {focus = card, message = localize{type='variable',key='a_pchips',vars={(card.ability.seal.extra.chipsreduc*(1+#SMODS.find_card("j_bld_pumpkin")))*100}}, 
                colour = G.C.DARK_EDITION,},
                colour = G.C.DARK_EDITION,
                func = function()
                    BLINDSIDE.chipsmodify(0, chipsReduc, 0, 0, true)
                end,
                card = card
            }
        end
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.seal.extra.chipsreduc*(1+#SMODS.find_card("j_bld_pumpkin"))*100
            }
        }
    end
}