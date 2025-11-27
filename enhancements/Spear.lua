    SMODS.Enhancement({
        key = 'spear',
        atlas = 'bld_blindrank',
        pos = {x = 9, y = 8},
        config = {
            extra = {
                value = 100,
                hues = {"Red", "Yellow"}
            }},
        pools = {
            ["bld_obj_blindcard_generate"] = true,
            ["bld_obj_blindcard_warm"] = true,
            ["bld_obj_blindcard_dual"] = true,
            ["bld_obj_blindcard_red"] = true,
            ["bld_obj_blindcard_yellow"] = true,
        },
        --weight = 3,
        always_scores = true,
        replace_base_card = true,
        no_rank = true,
        no_suit = true,
        overrides_base_rank = true,
        in_pool = function(self, args)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
                return true
            else
            return false
            end
        end,
        calculate = function(self, card, context)
            if context.earn_money and context.earn_money > 0 then
                for key, value in pairs(G.play.cards) do
                    if value == card then
                        print(context.earn_money)
                        return {
                            mult = context.earn_money
                        }
                    end
                end
            end
        end,
    })
----------------------------------------------
------------MOD CODE END----------------------
