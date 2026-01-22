SMODS.Seal {
    key = "tech",
    atlas = 'bld_enhance', 
    pos = { x = 1, y = 1 },
    config = { 
        extra = {
            draw_extra = 1
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
        if context.main_eval and (context.hand_drawn and context.cardarea == G.hand and tableContains(card, context.hand_drawn)) or (context.other_drawn and context.cardarea == G.hand and tableContains(card, context.other_drawn)) then
            if not G.GAME.tech_draw_buffer then
                G.GAME.tech_draw_buffer = 0
            end

            G.GAME.tech_draw_buffer = G.GAME.tech_draw_buffer + card.ability.seal.extra.draw_extra
            
            local hand_drawn = context.hand_drawn
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.E_MANAGER:add_event(Event({
                        delay = 0.35,
                        trigger = "after",
                        func = function()
                            local index = -1
                            local techs = {}
                            for i, value in ipairs(hand_drawn) do
                                if value.seal == 'bld_tech' then
                                    table.insert(techs, value)
                                end
                            end

                            for i, value in ipairs(techs) do
                                if card == value then
                                    index = i
                                    break
                                end
                            end
                            card_eval_status_text(card, 'extra', nil, nil, nil, {instant = true, message = "+" .. 1 --[[index]], volume = 0.7, colour = G.C.BLUE})
                            return true
                        end
                    }))
                    return true
                end
            }))

            --[[return {
                message = "+" .. G.GAME.tech_draw_buffer,
                colour = G.C.BLUE
            }]]
        end
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.seal.extra.draw_extra,
                (G.GAME.tech_draw_primary_buffer or 0) ~= 1 and (G.GAME.tech_draw_primary_buffer or 0) .. " Blinds" or "1 Blind"
            }
        }
    end
}