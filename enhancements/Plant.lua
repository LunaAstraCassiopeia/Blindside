    SMODS.Enhancement({
        key = 'plant',
        atlas = 'bld_blindrank',
        pos = {x = 1, y = 2},
        config = {
            x_mult = 3,
            extra = {
                value = 11,
                chance = 1,
                trigger = 3,
                chance_up = 2,
                hues = {"Green"}
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
            ["bld_obj_blindcard_warm"] = true,
            ["bld_obj_blindcard_cool"] = true,
            ["bld_obj_blindcard_single"] = true,
            ["bld_obj_blindcard_green"] = true,
        },
        calculate = function(self, card, context)
                if context.cardarea == G.play and context.before then
                    if SMODS.pseudorandom_probability(card, pseudoseed("flip"), card.ability.extra.chance, card.ability.extra.trigger, 'flip') and card.facing ~= 'back' then
                    for i=1, #G.play.cards do
                        if G.play.cards[i] ~= card then
                            if G.play.cards[i].facing ~= 'back' then 
                            G.play.cards[i]:flip()
                            end
                            G.play.cards[i]:set_debuff(true)
                        end
                        end
                    end
                end
                if context.cardarea == G.play and context.after and card.facing ~= 'back' then
                    for i=1, #G.play.cards do
                        if G.play.cards[i] and G.play.cards[i] ~= card then
                            G.play.cards[i]:set_debuff(false)
                        end
                    end
                end
        end,
        loc_vars = function(self, info_queue, card)
            local chance, trigger = SMODS.get_probability_vars(card, card.ability.extra.chance, card.ability.extra.trigger, 'flip')
            return {
                vars = {
                    card.ability.x_mult,
                    chance,
                    trigger
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.extra.trigger = card.ability.extra.trigger + card.ability.extra.chance_up
            card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
