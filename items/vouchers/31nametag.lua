SMODS.Voucher {
    key = 'nametag',
    atlas = 'bld_price_tag',
    pos = {x = 8, y = 2},
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
        art = "AnneBean",
        code = "base4",
        concept = "AstraLuna"
    },
    redeem = function(self, card)
        add_tag(Tag('tag_bld_nametag_relic'))
    end,
}