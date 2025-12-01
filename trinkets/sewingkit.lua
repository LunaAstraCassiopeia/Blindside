
    SMODS.Joker({
        key = 'sewingkit',
        atlas = 'bld_trinkets',
        pos = {x = 9, y = 5},
        rarity = 'bld_hobby',
        cost = 7,
        blueprint_compat = true,
        eternal_compat = true,
        loc_vars = function (self, info_queue, card)
            info_queue[#info_queue + 1] = G.P_TAGS['tag_bld_symmetry']
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
            if context.reshuffle then
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.5,
                    func = function ()
                        add_tag(Tag('tag_bld_symmetry'))
                        card:juice_up(0.65, 0.65)
                        play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                        play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                        return true
                    end
                }))
            end
        end
    })