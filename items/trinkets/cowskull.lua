
    SMODS.Joker({
        key = 'cowskull',
        atlas = 'bld_trinkets',
        pos = {x = 9, y = 4},
        rarity = 'bld_trinket',
        config = {
            extra = {
                hunterbonus = 1,
            }
        },
        cost = 12,
        blueprint_compat = false,
        eternal_compat = true,
        loc_vars = function (self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_SEALS['bld_hunter']
        info_queue[#info_queue+1] = G.P_TAGS['tag_bld_strike']
            return {
                vars = {
                card.ability.extra.hunterbonus,
            }
        }
        end,
        credit = {
            art = "AstraLuna",
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
            if context.setting_blind and not context.perkeo then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after', delay = 0.4,
                    func = (function()
                        add_tag(Tag('tag_bld_strike'))
                        play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                        play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                        return true
                    end)
                }))

                return {
                    message = localize('k_tagged_ex')
                }
            end
            if context.individual and context.cardarea == G.play and not G.GAME.blind.boss then
                if context.other_card.seal == 'bld_hunter' and context.other_card.facing ~= "back" then
                    return {
                        dollars = card.ability.extra.hunterbonus
                    }
                end
            end
        end
    })