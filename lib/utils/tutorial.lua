G.FUNCS.start_blind_run = function(e, args) 
  G.SETTINGS.paused = true
  if e and e.config.id == 'restart_button' then G.GAME.viewed_back = nil end
  args = args or {}
  G.GAME.selected_back = Back(G.P_CENTERS['b_bld_whitedispenser'])
  args.seed = "BLINDSDE"
  G.E_MANAGER:clear_queue()
  G.FUNCS.wipe_on()
  G.E_MANAGER:add_event(Event({
    no_delete = true,
    func = function()
      G:delete_run()
      return true
    end
  }))
  G.E_MANAGER:add_event(Event({
    trigger = 'immediate',
    no_delete = true,
    func = function()
      G:start_run(args)
      return true
    end
  }))
  G.FUNCS.wipe_off()
end


G.FUNCS.blindside_tutorial_controller = function()
    if G.F_SKIP_TUTORIAL then
        G.SETTINGS.blindside_tutorial_complete = true
        G.SETTINGS.blindside_tutorial_progress = nil
        
        return
    end
    print(G.SETTINGS.blindside_tutorial_complete)
    G.SETTINGS.blindside_tutorial_progress = G.SETTINGS.blindside_tutorial_progress or 
    {
        forced_shop = {'j_bld_pirateship', 'j_bld_glasses', 'j_bld_lighter', 'j_bld_porcelaindoll'},
        forced_blinds = {'m_bld_arm', 'm_bld_peace', 'm_bld_ore', 'm_bld_grate'},
        forced_voucher = 'v_bld_grabbyhand',
        forced_tags = {'tag_bld_maxim', 'tag_bld_wave'},
        hold_parts = {},
        completed_parts = {},
    }
    G.SETTINGS.blindside_tutorial_progress.forced_boss = 'bl_bld_hittheroad'
    G.SETTINGS.blindside_tutorial_progress.forced_shop.spawn['j_bld_pirateship'] = true
    G.SETTINGS.blindside_tutorial_progress.forced_shop.spawn['j_bld_glasses'] = true
    G.SETTINGS.blindside_tutorial_progress.forced_shop.spawn['j_bld_lighter'] = true
    G.SETTINGS.blindside_tutorial_progress.forced_shop.spawn['j_bld_porcelaindoll'] = true
    if not G.SETTINGS.paused and (not G.SETTINGS.blindside_tutorial_complete) then
        if G.STATE == G.STATES.SELECTING_HAND and not G.SETTINGS.blindside_tutorial_progress.completed_parts['second_hand'] and G.SETTINGS.blindside_tutorial_progress.hold_parts['shop_1'] then
            G.SETTINGS.blindside_tutorial_progress.section = 'second_hand'
            G.FUNCS.blindside_tutorial_part('second_hand')
            G.SETTINGS.blindside_tutorial_progress.completed_parts['second_hand']  = true
            G:save_progress()
        end
        if G.STATE == G.STATES.SELECTING_HAND and not G.SETTINGS.blindside_tutorial_progress.completed_parts['reshuffle'] and G.SETTINGS.blindside_tutorial_progress.hold_parts['whoa_what_happened'] and #G.deck.cards < 5  then
            G.FUNCS.blindside_tutorial_part('reshuffle')
            G.SETTINGS.blindside_tutorial_progress.completed_parts['reshuffle']  = true
            G:save_progress()
        end
        if not G.SETTINGS.blindside_tutorial_progress.completed_parts['first_hand_section'] then 
            if G.STATE == G.STATES.SELECTING_HAND and not G.SETTINGS.blindside_tutorial_progress.completed_parts['first_hand'] then
                G.SETTINGS.blindside_tutorial_progress.section = 'first_hand'
                G.FUNCS.blindside_tutorial_part('first_hand')
                G.SETTINGS.blindside_tutorial_progress.completed_parts['first_hand']  = true
                G:save_progress()
            end
            if G.STATE == G.STATES.SELECTING_HAND and not G.SETTINGS.blindside_tutorial_progress.completed_parts['first_hand_2'] and G.SETTINGS.blindside_tutorial_progress.hold_parts['first_hand']  then
                G.FUNCS.blindside_tutorial_part('first_hand_2')
                G.SETTINGS.blindside_tutorial_progress.completed_parts['first_hand_2']  = true
                G:save_progress()
            end
            if G.STATE == G.STATES.SELECTING_HAND and not G.SETTINGS.blindside_tutorial_progress.completed_parts['whoa_what_happened'] and G.SETTINGS.blindside_tutorial_progress.hold_parts['first_hand_2']  then
                G.FUNCS.blindside_tutorial_part('whoa_what_happened')
                G.SETTINGS.blindside_tutorial_progress.completed_parts['whoa_what_happened'] = true
                G.SETTINGS.blindside_tutorial_progress.completed_parts['first_hand_section']  = true
                G:save_progress()
            end
        end
         if G.STATE == G.STATES.SHOP and G.shop and G.shop.VT.y < 5 and not G.SETTINGS.blindside_tutorial_progress.completed_parts['shop_1'] then
            G.SETTINGS.blindside_tutorial_progress.section = 'shop_1'
            G.FUNCS.blindside_tutorial_part('shop_1')
            G.SETTINGS.blindside_tutorial_progress.completed_parts['shop_1']  = true
            G:save_progress()
        end
         if G.STATE == G.STATES.SHOP and G.shop and G.shop.VT.y < 5 and not G.SETTINGS.blindside_tutorial_progress.completed_parts['shop_2'] and G.SETTINGS.blindside_tutorial_progress.hold_parts['second_hand'] then
            G.SETTINGS.blindside_tutorial_progress.section = 'shop_2'
            G.FUNCS.blindside_tutorial_part('shop_2')
            G.SETTINGS.blindside_tutorial_progress.completed_parts['shop_2']  = true
            G:save_progress()
        end
         if G.STATE == G.STATES.SHOP and G.shop and G.shop.VT.y < 5 and not G.SETTINGS.blindside_tutorial_progress.completed_parts['shop_3'] and G.GAME.last_joker then
            G.SETTINGS.blindside_tutorial_progress.section = 'shop_3'
            G.FUNCS.blindside_tutorial_part('shop_3')
            G.SETTINGS.blindside_tutorial_progress.completed_parts['shop_3']  = true
            G:save_progress()
        end
        if G.SETTINGS.blindside_tutorial_progress.hold_parts['shop_3'] then
            print("test")
            G.SETTINGS.blindside_tutorial_complete = true
            G.SETTINGS.blindside_tutorial_progress = nil
        end
    end
