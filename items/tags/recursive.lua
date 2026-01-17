SMODS.Tag {
    key = "recursive",
    config = {
        chips_mod = 15,
    },
    hide_ability = false,
    atlas = 'bld_tag',
    pos = {x = 4, y = 0},
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
                15, 15*#G.GAME.tags
            }
        }
    end,
    apply = function(self, tag, context)
        if context.type == 'shop_start' and not (next(SMODS.find_card("j_bld_taglock")) and not (G.GAME.blind.boss or G.GAME.last_joker)) then
                tag:yep('+', G.C.MONEY, function() 
                    return true end)
                tag.triggered = true
        end
        if context.type == 'after_hand' then
            hand_chips = mod_chips(hand_chips + 15*#G.GAME.tags)
            update_hand_text({delay = 0}, {chips = hand_chips, mult = mult})
            tag_area_status_text(tag, "+" .. tostring(15*#G.GAME.tags), G.C.BLUE, false, 0)
            G.E_MANAGER:add_event(Event({trigger = 'immediate', func = function()
                play_sound('chips1')
                tag:juice_up()
                return true
            end}))
            return true
        end
    end,
    set_ability = function(self, tag) 
        tag.ability.chips_mod = tag.config.chips_mod
    end
}