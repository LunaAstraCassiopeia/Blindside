SMODS.Consumable {
    key = 'musical',
    set = 'bld_obj_filmcard',
    atlas = 'bld_consumable',
    pos = {x=8, y=0},
    config = {
        extra = {
            channels = 2
        },
    },
    use = function(self, card, area)
        for i = 1, math.min(card.ability.extra.channels, G.consumeables.config.card_limit - #G.consumeables.cards) do
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                if G.consumeables.config.card_limit > #G.consumeables.cards then
                    play_sound('timpani')
                    SMODS.add_card({ set = 'bld_obj_mineral' })
                    card:juice_up(0.3, 0.5)
                end
            return true end }))
        end
        delay(0.3)
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.channels
            }
        }
    end,
    can_use = function(self, card)
        return G.consumeables and #G.consumeables.cards < G.consumeables.config.card_limit or
            (card.area == G.consumeables)
    end
}