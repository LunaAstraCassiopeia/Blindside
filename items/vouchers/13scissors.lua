SMODS.Voucher {
    key = 'scissors',
    atlas = 'bld_price_tag',
    pos = {x = 2, y = 0},
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
        art = "AstraLuna",
        code = "AstraLuna",
        concept = "AstraLuna"
    },
    redeem = function(self, card)
        if G.shop_booster.cards[1] then
            G.shop_booster.cards[1].ability.couponed = true
            G.shop_booster.cards[1]:set_cost()
        end  
        add_tag(Tag('tag_bld_scissors_relic'))
    end
}