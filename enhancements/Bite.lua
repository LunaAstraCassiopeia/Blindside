    SMODS.Enhancement({
        key = 'bite',
        atlas = 'bld_blindrank',
        pos = {x = 6, y = 5},
        config = {
            xmult = 1.5,
            extra = {
                value = 11,
                hues = {"Purple"}
            }},
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
        pools = {
            ["bld_obj_blindcard_single"] = true,
            ["bld_obj_blindcard_purple"] = true,
        },
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.before and card.facing ~= 'back' then
                local my_pos = -1
                for i=1, #context.scoring_hand do
                    if context.scoring_hand[i] == card then
                        my_pos = i
                        break
                    end
                end

                local coin_flip = pseudorandom(pseudoseed('bite')) < 0.5

                for i=1, #context.scoring_hand do
                    if (i == my_pos-1 and coin_flip) or (i == my_pos+1 and not coin_flip) or (i == 2 and my_pos == 1) or (i == my_pos-1 and my_pos == #context.scoring_hand) then
                        if G.play.cards[i].facing ~= 'back' then 
                            G.play.cards[i]:flip()
                        end
                        G.play.cards[i]:set_debuff(true)
                        card.ability.extra.debuffed_blind = G.play.cards[i]
                        break
                    end
                end
            end
            if context.cardarea == G.play and context.main_scoring then
                return {
                    xmult = card.ability.xmult
                }
            end

            if card.ability.extra.debuffed_blind and context.cardarea == G.play and context.after then
                card.ability.extra.debuffed_blind:set_debuff(false)
                card.ability.extra.debuffed_blind = nil
            end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.xmult
                }
            }
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
