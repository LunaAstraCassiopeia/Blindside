SMODS.Consumable {
    key = 'evoke',
    set = 'bld_obj_ritual',
    atlas = 'bld_consumable',
    pos = {x=1, y=3},
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
                    SMODS.add_card({ set = 'bld_obj_ritual' })
                    card:juice_up(0.3, 0.5)
                end
            return true end }))
        end
        delay(0.3)
                    G.E_MANAGER:add_event(Event({
            func = (function()
                add_tag(Tag('tag_bld_joker'))
                play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                return true
            end),
        }))
        delay(0.6)
    end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_TAGS['tag_bld_joker']
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