SMODS.Seal {
    key = "spooky",
    atlas = 'bld_enhance', 
    pos = { x = 1, y = 0 },
    config = { 
        extra = { 
            chipsreduc = 0.02,
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
            local sharing = {}
            for key, value in pairs(context.scoring_hand) do
                local shares = false
                for key, color in pairs(value.ability.extra.hues) do
                    if tableContains(color, card.ability.extra.hues) then
                        shares = true
                        break
                    end
                end

                if shares then
                    table.insert(sharing, value)
                end
            end
            local p = (card.ability.seal.extra.chipsreduc*#sharing*(1))
            local chipsReduc = -(G.GAME.blind.basechips + G.GAME.chips_buffer)*p -- #SMODS.find_card("j_bld_pumpkin")
            G.GAME.chips_buffer = G.GAME.chips_buffer + chipsReduc
            return {
                extra = {focus = card, message = localize{type='variable',key='a_pchips',vars={p*100}},
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
                card.ability.seal.extra.chipsreduc*100
            }
        }
    end
}