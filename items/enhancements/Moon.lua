    BLINDSIDE.Blind({
        key = 'moon',
        atlas = 'bld_blindrank',
        pos = {x = 1, y = 6},
        config = {
            extra = {
                value = 16,
                mult = 2,
                mult_gain = 2,
                triggered_this_round = false
            }},
        hues = {"Yellow"},
        calculate = function(self, card, context)
            if context.before and context.cardarea == G.play and card.facing ~= 'back' and not card.ability.extra.triggered_this_round then
                return {
                    focus = card,
                    message = localize('k_tagged_ex'),
                    func = function()
                        local pool = {"tag_bld_maxim","tag_bld_toss","tag_bld_recursive","tag_bld_symmetry",}
                        if (G.GAME.moon_batteries_this_round or 0) < 2 then
                            table.insert(pool, "tag_bld_battery")
                        end
                        local tag_key = choose_stuff(pool, 1, "moon")[1]
                        if tag_key == "tag_bld_battery" then
                            G.GAME.moon_batteries_this_round = (G.GAME.moon_batteries_this_round or 0) + 1
                        end
                        card.ability.extra.triggered_this_round = true
                        add_tag(Tag(tag_key))
                    end,
                    card = card
                }
            end
            if context.main_scoring and context.cardarea == G.play and #G.GAME.tags > 0 then
                return {
                    mult = card.ability.extra.mult * #G.GAME.tags
                }
            end
            if context.end_of_round then
                card.ability.extra.triggered_this_round = false
            end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                key = (not card.ability.extra.triggered_this_round or G.STATE == G.STATES.SHOP) and 'm_bld_moon' or 'm_bld_moon_inactive',
                vars = {
                    card.ability.extra.mult,
                    card.ability.extra.mult * #G.GAME.tags
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
            card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
