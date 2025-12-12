    BLINDSIDE.Blind({
        key = 'bite',
        atlas = 'bld_blindrank',
        pos = {x = 6, y = 5},
        config = {
            extra = {
                xmult = 1.35,
                value = 11,
                xmultup = 0.4,
            }},
        replace_base_card = true,
        no_rank = true,
        no_suit = true,
        hues = {"Purple"},
        basic = true,
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
            if context.cardarea == G.play and context.before and card.facing ~= 'back' then
                for i=1, #G.play.cards do
                    if G.play.cards[i]:is_color("Red", true, false) and G.play.cards[i] ~= card then
                        if G.play.cards[i].facing ~= 'back' then 
                        G.play.cards[i]:flip()
                        end
                        G.play.cards[i]:set_debuff(true)
                    end
                end
            end
            if context.cardarea == G.play and context.after and card.facing ~= 'back' then
                for i=1, #G.play.cards do
                    if G.play.cards[i]:is_color("Red", true, false) and G.play.cards[i] ~= card then
                        G.play.cards[i]:set_debuff(false)
                    end
                end
            end
            if context.cardarea == G.play and context.main_scoring then
                return {
                    xmult = card.ability.extra.xmult
                }
            end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.xmult
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmultup
            card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
