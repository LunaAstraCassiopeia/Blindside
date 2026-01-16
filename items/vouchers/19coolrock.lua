SMODS.Voucher {
    key = 'coolrock',
    atlas = 'bld_price_tag',
    pos = {x = 5, y = 0},
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
        code = "AstraLuna",
        concept = "AstraLuna"
    },
    redeem = function(self, card)
        add_tag(Tag('tag_bld_coolrock_relic'))
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.bld_obj_mineral_rate = 2
                return true
            end
        }))
    end
}