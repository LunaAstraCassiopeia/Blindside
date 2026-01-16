SMODS.Consumable {
    key = 'intervene',
    set = 'bld_obj_ritual',
    atlas = 'bld_consumable',
    pos = {x=2, y=4},
    config = {
        min_highlighted = 1,
        max_highlighted = 2,
    },
    use = function(self, card, area)
        local enhancements = {}

        local args = {}
        args.guaranteed = true
        for i, card in ipairs(G.hand.highlighted) do
            SMODS.ObjectTypes.bld_obj_blindcard_generate:delete_card(G.hand.highlighted[1].config.center)
            args.options = G.P_CENTER_POOLS.bld_obj_blindcard_generate
            args.colors = card.ability.extra.hues
            args.cursed = card.config.center.weight == 67
            local enhancement = BLINDSIDE.poll_enhancement(args)
            SMODS.ObjectTypes.bld_obj_blindcard_generate:inject_card(G.hand.highlighted[1].config.center)

            enhancements[i] = enhancement
        end

        
        for i=1, #G.hand.highlighted do
            local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.3,func = function() G.hand.highlighted[i]:flip();play_sound('card1', percent);G.hand.highlighted[i]:juice_up(0.3, 0.3);return true end }))
        end
        for i=1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.2,func = function() G.hand.highlighted[i]:set_ability(enhancements[i])return true end }))
        end 
        upgrade_blinds(G.hand.highlighted, true)
        for i=1, #G.hand.highlighted do
            local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.4,func = function() G.hand.highlighted[i]:flip();play_sound('tarot2', percent, 0.6);G.hand.highlighted[i]:juice_up(0.3, 0.3);return true end }))
        end
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3,func = function() G.hand:unhighlight_all(); return true end }))
        delay(0.5)
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.max_highlighted
            }
        }
    end
}