    BLINDSIDE.Blind({
        key = 'vault',
        atlas = 'bld_blindrank',
        pos = {x = 8, y = 6},
        config = {
            extra = {
                value = 17,
                gain = 4,
                total = 0,
                gain_up = 1,
                retain = true,
            }},
        hues = {"Yellow"},
        rare = true,
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue+1] = {key = 'bld_retain', set = "Other"}
            return {
                key = card.ability.extra.upgraded and 'm_bld_vault_upgraded' or 'm_bld_vault',
                vars = {
                    card.ability.extra.gain,
                    card.ability.extra.total
                }
            }
        end,
        calculate = function(self, card, context)
            if card.ability.extra.total > 0 and context.cardarea == G.play and context.main_scoring and card.facing ~= 'back' then
                local cash = card.ability.extra.total
                return {
                    dollars = cash,
                    message = localize('k_reset'),
                    func = function ()
                        card.ability.extra.total = card.ability.extra.upgraded and math.floor(card.ability.extra.total/2) or 0
                    end
                }
            end
            if context.cardarea == G.hand and context.main_scoring and not context.end_of_round then
                card.ability.extra.total = card.ability.extra.total + card.ability.extra.gain
                return {
                    message = localize('k_upgrade_ex')
                }
            end
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
                card.ability.extra.gain = card.ability.extra.gain + card.ability.extra.gain_up
                card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
