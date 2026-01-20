
    SMODS.Joker({
        key = 'mask',
        atlas = 'bld_trinkets',
        pos = {x = 3, y = 3},
        rarity = 'bld_trinket',
        cost = 6,
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
            if context.selling_self then
                if G.GAME.round_resets.blind_states.Small == 'Select' then
                    G.from_boss_tag = true
                    G.FUNCS.reroll_small()
                elseif G.GAME.round_resets.blind_states.Big == 'Select' then
                    G.from_boss_tag = true
                    G.FUNCS.reroll_big()
                elseif G.GAME.round_resets.blind_states.Boss == 'Select' then
                    G.from_boss_tag = true
                    G.FUNCS.reroll_boss()
                end
            end
        end
    })