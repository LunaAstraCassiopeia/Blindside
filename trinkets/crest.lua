
    SMODS.Joker({
        key = 'crest',
        atlas = 'bld_trinkets',
        pos = {x = 4, y = 0},
        rarity = 'bld_keepsake',
        config = {
            extra = {
                xchips = 3,
                min = 1,
            }
        },
        cost = 15,
        blueprint_compat = true,
        eternal_compat = true,
        loc_vars = function (self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.xchips,
                    card.ability.extra.min,
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
            if context.before and context.scoring_hand then
                local count = 0
                for i, card in pairs(context.scoring_hand) do
                    if card:is_color("Blue") then
                        count = count + 1
                    end
                end
                if count < card.ability.extra.min then
                    for key, value in pairs(context.scoring_hand) do
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

            if context.joker_main then
                return {
                    xchips = card.ability.extra.xchips
                }
            end
        end
    })