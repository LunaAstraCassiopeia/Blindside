SMODS.Blind({
    key = 'yorick',
    atlas = 'bld_joker',
    pos = {x=0, y=39},
    boss_colour = HEX('e8b867'),
    mult = 16,
    dollars = 10,
    boss = {min = 1, showdown = true},
    in_pool = function(self, args)
        if G.GAME.selected_back.effect.center.config.extra then
            if not G.GAME.selected_back.effect.center.config.extra.blindside and G.GAME.round_resets.ante%6 == 0 then return false end
            return true
        else
        return false
        end
    end,
    set_blind = function(self)
        G.GAME.blindassist.states.visible = false
        G.GAME.blindassist:change_dim(0,0)
    end,
    calculate = function(self, blind, context)
        if not blind.disabled and context.reshuffle then
            BLINDSIDE.chipsmodify(0, 0, 2)
        end
    end,
    load = function()
        G.GAME.blindassist.states.visible = false
        G.GAME.blindassist:change_dim(0,0)
    end
})

local can_discardref = G.FUNCS.can_discard
G.FUNCS.can_discard = function(e)
    for key, value in pairs(G.hand.highlighted) do
        if value.config.center and value.config.center.config.extra and value.config.center.config.extra.stubborn then
            e.config.colour = G.C.UI.BACKGROUND_INACTIVE
            e.config.button = nil
            return
        end
    end
    can_discardref(e)
end

BLINDSIDE.Joker({
    key = 'triboulet',
    atlas = 'bld_joker',
    pos = {x=0, y=41},
    boss_colour = HEX('009CFD'),
    mult = 16,
    dollars = 10,
    boss = {min = 1, showdown = true},
    in_pool = function(self, args)
        if G.GAME.selected_back.effect.center.config.extra then
            if not G.GAME.selected_back.effect.center.config.extra.blindside and G.GAME.round_resets.ante%6 == 0 then return false end
            return true
        else
        return false
        end
    end,
    set_joker = function ()
        for i = 1, 8, 1 do
            local enhancement = 'm_bld_king'
            local card = SMODS.create_card { set = "Base", enhancement = enhancement, area = G.discard }
            G.playing_card = (G.playing_card and G.playing_card + 1) or 1
            card.playing_card = G.playing_card
            table.insert(G.playing_cards, card)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.3,
                func = function()
                        card:start_materialize({ G.C.SECONDARY_SET.Enhanced })
                        G.deck:emplace(card)
                    return true
                end
            }))
        end
        for i = 1, 8, 1 do
            local enhancement = 'm_bld_queen'
            local card = SMODS.create_card { set = "Base", enhancement = enhancement, area = G.discard }
            G.playing_card = (G.playing_card and G.playing_card + 1) or 1
            card.playing_card = G.playing_card
            table.insert(G.playing_cards, card)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.3,
                func = function()
                        card:start_materialize({ G.C.SECONDARY_SET.Enhanced })
                        G.deck:emplace(card)
                    return true
                end
            }))
        end
    end,
})