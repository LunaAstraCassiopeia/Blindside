    local function blindcards_ui()
        local blindcards = {}
        for k, v in pairs(G.P_CENTER_POOLS.Enhanced) do
            if BLINDSIDE.is_blindside(v.key) then
                table.insert(blindcards, v)
            end
        end
    local rows = {5, 6, 5}
    local args = {}
    local _pool = blindcards
    args.no_materialize = true
    args.w_mod = 1
    args.h_mod = 0.71
    args.card_scale = args.card_scale or 1
    args.back_func = 'blindside_collection'
    args.hide_single_page = true
    args.modify_card = function(card, center)
            if G.SETTINGS.blind_view_upgrades then upgrade_blinds({card}, true, true) end
        end
    local deck_tables = {}
    local pool = SMODS.collection_pool(_pool)

    G.your_collection = {}
    local cards_per_page = 0
    local row_totals = {}
    for j = 1, #rows do
        if cards_per_page >= #pool and args.collapse_single_page then
            rows[j] = nil
        else
            row_totals[j] = cards_per_page
            cards_per_page = cards_per_page + rows[j]
            G.your_collection[j] = CardArea(
                G.ROOM.T.x + 0.2*G.ROOM.T.w/2,G.ROOM.T.h,
                (args.w_mod*rows[j]+0.25)*G.CARD_W,
                args.h_mod*G.CARD_H, 
                {card_limit = rows[j], type = args.area_type or 'title', highlight_limit = 0, collection = true}
            )
            table.insert(deck_tables, 
            {n=G.UIT.R, config={align = "cm", padding = 0.07, no_fill = true}, nodes={
                {n=G.UIT.O, config={object = G.your_collection[j]}}
            }})
        end
    end

    local options = {}
    for i = 1, math.ceil(#pool/cards_per_page) do
        table.insert(options, localize('k_page')..' '..tostring(i)..'/'..tostring(math.ceil(#pool/cards_per_page)))
    end

    G.FUNCS.SMODS_card_collection_page = function(e)
        if not e or not e.cycle_config then return end
        for j = 1, #G.your_collection do
            for i = #G.your_collection[j].cards, 1, -1 do
            local c = G.your_collection[j]:remove_card(G.your_collection[j].cards[i])
            c:remove()
            c = nil
            end
        end
        for j = 1, #rows do
            for i = 1, rows[j] do
            local center = pool[i+row_totals[j] + (cards_per_page*(e.cycle_config.current_option - 1))]
            if not center then break end
            local card = Card(G.your_collection[j].T.x + G.your_collection[j].T.w/2, G.your_collection[j].T.y, G.CARD_W*args.card_scale, G.CARD_H*args.card_scale, G.P_CARDS.empty, (args.center and G.P_CENTERS[args.center]) or center)
            if args.modify_card then args.modify_card(card, center, i, j) end
            if not args.no_materialize then card:start_materialize(nil, i>1 or j>1) end
            G.your_collection[j]:emplace(card)
            end
        end
        INIT_COLLECTION_CARD_ALERTS()
    end

    G.FUNCS.SMODS_card_collection_page{ cycle_config = { current_option = 1 }}
    
    local t = create_UIBox_generic_options({
        colour = G.ACTIVE_MOD_UI and ((G.ACTIVE_MOD_UI.ui_config or {}).collection_colour or (G.ACTIVE_MOD_UI.ui_config or {}).colour),
        bg_colour = G.ACTIVE_MOD_UI and ((G.ACTIVE_MOD_UI.ui_config or {}).collection_bg_colour or (G.ACTIVE_MOD_UI.ui_config or {}).bg_colour),
        back_colour = G.ACTIVE_MOD_UI and ((G.ACTIVE_MOD_UI.ui_config or {}).collection_back_colour or (G.ACTIVE_MOD_UI.ui_config or {}).back_colour),
        outline_colour = G.ACTIVE_MOD_UI and ((G.ACTIVE_MOD_UI.ui_config or {}).collection_outline_colour or
                (G.ACTIVE_MOD_UI.ui_config or {}).outline_colour),
        back_func = (args and args.back_func) or G.ACTIVE_MOD_UI and "openModUI_"..G.ACTIVE_MOD_UI.id or 'your_collection', snap_back = args.snap_back, infotip = args.infotip, contents = {
          {n=G.UIT.R, config={align = "cm", r = 0.1, colour = G.C.BLACK, emboss = 0.05}, nodes=deck_tables}, 
          {n=G.UIT.R, config={id="view_upgrades", align = "cm", minw = 1, colour = G.C.L_BLACK}, nodes= 
            {create_toggle({label = localize('k_view_upgrades'), ref_table = G.SETTINGS, ref_value = 'blind_view_upgrades', callback = G.FUNCS.view_upgrades}),
            }},
          (not args.hide_single_page or cards_per_page < #pool) and {n=G.UIT.R, config={align = "cm"}, nodes={
            create_option_cycle({options = options, w = 4.5, cycle_shoulders = true, opt_callback = 'SMODS_card_collection_page', current_option = 1, colour = G.ACTIVE_MOD_UI and (G.ACTIVE_MOD_UI.ui_config or {}).collection_option_cycle_colour or G.C.RED, no_pips = true, focus_args = {snap_to = true, nav = 'wide'}})
          }} or nil,
      }})
        return t
    end

    G.FUNCS.view_upgrades = function()
        if G.SETTINGS.blind_view_upgrades then
            for i=1, #G.your_collection do
                upgrade_blinds(G.your_collection[i].cards, true, true)
            end
        else
            for i=1, #G.your_collection do
                for j=1, #G.your_collection[i].cards do
                    local key = G.your_collection[i].cards[j].config.center.key
                    G.your_collection[i].cards[j]:remove_sticker('bld_upgrade')
                    G.your_collection[i].cards[j]:set_ability(G.P_CENTERS[key])
                end
            end
        end
    end

    local function blindedition_ui()
        local blindui = {}
        for k, v in pairs(G.P_CENTER_POOLS.Edition) do
            if BLINDSIDE.is_blindside(v.key) then
                table.insert(blindui, v)
            end
        end

        return SMODS.card_collection_UIBox(blindui, { 5 }, {
        snap_back = true,
        h_mod = 1.03,
        infotip = localize('ml_edition_seal_enhancement_explanation'),
        hide_single_page = true,
        collapse_single_page = true,
        back_func = 'blindside_collection',
        modify_card = function(card, center)
            if center.discovered then card:set_edition(center.key, true, true) end
        end,
        })
    end
    
    local function blindrelics_ui()
        local blindrelics = {}
        for k, v in pairs(G.P_CENTER_POOLS.Voucher) do
            if BLINDSIDE.is_blindside(v.key) then
                table.insert(blindrelics, v)
            end
        end
        return SMODS.card_collection_UIBox(blindrelics, {4,4}, {
            area_type = 'voucher',
            back_func = 'blindside_collection',
        })
    end

    local function blindenhance_ui()
        local blindenhance = {}
        for k, v in pairs(G.P_CENTER_POOLS.Seal) do
            if BLINDSIDE.is_blindside(v.key) then
                table.insert(blindenhance, v)
            end
        end

        return SMODS.card_collection_UIBox(blindenhance, { 5, 4 }, {
        snap_back = true,
        h_mod = 1.03,
        infotip = localize('ml_edition_seal_enhancement_explanation'),
        center = 'm_bld_flip',
        hide_single_page = true,
        collapse_single_page = true,
        back_func = 'blindside_collection',
        modify_card = function(card, center)
            card:set_seal(center.key, true)
        end,
        })
    end
    
    local function blindboosters_ui()
        local blindbooster = {}
        for k, v in pairs(G.P_CENTER_POOLS.Booster) do
            if BLINDSIDE.is_blindside(v.key) then
                table.insert(blindbooster, v)
            end
        end

        return SMODS.card_collection_UIBox(blindbooster, { 4,4 }, {
        h_mod = 1.3,
        w_mod = 1.25, 
        card_scale = 1.27,
        back_func = 'blindside_collection',
        })
    end
    
    local function filmcards_ui()
        local filmcards = {}
        for k, v in pairs(G.P_CENTER_POOLS.bld_obj_filmcard) do
                table.insert(filmcards, v)
        end

        return SMODS.card_collection_UIBox(filmcards, { 6,5 }, {
        back_func = 'blindside_collection',
        })
    end

    local function rituals_ui()
        local rituals = {}
        for k, v in pairs(G.P_CENTER_POOLS.bld_obj_ritual) do
                table.insert(rituals, v)
        end

        return SMODS.card_collection_UIBox(rituals, { 5,4 }, {
        back_func = 'blindside_collection',
        })
    end
    
    local function runes_ui()
        local runes = {}
        for k, v in pairs(G.P_CENTER_POOLS.bld_obj_rune) do
                table.insert(runes, v)
        end

        return SMODS.card_collection_UIBox(runes, { 4,4 }, {
        back_func = 'blindside_collection',
        })
    end
    
    local function minerals_ui()
        local mineral = {}
        for k, v in pairs(G.P_CENTER_POOLS.bld_obj_mineral) do
                table.insert(mineral, v)
        end

        return SMODS.card_collection_UIBox(mineral, { 5,5 }, {
        back_func = 'blindside_collection',
        })
    end
    
    local function blindtrinkets_ui()
        local blindbooster = {}
        for k, v in pairs(G.P_CENTER_POOLS.Joker) do
            if BLINDSIDE.is_blindside(v.key)then
                table.insert(blindbooster, v)
            end
        end

        return SMODS.card_collection_UIBox(blindbooster, { 5,5,5 }, {
        no_materialize = true, 
        h_mod = 0.95,
        back_func = 'blindside_collection',
        })
    end
    

G.blindside_joker_undiscovered = {name = 'Undiscovered', debuff_text = 'Defeat this joker to discover', pos = {x=0,y=26}}
function blind_jokers_ui(exit)
	local min_ante = 1
	local max_ante = 16
	local spacing = 1 - 15*0.06
	if G.GAME and G.GAME.round_resets and G.GAME.round_resets.ante then
		local current_ante = G.GAME.round_resets.ante

		if current_ante > 8 then
			min_ante = current_ante - 8 + 1
			max_ante = current_ante + 8
		end
	end
	local ante_amounts = {}
	for i = min_ante, max_ante do
		if i > 1 then
			ante_amounts[#ante_amounts + 1] = { n = G.UIT.R, config = { minh = spacing }, nodes = {} }
		end
		local blind_chip = Sprite(0, 0, 0.2, 0.2, G.ASSET_ATLAS["ui_" .. (G.SETTINGS.colourblind_option and 2 or 1)],
			{ x = 0, y = 0 })
		blind_chip.states.drag.can = false
		ante_amounts[#ante_amounts + 1] = {
			n = G.UIT.R,
			config = { align = "cm", padding = 0.03 },
			nodes = {
				{
					n = G.UIT.C,
					config = { align = "cm", minw = 0.7 },
					nodes = {
						{ n = G.UIT.T, config = { text = i, scale = 0.4, colour = G.C.FILTER, shadow = true } },
					}
				},
				{
					n = G.UIT.C,
					config = { align = "cr", minw = 2.8 },
					nodes = {
						{ n = G.UIT.O, config = { object = blind_chip } },
						{ n = G.UIT.C, config = { align = "cm", minw = 0.03, minh = 0.01 },                                                                                                                                  nodes = {} },
						{ n = G.UIT.T, config = { text = number_format(get_blind_amount(i)*0.5), scale = 0.4, colour = i <= G.PROFILES[G.SETTINGS.profile].high_scores.furthest_ante.amt and G.C.RED or G.C.JOKER_GREY, shadow = true } },
					}
				}
			}
		}
	end

	local rows = 6
	local cols = 5
	local page = 1
	local deck_tables = {}

	G.your_collection = {}
	for j = 1, rows do
		G.your_collection[j] = CardArea(
			G.ROOM.T.x + 0.2 * G.ROOM.T.w / 2, G.ROOM.T.h,
			cols * 1.55,
			0.95 * 1.33,
			{ card_limit = cols, type = 'title_2', highlight_limit = 0, collection = true })
		table.insert(deck_tables,
			{
				n = G.UIT.R,
				config = { align = "cm", padding = 0, no_fill = true },
				nodes = {
					j%2 == 0 and { n = G.UIT.B, config = { h = 0.2, w = 0.5 } } or nil,
					{ n = G.UIT.O, config = { object = G.your_collection[j] } },
					j%2 == 1 and { n = G.UIT.B, config = { h = 0.2, w = 0.5 } } or nil,
				}
			}
		)
	end
    local blindjokers = {}
    for k, v in pairs(G.P_BLINDS) do
        if BLINDSIDE.is_blindside(v.key) and not BLINDSIDE.is_dupe(v.key) then
            table.insert(blindjokers, v)
        end
    end

	local blind_tab = SMODS.collection_pool(blindjokers)
	local blinds_amt = #blind_tab
    table.sort(blind_tab, function(a, b) return a.order + (a.boss and a.boss.showdown and 1000 or 0) < b.order + (b.boss and b.boss.showdown and 1000 or 0) end)

	local this_page = {}
	for i, v in ipairs(blind_tab) do
		if i > rows*cols*(page-1) and i <= rows*cols*page then
			table.insert(this_page, v)
		elseif i > rows*cols*page then
			break
		end
	end
	blind_tab = this_page

	local blinds_to_be_alerted = {}
	local row, col = 1, 1
	for k, v in ipairs(blind_tab) do
		local temp_blind = AnimatedSprite(G.your_collection[row].T.x + G.your_collection[row].T.w/2, G.your_collection[row].T.y, 1.3, 1.3, G.ANIMATION_ATLAS[v.discovered and v.atlas or 'bld_joker'],
			v.discovered and v.pos or G.blindside_joker_undiscovered.pos)
		temp_blind.states.click.can = false
		temp_blind.states.drag.can = false
		temp_blind.states.hover.can = true
		local card = Card(G.your_collection[row].T.x + G.your_collection[row].T.w/2, G.your_collection[row].T.y, 1.3, 1.3, G.P_CARDS.empty, G.P_CENTERS.c_base)
		temp_blind.states.click.can = false
		card.states.drag.can = false
		card.states.hover.can = true
		card.children.center = temp_blind
		temp_blind:set_role({major = card, role_type = 'Glued', draw_major = card})
		card.set_sprites = function(...)
			local args = {...}
			if not args[1].animation then return end -- fix for debug unlock
			local c = card.children.center
			Card.set_sprites(...)
			card.children.center = c
		end
		temp_blind:define_draw_steps({
			{ shader = 'dissolve', shadow_height = 0.05 },
			{ shader = 'dissolve' }
		})
		temp_blind.float = true
		card.states.collide.can = true
		card.config.blind = v
		card.config.force_focus = true
		if v.discovered and not v.alerted then
			blinds_to_be_alerted[#blinds_to_be_alerted + 1] = card
		end
		card.hover = function()
			if not G.CONTROLLER.dragging.target or G.CONTROLLER.using_touch then
				if not card.hovering and card.states.visible then
					card.hovering = true
					card.hover_tilt = 3
					card:juice_up(0.05, 0.02)
					play_sound('chips1', math.random() * 0.1 + 0.55, 0.12)
					card.config.h_popup = create_UIBox_blind_popup(v, card.config.blind.discovered)
					card.config.h_popup_config = card:align_h_popup()
					Node.hover(card)
					if card.children.alert then
						card.children.alert:remove()
						card.children.alert = nil
						card.config.blind.alerted = true
						G:save_progress()
					end
				end
			end
			card.stop_hover = function()
				card.hovering = false; Node.stop_hover(card); card.hover_tilt = 0
			end
		end
		G.your_collection[row]:emplace(card)
		col = col + 1
		if col > cols then col = 1; row = row + 1 end
	end

	G.E_MANAGER:add_event(Event({
		trigger = 'immediate',
		func = (function()
			for _, v in ipairs(blinds_to_be_alerted) do
				v.children.alert = UIBox {
					definition = create_UIBox_card_alert(),
					config = { align = "tri", offset = { x = 0.1, y = 0.1 }, parent = v }
				}
				v.children.alert.states.collide.can = false
			end
			return true
		end)
	}))

	local page_options = {}
	for i = 1, math.ceil(blinds_amt/(rows*cols)) do
		table.insert(page_options, localize('k_page')..' '..tostring(i)..'/'..tostring(math.ceil(blinds_amt/(rows*cols))))
	end

	local extras = nil
    local t = create_UIBox_generic_options({
		colour = G.ACTIVE_MOD_UI and ((G.ACTIVE_MOD_UI.ui_config or {}).collection_colour or
            (G.ACTIVE_MOD_UI.ui_config or {}).colour) or nil,
        bg_colour = G.ACTIVE_MOD_UI and ((G.ACTIVE_MOD_UI.ui_config or {}).collection_bg_colour or
            (G.ACTIVE_MOD_UI.ui_config or {}).bg_colour) or nil,
        back_colour = G.ACTIVE_MOD_UI and ((G.ACTIVE_MOD_UI.ui_config or {}).collection_back_colour or
            (G.ACTIVE_MOD_UI.ui_config or {}).back_colour) or nil,
		back_func = G.ACTIVE_MOD_UI and "openModUI_"..G.ACTIVE_MOD_UI.id or exit or 'blindside_collection',
		contents = {
			{
				n = G.UIT.C,
				config = { align = "cm", r = 0.1, colour = G.C.BLACK, padding = 0.1, emboss = 0.05 },
				nodes = {
					{
						n = G.UIT.C,
						config = { align = "cm", r = 0.1, colour = G.C.L_BLACK, padding = 0.1, force_focus = true, focus_args = { nav = 'tall' } },
						nodes = {
							{
								n = G.UIT.R,
								config = { align = "cm", padding = 0.05 },
								nodes = {
									{
										n = G.UIT.C,
										config = { align = "cm", minw = 0.7 },
										nodes = {
											{ n = G.UIT.T, config = { text = localize('k_ante_cap'), scale = 0.4, colour = lighten(G.C.FILTER, 0.2), shadow = true } },
										}
									},
									{
										n = G.UIT.C,
										config = { align = "cr", minw = 2.8 },
										nodes = {
											{ n = G.UIT.T, config = { text = localize('k_base_cap'), scale = 0.4, colour = lighten(G.C.RED, 0.2), shadow = true } },
										}
									}
								}
							},
							{ n = G.UIT.R, config = { align = "cm" }, nodes = ante_amounts }
						}
					},
					{
						n = G.UIT.C,
						config = { align = 'cm' },
						nodes = {
							{
								n = G.UIT.R,
								config = { align = 'cm', padding = 0.15 },
								nodes = {}
							},
							{
								n= G.UIT.R,
								config = {align = 'cm' },
								nodes = {
									{
										n = G.UIT.C,
										config = {
											align = 'cm',
										},
										nodes = deck_tables,
									}
								}
							},
							{
								n = G.UIT.R,
								config = { align = 'cm', padding = 0.1 },
								nodes = {}
							},
							create_option_cycle({
								options = page_options,
								w = 4.5,
								cycle_shoulders = true,
								opt_callback = 'your_collection_blindjokers_page',
								focus_args = {snap_to = true, nav = 'wide'},
								current_option = page,
								colour = G.ACTIVE_MOD_UI and (G.ACTIVE_MOD_UI.ui_config or {}).collection_option_cycle_colour or G.C.RED,
								no_pips = true
							})
						},
					},
				}
			}
		}
	})
	return t
end

function G.FUNCS.your_collection_blindjokers_page(args)
	if not args or not args.cycle_config then return end
	for j = 1, #G.your_collection do
		for i = #G.your_collection[j].cards, 1, -1 do
			local c = G.your_collection[j]:remove_card(G.your_collection[j].cards[i])
			c:remove()
			c = nil
		end
	end

	local cols = 5
	local rows = 6
	local page = args.cycle_config.current_option
    local blindjokers = {}
    for k, v in pairs(G.P_BLINDS) do
        if BLINDSIDE.is_blindside(v.key) and not BLINDSIDE.is_dupe(v.key) then
            table.insert(blindjokers, v)
        end
    end

	local blind_tab = SMODS.collection_pool(blindjokers)
    table.sort(blind_tab, function(a, b) return a.order + (a.boss and a.boss.showdown and 1000 or 0) < b.order + (b.boss and b.boss.showdown and 1000 or 0) end)

	local this_page = {}
	for i, v in ipairs(blind_tab) do
		if i > rows*cols*(page-1) and i <= rows*cols*page then
			table.insert(this_page, v)
		elseif i > rows*cols*page then
			break
		end
	end
	blind_tab = this_page

	local blinds_to_be_alerted = {}
	local row, col = 1, 1
	for k, v in ipairs(blind_tab) do
		local atlas_key = v.discovered and v.atlas or 'bld_joker'
		local temp_blind = SMODS.create_sprite(G.your_collection[row].T.x + G.your_collection[row].T.w/2, G.your_collection[row].T.y, 1.3, 1.3, atlas_key, v.discovered and v.pos or G.blindside_joker_undiscovered.pos)
		temp_blind.states.click.can = false
		temp_blind.states.drag.can = false
		temp_blind.states.hover.can = true
		local card = Card(G.your_collection[row].T.x + G.your_collection[row].T.w/2, G.your_collection[row].T.y, 1.3, 1.3, G.P_CARDS.empty, G.P_CENTERS.c_base)
		temp_blind.states.click.can = false
		card.states.drag.can = false
		card.states.hover.can = true
		card.children.center = temp_blind
		temp_blind:set_role({major = card, role_type = 'Glued', draw_major = card})
		card.set_sprites = function(...)
			local args = {...}
			if not args[1].animation then return end -- fix for debug unlock
			local c = card.children.center
			Card.set_sprites(...)
			card.children.center = c
		end
		temp_blind:define_draw_steps({
			{ shader = 'dissolve', shadow_height = 0.05 },
			{ shader = 'dissolve' }
		})
		temp_blind.float = true
		card.states.collide.can = true
		card.config.blind = v
		card.config.force_focus = true
		if v.discovered and not v.alerted then
			blinds_to_be_alerted[#blinds_to_be_alerted + 1] = card
		end
		card.hover = function()
			if not G.CONTROLLER.dragging.target or G.CONTROLLER.using_touch then
				if not card.hovering and card.states.visible then
					card.hovering = true
					card.hover_tilt = 3
					card:juice_up(0.05, 0.02)
					play_sound('chips1', math.random() * 0.1 + 0.55, 0.12)
					card.config.h_popup = create_UIBox_blind_popup(v, card.config.blind.discovered)
					card.config.h_popup_config = card:align_h_popup()
					Node.hover(card)
					if card.children.alert then
						card.children.alert:remove()
						card.children.alert = nil
						card.config.blind.alerted = true
						G:save_progress()
					end
				end
			end
			card.stop_hover = function()
				card.hovering = false; Node.stop_hover(card); card.hover_tilt = 0
			end
		end
		G.your_collection[row]:emplace(card)
		col = col + 1
		if col > cols then col = 1; row = row + 1 end
	end
	G.E_MANAGER:add_event(Event({
		trigger = 'immediate',
		func = (function()
			for _, v in ipairs(blinds_to_be_alerted) do
			  v.children.alert = UIBox{
				definition = create_UIBox_card_alert(),
				config = { align="tri", offset = {x = 0.1, y = 0.1}, parent = v}
			  }
			  v.children.alert.states.collide.can = false
			end
			return true
		end)
	}))
end

function blind_decks_ui()
    local deck_pool = {}
    for k, v in pairs(G.P_CENTER_POOLS.Back) do
        if BLINDSIDE.is_blindside(v.key) then
            table.insert(deck_pool, v)
        end
    end
  G.GAME.viewed_back = Back(deck_pool[1])
  
  local area = CardArea(
    G.ROOM.T.x + 0.2*G.ROOM.T.w/2,G.ROOM.T.h,
    1.2*G.CARD_W,
    1.2*G.CARD_H, 
    {card_limit = 20, type = 'deck', highlight_limit = 0})

  for i = 1, 20 do
    local card = Card(G.ROOM.T.x + 0.2*G.ROOM.T.w/2,G.ROOM.T.h, G.CARD_W*1.2, G.CARD_H*1.2, pseudorandom_element(G.P_CARDS), G.P_CENTERS.c_base, {playing_card = i, viewed_back = true})
    card.sprite_facing = 'back'
    card.facing = 'back'
    area:emplace(card)
    if i == 20 then G.sticker_card = card; card.sticker = get_deck_win_sticker(G.GAME.viewed_back.effect.center) end
  end

  local ordered_names = {}
  for k, v in ipairs(deck_pool) do
      ordered_names[#ordered_names+1] = v.key
  end
  
  local t = create_UIBox_generic_options({ 
  colour = G.ACTIVE_MOD_UI and ((G.ACTIVE_MOD_UI.ui_config or {}).collection_colour or
      (G.ACTIVE_MOD_UI.ui_config or {}).colour),
  bg_colour = G.ACTIVE_MOD_UI and ((G.ACTIVE_MOD_UI.ui_config or {}).collection_bg_colour or
      (G.ACTIVE_MOD_UI.ui_config or {}).bg_colour),
  back_colour = G.ACTIVE_MOD_UI and ((G.ACTIVE_MOD_UI.ui_config or {}).collection_back_colour or
      (G.ACTIVE_MOD_UI.ui_config or {}).back_colour),
  outline_colour = G.ACTIVE_MOD_UI and ((G.ACTIVE_MOD_UI.ui_config or {}).collection_outline_colour or
      (G.ACTIVE_MOD_UI.ui_config or {}).outline_colour),
  back_func = G.ACTIVE_MOD_UI and "openModUI_"..G.ACTIVE_MOD_UI.id or 'blindside_collection', contents = {
    create_option_cycle({options = ordered_names, opt_callback = 'change_viewed_blindback', current_option = 1, colour = G.ACTIVE_MOD_UI and (G.ACTIVE_MOD_UI.ui_config or {}).collection_option_cycle_colour or G.C.RED, w = 4.5, focus_args = {snap_to = true}, mid = 
            {n=G.UIT.R, config={align = "cm", minw = 2.5, padding = 0.1, r = 0.1, colour = G.C.BLACK, emboss = 0.05}, nodes={
              {n=G.UIT.R, config={align = "cm", padding = 0.2, colour = G.C.BLACK, r = 0.2}, nodes={
                {n=G.UIT.C, config={align = "cm", padding = 0}, nodes={
                  {n=G.UIT.O, config={object = area}}
                }},
                {n=G.UIT.C, config={align = "tm", minw = 3.7, minh = 2.1, r = 0.1, colour = G.C.L_BLACK, padding = 0.1}, nodes={
                  {n=G.UIT.R, config={align = "cm", emboss = 0.1, r = 0.1, minw = 4, maxw = 4, minh = 0.6}, nodes={
                    {n=G.UIT.O, config={id = nil, func = 'RUN_SETUP_check_back_name', object = Moveable()}},
                  }},
                  {n=G.UIT.R, config={align = "cm", colour = G.C.WHITE, emboss = 0.1, minh = 2.2, r = 0.1}, nodes={
                    {n=G.UIT.O, config={id = G.GAME.viewed_back.name, func = 'RUN_SETUP_check_back', object = UIBox{definition = G.GAME.viewed_back:generate_UI(), config = {offset = {x=0,y=0}}}}}
                  }}       
                }},
              }},
            }}}),
          }})
  return t
end


G.FUNCS.change_viewed_blindback = function(args)
  G.viewed_stake = G.viewed_stake or 1
    local deck_pool = {}
    for k, v in pairs(G.P_CENTER_POOLS.Back) do
        if BLINDSIDE.is_blindside(v.key) then
            table.insert(deck_pool, v)
        end
    end
  G.GAME.viewed_back:change_to(deck_pool[args.to_key])
  if G.sticker_card then G.sticker_card.sticker = get_deck_win_sticker(G.GAME.viewed_back.effect.center) end
  -- local max_stake = get_deck_win_stake(G.GAME.viewed_back.effect.center.key) or 0
  -- G.viewed_stake = math.min(G.viewed_stake, max_stake + 1)
  G.PROFILES[G.SETTINGS.profile].MEMORY.deck = args.to_val
  for key, val in pairs(G.sticker_card.area.cards) do
  	val.children.back = false
  	val:set_ability(val.config.center, true)
  end
end

function blindtags_ui()
    local tag_matrix = {}
    local counter = 0
    local tag_tab = {}
    local tag_pool = {}
    for k, v in pairs(G.P_TAGS) do
        if BLINDSIDE.is_blindside(v.key) and not BLINDSIDE.is_relic(v.key) then tag_pool[k] = v end
    end
    for k, v in pairs(tag_pool) do
        counter = counter + 1
        tag_tab[#tag_tab+1] = v
    end
    for i = 1, math.ceil(counter / 6) do
        table.insert(tag_matrix, {})
    end
	table.sort(tag_tab, function(a, b) return a.order < b.order end)
    local tags_to_be_alerted = {}
    for k, v in ipairs(tag_tab) do
        local discovered = v.discovered
        local temp_tag = Tag(v.key, true)
        if not v.discovered then temp_tag.hide_ability = true end
        local temp_tag_ui, temp_tag_sprite = temp_tag:generate_UI()
        tag_matrix[math.ceil((k-1)/6+0.001)][1+((k-1)%6)] = {n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
        temp_tag_ui,
        }}
        if discovered and not v.alerted then 
        tags_to_be_alerted[#tags_to_be_alerted+1] = temp_tag_sprite
        end
    end

    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = (function()
            for _, v in ipairs(tags_to_be_alerted) do
            v.children.alert = UIBox{
                definition = create_UIBox_card_alert(), 
                config = { align="tri", offset = {x = 0.1, y = 0.1}, parent = v}
            }
            v.children.alert.states.collide.can = false
            end
            return true
        end)
    }))


            local table_nodes = {}
            for i = 1, math.ceil(counter / 6) do
                table.insert(table_nodes, {n=G.UIT.R, config={align = "cm"}, nodes=tag_matrix[i]})
            end  local t = create_UIBox_generic_options({ 
    colour = G.ACTIVE_MOD_UI and ((G.ACTIVE_MOD_UI.ui_config or {}).collection_colour or
        (G.ACTIVE_MOD_UI.ui_config or {}).colour),
    bg_colour = G.ACTIVE_MOD_UI and ((G.ACTIVE_MOD_UI.ui_config or {}).collection_bg_colour or
        (G.ACTIVE_MOD_UI.ui_config or {}).bg_colour),
    back_colour = G.ACTIVE_MOD_UI and ((G.ACTIVE_MOD_UI.ui_config or {}).collection_back_colour or
        (G.ACTIVE_MOD_UI.ui_config or {}).back_colour),
    outline_colour = G.ACTIVE_MOD_UI and ((G.ACTIVE_MOD_UI.ui_config or {}).collection_outline_colour or
        (G.ACTIVE_MOD_UI.ui_config or {}).outline_colour),
    back_func = 'blindside_collection', contents = {
        {n=G.UIT.C, config={align = "cm", r = 0.1, colour = G.C.BLACK, padding = 0.1, emboss = 0.05}, nodes={
        {n=G.UIT.C, config={align = "cm"}, nodes={
            {n=G.UIT.R, config={align = "cm"}, nodes=table_nodes}
        }} 
        }}  
    }})
    return t
end

    G.FUNCS.your_collection_blindside_blindcards = function()
        G.SETTINGS.paused = true
        G.FUNCS.overlay_menu {
        definition = blindcards_ui()
        }
    end

    G.FUNCS.your_collection_blindside_blindtags = function()
        G.SETTINGS.paused = true
        G.FUNCS.overlay_menu {
        definition = blindtags_ui()
        }
    end

    G.FUNCS.your_collection_blindside_filmcards = function()
        G.SETTINGS.paused = true
        G.FUNCS.overlay_menu {
        definition = filmcards_ui()
        }
    end

    G.FUNCS.your_collection_blindside_rituals = function()
        G.SETTINGS.paused = true
        G.FUNCS.overlay_menu {
        definition = rituals_ui()
        }
    end

    G.FUNCS.your_collection_blindside_runes = function()
        G.SETTINGS.paused = true
        G.FUNCS.overlay_menu {
        definition = runes_ui()
        }
    end
    G.FUNCS.your_collection_blindside_minerals = function()
        G.SETTINGS.paused = true
        G.FUNCS.overlay_menu {
        definition = minerals_ui()
        }
    end
    
    G.FUNCS.your_collection_blindside_boosters = function()
        G.SETTINGS.paused = true
        G.FUNCS.overlay_menu {
        definition = blindboosters_ui()
        }
    end
    
    G.FUNCS.your_collection_blindside_relics = function()
        G.SETTINGS.paused = true
        G.FUNCS.overlay_menu {
        definition = blindrelics_ui()
        }
    end

    G.FUNCS.your_collection_blindside_editions = function()
        G.SETTINGS.paused = true
        G.FUNCS.overlay_menu {
        definition = blindedition_ui()
        }
    end
    
    G.FUNCS.your_collection_blindside_trinkets = function()
        G.SETTINGS.paused = true
        G.FUNCS.overlay_menu {
        definition = blindtrinkets_ui()
        }
    end

    G.FUNCS.your_collection_blindside_enhance = function()
        G.SETTINGS.paused = true
        G.FUNCS.overlay_menu {
        definition = blindenhance_ui()
        }
    end

    G.FUNCS.your_collection_blindside_jokers = function()
        G.SETTINGS.paused = true
        G.FUNCS.overlay_menu {
        definition = blind_jokers_ui()
        }
    end

    G.FUNCS.your_collection_blindside_decks = function()
        G.SETTINGS.paused = true
        G.FUNCS.overlay_menu {
        definition = blind_decks_ui()
        }
    end
        
        local function wrap_without_blindcards(func)
        local removed = {}
        for k, v in pairs(G.P_CENTER_POOLS.Enhanced) do
        if BLINDSIDE.is_blindside(v.key) then
            removed[k] = v
            G.P_CENTER_POOLS.Enhanced[k] = nil
        end
        end
        G.P_CENTER_POOLS.Enhanced = remove_nils(G.P_CENTER_POOLS.Enhanced)

        local ret = func()

        for k, v in pairs(removed) do
            table.insert(G.P_CENTER_POOLS.Enhanced,v)
        end

        return ret
    end

    local function wrap_without_blindedition(func)
        local removed = {}
        for k, v in pairs(G.P_CENTER_POOLS.Edition) do
        if BLINDSIDE.is_blindside(v.key) then
            removed[k] = v
            G.P_CENTER_POOLS.Edition[k] = nil
        end
        end
        G.P_CENTER_POOLS.Edition = remove_nils(G.P_CENTER_POOLS.Edition)

        local ret = func()

        for k, v in pairs(removed) do
            table.insert(G.P_CENTER_POOLS.Edition,v)
        end

        return ret
    end

    local function wrap_without_blindenhancement(func)
        local removed = {}
        for k, v in pairs(G.P_CENTER_POOLS.Seal) do
        if BLINDSIDE.is_blindside(v.key) then
            removed[k] = v
            G.P_CENTER_POOLS.Seal[k] = nil
        end
        end
        G.P_CENTER_POOLS.Seal = remove_nils(G.P_CENTER_POOLS.Seal)

        local ret = func()

        for k, v in pairs(removed) do
            table.insert(G.P_CENTER_POOLS.Seal,v)
        end

        return ret
    end
    
    local function wrap_without_blindboosters(func)
        local removed = {}
        local initialnum = 0
        for k, v in pairs(G.P_CENTER_POOLS.Booster) do
        initialnum = k
        if BLINDSIDE.is_blindside(v.key) then
            removed[k] = v
            G.P_CENTER_POOLS.Booster[k] = nil
        end
        end
        G.P_CENTER_POOLS.Booster = remove_nils(G.P_CENTER_POOLS.Booster)

        local ret = func()

        for k, v in pairs(removed) do
            table.insert(G.P_CENTER_POOLS.Booster,v)
        end

        return ret
    end

    local function wrap_without_blindtrinkets(func)
        local removed = {}
        for k, v in pairs(G.P_CENTER_POOLS.Joker) do
        if BLINDSIDE.is_blindside(v.key) then
            removed[k] = v
            G.P_CENTER_POOLS.Joker[k] = nil
        end
        end
        G.P_CENTER_POOLS.Joker = remove_nils(G.P_CENTER_POOLS.Joker)

        local ret = func()

        for k, v in pairs(removed) do
            table.insert(G.P_CENTER_POOLS.Joker,v)
        end

        return ret
    end

    local function wrap_without_blindjokers(func)
        local removed = {}
        for k, v in pairs(G.P_BLINDS) do
        if BLINDSIDE.is_blindside(v.key) then
            removed[k] = v
            G.P_BLINDS[k] = nil
        end
        end
        local ret = func()

        for k, v in pairs(removed) do
        G.P_BLINDS[k] = v
        end
        return ret
    end
    
    local function wrap_without_blindjokerspage(func,args)
        local removed = {}
        for k, v in pairs(G.P_BLINDS) do
        if BLINDSIDE.is_blindside(v.key) then
            removed[k] = v
            G.P_BLINDS[k] = nil
        end
        end
        local ret = func(args)

        for k, v in pairs(removed) do
        G.P_BLINDS[k] = v
        end
        return ret
    end
    
    local function wrap_without_blindtags(func, page)
        local removed = {}
        for k, v in pairs(G.P_TAGS) do
        if BLINDSIDE.is_blindside(v.key) then
            removed[k] = v
            G.P_TAGS[k] = nil
        end
        end
        local ret = func(page)

        for k, v in pairs(removed) do
        G.P_TAGS[k] = v
        end
        return ret
    end

    local function wrap_without_blinddeck(func)
        local removed = {}
        for k, v in pairs(G.P_CENTER_POOLS.Back) do
        if BLINDSIDE.is_blindside(v.key) then
            removed[k] = v
            G.P_CENTER_POOLS.Back[k] = nil
        end
        end
        G.P_CENTER_POOLS.Back = remove_nils(G.P_CENTER_POOLS.Back)
        local ret = func()

        for k, v in pairs(removed) do
            table.insert(G.P_CENTER_POOLS.Back,v)
        end
        return ret
    end
    
    local function wrap_without_blindpricetags(func)
        local removed = {}
        for k, v in pairs(G.P_CENTER_POOLS.Voucher) do
        if BLINDSIDE.is_blindside(v.key) then
            removed[k] = v
            G.P_CENTER_POOLS.Voucher[k] = nil
        end
        end
        G.P_CENTER_POOLS.Voucher = remove_nils(G.P_CENTER_POOLS.Voucher)
        local ret = func()

        for k, v in pairs(removed) do
            table.insert(G.P_CENTER_POOLS.Voucher,v)
        end
        return ret
    end

    local booster_ui_ref = create_UIBox_your_collection_boosters
    create_UIBox_your_collection_boosters = function()
        return wrap_without_blindboosters(booster_ui_ref)
    end

    local editions_ui_ref = create_UIBox_your_collection_editions
    create_UIBox_your_collection_editions = function()
        return wrap_without_blindedition(editions_ui_ref)
    end

    local enhancements_ui_ref = create_UIBox_your_collection_enhancements
    create_UIBox_your_collection_enhancements = function()
        return wrap_without_blindcards(enhancements_ui_ref)
    end

    local blinds_ui_ref = create_UIBox_your_collection_blinds
    create_UIBox_your_collection_blinds = function()
        return wrap_without_blindjokers(blinds_ui_ref)
    end
    
    local blinds_page_ref = G.FUNCS.your_collection_blinds_page
    function G.FUNCS.your_collection_blinds_page(args)
        return wrap_without_blindjokerspage(blinds_page_ref,args)
    end
    
    local joker_ui_ref = create_UIBox_your_collection_jokers
    create_UIBox_your_collection_jokers = function()
        return wrap_without_blindtrinkets(joker_ui_ref)
    end

    local tag_ui_ref = create_UIBox_your_collection_tags_content
    create_UIBox_your_collection_tags_content = function(page)
        return wrap_without_blindtags(tag_ui_ref, page)
    end
    
    local joker_ui_seal = create_UIBox_your_collection_seals
    create_UIBox_your_collection_seals = function()
        return wrap_without_blindenhancement(joker_ui_seal)
    end

    local deck_ui_ref = create_UIBox_your_collection_decks
    create_UIBox_your_collection_decks = function()
        return wrap_without_blinddeck(deck_ui_ref)
    end

    local voucher_ui_ref = create_UIBox_your_collection_vouchers
    create_UIBox_your_collection_vouchers = function()
        return wrap_without_blindpricetags(voucher_ui_ref)
    end

    function Card:get_blind_nominal(mod)
    local mult = 1
    local color_table = {
        ['Red'] = 1,
        ['Yellow'] = 2,
        ['Green'] = 3,
        ['Blue'] = 4,
        ['Purple'] = 5,
        ['Faded'] = 6
    }
    if mod == 'color' then mult = 1000 end
    return self.config.center.config.extra.value + color_table[self.config.center.config.extra.hues[1]]*mult + 0.000001*self.unique_val
    end


    local UIDEF_REF = G.UIDEF.view_deck
    function G.UIDEF.view_deck(unplayed_only)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return UIDEF_REF(unplayed_only) end
        local deck_tables = {}
        remove_nils(G.playing_cards)
        G.VIEWING_DECK = true
        table.sort(G.playing_cards, function (a, b) return a:get_blind_nominal('color') > b:get_blind_nominal('color') end )
        local SUITS = {
            Red = {},
            Yellow = {},
            Green = {},
            Blue = {},
            Purple = {},
            Faded = {},
        }
        local suit_map = {'Red', 'Yellow', 'Green', 'Blue', 'Purple', 'Faded'}
        for k, v in ipairs(G.playing_cards) do
            table.insert(SUITS[v.config.center.config.extra.hues[1]], v)
        end
        for j = 1, 6 do
            if SUITS[suit_map[j]][1] then
            local view_deck = CardArea(
                G.ROOM.T.x + 0.2*G.ROOM.T.w/2,G.ROOM.T.h*0.2,
                6.5*G.CARD_W,
                0.4*G.CARD_H,
                {card_limit = #SUITS[suit_map[j]], type = 'title', view_deck = true, highlight_limit = 0, card_w = G.CARD_W*0.7, draw_layers = {'card'}, 
						negative_info = 'playing_card'})
            table.insert(deck_tables, 
            {n=G.UIT.R, config={align = "cm", padding = 0}, nodes={
                {n=G.UIT.O, config={object = view_deck}}
            }}
            )

            for i = 1, #SUITS[suit_map[j]] do
                if SUITS[suit_map[j]][i] then
                local greyed, _scale = nil, 0.7
                if unplayed_only and not ((SUITS[suit_map[j]][i].area and SUITS[suit_map[j]][i].area == G.deck)) then
                    greyed = true
                end
                local copy = copy_card(SUITS[suit_map[j]][i], nil, _scale)
                copy.greyed = greyed
                copy.T.x = view_deck.T.x + view_deck.T.w/2
                copy.T.y = view_deck.T.y

                copy:hard_set_T()
                view_deck:emplace(copy)
                end
            end
            end
        end

        local flip_col = G.C.WHITE

        local suit_tallies = {['Red']  = 0, ['Green'] = 0, ['Blue'] = 0, ['Yellow'] = 0, ['Purple'] = 0, ['Faded'] = 0}
        local mod_suit_tallies = {['Red']  = 0, ['Green'] = 0, ['Blue'] = 0, ['Yellow'] = 0, ['Purple'] = 0, ['Faded'] = 0}

        for k, v in ipairs(G.playing_cards) do
            if v.ability.name ~= 'Stone Card' and (not unplayed_only or ((v.area and v.area == G.deck))) then 
            --For the suits
            suit_tallies[v.config.center.config.extra.hues[1]] = (suit_tallies[v.config.center.config.extra.hues[1]] or 0) + 1
            mod_suit_tallies['Red'] = (mod_suit_tallies['Red'] or 0) + (v:is_color('Red') and 1 or 0)
            mod_suit_tallies['Green'] = (mod_suit_tallies['Green'] or 0) + (v:is_color('Green') and 1 or 0)
            mod_suit_tallies['Blue'] = (mod_suit_tallies['Blue'] or 0) + (v:is_color('Blue') and 1 or 0)
            mod_suit_tallies['Yellow'] = (mod_suit_tallies['Yellow'] or 0) + (v:is_color('Yellow') and 1 or 0)
            mod_suit_tallies['Purple'] = (mod_suit_tallies['Purple'] or 0) + (v:is_color('Purple') and 1 or 0)
            mod_suit_tallies['Faded'] = (mod_suit_tallies['Faded'] or 0) + (v:is_color('Faded') and 1 or 0)
            end
        end

        local t = 
        {n=G.UIT.ROOT, config={align = "cm", colour = G.C.CLEAR}, nodes={
            {n=G.UIT.R, config={align = "cm", padding = 0.05}, nodes={}},
            {n=G.UIT.R, config={align = "cm"}, nodes={
            {n=G.UIT.C, config={align = "cm", minw = 1.5, minh = 2, r = 0.1, colour = G.C.BLACK, emboss = 0.05}, nodes={
                {n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
                {n=G.UIT.R, config={align = "cm", r = 0.1, colour = G.C.L_BLACK, emboss = 0.05, padding = 0.15}, nodes={
                    {n=G.UIT.R, config={align = "cm"}, nodes={
                    {n=G.UIT.O, config={object = DynaText({string = G.GAME.selected_back.loc_name, colours = {G.C.WHITE}, bump = true, rotate = true, shadow = true, scale = 0.6 - string.len(G.GAME.selected_back.loc_name)*0.01})}},
                    }},
                    {n=G.UIT.R, config={align = "cm", r = 0.1, padding = 0.1, minw = 2.5, minh = 1.3, colour = G.C.WHITE, emboss = 0.05}, nodes={
                    {n=G.UIT.O, config={object = UIBox{
                        definition = G.GAME.selected_back:generate_UI(nil,0.7, 0.5, G.GAME.challenge),
                        config = {offset = {x=0,y=0}}
                    }}}
                    }}
                }},
                {n=G.UIT.R, config={align = "cm", r = 0.1, outline_colour = G.C.L_BLACK, line_emboss = 0.05, outline = 1.5}, nodes={
                    {n=G.UIT.R, config={align = "cm", minh = 0.05, padding = 0.07}, nodes={
                        {n=G.UIT.O, config={object = DynaText({string = {{string = localize('k_base_blinds'), colour = G.C.RED}, modded and {string = localize('k_effective'), colour = G.C.BLUE} or nil}, colours = {G.C.RED}, silent = true,scale = 0.4,pop_in_rate = 10, pop_delay = 4})}}
                    }},
                    {n=G.UIT.R, config={align = "cm", minh = 0.05, padding = 0.1}, nodes={
                    tally_sprite({x=0,y=0}, {{string = ''..suit_tallies['Red'], colour = flip_col},{string =''..mod_suit_tallies['Red'], colour = G.C.BLUE}}, {localize('bld_Red', 'suits_plural')}, "bld_Red"),
                    tally_sprite({x=2,y=0}, {{string = ''..suit_tallies['Yellow'], colour = flip_col},{string =''..mod_suit_tallies['Yellow'], colour = G.C.BLUE}}, {localize('bld_Yellow', 'suits_plural')}, "bld_Yellow"),
                    }},
                    {n=G.UIT.R, config={align = "cm", minh = 0.05, padding = 0.1}, nodes={
                    tally_sprite({x=3,y=0}, {{string = ''..suit_tallies['Green'], colour = flip_col},{string =''..mod_suit_tallies['Green'], colour = G.C.BLUE}}, {localize('bld_Green', 'suits_plural')}, "bld_Green"),
                    tally_sprite({x=1,y=0}, {{string = ''..suit_tallies['Blue'], colour = flip_col},{string =''..mod_suit_tallies['Blue'], colour = G.C.BLUE}}, {localize('bld_Blue', 'suits_plural')}, "bld_Blue"),
                    }},
                    {n=G.UIT.R, config={align = "cm", minh = 0.05, padding = 0.1}, nodes={
                    tally_sprite({x=0,y=1}, {{string = ''..suit_tallies['Purple'], colour = flip_col},{string =''..mod_suit_tallies['Purple'], colour = G.C.BLUE}}, {localize('bld_Purple', 'suits_plural')}, "bld_Purple"),
                    tally_sprite({x=1,y=1}, {{string = ''..suit_tallies['Faded'], colour = flip_col},{string =''..mod_suit_tallies['Faded'], colour = G.C.BLUE}}, {localize('bld_Faded', 'suits_plural')}, "bld_Faded"),
                    }},
                }}
                }},
            }},
            {n=G.UIT.B, config={w = 0.2, h = 0.1}},
            {n=G.UIT.C, config={align = "cm", padding = 0.1, r = 0.1, colour = G.C.BLACK, emboss = 0.05}, nodes=deck_tables}
            }},
            {n=G.UIT.R, config={align = "cm", minh = 0.8, padding = 0.05}, nodes={
            modded and {n=G.UIT.R, config={align = "cm"}, nodes={
                {n=G.UIT.C, config={padding = 0.3, r = 0.1, colour = mix_colours(G.C.BLUE, G.C.WHITE,0.7)}, nodes = {}},
                {n=G.UIT.T, config={text =' '..localize('ph_deck_preview_effective'),colour = G.C.WHITE, scale =0.3}},
            }} or nil,
            }}
        }}
        return t
    else
        return UIDEF_REF(unplayed_only)
    end
    end
    
    local UIDEF_PREV_REF = G.UIDEF.deck_preview
function G.UIDEF.deck_preview(args)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return UIDEF_PREV_REF(args) end
	local _minh, _minw = 0.35, 0.5
	local suit_labels = {}
	local suit_counts = { bld_Red = 0, bld_Green = 0, bld_Blue = 0, bld_Yellow = 0, bld_Purple = 0, bld_Faded = 0}
	local wheel_flipped, wheel_flipped_text = 0, nil
	local flip_col = G.C.WHITE
	local deck_tables = {}
	remove_nils(G.playing_cards)
    table.sort(G.playing_cards, function (a, b) return a:get_blind_nominal('color') > b:get_blind_nominal('color') end )
	local SUITS = {
            Red = {},
            Green = {},
            Blue = {},
            Yellow = {},
            Purple = {},
            Faded = {},
        }
	for _, suit in ipairs(SMODS.Suit.obj_buffer) do
		SUITS[suit] = {}
			SUITS[suit][1] = {}
	end
	local stones = nil
        local suit_map = {'bld_Red', 'bld_Green', 'bld_Blue', 'bld_Yellow', 'bld_Purple', 'bld_Faded'}
	for k, v in ipairs(G.playing_cards) do
		if v.ability.effect == 'Stone Card' then
			stones = stones or 0
		end
		if (v.area and v.area == G.deck) or v.ability.wheel_flipped then
			if v.ability.wheel_flipped and not (v.area and v.area == G.deck) then wheel_flipped = wheel_flipped + 1 end
			if v.ability.effect == 'Stone Card' then
				stones = stones + 1
			end
			for kk, vv in pairs(suit_counts) do
				if v:is_color(kk) then suit_counts[kk] = suit_counts[kk] + 1 end
			end
			if SUITS[v:get_color()][1] then
				table.insert(SUITS[v:get_color()][1], v)
			end
		end
	end

	wheel_flipped_text = (wheel_flipped > 0) and
		{n = G.UIT.T, config = {text = '?', colour = G.C.FILTER, scale = 0.25, shadow = true}}
	or nil
	flip_col = wheel_flipped_text and mix_colours(G.C.FILTER, G.C.WHITE, 0.7) or G.C.WHITE
	local _row = {}
	table.insert(deck_tables, {n = G.UIT.R, config = {align = "cm", padding = 0.04 }, nodes = _row })

	for k, v in ipairs(suit_map) do
    local _x = (v == 'bld_Red' and 3) or (v == 'bld_Green' and 0) or (v == 'bld_Blue' and 2) or (v == 'bld_Yellow' and 1) or (v == 'bld_Purple' and 4) or (v == 'bld_Faded' and 5)t_s = Sprite(0, 0, 0.3, 0.3,
	G.ASSET_ATLAS[SMODS.Suits[v][G.SETTINGS.colour_palettes[v] == 'hc' and "hc_ui_atlas" or G.SETTINGS.colour_palettes[v] == 'lc' and "lc_ui_atlas"]] or
	G.ASSET_ATLAS[("ui_" .. (G.SETTINGS.colourblind_option and "2" or "1"))], SMODS.Suits[v].ui_pos)
    t_s.states.drag.can = false
    t_s.states.hover.can = false
    t_s.states.collide.can = false

    suit_labels[#suit_labels+1] = 
    {n=G.UIT.R, config={align = "cm", r = 0.1, padding = 0.03, colour = G.C.JOKER_GREY}, nodes={
      {n=G.UIT.C, config={align = "cm", minw = _minw, minh = _minh}, nodes={
        {n=G.UIT.O, config={can_collide = false, object = t_s}}
      }},
      {n=G.UIT.C, config={align = "cm", minw = _minw*2.4, minh = _minh, colour = G.C.L_BLACK, r = 0.1}, nodes={
        {n=G.UIT.T, config={text = ''..suit_counts[v],colour = flip_col, scale =0.3, shadow = true, lang = G.LANGUAGES['en-us']}},
      }}
    }}
  end


	local t = {n = G.UIT.ROOT, config = {align = "cm", colour = G.C.JOKER_GREY, r = 0.1, emboss = 0.05, padding = 0.07}, nodes = {
		{n = G.UIT.R, config = {align = "cm", r = 0.1, emboss = 0.05, colour = G.C.BLACK, padding = 0.1}, nodes = {
                {n = G.UIT.R, config = {align = "cm", padding = 0.04 }, nodes = {
                    {n = G.UIT.T, config={text = localize('ui_bld_deck_view'),colour = G.C.WHITE, scale = 0.4}},
                },},
			{n = G.UIT.R, config = {align = "cm"}, nodes = {
				{n = G.UIT.C, config = {align = "cm", padding = 0.04}, nodes = suit_labels },}},
}}}}
	return t
else
    return UIDEF_PREV_REF(args)
end
end

GAMEUPDATE_REF = Game.update_selecting_hand
function Game:update_selecting_hand(dt)
    if G.GAME.selected_back.effect.center.config.extra and G.GAME.selected_back.effect.center.config.extra.blindside then
    if not self.deck_preview and not G.OVERLAY_MENU and (
        (self.deck and self.deck.cards[1] and self.deck.cards[1].states.collide.is and ((not self.deck.cards[1].states.drag.is) or self.CONTROLLER.HID.touch) and (not self.CONTROLLER.HID.controller)) or 
        G.CONTROLLER.held_buttons.triggerleft) then
        if self.buttons then
            self.buttons.states.visible = false
        end
        self.deck_preview = UIBox{
            definition = self.UIDEF.deck_preview(),
            config = {align='tr', offset = {x=0.1,y=-0.8},major = self.hand, bond = 'Weak'}
        }
        self.E_MANAGER:add_event(Event({
            blocking = false,
            blockable = false,
            func = function()
                if self.deck_preview and not (((self.deck and self.deck.cards[1] and self.deck.cards[1].states.collide.is and not self.CONTROLLER.HID.controller)) or G.CONTROLLER.held_buttons.triggerleft) then 
                    self.deck_preview:remove()
                    self.deck_preview = nil
                    local _card = G.CONTROLLER.focused.target
                    local start = G.TIMERS.REAL
                    self.E_MANAGER:add_event(Event({
                        func = function()
                            if _card and _card.area and _card.area == G.hand then
                                local _x, _y = _card:put_focused_cursor()
                                G.CONTROLLER:update_cursor({x=_x/(G.TILESCALE*G.TILESIZE),y=_y/(G.TILESCALE*G.TILESIZE)})
                            end
                            if start + 0.4 < G.TIMERS.REAL then
                                return true
                            end
                        end
                    }))
                    return true
                end
            end
        }))
    end
    if not self.buttons and not self.deck_preview then
        self.buttons = UIBox{
            definition = create_UIBox_buttons(),
            config = {align="bm", offset = {x=0,y=0.3},major = G.hand, bond = 'Weak'}
        }
    end
    if self.buttons and not self.buttons.states.visible and not self.deck_preview then
        self.buttons.states.visible = true
    end

    if #G.hand.cards < 1 and #G.deck.cards < 1 and #G.play.cards < 1 then
        end_round()
    end

    if self.shop then self.shop:remove(); self.shop = nil end
    if not G.STATE_COMPLETE then
        G.STATE_COMPLETE = true
        if #G.hand.cards < 1 and #G.deck.cards < 1 then
            end_round()
        else
            save_run()
            G.CONTROLLER:recall_cardarea_focus('hand')
        end
    end
else
return GAMEUPDATE_REF(self, dt)
end
end

G.FUNCS.your_collection = function(e)
  G.SETTINGS.paused = true
  G.FUNCS.overlay_menu{
    definition = create_UIBox_your_collection(),
  }
    local card = Card(G.Blindside_Collection.T.x, G.Blindside_Collection.T.y, G.CARD_W, G.CARD_H, G.P_CARDS.S_A, G.P_CENTERS.m_bld_flip)
    card.no_ui = true
    card.ambient_tilt = 0.0
    G.Blindside_Collection:emplace(card, nil, false)
    play_sound('button', 1, 0.3)
end

G.FUNCS.blindside_collection = function(e)
  G.SETTINGS.paused = true
  G.FUNCS.overlay_menu{
    definition = create_UIBox_blindside_collection()
  }
    local card = Card(G.Blindside_Back.T.x, G.Blindside_Back.T.y, G.CARD_W, G.CARD_H, G.P_CARDS.S_A, G.P_CENTERS.m_bld_ox)
    card.no_ui = true
    card.ambient_tilt = 0.0
    G.Blindside_Back:emplace(card, nil, false)
    play_sound('button', 1, 0.3)
end


function create_UIBox_blindside_collection()
  G.Blindside_Back = CardArea(
        0, 0,
    1.05*G.CARD_W,
    1.05*G.CARD_H, 
        {card_limit = 1, type = 'title'})
  set_discover_tallies()
  G.E_MANAGER:add_event(Event({
    blockable = false,
    func = function()
      G.REFRESH_ALERTS = true
    return true
    end
  }))
  local t = create_UIBox_generic_options({ back_func = G.STAGE == G.STAGES.RUN and 'options' or 'exit_overlay_menu', contents = {
    {n=G.UIT.C, config={align = "cm", padding = 0.15}, nodes={
        {n = G.UIT.O, config = {object = G.Blindside_Back}} or nil}},
    {n=G.UIT.C, config={align = "cm", padding = 0.15}, nodes={
      UIBox_button({button = 'your_collection_blindside_trinkets', label = {localize('bld_ui_trinkets')}, count = G.DISCOVER_TALLIES.blindtrinkets,  minw = 5, minh = 1.7, scale = 0.6, id = 'your_collection_blindside_trinkets'}),
      UIBox_button({button = 'your_collection_blindside_decks', label = {localize('bld_ui_decks')}, count = G.DISCOVER_TALLIES.blinddecks, minw = 5, id = 'your_collection_blindside_decks'}),
      UIBox_button({button = 'your_collection_blindside_relics', label = {localize('bld_ui_relics')}, count = G.DISCOVER_TALLIES.blindrelics, minw = 5, id = 'your_collection_blindside_relics'}),
      {n=G.UIT.R, config={align = "cm", padding = 0.1, r=0.2, colour = G.C.BLACK}, nodes={
        {n=G.UIT.C, config={align = "cm", maxh=2.9}, nodes={
          {n=G.UIT.T, config={text = localize('k_cap_consumables'), scale = 0.45, colour = G.C.L_BLACK, vert = true, maxh=2.2}},
        }},
        {n=G.UIT.C, config={align = "cm", padding = 0.15}, nodes={
          UIBox_button({button = 'your_collection_blindside_filmcards', count = G.DISCOVER_TALLIES.allfilmcards, label = {localize('bld_ui_filmcards')}, minw = 4, id = 'your_collection_blindside_filmcards', colour = G.C.SECONDARY_SET.bld_obj_filmcard}),
          UIBox_button({button = 'your_collection_blindside_minerals', count = G.DISCOVER_TALLIES.allminerals, label = {localize('bld_ui_minerals')}, minw = 4, id = 'your_collection_blindside_minerals', colour = G.C.SECONDARY_SET.bld_obj_mineral}),
          UIBox_button({button = 'your_collection_blindside_rituals', count = G.DISCOVER_TALLIES.allrituals, label = {localize('bld_ui_rituals')}, minw = 4, id = 'your_collection_blindside_rituals', colour = G.C.SECONDARY_SET.bld_obj_ritual}),
          UIBox_button({button = 'your_collection_blindside_runes', count = G.DISCOVER_TALLIES.allrunes, label = {localize('bld_ui_runes')}, minw = 4, id = 'your_collection_runes', colour = G.C.SECONDARY_SET.bld_obj_rune}),
        }}
      }},
    }},
    {n=G.UIT.C, config={align = "cm", padding = 0.15}, nodes={
      UIBox_button({button = 'your_collection_blindside_blindcards', count = G.DISCOVER_TALLIES.allblindcards, label = {localize('bld_ui_blindcards')}, minw = 5, minh = 1.3, id = 'your_collection_blindside_blindcards'}),
      UIBox_button({button = 'your_collection_blindside_enhance', label = {localize('bld_ui_enhance')}, minw = 5, id = 'your_collection_blindside_enhance'}),
      UIBox_button({button = 'your_collection_blindside_editions', label = {localize('bld_ui_edition')}, count = G.DISCOVER_TALLIES.blindeditions, minw = 5, id = 'your_collection_blindside_editions'}),
      UIBox_button({button = 'your_collection_blindside_boosters', label = {localize('bld_ui_boosters')}, count = G.DISCOVER_TALLIES.blindboosters, minw = 5, id = 'your_collection_blindside_boosters'}),
      UIBox_button({button = 'your_collection_blindside_blindtags', label = {localize('bld_ui_tags')}, count = G.DISCOVER_TALLIES.blindtags, minw = 5, id = 'your_collection_blindside_blindtags'}),
      UIBox_button({button = 'your_collection_blindside_jokers', label = {localize('bld_ui_jokers')}, count = G.DISCOVER_TALLIES.blindboosters, minw = 5, minh = 2.0, id = 'your_collection_blindside_jokers', focus_args = {snap_to = true}}),
    }},
  }})
  return t
end

local create_UIBox_buttons_ref = create_UIBox_buttons

function create_UIBox_buttons()
    if G.GAME.selected_back.effect.center.config.extra and G.GAME.selected_back.effect.center.config.extra.blindside then
    local text_scale = 0.45
    local button_height = 1.3
    local play_button = {n=G.UIT.C, config={id = 'play_button', align = "tm", minw = 2.5, padding = 0.3, r = 0.1, hover = true, colour = G.C.BLUE, button = "play_cards_from_highlighted", one_press = true, shadow = true, func = 'can_play'}, nodes={
      {n=G.UIT.R, config={align = "bcm", padding = 0}, nodes={
        {n=G.UIT.T, config={text = localize('b_play_hand'), scale = text_scale, colour = G.C.UI.TEXT_LIGHT, focus_args = {button = 'x', orientation = 'bm'}, func = 'set_button_pip'}}
      }},
      {n=G.UIT.R, config={align = "bcm", padding = 0}, nodes = {
          {n=G.UIT.T, config={ref_table = SMODS.hand_limit_strings, ref_value = 'play', scale = text_scale * 0.65, colour = G.C.UI.TEXT_LIGHT}}
      }},
    }}

    local discard_button = {n=G.UIT.C, config={id = 'discard_button',align = "tm", padding = 0.3, r = 0.1, minw = 2.5, minh = button_height, hover = true, colour = G.C.RED, button = "discard_cards_from_highlighted", one_press = true, shadow = true, func = 'can_discard'}, nodes={
      {n=G.UIT.R, config={align = "cm", padding = 0}, nodes={
          {n=G.UIT.T, config={text = localize('b_discard'), scale = text_scale, colour = G.C.UI.TEXT_LIGHT, focus_args = {button = 'y', orientation = 'bm'}, func = 'set_button_pip'}}
      }},
      {n=G.UIT.R, config={align = "cm", padding = 0}, nodes={
          {n=G.UIT.T, config={ref_table = SMODS.hand_limit_strings, ref_value = 'discard', scale = text_scale * 0.65, colour = G.C.UI.TEXT_LIGHT}}
      }},
    }}

    local t = {
      n=G.UIT.ROOT, config = {align = "cm", minw = 1, minh = 0.3,padding = 0.15, r = 0.1, colour = G.C.CLEAR}, nodes={
          G.SETTINGS.play_button_pos == 1 and discard_button or play_button,

          {n=G.UIT.C, config={align = "cm", padding = 0.1, r = 0.1, colour =G.C.UI.TRANSPARENT_DARK, outline = 1.5, outline_colour = mix_colours(G.C.WHITE,G.C.JOKER_GREY, 0.7), line_emboss = 1}, nodes={
            {n=G.UIT.R, config={align = "cm", padding = 0}, nodes={
              {n=G.UIT.R, config={align = "cm", padding = 0}, nodes={
                {n=G.UIT.T, config={text = localize('b_sort_hand'), scale = text_scale*0.8, colour = G.C.UI.TEXT_LIGHT}}
              }},
              {n=G.UIT.R, config={align = "cm", padding = 0.1}, nodes={
                {n=G.UIT.C, config={align = "cm", minh = 0.7, minw = 1.8, padding = 0.1, r = 0.1, hover = true, colour =G.C.ORANGE, button = "sort_hand_color", shadow = true}, nodes={
                  {n=G.UIT.T, config={text = localize('k_hue'), scale = text_scale*0.7, colour = G.C.UI.TEXT_LIGHT}}
                }},
              }}
            }}
          }},
  
          G.SETTINGS.play_button_pos == 1 and play_button or discard_button,
        }
      }
    return t
    else
        return create_UIBox_buttons_ref()
    end
  end

local generate_UIBox_ability_table_ref = Card.generate_UIBox_ability_table

function Card.generate_UIBox_ability_table(self, vars_only)
	local AUT = generate_UIBox_ability_table_ref(self, vars_only)
	if not vars_only then AUT.credits = self.config.center.credit or nil end
	return AUT
end

-- Structure copied from Handy!

if SMODS then
	local create_UIBox_mods_ref = create_UIBox_mods
	function create_UIBox_mods(...)
		if G.ACTIVE_MOD_UI and G.ACTIVE_MOD_UI == BLINDSIDE.current_mod then
            BLINDSIDE.config_opened = nil
			return G.UIDEF.blindside_mod()
		end
		return create_UIBox_mods_ref(...)
	end

	local mods_button_ref = G.FUNCS.mods_button
	function G.FUNCS.mods_button(...)
        BLINDSIDE.config_opened = nil
		return mods_button_ref(...)
	end
end

function G.UIDEF.blindside_mod()
	local tabs = BLINDSIDE.get_options_tabs()
	tabs[1].chosen = true
	local t = create_UIBox_generic_options({
		back_func = "mods_button",
		contents = {
			{
				n = G.UIT.R,
				config = { align = "cm", padding = 0 },
				nodes = {
					create_tabs({
						tabs = tabs,
						snap_to_nav = true,
						no_shoulders = true,
						colour = G.C.BOOSTER,
					}),
				},
			},
		},
	})
	return t
end

function BLINDSIDE.get_options_tabs()
	local result = {}
	for index, k in ipairs(BLINDSIDE.tabs_order) do
		table.insert(result, {
			label = localize(k, "blind_tabs"),
			tab_definition_function = function()
				return BLINDSIDE.get_config_tab(k, index)
			end,
		})
	end
	return result
end

function BLINDSIDE.get_config_tab(_tab, _index)
	local result = {
		n = G.UIT.ROOT,
		config = { align = "cm", padding = 0.05, colour = G.C.CLEAR, minh = 5, minw = 5 },
		nodes = BLINDSIDE.tabs_list[_tab].definition(),
	}
	BLINDSIDE.config_tab_index = _index
	return result
end

BLINDSIDE.tabs_list = {
	["Description"] = {
		definition = function()
			return mod_tab_description()
		end,
	},
	["Collection"] = {
		definition = function()
			return mod_tab_collection()
		end,
	},
}

BLINDSIDE.tabs_order = {
    "Description",
    "Collection",
}

function mod_tab_collection()
  return {
        {n=G.UIT.C, config={align = "cm", padding = 0.15}, nodes={
        UIBox_button({button = 'your_collection_blindside_trinkets', label = {localize('bld_ui_trinkets')}, count = G.DISCOVER_TALLIES.blindtrinkets,  minw = 5, minh = 1.7, scale = 0.6, id = 'your_collection_blindside_trinkets'}),
        UIBox_button({button = 'your_collection_blindside_decks', label = {localize('bld_ui_decks')}, count = G.DISCOVER_TALLIES.blinddecks, minw = 5, id = 'your_collection_blindside_decks'}),
        UIBox_button({button = 'your_collection_blindside_relics', label = {localize('bld_ui_relics')}, count = G.DISCOVER_TALLIES.blindrelics, minw = 5, id = 'your_collection_blindside_relics'}),
        {n=G.UIT.R, config={align = "cm", padding = 0.1, r=0.2, colour = G.C.BLACK}, nodes={
            {n=G.UIT.C, config={align = "cm", maxh=2.9}, nodes={
            {n=G.UIT.T, config={text = localize('k_cap_consumables'), scale = 0.45, colour = G.C.L_BLACK, vert = true, maxh=2.2}},
            }},
            {n=G.UIT.C, config={align = "cm", padding = 0.15}, nodes={
            UIBox_button({button = 'your_collection_blindside_filmcards', count = G.DISCOVER_TALLIES.allfilmcards, label = {localize('bld_ui_filmcards')}, minw = 4, id = 'your_collection_blindside_filmcards', colour = G.C.SECONDARY_SET.bld_obj_filmcard}),
            UIBox_button({button = 'your_collection_blindside_minerals', count = G.DISCOVER_TALLIES.allminerals, label = {localize('bld_ui_minerals')}, minw = 4, id = 'your_collection_blindside_minerals', colour = G.C.SECONDARY_SET.bld_obj_mineral}),
            UIBox_button({button = 'your_collection_blindside_rituals', count = G.DISCOVER_TALLIES.allrituals, label = {localize('bld_ui_rituals')}, minw = 4, id = 'your_collection_blindside_rituals', colour = G.C.SECONDARY_SET.bld_obj_ritual}),
            UIBox_button({button = 'your_collection_blindside_runes', count = G.DISCOVER_TALLIES.allrunes, label = {localize('bld_ui_runes')}, minw = 4, id = 'your_collection_runes', colour = G.C.SECONDARY_SET.bld_obj_rune}),
            }}
        }},
        }},
        {n=G.UIT.C, config={align = "cm", padding = 0.15}, nodes={
        UIBox_button({button = 'your_collection_blindside_blindcards', count = G.DISCOVER_TALLIES.allblindcards, label = {localize('bld_ui_blindcards')}, minw = 5, minh = 1.3, id = 'your_collection_blindside_blindcards'}),
        UIBox_button({button = 'your_collection_blindside_enhance', label = {localize('bld_ui_enhance')}, minw = 5, id = 'your_collection_blindside_enhance'}),
        UIBox_button({button = 'your_collection_blindside_editions', label = {localize('bld_ui_edition')}, count = G.DISCOVER_TALLIES.blindeditions, minw = 5, id = 'your_collection_blindside_editions'}),
        UIBox_button({button = 'your_collection_blindside_boosters', label = {localize('bld_ui_boosters')}, count = G.DISCOVER_TALLIES.blindboosters, minw = 5, id = 'your_collection_blindside_boosters'}),
        UIBox_button({button = 'your_collection_blindside_blindtags', label = {localize('bld_ui_tags')}, count = G.DISCOVER_TALLIES.blindtags, minw = 5, id = 'your_collection_blindside_blindtags'}),
        UIBox_button({button = 'your_collection_blindside_jokers', label = {localize('bld_ui_jokers')}, count = G.DISCOVER_TALLIES.blindboosters, minw = 5, minh = 2.0, id = 'your_collection_blindside_jokers', focus_args = {snap_to = true}}),
        }},
    }
end

local function wrapText(text, maxChars)
    local wrappedText = ""
    local currentLineLength = 0

    for word in text:gmatch("%S+") do
        if currentLineLength + #word <= maxChars then
            wrappedText = wrappedText .. word .. ' '
            currentLineLength = currentLineLength + #word + 1
        else
            wrappedText = wrappedText .. '\n' .. word .. ' '
            currentLineLength = #word + 1
        end
    end

    return wrappedText
end

function mod_tab_description()
            local mod = G.ACTIVE_MOD_UI
            local modNodes = {}
            local scale = 0.75 -- Scale factor for text
            local maxCharsPerLine = 50

            local wrappedDescription = wrapText(mod.description or '', maxCharsPerLine)

            local authors = localize('authors', "blind_tabs")

            -- Authors names
            table.insert(modNodes, {
                n = G.UIT.R,
                config = {
                    align = "cm",
                    r = 0.1,
                    emboss = 0.1,
                    outline = 1,
                    padding = 0.07,
                    outline_colour = (mod.ui_config or {}).author_outline_colour,
                    colour = (mod.ui_config or {}).author_bg_colour,
                },
                nodes = {
                    {
                        n = G.UIT.T,
                        config = {
                            text = authors,
                            shadow = true,
                            scale = scale * 0.65,
                            colour = (mod.ui_config or {}).author_colour or G.C.BLUE,
                        }
                    }
                }
            })

            -- Mod description
            if (G.localization.descriptions.Mod or {})[mod.id] then
                modNodes[#modNodes + 1] = {}
                local loc_vars = mod.description_loc_vars and mod:description_loc_vars() or {}
                localize { type = 'descriptions', key = loc_vars.key or mod.id, set = 'Mod', nodes = modNodes[#modNodes], vars = loc_vars.vars, scale = loc_vars.scale, text_colour = loc_vars.text_colour, shadow = loc_vars.shadow }
                modNodes[#modNodes] = desc_from_rows(modNodes[#modNodes])
                modNodes[#modNodes].config.colour = loc_vars.background_colour or modNodes[#modNodes].config.colour
            else
                table.insert(modNodes, {
                    n = G.UIT.R,
                    config = {
                        padding = 0.2,
                        align = "cm"
                    },
                    nodes = {
                        {
                            n = G.UIT.T,
                            config = {
                                text = wrappedDescription,
                                shadow = true,
                                scale = scale * 0.5,
                                colour = G.C.UI.TEXT_LIGHT
                            }
                        }
                    }
                })
            end

            local custom_ui_func = mod.custom_ui
            if custom_ui_func and type(custom_ui_func) == 'function' then
                custom_ui_func(modNodes)
            end

            if not mod.can_load and not mod.disabled then
                local _, _, msg_key, specific_vars = getModtagInfo(mod)
                local text = localize { type = 'raw_descriptions', set = 'Other', key = msg_key, vars = specific_vars }
                local text_nodes = {}
                for _,v in ipairs(text) do
                    text_nodes[#text_nodes+1] = {
                        n = G.UIT.R, config = { align = 'cm' }, nodes = {
                            { n = G.UIT.T, config = { text = v, colour = G.SETTINGS.reduced_motion and G.C.WHITE or SMODS.Gradients.warning_text, scale = 0.35, shadow = true } }
                        }
                    }
                end
                table.insert(modNodes, { n = G.UIT.R, config = { align = "cm" }, nodes = {
                    { n = G.UIT.B, config = { w = 0.1, h = 0.1 }}
                }})
                table.insert(modNodes, {
                    n = G.UIT.R, config = { align = "cm", r = 0.1, minw = 6, minh = 0.6, colour = G.SETTINGS.reduced_motion and G.C.RED or SMODS.Gradients.warning_bg, padding = 0.1 }, nodes={
                        {
                            n = G.UIT.C, config = { align = 'cm' }, nodes = {
                                { n = G.UIT.O, config = { object = SMODS.create_sprite(0, 0, 0.8, 0.8, 'mod_tags', { x = 0, y = 0 }) } },
                            }
                        }, 
                        { 
                            n = G.UIT.C, config = { align = 'cm' }, nodes = text_nodes
                        },
                        {
                            n = G.UIT.C, config = { align = 'cm' }, nodes = {
                                { n = G.UIT.O, config = { object = SMODS.create_sprite(0, 0, 0.8, 0.8, 'mod_tags', { x = 0, y = 0 }) } },
                            }
                        }, 
                    }
                })
            end

  return {{n = G.UIT.C, config = {emboss = 0.05, minh = 6, r = 0.1, minw = 6, align = "tm",padding = 0.2, colour = G.C.BLACK}, nodes = modNodes }}
end

----------------------------------------------
------------MOD CODE END----------------------

