
    SMODS.Joker({
        key = 'peppermintcandycane',
        atlas = 'bld_trinkets',
        pos = {x = 7, y = 7},
        rarity = 'bld_curio',
        cost = 12,
        blueprint_compat = false,
        eternal_compat = true,
        loc_vars = function (self, info_queue, card)
            info_queue[#info_queue+1] = G.P_CENTERS['e_bld_mint']
        end,
        in_pool = function(self, args)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
                return true
            else
            return false
            end
        end,
        credit = {
            art = "AnneBean",
            code = "base4",
            concept = "base4"
        },
        calculate = function(self, card, context)
            if context.after then
                local red = nil
                local faded = nil
                for key, value in pairs(context.scoring_hand) do
                    if value:is_color("Red") and not red then
                        red = value
                    end
                    if value:is_color("Faded") and not faded then
                        faded = value
                    end
                end
                
                if red and faded then
                    local eligible = {}
                    for key, value in pairs(context.scoring_hand) do
                        if not value.edition then
                            table.insert(eligible, value)
                        end    
                    end

                    if #eligible >= 1 then
                        local cards = choose_stuff(eligible, 1, pseudoseed('peppermint'))
                        for key, value in pairs(cards) do
                            G.E_MANAGER:add_event(Event({
                                delay = 0.8,
                                trigger = 'before',
                                func = function ()
                                    card:juice_up()
                                    value:juice_up()
                                    value:set_edition('e_bld_mint')
                                    return true
                                end
                            }))
                        end
                    end
                end
            end
        end
    })