SMODS.Shader({key = 'mint', path = "mint.fs"})

SMODS.Edition {
    key = 'mint',
    discovered = false,
    unlocked = true,
    shader = 'mint',
    atlas = 'bld_blindrank',
    pos = {x = 3, y = 0},
        in_pool = function(self, args)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
                return true
            else
            return false
            end
        end,
    config = {
 		p_dollars = 2,
    },
    in_shop = false,
    weight = 3,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.edition and card.edition.p_dollars or nil
            }
        }
    end,
    calculate = function(self, card, context)
        if (context.pre_joker or (context.main_scoring and context.cardarea == G.play)) and card.facing ~= 'back' then
            return {
                dollars = card.edition.p_dollars
            }
        end
    end
}