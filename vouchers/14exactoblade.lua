SMODS.Voucher {
    key = 'exactoblade',
    atlas = 'bld_price_tag',
    pos = {x = 2, y = 1},
    cost = 15,
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
        for key, value in pairs(G.shop_booster.cards) do
            value.ability.couponed = true
            value:set_cost()
        end
        add_tag(Tag('tag_bld_exactoblade_relic'))
    end,
    requires = {'v_bld_scissors'}
}