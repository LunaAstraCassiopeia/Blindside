    BLINDSIDE.Blind({
        key = 'death',
        atlas = 'bld_blindrank',
        pos = {x = 4, y = 11},
        config = {
            extra = {
                value = 30,
                victim = nil
            }},
        hues = {"Faded"},
        curse = true,
        credit = {
            art = "pangaea47",
            code = "base4",
            concept = "base4"
        },
        calculate = function(self, card, context)
            if context.before and tableContains(card, context.scoring_hand) then
                local choices = {}

                for key, value in pairs(G.play.cards) do
                    if value ~= card then
                        table.insert(choices, value)
                    end
                end

                if #choices > 0 then
                    card.ability.extra.victim = choose_stuff(choices, 1, pseudoseed('bld_death'))[1]
                end
            end

            if card.ability.extra.victim and context.destroy_card == card.ability.extra.victim then
                card.ability.extra.victim = nil
                return {remove = true}
            end
        end,
        upgrade = function(card)
            if not card.ability.extra.upgraded then
                card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
