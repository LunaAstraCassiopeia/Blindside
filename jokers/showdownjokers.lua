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
G.FUNCS.cant_discardLOL = function(e)
    if G.GAME.blind and G.GAME.blind.name == '' then
        if G.GAME.current_round.discards_left <= 0 or #G.hand.highlighted <= 4 or #G.hand.highlighted > math.max(G.GAME.starting_params.discard_limit, 0) then
            e.config.colour = G.C.UI.BACKGROUND_INACTIVE
            e.config.button = nil
        else
            e.config.colour = G.C.RED
            e.config.button = 'discard_cards_from_highlighted'
        end
    else
        can_discardref(e)
    end
  end