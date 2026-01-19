SMODS.Edition:take_ownership('negative', {
        loc_vars = function(self, info_queue, card)
            return { key = (G.GAME.selected_back.effect.center.config.extra and G.GAME.selected_back.effect.center.config.extra.blindside) and 'e_bld_negative' or card.key,
                vars = { card.edition.card_limit } }
        end,
    })