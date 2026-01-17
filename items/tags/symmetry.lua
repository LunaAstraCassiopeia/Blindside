SMODS.Tag {
    key = "symmetry",
    config = {
        chance = 1,
        trigger = 2,
    },
    hide_ability = false,
    atlas = 'bld_tag',
    pos = {x = 3, y = 0},
        in_pool = function(self, args)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
                return true
            else
                return false
            end
        end,
    loc_vars = function(self, info_queue, tag)
        local n,d = SMODS.get_probability_vars(tag, 1, 2)
        return {
            vars = {
                n,
                d,
            }
        }
    end,
    apply = function(self, tag, context)
        if context.type == 'shop_start' and not (next(SMODS.find_card("j_bld_taglock")) and not (G.GAME.blind.boss or G.GAME.last_joker)) then
                tag:yep('+', G.C.GREEN, function() 
                    return true end)
                tag.triggered = true
        end
        if context.type == 'scoring_card' then
            local numerator, denominator = SMODS.get_probability_vars(tag, 1, 2, 'symmetry', true)
            if pseudorandom('symmetry') < numerator / denominator and context.card.facing ~= 'back' and context.context.cardarea == G.play then
                tag:juice_up()
                tag_area_status_text(tag, localize('k_again_ex'), G.C.FILTER, false, 0)
                BLINDSIDE.rescore_card(context.card, context.context)
            end
        end
    end,
    set_ability = function(self, tag) 
        tag.ability.chance = tag.config.chance
        tag.ability.trigger = tag.config.trigger
    end
}
