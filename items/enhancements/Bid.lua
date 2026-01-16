    BLINDSIDE.Blind({
        key = 'bid',
        atlas = 'bld_blindrank',
        pos = {x = 8, y = 7},
        config = {
            extra = {
                value = 16,
                xmult = 1.5,
                xmult_up = 0.5,
                retrigger_tags = 2
            }
        },
        credit = {
            art = "Zayden",
            code = "base4",
            concept = "base4"
        },
        hues = {"Yellow"},
        rare = true,
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.main_scoring then
                return {
                    xmult = card.ability.extra.xmult
                }
            end

            if context.cardarea == G.play and context.other_card == card and context.repetition then
                local tags = 0

                for key, tag in pairs(G.GAME.tags) do
                    if not tag.triggered then
                        tags = tags + 1
                    end
                end
                return {
                    repetitions = math.floor(tags / card.ability.extra.retrigger_tags)
                }
            end
        end,
        loc_vars = function(self, info_queue, card)
            local tags = 0

            for key, tag in pairs(G.GAME.tags) do
                if not tag.triggered then
                    tags = tags + 1
                end
            end
            local retriggers = math.floor(tags / card.ability.extra.retrigger_tags)
            return {
                vars = {
                    card.ability.extra.xmult,
                    retriggers,
                    retriggers == 1 and "" or "s"
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
                card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_up
                card.ability.extra.upgraded = true
            end
        end
    })
    
----------------------------------------------
------------MOD CODE END----------------------
