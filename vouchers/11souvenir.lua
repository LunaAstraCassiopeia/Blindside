SMODS.Voucher {
    key = 'souvenir',
    atlas = 'bld_price_tag',
    pos = {x = 1, y = 2},
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
        add_tag(Tag('tag_bld_souvenir_relic'))
        for key, value in pairs(G.shop_jokers.cards) do
            if value.cost then
                value.cost = math.floor(value.cost * 0.67)
            end
        end
    end,
}