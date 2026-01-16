SMODS.Voucher {
    key = 'film_reel',
    atlas = 'bld_price_tag',
    pos = {x = 5, y = 3},
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
        add_tag(Tag('tag_bld_film_reel_relic'))
    end,
    requires = {'v_bld_clapper'}
}