SMODS.Voucher {
    key = 'birthcertificate',
    atlas = 'bld_price_tag',
    pos = {x = 8, y = 3},
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
        add_tag(Tag('tag_bld_birthcertificate_relic'))
        SMODS.change_play_limit(1)
    end,
    credit = {
        art = "AnneBean",
        code = "base4",
        concept = "AstraLuna"
    },
    remove_from_deck = function (self, card, from_debuff)
        SMODS.change_play_limit(-1)
    end,
    requires = {'v_bld_nametag'}
}