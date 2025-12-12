    BLINDSIDE.Blind({
        key = 'bones',
        atlas = 'bld_blindrank',
        pos = {x = 6, y = 3},
        config = {
            extra = {
                value = 100,
                chance = 3,
            }},
        hues = {"Green", "Faded"},
        rare = true,
        replace_base_card = true,
        no_rank = true,
        no_suit = true,
        overrides_base_rank = true,
        in_pool = function(self, args)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
                return true
            else
            return false
            end
        end,
        calculate = function(self, card, context)
                if (context.cardarea == G.play or (card.ability.extra.upgraded and context.cardarea == G.hand)) and context.before then
		            G.GAME.probabilities.normal = G.GAME.probabilities.normal + card.ability.extra.chance
                end
                if (context.cardarea == G.play or (card.ability.extra.upgraded and context.cardarea == G.hand)) and context.after then
		            G.GAME.probabilities.normal = G.GAME.probabilities.normal - card.ability.extra.chance
                end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                key = card.ability.extra.upgraded and 'm_bld_bones_upgrade' or 'm_bld_bones',
                vars = {
                    card.ability.extra.chance
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
