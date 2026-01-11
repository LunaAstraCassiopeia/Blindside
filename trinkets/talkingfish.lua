
    SMODS.Joker({
        key = 'talkingfish',
        atlas = 'bld_trinkets',
        pos = {x = 2, y = 5},
        rarity = 'bld_doodad',
        cost = 8,
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
        credit = {
            art = "AstraLuna",
            code = "AstraLuna",
            concept = "AstraLuna"
        },
        calculate = function(self, card, context)
            if context.joker_main then
                local blues = 0
                for k, v in ipairs(G.hand.cards) do
                    if v:is_color('Blue') then
                        blues = blues + 1
                    end
                end
                if blues >= 2 then
                    return {
                        extra = {
                            message = localize('k_hey_ex'),
                            func = function()
                                ease_discard(1)
                            end
                        },
                        colour = G.C.RED
                    }
                end
            end
        end
    })