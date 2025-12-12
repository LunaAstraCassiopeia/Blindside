function Game:blindupdate_shop(dt)
    if not G.STATE_COMPLETE then
        stop_use()
        ease_background_colour_blind(G.STATES.SHOP)
        local shop_exists = not not G.shop
        G.shop = G.shop or UIBox{
            definition = G.UIDEF.blind_shop(),
            config = {align='tmi', offset = {x=0,y=G.ROOM.T.y+11},major = G.hand, bond = 'Weak'}
        }
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.shop.alignment.offset.y = -5.3
                    G.shop.alignment.offset.x = 0
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.2,
                        blockable = false,
                        func = function()
                            if math.abs(G.shop.T.y - G.shop.VT.y) < 3 then
                                G.ROOM.jiggle = G.ROOM.jiggle + 3
                                play_sound('cardFan2')
                                for i = 1, #G.GAME.tags do
                                    G.GAME.tags[i]:apply_to_run({type = 'shop_start'})
                                end
                                local nosave_shop = nil
                                if not shop_exists then
                                
                                    if G.load_shop_jokers then 
                                        nosave_shop = true
                                        G.shop_jokers:load(G.load_shop_jokers)
                                        for k, v in ipairs(G.shop_jokers.cards) do
                                            create_shop_card_ui(v)
                                            if v.ability.consumeable then v:start_materialize() end
                                            for _kk, vvv in ipairs(G.GAME.tags) do
                                                if vvv:apply_to_run({type = 'store_joker_modify', card = v}) then break end
                                            end
                                        end
                                        G.load_shop_jokers = nil
                                    else
                                        local vouchers_to_spawn = 0
                                        for _,_ in pairs(G.GAME.current_round.trinket.spawn) do vouchers_to_spawn = vouchers_to_spawn + 1 end
                                        if vouchers_to_spawn < G.GAME.shop.joker_max then
                                            BLINDSIDE.get_next_trinket(G.GAME.current_round.trinket)
                                        end
                                        for _, key in ipairs(G.GAME.current_round.trinket or {}) do
                                            if G.P_CENTERS[key] and G.GAME.current_round.trinket.spawn[key] then
                                                BLINDSIDE.add_trinket_to_shop(key)
                                            end
                                        end
                                    end
                                    
                                    if G.load_shop_vouchers then 
                                        nosave_shop = true
                                        G.shop_vouchers:load(G.load_shop_vouchers)
                                        for k, v in ipairs(G.shop_vouchers.cards) do
                                            create_shop_card_ui(v)
                                            v:start_materialize()
                                        end
                                        G.load_shop_vouchers = nil
                                    else
                                        local vouchers_to_spawn = 0
                                        for _,_ in pairs(G.GAME.current_round.voucher.spawn) do vouchers_to_spawn = vouchers_to_spawn + 1 end
                                        if vouchers_to_spawn < G.GAME.starting_params.vouchers_in_shop + (G.GAME.modifiers.extra_vouchers or 0) then
                                            SMODS.get_next_vouchers(G.GAME.current_round.voucher)
                                        end
                                        for _, key in ipairs(G.GAME.current_round.voucher or {}) do
                                            if G.P_CENTERS[key] and G.GAME.current_round.voucher.spawn[key] then
                                                SMODS.add_voucher_to_shop(key)
                                                G.shop_vouchers.cards[1].cost = G.shop_vouchers.cards[1].cost + 15*G.GAME.round_resets.tags_bought
                                            end
                                        end
                                    end
                                    

                                        if G.load_shop_booster then 
                                            nosave_shop = true
                                            G.shop_booster:load(G.load_shop_booster)
                                            for k, v in ipairs(G.shop_booster.cards) do
                                                create_shop_card_ui(v)
                                                v:start_materialize()
                                            end
                                            G.load_shop_booster = nil
                                        else
                                        for i=1, G.GAME.starting_params.boosters_in_shop + (G.GAME.last_joker and G.GAME.modifiers.extra_boosters or 0) + (not G.GAME.last_joker and 2 or 1) do
                                          if i <= 2 and G.GAME.last_joker then
                                            G.GAME.current_round.used_packs = G.GAME.current_round.used_packs or {}
                                            if not G.GAME.current_round.used_packs[i] then
                                                G.GAME.current_round.used_packs[i] = get_pack('shop_pack').key
                                            end

                                            if G.GAME.current_round.used_packs[i] ~= 'USED' then 
                                                local card = Card(G.shop_booster.T.x + G.shop_booster.T.w/2,
                                                G.shop_booster.T.y, G.CARD_W*1.27, G.CARD_H*1.27, G.P_CARDS.empty, G.P_CENTERS[G.GAME.current_round.used_packs[i]], {bypass_discovery_center = true, bypass_discovery_ui = true})
                                                create_shop_card_ui(card, 'Booster', G.shop_booster)
                                                card.ability.booster_pos = i
                                                card:start_materialize()
                                                G.shop_booster:emplace(card)
                                            end
                                          else
                                            G.shop_booster:emplace(BLINDSIDE.create_blindcard_for_shop(G.shop_booster, G.GAME.last_joker))
                                          end
                                        end

                                        for i = 1, #G.GAME.tags do
                                            G.GAME.tags[i]:apply_to_run({type = 'voucher_add'})
                                        end
                                        for i = 1, #G.GAME.tags do
                                            G.GAME.tags[i]:apply_to_run({type = 'shop_final_pass'})
                                        end
                                    end
                                end

                                if not nosave_shop then SMODS.calculate_context({starting_shop = true}) end
                                G.CONTROLLER:snap_to({node = G.shop:get_UIE_by_ID('next_round_button')})
                                if not nosave_shop then G.E_MANAGER:add_event(Event({ func = function() save_run(); return true end})) end
                                return true
                            end
                        end}))
                    return true
                end
            }))
          G.STATE_COMPLETE = true
    end  
    if self.buttons then self.buttons:remove(); self.buttons = nil end          
