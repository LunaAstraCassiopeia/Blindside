
    SMODS.Joker({
        key = 'prayerwheel',
        atlas = 'bld_trinkets',
        pos = {x = 5, y = 7},
        rarity = 'bld_doodad',
        cost = 9,
        blueprint_compat = true,
        eternal_compat = true,
        in_pool = function(self, args)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
                return true
            else
            return false
            end
        end,
        credit = {
            art = "Gappie",
            code = "base4",
            concept = "AstraLuna"
        },
        calculate = function(self, card, context)
            if context.playing_card_added then
                for key, the_card in pairs(context.cards) do
                    local copy_card = copy_card(the_card)
                    copy_card:add_to_deck()
                    G.deck.config.card_limit = G.deck.config.card_limit + 1
                    table.insert(G.playing_cards, copy_card)
                    copy_card.states.visible = nil
                    
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            card:juice_up()
                            copy_card:start_materialize()
                            G.E_MANAGER:add_event(Event({
                                trigger = 'after',
                                delay = 0.8,
                                func = function()
                                    G.deck:emplace(copy_card)
                                    return true
                                end
                            }))
                            return true
                        end
                    }))
                end
            end
        end
    })