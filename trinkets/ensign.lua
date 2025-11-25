
    SMODS.Joker({
        key = 'ensign',
        atlas = 'bld_trinkets',
        pos = {x = 6, y = 0},
        rarity = 'bld_keepsake',
        config = {
            extra = {
                count = 0,
                trigger = 4,
            }
        },
        cost = 10,
        blueprint_compat = false,
        eternal_compat = true,
        loc_vars = function (self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_TAGS['tag_bld_recursive']
            return {
                vars = {
                card.ability.extra.count,
                card.ability.extra.trigger
            }
        }
        end,
        in_pool = function(self, args)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
                return true
            else
            return false
            end
        end,
        calculate = function(self, card, context)
            if context.individual and context.cardarea == G.play and context.other_card:is_color("Yellow") and context.other_card.facing ~= "back" and not context.blueprint then
                if card.ability.extra.count < card.ability.extra.trigger-1 then
                    card.ability.extra.count = card.ability.extra.count+1
                else
                card.ability.extra.count = 0
                return {
                    focus = card,
                    message = localize('k_tagged_ex'),
                    func = function()
                        local tag_key = 'tag_bld_recursive'
                        add_tag(Tag(tag_key))   
                    end,
                    card = card
                }
                end
            end
        end
    })