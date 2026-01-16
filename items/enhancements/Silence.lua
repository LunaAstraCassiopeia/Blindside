    BLINDSIDE.Blind({
        key = 'silence',
        atlas = 'bld_blindrank',
        pos = {x = 2, y = 10},
        config = {
            extra = {
                value = 999
            }
        },
        hues = {"Faded"},
        curse = true,
        credit = {
            art = "Gud",
            code = "base4",
            concept = "base4"
        },
        loc_vars = function(self, info_queue, card)
            if card.ability.extra.upgraded then
                info_queue[#info_queue+1] = {key = 'bld_burn', set = 'Other'}
            else
                info_queue[#info_queue+1] = G.P_TAGS['tag_bld_debuff']
            end

            return {
                key = card.ability.extra.upgraded and 'm_bld_silence_upgraded' or 'm_bld_silence'
            }
        end,
        upgrade = function(card)
            if not card.ability.extra.upgraded then
                card.ability.extra.upgraded = true
            end
        end,
        calculate = function(self, card, context)
            if context.before and context.main_eval and card.ability.extra.upgraded and context.scoring_name and tableContains(card, G.hand.cards) then
                level_up_hand(card, context.scoring_name, false, 1)
            end

            if (context.hand_discard or context.hand_retain) and context.other_card == card and card.ability.extra.upgraded then
                return { burn = true }
            end

            if context.after and context.scoring_name and not card.ability.extra.upgraded and context.main_eval and tableContains(card, G.hand.cards) then
                G.E_MANAGER:add_event(Event({
                    func = function ()
                        G.bolt_played_hand = context.scoring_name
                        add_tag(Tag('tag_bld_debuff'))
                        return true
                    end
                }))
                return {
                    message = localize('k_tagged_ex')
                }
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