end

G.FUNCS.blindside_tutorial_part = function(_part)
    local step = 1
    G.SETTINGS.paused = true
    if _part == 'first_hand' then
        step = blindside_tutorial_info({
            text_key = 'bld_fh_1',
            attach = {major = G.ROOM_ATTACH, type = 'cm', offset = {x = 0, y = 0}},
            step = step,
        })
        step = blindside_tutorial_info({
            text_key = 'bld_fh_2',
            attach = {major = G.ROOM_ATTACH, type = 'cm', offset = {x = 0, y = 0}},
            step = step,
        })
        step = blindside_tutorial_info({
            text_key = 'bld_fh_3',
            highlight = {
                G.hand,
            },
            look = {1, 0},
            attach = {major = G.hand, type = 'cl', offset = {x = -1.5, y = 0}},
            snap_to = function() return G.hand.cards[1] end,
            step = step,
        })
        step = blindside_tutorial_info({
            hard_set = true,
            text_key = 'bld_fh_4',
            highlight = {
                G.hand,
            },
            look = {1, 0},
            attach = {major = G.hand, type = 'cl', offset = {x = -1.5, y = 0}},
            snap_to = function() return G.hand.cards[1] end,
            step = step,
        })
        step = blindside_tutorial_info({
            text_key = 'bld_fh_5',
            attach = {major = G.ROOM_ATTACH, type = 'cm', offset = {x = 0, y = 0}},
            highlight = {
                G.hand,
                G.HUD:get_UIE_by_ID('run_info_button')
            },
            look = {-1, 0.3},
            no_button = true,
            button_listen = 'run_info',
            snap_to = function() return G.HUD:get_UIE_by_ID('run_info_button') end,
            step = step,
        })
    elseif _part == 'first_hand_2' then
        step = blindside_tutorial_info({
            text_key = 'bld_fh_6',
            highlight = {
                G.hand,
                G.buttons:get_UIE_by_ID('play_button'),
            },
            look = {1, 0},
            attach = {major = G.hand, type = 'cl', offset = {x = -1.5, y = 0}},
            no_button = true,
            button_listen = 'play_cards_from_highlighted',
            step = step,
        })
    elseif _part == 'whoa_what_happened' then
        step = blindside_tutorial_info({
            hard_set = true,
            text_key = 'bld_wtf_1',
            highlight = {
                G.HUD_blind,
            },
            look = {0, -1},
            attach = {major = G.HUD_blind, type = 'cm', offset = {x = 0, y = 6}},
            step = step,
        })
        step = blindside_tutorial_info({
            hard_set = true,
            text_key = 'bld_wtf_2',
            highlight = {
                G.hand,
            },
            look = {1, 0},
            attach = {major = G.hand, type = 'cl', offset = {x = -1.5, y = 0}},
            step = step,
        })
        step = blindside_tutorial_info({
            text_key = 'bld_wtf_4',
            attach = {major = G.ROOM_ATTACH, type = 'cm', offset = {x = 0, y = 0}},
            step = step,
        })
    elseif _part == 'reshuffle' then
        step = blindside_tutorial_info({
            hard_set = true,
            text_key = 'bld_rshfl_1',
            highlight = {
                G.deck,
            },
            attach = {major = G.deck, type = 'cm', offset = {x = 0, y = -4}},
            step = step,
        })
        step = blindside_tutorial_info({
            hard_set = true,
            text_key = 'bld_rshfl_2',
            highlight = {
                G.deck,
            },
            attach = {major = G.deck, type = 'cm', offset = {x = 0, y = -4}},
            step = step,
        })
    elseif _part == 'second_hand' then
        step = blindside_tutorial_info({
            text_key = 'bld_sh_1',
            hard_set = true,
            highlight = {
                G.HUD_blind
            },
            look = {0, -1},
            attach = {major =  G.HUD_blind, type = 'cm', offset = {x = 0, y = 6}},
            step = step,
        })
        step = blindside_tutorial_info({
            text_key = 'bld_sh_2',
            hard_set = true,
            highlight = {
                G.HUD_blind
            },
            look = {0, -1},
            attach = {major =  G.HUD_blind, type = 'cm', offset = {x = 0, y = 6}},
            step = step,
        })
    elseif _part == 'shop_1' then
        step = blindside_tutorial_info({
            hard_set = true,
            text_key = 'bld_s_1',
            highlight = {
                G.SHOP_SIGN,
            },
            attach = {major = G.shop, type = 'tm', offset = {x = 0, y = 4}},
            step = step,
        })
        step = blindside_tutorial_info({
            text_key = 'bld_s_2',
            highlight = {
                G.SHOP_SIGN,
                G.HUD:get_UIE_by_ID('dollar_text_UI').parent.parent.parent,
                G.shop_booster
            },
            look = {0, -1},
            snap_to = function() return G.shop_booster.cards[1] end,
            attach = {major = G.shop, type = 'tm', offset = {x = 0, y = 8}},
            no_button = true,
            button_listen = 'buy_from_shop',
            step = step,
        })
        step = blindside_tutorial_info({
            text_key = 'bld_s_3',
            highlight = function() return {
                G.shop:get_UIE_by_ID('next_round_button'),
                G.shop_booster
            } end,
            look = {-0.2, -1},
            snap_to = function() if G.shop then return G.shop:get_UIE_by_ID('next_round_button') end end,
            no_button = true,
            button_listen = 'toggle_shop',
            attach = {major = G.shop, type = 'tm', offset = {x = 0, y = 8}},
            step = step,
        })
    elseif _part == 'shop_2' then
        step = blindside_tutorial_info({
            hard_set = true,
            text_key = 'bld_st_1',
            highlight = {
                G.SHOP_SIGN,
                G.HUD:get_UIE_by_ID('dollar_text_UI').parent.parent.parent,
                G.shop_jokers
            },
            attach = {major = G.shop, type = 'tm', offset = {x = 0, y = 4}},
            step = step,
        })
        step = blindside_tutorial_info({
            text_key = 'bld_st_2',
            highlight = {
                G.SHOP_SIGN,
                G.HUD:get_UIE_by_ID('dollar_text_UI').parent.parent.parent,
                G.shop_jokers
            },
            snap_to = function() return G.shop_jokers.cards[1] end,
            attach = {major = G.shop, type = 'tm', offset = {x = 0, y = 4}},
            no_button = true,
            button_listen = 'buy_from_shop',
            step = step,
        })
        step = blindside_tutorial_info({
            text_key = 'bld_st_3',
            highlight = function() return {
                G.shop:get_UIE_by_ID('next_round_button'),
                G.jokers,
                G.shop_jokers
            } end,
            look = {0, -1},
            snap_to = function() if G.shop then return G.shop:get_UIE_by_ID('next_round_button') end end,
            no_button = true,
            button_listen = 'toggle_shop',
            attach = {major = G.shop, type = 'tm', offset = {x = 0, y = 4}},
            step = step,
        })
    elseif _part == 'shop_3' then
        step = blindside_tutorial_info({
            text_key = 'bld_sb_1',
            attach = {major = G.ROOM_ATTACH, type = 'cm', offset = {x = 0, y = 0}},
            step = step,
        })
        step = blindside_tutorial_info({
            hard_set = true,
            text_key = 'bld_sb_2',
            highlight = {
                G.SHOP_SIGN,
                G.HUD:get_UIE_by_ID('dollar_text_UI').parent.parent.parent,
                G.shop_jokers,
                G.shop_vouchers
            },
            attach = {major = G.shop, type = 'tm', offset = {x = 0, y = 4}},
            step = step,
        })
        step = blindside_tutorial_info({
            text_key = 'bld_sb_3',
            highlight = {
                G.SHOP_SIGN,
                G.HUD:get_UIE_by_ID('dollar_text_UI').parent.parent.parent,
                G.shop_booster
            },
            look = {1, 0},
            snap_to = function() return G.shop_booster.cards[1] end,
            attach = {major = G.shop, type = 'tm', offset = {x = -4, y = 4}},
            step = step,
        })
        step = blindside_tutorial_info({
            text_key = 'bld_sb_4',
            attach = {major = G.ROOM_ATTACH, type = 'cm', offset = {x = 0, y = 0}},
            step = step,
        })
        step = blindside_tutorial_info({
            text_key = 'bld_sb_5',
            attach = {major = G.ROOM_ATTACH, type = 'cm', offset = {x = 0, y = 0}},
            step = step,
        })
    end

    
    G.E_MANAGER:add_event(Event({
        blockable = false,
        timer = 'REAL',
        func = function()
            if (G.OVERLAY_TUTORIAL and G.OVERLAY_TUTORIAL.step == step and
            not G.OVERLAY_TUTORIAL.step_complete) or G.OVERLAY_TUTORIAL.skip_steps then
                if G.OVERLAY_TUTORIAL.Jimbo then G.OVERLAY_TUTORIAL.Jimbo:remove() end
                if G.OVERLAY_TUTORIAL.content then G.OVERLAY_TUTORIAL.content:remove() end
                G.OVERLAY_TUTORIAL:remove()
                G.OVERLAY_TUTORIAL = nil
                G.SETTINGS.blindside_tutorial_progress.hold_parts[_part]=true
                return true
            end
            return G.OVERLAY_TUTORIAL.step > step or G.OVERLAY_TUTORIAL.skip_steps
        end
    }), 'tutorial') 
    G.SETTINGS.paused = false
