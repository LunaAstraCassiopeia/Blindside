
    SMODS.Joker({
        key = 'barrel',
        atlas = 'bld_trinkets',
        pos = {x = 7, y = 5},
        rarity = 'bld_trinket',
        config = {
            extra = {
                xmult_gain = 0.25,
            }
        },
        cost = 12,
        blueprint_compat = false,
        eternal_compat = true,
        loc_vars = function (self, info_queue, card)
            return {
                vars = {
                card.ability.extra.xmult_gain
            }
        }
        end,
        credit = {
            art = "AstraLuna",
            code = "base4",
            concept = "AstraLuna"
        },
        in_pool = function(self, args)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
                return true
            else
            return false
            end
        end,
        calculate = function(self, card, context)
            if context.joker_main then
                local unique_blinds = {}
                for key1, value1 in pairs(context.scoring_hand) do
                    local inside = false
                    for key2, value2 in pairs(unique_blinds) do
                        if value1.config.center.key == value2.config.center.key then
                            inside = true
                            break
                        end
                    end
                    if not inside then
                        table.insert(unique_blinds, value1)
                    end
                end
                return {
                    xmult = 1 + card.ability.extra.xmult_gain * #unique_blinds
                }
            end
        end
    })