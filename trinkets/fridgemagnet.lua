
    SMODS.Joker({
        key = 'fridgemagnet',
        atlas = 'bld_trinkets',
        pos = {x = 5, y = 3},
        soul_pos = {x = 6, y = 3},
        rarity = 'bld_keepsake',
        cost = 15,
        blueprint_compat = false,
        eternal_compat = true,
        in_pool = function(self, args)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
                return true
            else
            return false
            end
        end,
        credit = {
            art = "AstraLuna",
            code = "AstraLuna",
            concept = "AstraLuna"
        },
        calculate = function(self, card, context)
            if context.retrigger_joker_check and context.other_card ~= card then
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i] == card then
                        if context.other_card == G.jokers.cards[i+1] then
                        return {
                            message = localize('k_again_ex'),
                            repetitions = 1,
                            card = card
                        }
                        end
                    end        
                end
            end
        end,
    })