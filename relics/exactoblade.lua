SMODS.Tag {
    key = "exactoblade_relic",
    config = {
        relic = true
    },
    hide_ability = false,
    atlas = 'bld_relic',
    pos = {x = 5, y = 0},
    in_pool = function(self, args)
        return false
    end,
    apply = function(self, tag, context)
        if context.type == 'shop_final_pass'  then
            if G.shop then
                for key, value in pairs(G.shop_booster.cards) do
                    value.ability.couponed = true
                    value:set_cost()
                end
                tag:juice_up()
            end
        end
    end
}