SMODS.Consumable {
    key = 'purify',
    set = 'bld_obj_ritual',
    atlas = 'bld_consumable',
    pos = {x=3, y=3},
    config = {
        min_highlighted = 1,
        max_highlighted = 3,
    },
    use = function(self, card, area)
        local do_upgrades = {} 
        for key, value in pairs(G.hand.highlighted) do
           if value.edition or value.seal then
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.4,
                    func = function()
                        value:set_edition(nil)
                        value:set_seal(nil)
                        play_sound('cardFan2')
                        value:juice_up()
                        return true
                    end
                }))
                table.insert(do_upgrades, value)
            end
        end

        delay(0.6)
        upgrade_blinds(do_upgrades)
    end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = {key = 'bld_modifiers', set = 'Other'}
        return {
            vars = {
                card.ability.max_highlighted
            }
        }
    end
}