end

function G.UIDEF.blind_shop()
    G.shop_jokers = CardArea(
      G.hand.T.x+0,
      G.hand.T.y+G.ROOM.T.y + 9,
      (G.GAME.shop.joker_max)*G.CARD_W,
      1.05*G.CARD_H, 
      {card_limit = G.GAME.shop.joker_max, type = 'shop', highlight_limit = 1, card_w = 1.27*G.CARD_W})

    G.shop_vouchers = CardArea(
      G.hand.T.x+0,
      G.hand.T.y+G.ROOM.T.y + 9,
      G.CARD_W,
      1.05*G.CARD_H, 
      {card_limit = 1, type = 'shop', highlight_limit = 1})

    G.shop_booster = CardArea(
      G.hand.T.x+0,
      G.hand.T.y+G.ROOM.T.y + 9,
      (G.GAME.starting_params.boosters_in_shop + 1)*1.3*G.CARD_W, -- changed
      1.05*G.CARD_H, 
      {card_limit = G.GAME.starting_params.boosters_in_shop + (G.GAME.modifiers.extra_boosters or 0) + (not G.GAME.last_joker and 1 or 1), type = 'shop', highlight_limit = 1, card_w = 1.27*G.CARD_W})

    local shop_sign = AnimatedSprite(0,0, 4.4, 2.2, G.ANIMATION_ATLAS['shop_sign'])
    shop_sign:define_draw_steps({
      {shader = 'dissolve', shadow_height = 0.05},
      {shader = 'dissolve'}
    })
    G.SHOP_SIGN = UIBox{
      definition = 
        {n=G.UIT.ROOT, config = {colour = G.C.DYN_UI.MAIN, emboss = 0.05, align = 'cm', r = 0.1, padding = 0.1}, nodes={
          {n=G.UIT.R, config={align = "cm", padding = 0.1, minw = 4.72, minh = 3.1, colour = G.C.DYN_UI.DARK, r = 0.1}, nodes={
            {n=G.UIT.R, config={align = "cm"}, nodes={
              {n=G.UIT.O, config={object = shop_sign}}
            }},
            {n=G.UIT.R, config={align = "cm"}, nodes={
              {n=G.UIT.O, config={object = DynaText({string = {localize('ph_improve_run')}, colours = {lighten(G.C.GOLD, 0.3)},shadow = true, rotate = true, float = true, bump = true, scale = 0.5, spacing = 1, pop_in = 1.5, maxw = 4.3})}}
            }},
          }},
        }},
      config = {
        align="cm",
        offset = {x=0,y=-15},
        major = G.HUD:get_UIE_by_ID('row_blind'),
        bond = 'Weak'
      }
    }
    G.E_MANAGER:add_event(Event({
      trigger = 'immediate',
      func = (function()
          G.SHOP_SIGN.alignment.offset.y = 0
          return true
      end)
    }))
    local t = {n=G.UIT.ROOT, config = {align = 'cl', colour = G.C.CLEAR}, nodes={
            UIBox_dyn_container({
                {n=G.UIT.C, config={align = "cm", padding = 0.1, emboss = 0.05, r = 0.1, colour = G.C.DYN_UI.BOSS_MAIN}, nodes={
                    {n=G.UIT.R, config={align = "cm", padding = 0.05}, nodes={
                      {n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
                        {n=G.UIT.R,config={id = 'next_round_button', align = "cm", minw = 3, minh = 1.5, r=0.15,colour = G.C.RED, one_press = true, button = 'toggle_shop', hover = true,shadow = true}, nodes = {
                          {n=G.UIT.R, config={align = "cm", padding = 0.07, focus_args = {button = 'y', orientation = 'cr'}, func = 'set_button_pip'}, nodes={
                            {n=G.UIT.R, config={align = "cm", maxw = 1.6}, nodes={
                              {n=G.UIT.T, config={text = localize('b_next_round_1'), scale = 0.4, colour = G.C.WHITE, shadow = true}}
                            }},
                            {n=G.UIT.R, config={align = "cm", maxw = 1.6}, nodes={
                              {n=G.UIT.T, config={text = localize('b_next_round_2'), scale = 0.4, colour = G.C.WHITE, shadow = true}}
                            }}   
                          }},              
                        }},
                        {n=G.UIT.R, config={align = "cm", minw = 3, minh = 1.6, r=0.15,colour = G.C.GREEN, button = 'blindreroll_shop', func = 'blindcan_reroll', hover = true,shadow = true}, nodes = {
                            --[[(not G.GAME.last_joker) and
                            {n=G.UIT.R, config={align = "cm", padding = 0.07, focus_args = {button = 'x', orientation = 'cr'}, func = 'set_button_pip'}, nodes={
                              {n=G.UIT.R, config={align = "cm", maxw = 1.3}, nodes={
                                {n=G.UIT.T, config={text = localize('k_locked1'), scale = 0.6, colour = G.C.WHITE, shadow = true}},
                              }},
                              {n=G.UIT.R, config={align = "cm", maxw = 1.3}, nodes={
                                {n=G.UIT.T, config={text = localize('k_locked2'), scale = 0.6, colour = G.C.WHITE, shadow = true}},
                              }},
                            }}
                            or]]
                          {n=G.UIT.R, config={align = "cm", padding = 0.07, focus_args = {button = 'x', orientation = 'cr'}, func = 'set_button_pip'}, nodes={
                            {n=G.UIT.R, config={align = "cm", maxw = 1.6}, nodes={
                              {n=G.UIT.T, config={text = localize('k_reroll'), scale = 0.4, colour = G.C.WHITE, shadow = true}},
                            }},
                            {n=G.UIT.R, config={align = "cm", maxw = 1.6, minw = 1}, nodes={
                              {n=G.UIT.T, config={text = localize('$'), scale = 0.7, colour = G.C.WHITE, shadow = true}},
                              {n=G.UIT.T, config={ref_table = G.GAME.current_round, ref_value = 'reroll_cost', scale = 0.75, colour = G.C.WHITE, shadow = true}},
                            }}
                          }}
                        }},
                      }},
                      {n=G.UIT.C, config={align = "cm", padding = 0.2, r=0.2, colour = G.C.L_BLACK, emboss = 0.05, minw = 8.2}, nodes={
                          {n=G.UIT.O, config={object = G.shop_booster}},
                      }},
                    }},
                    {n=G.UIT.R, config={align = "cm", minh = 0.2}, nodes={}},
                    {n=G.UIT.R, config={align = "cm", padding = 0.1}, nodes={
                      {n=G.UIT.C, config={align = "cm", padding = 0.1, r=0.2, colour = G.C.L_BLACK, emboss = 0.05}, nodes={
                        {n=G.UIT.C, config={align = "cm", padding = 0.2, r=0.2, colour = G.C.BLACK, maxh = G.shop_vouchers.T.h+0.4}, nodes={
                          {n=G.UIT.T, config={text = localize{type = 'variable', key = 'ante_x_price_tag', vars = {G.GAME.round_resets.ante}}, scale = 0.4, colour = G.C.L_BLACK, vert = true}},
                          {n=G.UIT.O, config={object = G.shop_vouchers}},
                        }},
                      }},
                      {n=G.UIT.C, config={align = "cm", padding = 0.1, r=0.2, colour = G.C.L_BLACK, emboss = 0.05}, nodes={
                        {n=G.UIT.O, config={object = G.shop_jokers}},
                      }},
                    }}
                }
              },
              
              }, false)
        }}
    return t
