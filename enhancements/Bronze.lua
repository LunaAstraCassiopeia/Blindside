    BLINDSIDE.Blind({
        key = 'bronze',
        atlas = 'bld_blindrank',
        pos = {x = 0, y = 6},
        config = {
            extra = {
                value = 14,
                xmult = 0.5,
                xmultup = 0.25,
            }},
        hues = {"Red"},
        rare = true,
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
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.main_scoring then
                local flipped = 0
                for _, value in pairs(G.hand.cards) do
                    if value.facing == 'back' then
                        local current = flipped
                        G.E_MANAGER:add_event(Event({
                            trigger = "after",
                            delay = 0.3,
                            func = function ()
                                value:juice_up(0.35, 0.35)
                                play_sound("multhit1", 0.92 + current * 0.04, 0.6)
                                return true
                            end
                        }))
                        flipped = flipped + 1
                    end
                end

                if flipped > 0 then
                    return {
                        xmult = 1 + card.ability.extra.xmult * flipped
                    }
                end
            end
            
            --[[if context.cardarea == G.hand and context.individual then --and context.scoring_hand and  and card.facing ~= 'back' then
                local played = false
                for _, value in pairs(context.scoring_hand) do
                    if value == card then
                        played = true
                        break
                    end
                end
                if played then
                    return {
                        xmult = card.ability.extra.xmult,
                        card = context.other_card
                    }
                end
            end]]
        end,
        loc_vars = function(self, info_queue, card)
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
