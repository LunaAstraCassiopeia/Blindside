SMODS.Tag {
    key = "hiss",
    hide_ability = false,
    atlas = 'bld_tag',
    pos = {x = 3, y = 1},
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
                tag.ability and tag.ability.count or 3
            }
        }
    end,
    apply = function(self, tag, context)
        if context.type == 'post_draw'  then
            G.FUNCS.blind_draw_from_deck_to_hand(tag.ability.count)
            tag:yep('+', G.C.GREEN, function()
                return true
            end)
            tag.triggered = true
            return true
        end
    end,
    set_ability = function(self, tag) 
        tag.ability.count = G.serpent_draw
    end
}