end
  
  G.FUNCS.blindreroll_shop = function(e)
    stop_use()
    G.CONTROLLER.locks.shop_reroll = true
    if G.CONTROLLER:save_cardarea_focus('shop_jokers') then G.CONTROLLER.interrupt.focus = true end
    if G.GAME.current_round.reroll_cost > 0 then 
      inc_career_stat('c_shop_dollars_spent', G.GAME.current_round.reroll_cost)
      inc_career_stat('c_shop_rerolls', 1)
      ease_dollars(-G.GAME.current_round.reroll_cost)
    end
    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = function()
          local final_free = G.GAME.current_round.free_rerolls > 0
          G.GAME.current_round.free_rerolls = math.max(G.GAME.current_round.free_rerolls - 1, 0)
          G.GAME.round_scores.times_rerolled.amt = G.GAME.round_scores.times_rerolled.amt + 1

          calculate_blindreroll_cost(final_free)
          for i = 1, #G.GAME.tags do
              G.GAME.tags[i]:apply_to_run({type = 'after_reroll'})
          end
          G.GAME.rerolled = false
          for i = #G.shop_booster.cards,1, -1 do
            local c = G.shop_booster:remove_card(G.shop_booster.cards[i])
            c:remove()
            c = nil
          end

          --save_run()

          play_sound('coin2')
          play_sound('other1')

          for i=1, G.GAME.starting_params.boosters_in_shop + (G.GAME.modifiers.extra_boosters or 0) + (not G.GAME.last_joker and 1 or 1) do -- changed
            if i <= 2 and G.GAME.last_joker then
                G.GAME.current_round.used_packs = G.GAME.current_round.used_packs or {}
                G.GAME.current_round.used_packs[i] = get_pack('shop_pack').key 
                local card = Card(G.shop_booster.T.x + G.shop_booster.T.w/2, G.shop_booster.T.y, G.CARD_W*1.27, G.CARD_H*1.27, G.P_CARDS.empty, G.P_CENTERS[G.GAME.current_round.used_packs[i]], {bypass_discovery_center = true, bypass_discovery_ui = true})
                create_shop_card_ui(card, 'Booster', G.shop_booster)
                card.ability.booster_pos = i
                card:start_materialize()
                G.shop_booster:emplace(card) 
            else
              G.shop_booster:emplace(BLINDSIDE.create_blindcard_for_shop(G.shop_booster, G.GAME.last_joker))
            end
          end
          return true
        end
      }))
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.3,
        func = function()
        G.E_MANAGER:add_event(Event({
          func = function()
            G.CONTROLLER.interrupt.focus = false
            G.CONTROLLER.locks.shop_reroll = false
            G.CONTROLLER:recall_cardarea_focus('shop_jokers')
            for i = 1, #G.jokers.cards do
              G.jokers.cards[i]:calculate_joker({reroll_shop = true})
            end
            return true
          end
        }))
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({ func = function() save_run(); return true end}))
  end

