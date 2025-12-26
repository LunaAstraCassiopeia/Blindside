SMODS.Tag {
    key = "scissors_relic",
    config = {
        relic = true
    },
    hide_ability = false,
    atlas = 'bld_relic',
    pos = {x = 4, y = 0},
    in_pool = function(self, args)
        return false
    end,
    apply = function(self, tag, context)
        if context.type == 'shop_final_pass'  then
            if G.shop then
                G.shop_booster.cards[1].ability.couponed = true
                G.shop_booster.cards[1]:set_cost()
                tag:juice_up()
            end
        end
    end
}