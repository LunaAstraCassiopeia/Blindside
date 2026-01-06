    BLINDSIDE.Blind({
        key = 'crimson_heart',
        atlas = 'bld_blindrank',
        pos = {x = 9, y = 9},
        config = {
            extra = {
                value = 1,
                disabled_this_ante = 0,
            }
        },
        hues = {"Red"},
        basic = true,
        calculate = function(self, card, context) 
            if context.cardarea == G.play and context.main_scoring then
                if card.ability.extra.disabled_this_ante < 1 or (card.ability.extra.disabled_this_ante < 2 and card.ability.extra.upgraded) and not G.GAME.blind.disabled then
                    card.ability.extra.disabled_this_ante = card.ability.extra.disabled_this_ante + 1
                    G.E_MANAGER:add_event(Event({
                        func = function ()
                            if G.GAME.blind and not G.GAME.blind.disabled then
                                G.GAME.blind:disable()
                                G.GAME.blindassist:disable()
                            end
                            return true
                        end
                    }))
                    return {
                        message = localize('k_disabled_ex')
                    }
                else
                    return {
                        message = localize('k_nope_ex')
                    }
                end
            end

            if context.beat_boss then
                card.ability.extra.disabled_this_ante = 0
            end
        end,
        loc_vars = function(self, info_queue, card)
            local verbage = ""
            if card.ability.extra.disabled_this_ante == 0 or card.ability.extra.upgraded then
                verbage = "Active!"
            elseif card.ability.extra.disabled_this_ante == 1 and not card.ability.extra.upgraded or card.ability.extra.disabled_this_ante >= 2 then
                verbage = "Inactive"
            elseif card.ability.extra.disabled_this_ante == 1 and card.ability.extra.upgraded then
                verbage = "Used once!"
            end
            return {
                key = card.ability.extra.upgraded and 'm_bld_crimson_heart_upgraded' or 'm_bld_crimson_heart',
                vars = {
                    verbage
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
