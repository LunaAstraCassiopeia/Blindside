    BLINDSIDE.Blind({
        key = 'verdant_leaf',
        atlas = 'bld_blindrank',
        pos = {x = 2, y = 12},
        config = {
            extra = {
                value = 1,
                xmult = 1,
                xmultgain = 0.5,
                xmultup = 0.5,
            }
        },
        hues = {"Green"},
        hidden = true,
        legendary = true,
        calculate = function(self, card, context) 
            if context.cardarea == G.play and context.main_scoring then
                return {
                    xmult = card.ability.extra.xmult
                }
            end

            if context.selling_card and context.card.config.center.set == 'Joker' and context.main_eval then
                card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmultgain
                return {
                    message = localize('k_upgrade_ex')
                }
            end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.xmult,
                    card.ability.extra.xmultgain
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.extra.xmultgain = card.ability.extra.xmultgain + card.ability.extra.xmultup
            card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
