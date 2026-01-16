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
    weight = 0.5,
    in_shop = false,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.edition and card.edition.extra.retriggers or nil
            }
        }
    end,
    credit = {
        art = "70UNIK",
    },
    calculate = function(self, card, context)
        if context.repetition and card.facing ~= 'back' and context.other_card and context.other_card == card and context.other_card.ability.extra.rescore ~= 1 then
            return {
                repetitions = card.edition.extra.retriggers
            }
        end
    end
    
}