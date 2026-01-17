SMODS.Tag {
    key = "memory",
    hide_ability = false,
    atlas = 'bld_tag',
    pos = {x = 2, y = 2},
        in_pool = function(self, args)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
                return true
            else
            return false
            end
        end,
    apply = function(self, tag, context)
        if context.type == 'immediate'  then
            tag:yep('+', G.C.bld_keepsake, function()
                return true
            end)
            local card = nil
                if G.jokers and #G.jokers.cards < G.jokers.config.card_limit then
                    card = SMODS.create_card {
                        set = "Joker",
                        rarity = "bld_keepsake",
                        area = G.jokers,
                        key_append = "memorytag"
                    }
                    card:add_to_deck()
                    G.jokers:emplace(card)
                end
            tag.triggered = true
            return card
        end
    end,
}