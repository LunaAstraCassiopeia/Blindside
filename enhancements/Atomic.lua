    BLINDSIDE.Blind({
        key = 'atomic',
        atlas = 'bld_blindrank',
        pos = {x = 0, y = 9},
        config = {
            extra = {
                kaboom = false,
                odds = 2,
                repetitions = 2,
                value = 1000,
            }},
        replace_base_card = true,
        no_rank = true,
        no_suit = true,
        hues = {"Yellow", "Green"},
        hidden = true,
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
            if context.cardarea == G.play and context.main_scoring then
                card.ability.extra.goingtoburn = true
                add_tag(Tag('tag_bld_maxim'))
                return {
                    message = "Tag!"
                }
            end
            if context.repetition and context.other_card and context.other_card == card and context.other_card.facing ~= "back" then
                return {
                    repetitions = card.ability.extra.repetitions
                }
            end

            if context.before then
                if SMODS.pseudorandom_probability(card, 'atomic', 1, card.ability.extra.odds) then
                    card.ability.extra.kaboom = true
                end
            end

            if card.ability.extra.kaboom and context.burn_card and (context.cardarea == G.play or context.cardarea == G.hand) then
                if context.burn_card == card then
                    return { message = "KABOOM!", remove = true }
                end
                return { remove = true }
            end

            if context.after then
                card.ability.extra.kaboom = false
            end
        end,
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue + 1] = G.P_TAGS['tag_bld_maxim']
            info_queue[#info_queue+1] = {key = 'bld_burn', set = 'Other'}
            local n,d = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'bld_atomic')
            return {
                vars = {
                    card.ability.extra.repetitions,
                    n,
                    d
                }
            }
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
