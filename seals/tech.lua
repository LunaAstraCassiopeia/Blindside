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
            if G.GAME.draw_tech then
                --print("this is a tech draw")
            end
            --print(#context.hand_drawn)
            if not G.GAME.tech_draw_buffer then
                G.GAME.tech_draw_buffer = 0
            end
            G.GAME.tech_draw_buffer = G.GAME.tech_draw_buffer + card.ability.seal.extra.draw_extra
            G.E_MANAGER:add_event(Event({
                blocking = false,
                func = function()
                    if G.STATE == G.STATES.SELECTING_HAND and G.GAME.tech_draw_buffer > 0 then
                        --print("----------- tech draw")
                        G.FUNCS.blind_draw_from_deck_to_hand(math.floor(G.GAME.tech_draw_buffer))
                        G.GAME.tech_draw_buffer = 0
                        return true
                    elseif G.STATE == G.STATES.SHOP then -- no drawing later!
                        return true
                    elseif G.GAME.tech_draw_buffer == 0 then
                        return true
                    end
                end
            }))
        end
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.seal.extra.draw_extra
            }
        }
    end
}