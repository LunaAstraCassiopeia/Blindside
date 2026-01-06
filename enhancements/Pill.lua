BLINDSIDE.Blind({
    key = 'pill',
    atlas = 'bld_blindrank',
    pos = {x = 7, y = 11},
    config = {
        forced_selection = true,
        extra = {
            value = 30,
            xmult = 3,
            odds = 2,
        }},
    hues = {"Green"},
    curse = true,
        credit = {
            art = "Gud",
            code = "base4",
            concept = "base4"
        },
    always_scores = true,
    calculate = function(self, card, context)
        -- does not work in booster packs. intentional.
        -- also contains a failsafe for if the card cannot be selected due to # of cards
        -- if another reason applies hopefully add_to_highlighted will be sufficient to stop silliness
        if tableContains(card, G.hand.cards) and not tableContains(card, G.hand.highlighted) and #G.hand.highlighted < 5 and G.STATE ~= G.STATES.SMODS_BOOSTER_OPENED then
            card.ability.forced_selection = true
            G.hand:add_to_highlighted(card, true)
        end
        if context.cardarea == G.play and context.before and card.facing ~= 'back' then
            if SMODS.pseudorandom_probability(card, pseudoseed("pill"), 1, card.ability.extra.odds, 'pill') and card.facing ~= "back" then
                card:flip()
                card:flip()
            else
                if card.facing ~= 'back' then 
                card:flip()
                end
            end
        end
        if context.cardarea == G.play and context.main_scoring then
            if card.facing ~= "back" then
                return {
                    xmult = card.ability.extra.xmult
                }
            else
                return {
                    message = localize('k_nope_ex'),
                    colour = G.C.GREEN
                }
            end
        end
    end,
    loc_vars = function(self, info_queue, card)
    info_queue[#info_queue+1] = {key = 'bld_self_scoring', set = 'Other'}
        local chance, trigger = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'pill')
        return {
            vars = {
                card.ability.extra.xmult,
                chance,
                trigger
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
