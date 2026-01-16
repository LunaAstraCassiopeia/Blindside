    BLINDSIDE.Blind({
        key = 'claw',
        atlas = 'bld_blindrank',
        pos = {x = 8, y = 8},
        config = {
            extra = {
                value = 100,
                mult = 5,
                multup = 3,
                wound_tally = 0,
            }
        },
        hues = {"Red","Purple"},
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
                    return {
                        mult = card.ability.extra.mult*card.ability.extra.wound_tally
                    }
            end
            if context.after and context.cardarea == G.play and card.facing ~= 'back' then
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                local copy_card = SMODS.create_card({ set = 'Base', enhancement = 'm_bld_wound' })
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
        end,
        loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_bld_wound
            return {
                vars = {
                    card.ability.extra.mult,
                    card.ability.extra.mult*card.ability.extra.wound_tally
                }
            }
        end,
        update = function(self, card, dt)
            card.ability.extra.wound_tally = 0
            if G.STAGE == G.STAGES.RUN then
                for k, v in pairs(G.playing_cards) do
                    if v.config.center_key == 'm_bld_wound' then 
                        card.ability.extra.wound_tally = card.ability.extra.wound_tally+1 end
                end
            end
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.multup
            card.ability.extra.upgraded = true
            end
        end
    })
    
----------------------------------------------
------------MOD CODE END----------------------
