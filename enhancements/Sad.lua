    BLINDSIDE.Blind({
        key = 'sad',
        atlas = 'bld_blindrank',
        pos = {x = 4, y = 10},
        config = {
            extra = {
                value = 30,
                victims = {}
            }},
        hues = {"Blue"},
        curse = true,
        credit = {
            art = "Gud",
            code = "base4",
            concept = "base4"
        },
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.before and card.facing ~= 'back' then
                if card.ability.extra.upgraded then
                    for key, value in pairs(context.scoring_hand) do
                        if value.config.center.weight == 67 and card ~= value then
                            value.config.center.blind_debuff(value, true)
                            table.insert(card.ability.extra.victims, value)
                        end
                    end
                else
                    local self_pos = nil
                    for i=1, #G.play.cards do
                        if G.play.cards[i] == card then
                            self_pos = i
                        end
                    end
                    if G.play.cards[self_pos-1] then
                        G.play.cards[self_pos-1].config.center.blind_debuff(G.play.cards[self_pos-1], true)
                    end
                    if G.play.cards[self_pos+1] then
                        G.play.cards[self_pos+1].config.center.blind_debuff(G.play.cards[self_pos+1], true)
                    end
                end
            end

            if #card.ability.extra.victims > 0 and tableContains(context.burn_card, card.ability.extra.victims) then
                return {remove = true}
            end

            if context.after then
                card.ability.extra.victims = {}
            end
        end,
        loc_vars = function(self, info_queue, card)
            if card.ability.extra.upgraded then
                info_queue[#info_queue+1] = {key = 'bld_burn', set = 'Other'}
            end
            return {
                key = card.ability.extra.upgraded and 'm_bld_sad_upgraded' or 'm_bld_sad'
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