function calculate_blindreroll_cost(skip_increment)
    if G.GAME.current_round.free_rerolls < 0 then G.GAME.current_round.free_rerolls = 0 end
    if G.GAME.current_round.free_rerolls > 0 then G.GAME.current_round.reroll_cost = 0; return end
    G.GAME.current_round.reroll_cost_increase = G.GAME.current_round.reroll_cost_increase or 0
    if not skip_increment then G.GAME.current_round.reroll_cost_increase = G.GAME.current_round.reroll_cost_increase + 2 end
    G.GAME.current_round.reroll_cost = (G.GAME.round_resets.temp_reroll_cost or G.GAME.round_resets.reroll_cost) + G.GAME.current_round.reroll_cost_increase
end

  G.FUNCS.blindcan_reroll = function(e)
    if (((G.GAME.dollars-G.GAME.bankrupt_at) - G.GAME.current_round.reroll_cost < 0) and G.GAME.current_round.reroll_cost ~= 0) then
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
        --e.children[1].children[1].config.shadow = false
        --e.children[2].children[1].config.shadow = false
        --e.children[2].children[2].config.shadow = false
    else
        e.config.colour = G.C.GREEN
        e.config.button = 'blindreroll_shop'
        --e.children[1].children[1].config.shadow = true
        --e.children[2].children[1].config.shadow = true
        --e.children[2].children[2].config.shadow = true
    end
  end
  
