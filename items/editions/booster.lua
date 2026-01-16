SMODS.Shader({key = 'booster', path = "booster.fs"})

SMODS.Edition {
    key = 'enameled',
    discovered = false,
    unlocked = true,
    shader = 'booster',
    atlas = 'bld_blindrank',
        in_pool = function(self, args)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
                return true
            else
            return false
            end
        end,
    pos = {x = 3, y = 0},
    config = {
 		chips = 40,
    },
    in_shop = false,
    weight = 3,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.edition and card.edition.chips or nil
            }
        }
    end,
    calculate = function(self, card, context)
        if (context.pre_joker or (context.main_scoring and context.cardarea == G.play)) and card.facing ~= 'back' then
            return {
                chips = card.edition.chips
            }
        end
    end
}