    SMODS.Enhancement({
        key = 'window',
        atlas = 'bld_blindrank',
        pos = {x = 8, y = 0},
        config = {
            extra = {
                value = 11,
                money = 10,
                hues = {"Faded"}
            }},
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
        weight = 3,
        pools = {
            ["bld_obj_blindcard_generate"] = true,
            ["bld_obj_blindcard_single"] = true,
            ["bld_obj_blindcard_faded"] = true,
        },
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.before and card.facing ~= 'back' then
                for i=1, #G.play.cards do
                    if G.play.cards[i]:is_color("Yellow", true, false) and G.play.cards[i] ~= card then
                        if G.play.cards[i].facing ~= 'back' then 
                        G.play.cards[i]:flip()
                        end
                        G.play.cards[i]:set_debuff(true)
                    end
                end
            end
            if context.cardarea == G.play and context.main_scoring then
                return {
                    dollars = card.ability.extra.money
                }
            end
            if context.cardarea == G.play and context.after and card.facing ~= 'back' then
                for i=1, #G.play.cards do
                    if G.play.cards[i]:is_color("Yellow", true, false) and G.play.cards[i] ~= card then
                        G.play.cards[i]:set_debuff(false)
                    end
                end
            end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.money
                }
            }
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
