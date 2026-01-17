SMODS.Tag {
    key = "strike",
    config = {
        mult = 5,
    },
    hide_ability = false,
    atlas = 'bld_tag',
    pos = {x = 1, y = 1},
        in_pool = function(self, args)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
                return true
            else
            return false
            end
        end,
    loc_vars = function(self, info_queue, tag)
        return {
            vars = {
                tag.config.mult
            }
        }
    end,
    apply = function(self, tag, context)
        if context.type == 'shop_start' and not (next(SMODS.find_card("j_bld_taglock")) and not (G.GAME.blind.boss or G.GAME.last_joker)) then
                tag:yep('+', G.C.RED, function() 
                    return true end)
                tag.triggered = true
        end
        if context.type == 'after_money' and G.STATE == G.STATES.HAND_PLAYED then
            mult = mod_mult(mult + tag.config.mult)
            update_hand_text({delay = 0}, {mult = mult})
            tag_area_status_text(tag, "+5", G.C.RED, false, 0)
            G.E_MANAGER:add_event(Event({trigger = 'immediate', func = function()
                play_sound('multhit1')
                tag:juice_up()
                return true
            end}))
            return true
        end
    end,
}