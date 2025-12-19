
    SMODS.Joker({
        key = 'statuette',
        atlas = 'bld_trinkets',
        pos = {x = 6, y = 4},
        rarity = 'bld_keepsake',
        config = {
            extra = {
                xmult = 1,
            }
        },
        cost = 15,
        blueprint_compat = true,
        eternal_compat = true,
        loc_vars = function (self, info_queue, card)
            return {
                vars = {
                card.ability.extra.xmult,
            }
        }
        end,
        in_pool = function(self, args)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
                return true
            else
            return false
            end
        end,
        calculate = function(self, card, context)
            if context.before then
                for key, value in pairs(context.scoring_hand) do
                    if value:is_color("Faded") then
                        if value.facing ~= 'back' then 
                            value:flip()
                        end
                        value:set_debuff(true)
                    end
                end
            end

            if context.after then
                for key, value in pairs(context.scoring_hand) do
                    value:set_debuff(false)
                end
            end
            
            if context.joker_main and context.scoring_hand then
                local fadedcount = 0
                for key, value in pairs(context.scoring_hand) do
                    if value:is_color("Faded") then
                        fadedcount = fadedcount + 1
                    end
                end
                if fadedcount > 0 then
                    return {
                        xmult = 1 + card.ability.extra.xmult*fadedcount
                    }
                end
            end
        end
    })