end


function blindside_tutorial_info(args)
    local overlay_colour = {0.32,0.36,0.41,0}
    ease_value(overlay_colour, 4, 0.6, nil, 'REAL', true,0.4)
    G.OVERLAY_TUTORIAL = G.OVERLAY_TUTORIAL or UIBox{
        definition = {n=G.UIT.ROOT, config = {align = "cm", padding = 32.05, r=0.1, colour = overlay_colour, emboss = 0.05}, nodes={
            {n=G.UIT.R, config={align = "tr", minh = G.ROOM.T.h, minw = G.ROOM.T.w}, nodes={
                UIBox_button{label = {localize('b_skip').." >"}, button = "skip_blind_tutorial_section", minw = 1.3, scale = 0.45, colour = G.C.JOKER_GREY}
            }}
        }},
        config = {
            align = "cm",
            offset = {x=0,y=3.2},
            major = G.ROOM_ATTACH,
            bond = 'Weak'
          }
      }
    G.OVERLAY_TUTORIAL.step = G.OVERLAY_TUTORIAL.step or 1
    G.OVERLAY_TUTORIAL.step_complete = false
    local row_dollars_chips = G.HUD:get_UIE_by_ID('row_dollars_chips')
    local align = args.align or "tm"
    local step = args.step or 1
    local attach = args.attach or {major = row_dollars_chips, type = 'tm', offset = {x=0, y=-0.5}}
    local pos = args.pos or {x=attach.major.T.x + attach.major.T.w/2, y=attach.major.T.y + attach.major.T.h/2}
    pos.center = 'm_bld_flip'
    pos.googly = true
    local button = args.button or {button = localize('b_next'), func = 'tut_next'}
    args.highlight = args.highlight or {}
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.3,
        func = function()
            if G.OVERLAY_TUTORIAL and G.OVERLAY_TUTORIAL.step == step and
            not G.OVERLAY_TUTORIAL.step_complete then
                G.CONTROLLER.interrupt.focus = true
                G.OVERLAY_TUTORIAL.Jimbo = G.OVERLAY_TUTORIAL.Jimbo or Card_Character(pos)
                G.OVERLAY_TUTORIAL.Jimbo.children.card.googly = true
                G.OVERLAY_TUTORIAL.Jimbo.children.card.force_look_dir = args.look
                if type(args.highlight) == 'function' then args.highlight = args.highlight() end
                args.highlight[#args.highlight+1] = G.OVERLAY_TUTORIAL.Jimbo
                G.OVERLAY_TUTORIAL.Jimbo:add_speech_bubble(args.text_key, align, args.loc_vars)
                G.OVERLAY_TUTORIAL.Jimbo:set_alignment(attach)
                if args.hard_set then G.OVERLAY_TUTORIAL.Jimbo:hard_set_VT() end
                G.OVERLAY_TUTORIAL.button_listen = nil
                if G.OVERLAY_TUTORIAL.content then G.OVERLAY_TUTORIAL.content:remove() end
                if args.content then
                    G.OVERLAY_TUTORIAL.content = UIBox{
                        definition = args.content(),
                        config = {
                            align = args.content_config and args.content_config.align or "cm",
                            offset = args.content_config and args.content_config.offset or {x=0,y=0},
                            major = args.content_config and args.content_config.major or G.OVERLAY_TUTORIAL.Jimbo,
                            bond = 'Weak'
                          }
                      }
                    args.highlight[#args.highlight+1] = G.OVERLAY_TUTORIAL.content
                end
                if args.button_listen then G.OVERLAY_TUTORIAL.button_listen = args.button_listen end
                if not args.no_button then G.OVERLAY_TUTORIAL.Jimbo:add_button(button.button, button.func, button.colour, button.update_func, true) end
                G.OVERLAY_TUTORIAL.Jimbo:say_stuff(2*(#(G.localization.misc.tutorial[args.text_key] or {}))+1)
                if args.snap_to then
                    G.E_MANAGER:add_event(Event({
                        trigger = 'immediate',
                        blocking = false, blockable = false,
                        func = function()
                            if G.OVERLAY_TUTORIAL and G.OVERLAY_TUTORIAL.Jimbo and not G.OVERLAY_TUTORIAL.Jimbo.talking then 
                            local _snap_to = args.snap_to()
                            if _snap_to then
                                G.CONTROLLER.interrupt.focus = false
                                G.CONTROLLER:snap_to({node = args.snap_to()})
                            end
                            return true
                            end
                        end
                    }), 'tutorial') 
                end
                if args.highlight then G.OVERLAY_TUTORIAL.highlights = args.highlight end 
                G.OVERLAY_TUTORIAL.step_complete = true
            end
            return not G.OVERLAY_TUTORIAL or G.OVERLAY_TUTORIAL.step > step or G.OVERLAY_TUTORIAL.skip_steps
        end
    }), 'tutorial') 
    return step+1
end

  G.FUNCS.skip_blind_tutorial_section = function(e)
    G.OVERLAY_TUTORIAL.skip_steps = true

    if G.OVERLAY_TUTORIAL.Jimbo then G.OVERLAY_TUTORIAL.Jimbo:remove() end
    if G.OVERLAY_TUTORIAL.content then G.OVERLAY_TUTORIAL.content:remove() end
    G.OVERLAY_TUTORIAL:remove()
    G.OVERLAY_TUTORIAL = nil
    G.E_MANAGER:clear_queue('tutorial')
    if G.SETTINGS.blindside_tutorial_progress.section == 'second_hand' then
      G.SETTINGS.blindside_tutorial_progress.completed_parts['second_hand']  = true
      G.SETTINGS.blindside_tutorial_progress.hold_parts['second_hand'] = true
    elseif G.SETTINGS.blindside_tutorial_progress.section == 'reshuffle' then
      G.SETTINGS.blindside_tutorial_progress.completed_parts['reshuffle']  = true
      G.SETTINGS.blindside_tutorial_progress.hold_parts['reshuffle'] = true
    elseif G.SETTINGS.blindside_tutorial_progress.section == 'first_hand' then
      G.SETTINGS.blindside_tutorial_progress.completed_parts['first_hand']  = true
      G.SETTINGS.blindside_tutorial_progress.completed_parts['first_hand_2']  = true
      G.SETTINGS.blindside_tutorial_progress.completed_parts['whoa_what_happened']  = true
      G.SETTINGS.blindside_tutorial_progress.hold_parts['whoa_what_happened'] = true
      G.SETTINGS.blindside_tutorial_progress.completed_parts['first_hand_section']  = true
    elseif G.SETTINGS.blindside_tutorial_progress.section == 'shop_1' then
      G.SETTINGS.blindside_tutorial_progress.completed_parts['shop_1']  = true
      G.SETTINGS.blindside_tutorial_progress.hold_parts['shop_1'] = true
      G.SETTINGS.blindside_tutorial_progress.forced_voucher = nil
    elseif G.SETTINGS.blindside_tutorial_progress.section == 'shop_2' then
      G.SETTINGS.blindside_tutorial_progress.completed_parts['shop_2']  = true
      G.SETTINGS.blindside_tutorial_progress.hold_parts['shop_2'] = true
      G.SETTINGS.blindside_tutorial_progress.forced_voucher = nil
    elseif G.SETTINGS.blindside_tutorial_progress.section == 'shop_3' then
      G.SETTINGS.blindside_tutorial_progress.completed_parts['shop_3']  = true
      G.SETTINGS.blindside_tutorial_progress.hold_parts['shop_3'] = true
      G.SETTINGS.blindside_tutorial_progress.forced_voucher = nil
    end     
  end