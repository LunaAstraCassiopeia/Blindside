SMODS.Consumable {
    key = 'blindsoul',
    set = 'bld_obj_ritual',
    atlas = 'bld_consumable',
    hidden = true,
    soul_sets = {
        'bld_obj_ritual',
        'bld_obj_filmcard',
        'bld_obj_mineral',
        'Playing Card',
        'Enhanced',
    },
    soul_rate = 0.003,
    can_use = function (self, card)
        return true
    end,
    pos = {x=7, y=4},
    soul_pos = {x=8, y=4},
    use = function(self, card, area)
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.4,func = function() 
                play_sound('bld_crack', 1.0, 0.8)
                card:juice_up(0.8, 0.5)
        return true end }))
        delay(1)
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.4,func = function()
                play_sound('bld_crack', 1.1, 1)
                card:juice_up(0.8, 0.5)
        return true end }))
        delay(1)
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.4,func = function()
                play_sound('bld_crack', 1.3, 1.1)
                card:juice_up(0.8, 0.5)
        card:explode()
        return true end }))
        delay(1.5)
        local args = {}
        args.guaranteed = true
        args.options = G.P_CENTER_POOLS.bld_obj_blindcard_legendary
        args.legendary = true
        local cardtype = BLINDSIDE.poll_enhancement(args)
        local legendary = SMODS.create_card({ set = 'Playing Card', enhancement = cardtype, area = G.play })
        legendary.states.visible = false
        G.playing_card = (G.playing_card and G.playing_card + 1) or 1
        legendary.playing_card = G.playing_card
        table.insert(G.playing_cards, legendary)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 2,
            func = function()
                    G.play:emplace(legendary)
                    legendary:start_materialize({ G.C.SECONDARY_SET.Enhanced })
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 1.2,
            func = function()
                local legendary = G.play[1]
                draw_card(G.play, G.deck, 90, 'up')
                SMODS.calculate_context({ playing_card_added = true, cards = {legendary} })
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.7,
                    func = function()
                        pseudoshuffle(G.deck.cards, 'blindsoul'..G.GAME.round_resets.ante)
                        return true
                    end
                }))
                return true
            end
        }))
    end,
}