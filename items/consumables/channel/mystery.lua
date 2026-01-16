SMODS.Consumable {
    key = 'mystery',
    set = 'bld_obj_filmcard',
    atlas = 'bld_consumable',
    pos = {x=9, y=0},
    config = {
        tags = 2
    },
    use = function(self, card, area)
            G.E_MANAGER:add_event(Event({
            func = (function()
                for i = 1, card.ability.tags do
                local tag_key = get_next_tag_key()
                add_tag(Tag(tag_key))
                play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                end
                return true
            end),
        }))
        delay(0.6)
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.tags
            }
        }
    end,
    can_use = function(self, card)
        return true
    end
}