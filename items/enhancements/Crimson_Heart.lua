    BLINDSIDE.Blind({
        key = 'crimson_heart',
        atlas = 'bld_blindrank',
        pos = {x = 5, y = 12},
        config = {
            extra = {
                value = 1,
                xmult = 2,
                xmultup = 2,
            }
        },
        hues = {"Red"},
        hidden = true,
        legendary = true,
        calculate = function(self, card, context)

            if context.cardarea == G.play and context.main_scoring then
                card.ability.extra.was_last_hand = true
                return {
                    xmult = card.ability.extra.xmult
                }
            end

            if context.before then
                card.ability.extra.was_last_hand = false
            end

            if card.ability.extra.was_last_hand and context.end_of_round then
                card.ability.extra.was_last_hand = false
                G.E_MANAGER:add_event(Event({
                    func = function ()
                        add_tag(Tag('tag_bld_heartbreak'))
                        play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                        play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                        return true
                    end
                }))
                delay(0.3)
            end
        end,
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue+1] = G.P_TAGS['tag_bld_heartbreak']
            return {
                vars = {
                    card.ability.extra.xmult
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
                card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmultup
                card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
