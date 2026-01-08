SMODS.Voucher {
    key = 'microscope',
    atlas = 'bld_price_tag',
    pos = {x = 4, y = 1},
    cost = 10,
    in_pool = function(self, args)
        if G.GAME.selected_back.effect.center.config.extra then
            if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
            return true
        else
        return false
        end
    end,
    set_card_type_badge = function(self, card, badges)
        badges[#badges+1] = create_badge(localize('k_relic'), G.C.RED, G.C.WHITE, 1.2 )
    end,
    redeem = function(self, card)
        add_tag(Tag('tag_bld_microscope_relic'))
        G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost - 2
        G.GAME.current_round.reroll_cost = math.max(0, G.GAME.current_round.reroll_cost - 2)
    end,
    credit = {
        art = "AnneBean",
        code = "AstraLuna",
        concept = "AstraLuna"
    },
    requires = {'v_bld_magnifyingglass'}
}