function BLINDSIDE.create_blindcard_for_shop(area, is_boss_shop)
    local forced_tag = nil
    for k, v in ipairs(G.GAME.tags) do
      if not forced_tag then
        forced_tag = v:apply_to_run({type = 'store_joker_create', area = area})
        if forced_tag then
          for kk, vv in ipairs(G.GAME.tags) do
            if vv:apply_to_run({type = 'store_joker_modify', card = forced_tag}) then break end
          end
          return forced_tag end
      end
    end
    local blind_rate = is_boss_shop and 0 or G.GAME.blind_rate
    local film_rate = is_boss_shop and 1 or G.GAME.bld_obj_filmcard_rate
    local mineral_rate = is_boss_shop and 2 or G.GAME.bld_obj_mineral_rate
    local rune_rate = is_boss_shop and 0.25 or G.GAME.bld_obj_rune_rate
        local total_rate = blind_rate + film_rate + mineral_rate + rune_rate
        local polled_rate = pseudorandom(pseudoseed('cdt'..G.GAME.round_resets.ante))*total_rate
        local check_rate = 0
        -- need to preserve order to leave RNG unchanged
        local rates = {
          {type = 'Base', val = blind_rate},
          {type = 'bld_obj_filmcard', val = film_rate},
          {type = 'bld_obj_mineral', val = mineral_rate},
          {type = 'bld_obj_rune', val = rune_rate}
        }
        for _, v in ipairs(rates) do
          if polled_rate > check_rate and polled_rate <= check_rate + v.val then
            if v.type == 'Base' then
              local enhancement = nil
              local args = {}
              args.guaranteed = true
              args.options = G.P_CENTER_POOLS.bld_obj_blindcard_generate
              local cardtype = BLINDSIDE.poll_enhancement(args)
              local card = SMODS.create_card({ set = 'Base', seal = enhancement, enhancement = cardtype, area = area })
              create_shop_card_ui(card, 'Enhanced', area)
              if card.ability.set == 'Base' or card.ability.set == 'Enhanced' then
                card.cost = card.cost + 2 + ((card.config and card.config.center and card.config.center.weight) and 1 or 0)
              end
              G.E_MANAGER:add_event(Event({
                  func = (function()
                      for k, v in ipairs(G.GAME.tags) do
                        if v:apply_to_run({type = 'store_joker_modify', card = card}) then break end
                      end
                      return true
                  end)
              }))
              return card
            else
            local card = SMODS.create_card({set = v.type, area = area, bypass_discovery_center = true, discover = true})
            create_shop_card_ui(card, v.type, area)
            G.E_MANAGER:add_event(Event({
                func = (function()
                    for k, v in ipairs(G.GAME.tags) do
                      if v:apply_to_run({type = 'store_joker_modify', card = card}) then break end
                    end
                    return true
                end)
            }))
            return card
          end
          end
          check_rate = check_rate + v.val
        end
  end