
    SMODS.Joker({
        key = 'glasseye',
        atlas = 'bld_trinkets',
        pos = {x = 0, y = 5},
        rarity = 'bld_keepsake',
        config = {
            extra = {
                xmult = 3
            }
        },
        cost = 15,
        blueprint_compat = true,
        eternal_compat = true,
        loc_vars = function (self, info_queue, card)
            info_queue[#info_queue + 1] = G.P_TAGS['tag_bld_debuff']
            return {
                vars = {
                card.ability.extra.xmult
            }
        }
        end,
        credit = {
            art = "AstraLuna",
            code = "AstraLuna",
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
            if context.joker_main then
                G.bolt_played_hand = context.scoring_name
                add_tag(Tag('tag_bld_debuff'))
                return {
                    xmult = card.ability.extra.xmult
                }
            end
        end
    })