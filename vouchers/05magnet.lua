SMODS.Voucher {
    key = 'magnet',
    atlas = 'bld_price_tag',
    pos = {x = 7, y = 0},
    cost = 10,
    in_pool = function(self, args)
        if G.GAME.selected_back.effect.center.config.extra then
            if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
            return true
        else
        return false
        end
    end,
    loc_vars = function (self, info_queue, card)
        info_queue[#info_queue+1] = {key = 'bld_retain', set = 'Other'}
        info_queue[#info_queue+1] = {key = 'bld_upgrade', set = 'Other'}
    end,
    credit = {
        art = "Gappie",
        code = "base4",
        concept = "AstraLuna"
    },
    set_card_type_badge = function(self, card, badges)
        badges[#badges+1] = create_badge(localize('k_relic'), G.C.RED, G.C.WHITE, 1.2 )
    end,
    redeem = function(self, card)
        add_tag(Tag('tag_bld_magnet_relic'))
    end,
}