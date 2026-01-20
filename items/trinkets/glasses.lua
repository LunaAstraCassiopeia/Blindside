
    SMODS.Joker({
        key = 'glasses',
        atlas = 'bld_trinkets',
        pos = {x = 6, y = 1},
        rarity = 'bld_trinket',
        cost = 7,
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
            code = "AstraLuna",
            concept = "AstraLuna"
        },
        calculate = function(self, card, context)
            if context.joker_main then
                local r_color, all_cards, b_color = 0, 0, 0
                for k, v in ipairs(context.scoring_hand) do
                    all_cards = all_cards + 1
                    if v:is_color('Red', nil, true) then
                        r_color = r_color + 1
                    end
                    if v:is_color('Blue', nil, true) then
                        b_color = b_color + 1
                    end
                end
                if r_color + b_color == all_cards and r_color > 1 and b_color > 1 then
                    return {
                        extra = {focus = card, message = localize('k_filmpack_ex'), func = function()
                            G.E_MANAGER:add_event(Event({
                                trigger = 'before',
                                delay = 0.0,
                                func = (function()
                                        local card = create_card('bld_obj_filmcard',G.consumeables, nil, nil, nil, nil, nil, 'pickaxe')
                                        card:add_to_deck()
                                        G.consumeables:emplace(card)
                                        G.GAME.consumeable_buffer = 0
                                    return true
                                end)}))
                        end},
                        colour = G.C.SECONDARY_SET.bld_obj_filmcard,
                        card = card
                    }
                end
            end
        end
    })