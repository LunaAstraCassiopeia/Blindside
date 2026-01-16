SMODS.Voucher {
    key = 'antidote',
    atlas = 'bld_price_tag',
    pos = {x = 3, y = 2},
    cost = 10,
    config = { extra = { shop_size = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.shop_size } }
    end,
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
        art = "pangaea47",
        code = "AstraLuna",
        concept = "AstraLuna"
    },
    redeem = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.modifiers.extra_boosters = (G.GAME.modifiers.extra_boosters or 0) + 1
                if G.shop and G.GAME.last_joker then
                    SMODS.add_booster_to_shop()
                end
                return true
            end
        }))
        add_tag(Tag('tag_bld_antidote_relic'))
    end
}