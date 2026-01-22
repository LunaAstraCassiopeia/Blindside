    SMODS.Joker({
        key = 'matryoshka',
        atlas = 'bld_trinkets',
        pos = {x = 0, y = 6},
        rarity = 'bld_trinket',
        cost = 12,
        config = {
            extra = {
                last_tag = nil
            }
        },
        blueprint_compat = true,
        eternal_compat = true,
        in_pool = function(self, args)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
                return true
            else
            return false
            end
        end,
        credit = {
            art = "AstraLuna",
            code = "base4",
            concept = "AstraLuna"
        },
        calculate = function(self, card, context)
            if context.setting_blind and card.ability.extra.last_tag and not context.perkeo then
                G.E_MANAGER:add_event(Event({
                    func = function ()
                        add_tag(Tag(card.ability.extra.last_tag))
                        card:juice_up(0.65, 0.65)
                        play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                        play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                        return true
                    end
                }))
                delay(0.4)
                G.E_MANAGER:add_event(Event({
                    func = function ()
                        add_tag(Tag(card.ability.extra.last_tag))
                        card:juice_up(0.65, 0.65)
                        play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                        play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                        return true
                    end
                }))
            end
            if context.tag_triggered and not (context.tag_triggered.config and context.tag_triggered.config.extra and context.tag_triggered.config.extra.hex) then
                print(inspect(context.tag_triggered))
                card.ability.extra.last_tag = context.tag_triggered.key
            end
        end,
        loc_vars = function (self, info_queue, card)
            info_queue[#info_queue+1] = card.ability.extra.last_tag and {key = card.ability.extra.last_tag, set = 'Tag'} or nil
            return {
                vars = {
                    card.ability.extra.last_tag and localize({key = card.ability.extra.last_tag, type = 'name_text', set = 'Tag'}) or localize("matryoshka_none")
                }
            }
        end
    })