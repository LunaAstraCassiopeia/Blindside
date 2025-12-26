SMODS.Voucher {
    key = 'swearjar',
    atlas = 'bld_price_tag',
    pos = {x = 3, y = 0},
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
        add_tag(Tag('tag_bld_swearjar_relic'))
        G.GAME.modifiers.no_interest = false
    end
}