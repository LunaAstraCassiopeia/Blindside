SMODS.Shader({key = 'finish', path = "finish.fs"})

SMODS.Edition {
    key = 'finish',
    discovered = false,
    unlocked = true,
    shader = 'finish',
    atlas = 'bld_blindrank',
    pos = {x = 3, y = 0},
    config = {
 		extra = {retriggers = 1}
    },
    weight = 1,
    in_shop = false,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.edition and card.edition.extra.retriggers or nil
            }
        }
    end,
    calculate = function(self, card, context)
        if context.repetition and card.facing ~= 'back' and context.other_card and context.other_card == card then
            return {
                repetitions = card.edition.extra.retriggers
            }
        end
    end
    
}