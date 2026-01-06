    BLINDSIDE.Blind({
        key = 'work',
        atlas = 'bld_blindrank',
        pos = {x = 8, y = 11},
        config = {
            extra = {
                value = 30,
                xmult_per = 1,
            }},
        hues = {"Purple"},
        curse = true,
        credit = {
            art = "Gud",
            code = "base4",
            concept = "base4"
        },
        calculate = function(self, card, context)
            if context.after and context.cardarea == G.play and card.facing ~= 'back' then
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                local copy_card = SMODS.create_card({ set = 'Base', enhancement = 'm_bld_stress' })
                copy_card:add_to_deck()
                G.deck.config.card_limit = G.deck.config.card_limit + 1
                table.insert(G.playing_cards, copy_card)
                G.hand:emplace(copy_card)
                copy_card.states.visible = nil
                G.E_MANAGER:add_event(Event({
                    func = function()
                        copy_card:start_materialize()
                        return true
                    end
                }))   
                return {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                SMODS.calculate_context({ playing_card_added = true, cards = { copy_card } })
                                return true
                            end
                        }))
                    end
                }
            end
            if context.cardarea == G.hand and context.main_scoring then
                local curses = 0 -- essentially does not count self
                for key, value in pairs(G.hand.cards) do
                    if value.config.center.weight == 67 then
                        curses = curses + 1
                    end
                end
                return {
                    xmult = card.ability.extra.xmult_per * curses
                }
            end
        end,
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue+1] = G.P_CENTERS['m_bld_stress']
            return {
                vars = {
                    card.ability.extra.xmult_per
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
