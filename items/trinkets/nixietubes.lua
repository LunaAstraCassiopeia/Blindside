
    SMODS.Joker({
        key = 'nixietubes',
        atlas = 'bld_trinkets',
        pos = {x = 3, y = 7},
        rarity = 'bld_doodad',
        cost = 10,
        config = {
            extra = {
                count = 8
            }
        },
        blueprint_compat = true,
        eternal_compat = true,
        loc_vars = function (self, info_queue, card)
            info_queue[#info_queue + 1] = G.P_TAGS['tag_bld_neon']
            return {
                vars = {
                    card.ability.extra.count
                }
            }
        end,
        credit = {
            art = "Gappie",
            code = "base4",
            concept = "AstraLuna"
        },
        in_pool = function(self, args)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
                return true
            else
            return false
            end
        end,
        calculate = function(self, card, context)
            if context.before and not context.blueprint then
                card.ability.extra.count = card.ability.extra.count - 1
                if card.ability.extra.count == 1 then
                    juice_card_until(card, function ()
                        return card.ability.extra.count == 1
                    end)
                    return {
                        message = "1!"
                    }
                elseif card.ability.extra.count == 0 then
                    card.ability.extra.count = 8
                    G.E_MANAGER:add_event(Event({
                        trigger = 'before',
                        delay = 0.5,
                        func = function ()
                            add_tag(Tag('tag_bld_neon'))
                            card:juice_up(0.65, 0.65)
                            play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                            play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                            return true
                        end
                    }))
                elseif card.ability.extra.count <= 3 then
                    return {
                        message = card.ability.extra.count .. "..."
                    }
                end
            end
            if context.pre_discard then
                card.ability.extra.count = card.ability.extra.count - 1
                if card.ability.extra.count == 1 then
                    juice_card_until(card, function ()
                        return card.ability.extra.count == 1
                    end)
                    return {
                        message = "1!"
                    }
                elseif card.ability.extra.count == 0 then
                    card.ability.extra.count = 8
                    G.E_MANAGER:add_event(Event({
                        trigger = 'before',
                        delay = 0.5,
                        func = function ()
                            add_tag(Tag('tag_bld_neon'))
                            card:juice_up(0.65, 0.65)
                            play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                            play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                            return true
                        end
                    }))
                    return {
                        message = localize('k_reset')
                    }
                elseif card.ability.extra.count <= 3 then
                    return {
                        message = card.ability.extra.count .. "..."
                    }
                end
            end
        end
    })