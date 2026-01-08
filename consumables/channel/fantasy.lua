SMODS.Consumable {
    key = 'fantasy',
    set = 'bld_obj_filmcard',
    atlas = 'bld_consumable',
    pos = {x=4, y=0},
    config = {
        money = 0,
        extra = 3
    },
    use = function(self, card, area)
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_sound('timpani')
            card:juice_up(0.3, 0.5)
            ease_dollars(card.ability.money, true)
            return true end }))
        delay(0.6)
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.money, card.ability.extra
            }
        }
    end,
    update = function(self, card, dt)
        if G.STAGE == G.STAGES.RUN then
        card.ability.money = 0
        local colors = {}
        for i = 1, #G.hand.cards do
            if G.hand.cards[i].config.center.config.extra and G.hand.cards[i].config.center.config.extra.hues then
                for k = 1, #G.hand.cards[i].config.center.config.extra.hues do
                    colors[G.hand.cards[i].config.center.config.extra.hues[k]] = true
                end
            end
        end
        for k, v in pairs(colors) do
            card.ability.money = card.ability.money + card.ability.extra
        end
    end
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.cards > 0
    end
}