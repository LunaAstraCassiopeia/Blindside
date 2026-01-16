SMODS.Voucher {
    key = 'treasurechest',
    atlas = 'bld_price_tag',
    pos = {x = 3, y = 1},
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
    credit = {
        art = "Gappie",
        code = "base4",
        concept = "AstraLuna"
    },
    redeem = function(self, card)
        add_tag(Tag('tag_bld_treasurechest_relic'))
        G.shop_vouchers.cards[1].cost = math.max(G.shop_vouchers.cards[1].cost + 5*G.GAME.round_resets.tags_bought - 15, 0)
    end,
    requires = {'v_bld_swearjar'}
}