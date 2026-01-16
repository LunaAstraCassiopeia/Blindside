SMODS.Voucher {
    key = 'satellite',
    atlas = 'bld_price_tag',
    pos = {x = 4, y = 3},
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
        add_tag(Tag('tag_bld_satellite_relic'))
        if not G.GAME.shop then return end
        if G.shop_booster and G.shop_booster.cards then
            for _, booster in ipairs(G.shop_booster.cards) do
                if booster.config.center.kind == 'channel' then
                    booster.ability.choose = (booster.ability.choose or 1) + 1
                end
            end
        end
    end,
    requires = {'v_bld_television'}
}