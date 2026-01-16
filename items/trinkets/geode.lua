
    SMODS.Joker({
        key = 'geode',
        atlas = 'bld_trinkets',
        pos = {x = 6, y = 7},
        rarity = 'bld_keepsake',
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
        config = {
            extra = {
                eating_good = false,
                xmult = 3,
            }
        },
        credit = {
            art = "Gappie",
            code = "base4",
            concept = "base4"
        },
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.xmult,
                    card.ability.extra.eating_good and localize('k_active_ex') or localize('k_bld_inactive')
                }
            }
        end,
        calculate = function(self, card, context)
            if context.setting_blind then
                local pool = {}
                for key, value in pairs(G.consumeables.cards) do
                    if value.config.center.set == 'bld_obj_mineral' then
                        table.insert(pool, value)
                    end
                end
                if #pool > 0 then
                    card.ability.extra.eating_good = true
                    return {
                        message = localize('k_bld_ate_mineral'),
                        func = function ()
                            G.E_MANAGER:add_event(Event({
                                func = function ()
                                    choose_stuff(pool, 1, pseudoseed('geode_eat'))[1]:start_dissolve()
                                    return true
                                end
                            }))
                        end
                    }
                end

                card.ability.extra.eating_good = false
                return {
                    message = localize('k_nope_ex')
                }
            end

            if context.joker_main and card.ability.extra.eating_good then
                return {
                    xmult = card.ability.extra.xmult
                }
            end
        end
    })