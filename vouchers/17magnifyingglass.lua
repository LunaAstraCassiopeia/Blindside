SMODS.Voucher {
    key = 'magnifyingglass',
    atlas = 'bld_price_tag',
    pos = {x = 4, y = 0},
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
        add_tag(Tag('tag_bld_magnifyingglass_relic'))
    end,
    credit = {
        art = "AnneBean",
        code = "AstraLuna",
        concept = "AstraLuna"
    },
    loc_vars = function (self, info_queue, card)
        info_queue[#info_queue+1] = G.P_TAGS.tag_bld_reroll
    end
}