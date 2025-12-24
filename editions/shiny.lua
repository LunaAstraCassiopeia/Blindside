SMODS.Shader({key = 'shiny', path = "shiny.fs"})

SMODS.Edition {
    key = 'shiny',
    discovered = false,
    unlocked = true,
    shader = 'shiny',
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
    in_shop = false,
    config = {
        extra = {
            xmult = 1.3
        }
    },
    weight = 0.5,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.edition and card.edition.extra.xmult or nil
            }
        }
    end,
    calculate = function(self, card, context)
        if (context.pre_joker or (context.main_scoring and context.cardarea == G.play)) and card.facing ~= 'back' then
            return {
                xmult = card.edition.extra.xmult
            }
        end
    end
}