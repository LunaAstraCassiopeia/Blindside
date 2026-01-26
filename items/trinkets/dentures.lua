
    SMODS.Joker({
        key = 'dentures',
        atlas = 'bld_trinkets',
        pos = {x = 5, y = 6},
        rarity = 'bld_trinket',
        cost = 10,
        blueprint_compat = true,
        eternal_compat = true,
        loc_vars = function (self, info_queue, card)
            info_queue[#info_queue + 1] = G.P_TAGS['tag_bld_dental']
        end,
        in_pool = function(self, args)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
                    if G.playing_cards then
                        for i = 1, #G.playing_cards do
                            if G.playing_cards[i].seal == 'bld_wild' then
                                return true
                            end
                        end
                    end
            else
                return false
            end
        end,
        credit = {
            art = "AstraLuna",
            code = "base4",
            concept = "AstraLuna"
        },
        calculate = function (self, card, context)
            if context.after and G.GAME.current_round.hands_left == 3 then
                G.E_MANAGER:add_event(Event({
                    trigger = "after",
                    delay = 0.8,
                    func = function ()
                        add_tag(Tag('tag_bld_dental'))
                        play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                        play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                        return true
                    end
                }))
            end
        end
    })