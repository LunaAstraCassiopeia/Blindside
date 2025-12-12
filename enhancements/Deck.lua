    BLINDSIDE.Blind({
        key = 'deck',
        atlas = 'bld_blindrank',
        pos = {x = 3, y = 4},
        config = {
            extra = {
                value = 13,
                chips = 4,
                chipsup = 4,
            }},
        hues = {"Blue"},
        replace_base_card = true,
        no_rank = true,
        no_suit = true,
        overrides_base_rank = true,
        in_pool = function(self, args)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
                return true
            else
            return false
            end
        end,
        calculate = function(self, card, context) 
            if context.cardarea == G.play and context.main_scoring then
                return {
                    chips = card.ability.extra.chips*#G.deck.cards
                }
            end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.chips, card.ability.extra.chips*((G.deck and G.deck.cards) and #G.deck.cards or 20)
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipsup
            card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
