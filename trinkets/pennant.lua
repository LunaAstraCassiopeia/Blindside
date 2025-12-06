
    SMODS.Joker({
        key = 'pennant',
        atlas = 'bld_trinkets',
        pos = {x = 7, y = 0},
        rarity = 'bld_keepsake',
        config = {
            extra = {
                xmult = 1
            }
        },
        cost = 15,
        blueprint_compat = true,
        eternal_compat = true,
        in_pool = function(self, args)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
                return true
            else
            return false
            end
        end,
        calculate = function(self, card, context)
            if context.joker_main and context.scoring_hand then
                local purples = {}
                for key, value in pairs(context.scoring_hand) do
                    if value:is_color("Purple") and not tableContains(value.config.center.name, purples) then
                        table.insert(purples, value.config.center.name)
                    end
                end
                if #purples > 1 then
                    return {
                        xmult = #purples
                    }
                end
            end
        end
    })