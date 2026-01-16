SMODS.Tag {
    key = "additive",
    config = {
        chance = 1,
        trigger = 4,
    },
    hide_ability = false,
    atlas = 'bld_tag',
    pos = {x = 5, y = 0},
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
                1,
                4,
            }
        }
    end,
    apply = function(self, tag, context)
        if context.type == 'shop_start' and not (next(SMODS.find_card("j_bld_taglock")) and not (G.GAME.blind.boss or G.GAME.last_joker)) then
                tag:yep('+', G.C.PURPLE, function() 
                    return true end)
                tag.triggered = true
        end
        if context.type == 'before' then
            local converts = {}
                for k, v in ipairs(context.scoring_hand) do
                    if SMODS.pseudorandom_probability(tag, pseudoseed("flip"), tag.ability.chance, tag.ability.trigger, 'flip') then 
                        converts[#converts+1] = v
                        local enhancement = pseudorandom_element(SMODS.ObjectTypes.bld_obj_enhancements.enhancements, 'booster')
                        v:set_seal(enhancement, nil, true)
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                v:juice_up()
                                return true
                            end
                        }))
                    end
                end
                if #converts > 0 then 
                    tag_area_status_text(tag, 'Enhance!', G.C.FILTER, false, 0)
                end
        end
    end,
    set_ability = function(self, tag) 
        tag.ability.chance = tag.config.chance
        tag.ability.trigger = tag.config.trigger
    end
}