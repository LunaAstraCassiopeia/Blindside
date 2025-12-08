
    SMODS.Joker({
        key = 'giftbox',
        atlas = 'bld_trinkets',
        pos = {x = 4, y = 6},
        rarity = 'bld_keepsake',
        config = {
            extra = {
                xmult = 0.3,
            }
        },
        cost = 12,
        blueprint_compat = false,
        eternal_compat = true,
        loc_vars = function (self, info_queue, card)
            return {
                vars = {
                card.ability.extra.xmult
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
            if context.joker_main then
                local total = 0
                for key, tag in pairs(G.GAME.tags) do
                    if not tag.triggered then
                        local progress = total
                        total = total + 1
                        G.E_MANAGER:add_event(Event({
                            trigger = "before",
                            delay = 0.5,
                            func = function ()
                                card:juice_up(0.2, 0.3)
                                tag:juice_up(0.6, 0.5)
                                play_sound('chips1', 0.8 + 0.05*progress, 0.9)
                                return true
                            end
                        }))
                    end
                end

                if total > 0 then
                    return {
                        xmult = total*card.ability.extra.xmult + 1
                    }
                end
            end
        end
    })