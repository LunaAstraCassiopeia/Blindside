
    SMODS.Joker({
        key = 'bracelet',
        atlas = 'bld_trinkets',
        pos = {x = 0, y = 2},
        rarity = 'bld_curio',
        config = {
            extra = {
                chance = 1,
                trigger = 4,
            }
        },
        cost = 8,
        blueprint_compat = false,
        eternal_compat = true,
        loc_vars = function (self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_SEALS['bld_floral']
        end,
        credit = {
            art = "AstraLuna",
            code = "AstraLuna",
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
        calculate = function (self, card, context)
            if context.after and G.GAME.chips + SMODS.calculate_round_score() - G.GAME.blind.chips >= 0 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        context.scoring_hand[1]:set_seal('bld_floral', nil, true)
                        context.scoring_hand[1]:juice_up()
                        return true
                    end
                }))
            end
        end
    })