    BLINDSIDE.Blind({
        key = 'deep',
        atlas = 'bld_blindrank',
        pos = {x = 1, y = 9},
        config = {
            extra = {
                xchips = 1.5,
                xchipsup = 0.5,
                value = 1000,
            }},
        hues = {"Blue", "Faded"},
        hidden = true,
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
        --weight = 1,
        calculate = function(self, card, context)
            if context.cardarea == G.hand and context.individual then
                if context.other_card:is_color("Blue") then
                    return {
                        xchips = card.ability.extra.xchips,
                        card = context.other_card
                    }
                end
            end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.xchips,
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.extra.xchips = card.ability.extra.xchips + card.ability.extra.xchipsup
            card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
