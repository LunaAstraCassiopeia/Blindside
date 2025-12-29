    BLINDSIDE.Blind({
        key = 'pile',
        atlas = 'bld_blindrank',
        pos = {x = 1, y = 3},
        config = {
            extra = {
                value = 15,
                chips = 10,
                chips_up = 10,
                blue_tally = 0,
            }},
        hues = {"Blue"},
        calculate = function(self, card, context) 
            if context.cardarea == G.play and context.main_scoring then
                return {
                    chips = card.ability.extra.chips*card.ability.extra.blue_tally
                }
            end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.chips,
                    card.ability.extra.chips*card.ability.extra.blue_tally
                }
            }
        end,
        update = function(self, card, dt)
            card.ability.extra.blue_tally = 0
            if G.STAGE == G.STAGES.RUN then
                for k, v in pairs(G.playing_cards) do
                    if v:is_color("Blue") then card.ability.extra.blue_tally = card.ability.extra.blue_tally+1 end
                end
            end
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_up
            card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
