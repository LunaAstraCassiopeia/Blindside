function create_UIBox_HUD_jokerblind()
  local scale = 0.4
  local scorescale = 0.3
  local stake_sprite = get_stake_sprite(G.GAME.stake or 1, 0.5)
  G.GAME.blind:change_dim(1.5,1.5)

  return {n=G.UIT.ROOT, config={align = "cm", minw = 4.5, r = 0.1, colour = G.C.BLACK, emboss = 0.05, padding = 0.05, func = 'HUD_blind_visible', id = 'HUD_blind'}, nodes={
      {n=G.UIT.R, config={align = "cm", minh = 0.7, r = 0.1, emboss = 0.05, colour = G.C.DYN_UI.MAIN}, nodes={
        {n=G.UIT.C, config={align = "cm", minw = 3}, nodes={
          {n=G.UIT.O, config={object = DynaText({string = {{ref_table = G.GAME.blind, ref_value = 'loc_name'}}, colours = {G.C.UI.TEXT_LIGHT},shadow = true, rotate = true, silent = true, float = true, scale = 1.6*scale, y_offset = -4}),id = 'HUD_blind_name'}},
        }},
      }},
      {n=G.UIT.R, config={align = "cm", minh = 2.74, r = 0.1,colour = G.C.DYN_UI.DARK}, nodes={
        {n=G.UIT.R, config={align = "cm",padding = 0.15}, nodes={
          {n=G.UIT.O, config={object = G.GAME.blind, draw_layer = 1}},
          {n=G.UIT.O, config={object = G.GAME.blindassist, draw_layer = 2}},
          {n=G.UIT.C, config={align = "cm", id = 'HUD_blind_debuff', func = 'HUD_blind_debuff', scale = 0.8*scale}, nodes={}},
        }},
          {n=G.UIT.R, config={align = "cm",r = 0.1, padding = 0.05, minh = 1, colour = G.C.BLACK}, nodes={
            {n=G.UIT.R, config={align = "cm", id = 'HUD_blind_count', func = 'blind_chip_UI_scale'}, nodes={
        -- Inner shell container
                {n=G.UIT.C, config={align = "cm"}, nodes={
                    -- Chips container
                        {n=G.UIT.C, config={align = 'cm', id = 'blind_chips_container'}, nodes = {
                            {n=G.UIT.R, config={align = 'cr', minw = 2, minh = 0.3, r = 0.1, colour = SMODS.Scoring_Parameters["chips"].colour, id = 'blind_chips_area', emboss = 0.05}, nodes={
                                {n=G.UIT.O, config={id = 'blind_chips', func = 'blind_chip_UI_scale', text = 'basechip_text', type = "chips", scale = scorescale*2.3, object = DynaText({
                                    string = {{ref_table = G.GAME.blind, ref_value = 'basechips_text'}},
                                    colours = {G.C.UI.TEXT_LIGHT}, font = G.LANGUAGES['en-us'].font, shadow = true, float = true, scale = scorescale*2.3
                                })}},
                                'cr' ~= 'cl' and {n=G.UIT.B, config={w = 0.1, h = 0.1}} or nil,
                            }}
                        }},
                        -- Operator
                        SMODS.GUI.operator(scorescale),
                        -- Mult container
                        {n=G.UIT.C, config={align = 'cm', id = 'blind_mult_container'}, nodes = {
                            {n=G.UIT.R, config={align = 'cl', minw = 2, minh = 0.3, r = 0.1, colour = SMODS.Scoring_Parameters["mult"].colour, id = 'blind_mult_area', emboss = 0.05}, nodes={
                                {n=G.UIT.O, config={id = 'blind_mult', func = 'blind_chip_UI_scale', text = 'mult_text', type = "mult", scale = scorescale*2.3, object = DynaText({
                                    string = {{ref_table = G.GAME.blind, ref_value = 'mult_text'}},
                                    colours = {G.C.UI.TEXT_LIGHT}, font = G.LANGUAGES['en-us'].font, shadow = true, float = true, scale = scorescale*2.3
                                })}},
                                'cl' ~= 'cl' and {n=G.UIT.B, config={w = 0.1, h = 0.1}} or nil,
                            }}
                        }},
                }},
            }},
            {n=G.UIT.R, config={align = "cm", maxw = 2.8}, nodes={
              {n=G.UIT.T, config={text = localize('ph_blind_reward'), scale = 0, colour = G.C.WHITE}},
              {n=G.UIT.O, config={object = DynaText({string = {{ref_table = G.GAME.current_round, ref_value = 'dollars_to_be_earned'}}, colours = {G.C.MONEY},shadow = true, rotate = true, bump = true, silent = true, scale = 0}),id = 'dollars_to_be_earned'}},
          }},
            {n=G.UIT.R, config={align = "cm", minh = 0.6, colour = G.C.DYN_UI.BOSS_DARK, r = 0.1, emboss = 0.05}, nodes={
              {n=G.UIT.O, config={w=0.5,h=0.5, colour = G.C.BLUE, object = stake_sprite, hover = true, can_collide = false}},
              {n=G.UIT.B, config={h=0.1,w=0.1}},
              {n=G.UIT.T, config={ref_table = G.GAME.blind, ref_value = 'chip_text', scale = 0.001, colour = G.C.RED, shadow = true, id = 'HUD_blind_count', func = 'blind_chip_UI_scale'}}
            }},
        }},
      }},
    }}
end