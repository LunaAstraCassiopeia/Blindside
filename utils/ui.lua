    local function blindcards_ui()
        local blindcards = {}
        for k, v in pairs(G.P_CENTER_POOLS.Enhanced) do
            if BLINDSIDE.is_blindside(v.key) then
                table.insert(blindcards, v)
            end
        end
        return SMODS.card_collection_UIBox(blindcards, { 5, 6, 5 }, {
        no_materialize = true,
        hide_single_page = true,
        h_mod = 0.71,
        back_func = 'blindside_collection',
        })
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

        return SMODS.card_collection_UIBox(blindenhance, { 4, 4 }, {
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

        return SMODS.card_collection_UIBox(filmcards, { 5,5 }, {
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
						{ n = G.UIT.T, config = { text = number_format(get_blind_amount(i)), scale = 0.4, colour = i <= G.PROFILES[G.SETTINGS.profile].high_scores.furthest_ante.amt and G.C.RED or G.C.JOKER_GREY, shadow = true } },
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
        if BLINDSIDE.is_blindside(v.key)then
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
		local temp_blind = AnimatedSprite(G.your_collection[row].T.x + G.your_collection[row].T.w/2, G.your_collection[row].T.y, 1.3, 1.3, G.ANIMATION_ATLAS[v.discovered and v.atlas or 'blind_chips'],
			v.discovered and v.pos or G.b_undiscovered.pos)
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
								opt_callback = 'your_collection_blinds_page',
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
        
        local function wrap_without_blindcards(func)
        local removed = {}
        for k, v in pairs(G.P_CENTER_POOLS.Enhanced) do
        if BLINDSIDE.is_blindside(v.key) then
            removed[k] = v
            G.P_CENTER_POOLS.Enhanced[k] = nil
        end
        end

        local ret = func()

        for k, v in pairs(removed) do
        G.P_CENTER_POOLS.Enhanced[k] = v
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

        local ret = func()

        for k, v in pairs(removed) do
        G.P_CENTER_POOLS.Edition[k] = v
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

        local ret = func()

        for k, v in pairs(removed) do
        G.P_CENTER_POOLS.Seal[k] = v
        end

        return ret
    end
    
    local function wrap_without_blindboosters(func)
        local removed = {}
        for k, v in pairs(G.P_CENTER_POOLS.Booster) do
        if BLINDSIDE.is_blindside(v.key) then
            removed[k] = v
            G.P_CENTER_POOLS.Booster[k] = nil
        end
        end

        local ret = func()

        for k, v in pairs(removed) do
        G.P_CENTER_POOLS.Booster[k] = v
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

        local ret = func()

        for k, v in pairs(removed) do
        G.P_CENTER_POOLS.Joker[k] = v
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
    
    local function wrap_without_blindtags(func)
        local removed = {}
        for k, v in pairs(G.P_TAGS) do
        if BLINDSIDE.is_blindside(v.key) then
            removed[k] = v
            G.P_TAGS[k] = nil
        end
        end
        local ret = func()

        for k, v in pairs(removed) do
        G.P_TAGS[k] = v
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
    create_UIBox_your_collection_tags_content = function()
        return wrap_without_blindtags(tag_ui_ref)
    end

    local joker_ui_seal = create_UIBox_your_collection_seals
    create_UIBox_your_collection_seals = function()
        return wrap_without_blindenhancement(joker_ui_seal)
    end

    function Card:get_blind_nominal(mod)
    local mult = 1
    local color_table = {
        ['Red'] = 1,
        ['Green'] = 2,
        ['Blue'] = 3,
        ['Yellow'] = 4,
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
            Green = {},
            Blue = {},
            Yellow = {},
            Purple = {},
            Faded = {},
        }
        local suit_map = {'Red', 'Green', 'Blue', 'Yellow', 'Purple', 'Faded'}
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
                    tally_sprite({x=2,y=0}, {{string = ''..suit_tallies['Green'], colour = flip_col},{string =''..mod_suit_tallies['Green'], colour = G.C.BLUE}}, {localize('bld_Green', 'suits_plural')}, "bld_Green"),
                    }},
                    {n=G.UIT.R, config={align = "cm", minh = 0.05, padding = 0.1}, nodes={
                    tally_sprite({x=3,y=0}, {{string = ''..suit_tallies['Blue'], colour = flip_col},{string =''..mod_suit_tallies['Blue'], colour = G.C.BLUE}}, {localize('bld_Blue', 'suits_plural')}, "bld_Blue"),
                    tally_sprite({x=1,y=0}, {{string = ''..suit_tallies['Yellow'], colour = flip_col},{string =''..mod_suit_tallies['Yellow'], colour = G.C.BLUE}}, {localize('bld_Yellow', 'suits_plural')}, "bld_Yellow"),
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
        {n = G.UIT.O, config = {object = G.Blindside_Back}}}},
    {n=G.UIT.C, config={align = "cm", padding = 0.15}, nodes={
      UIBox_button({button = 'your_collection_blindside_trinkets', label = {localize('bld_ui_trinkets')}, count = G.DISCOVER_TALLIES.blindtrinkets,  minw = 5, minh = 1.7, scale = 0.6, id = 'your_collection_blindside_trinkets'}),
      UIBox_button({button = 'your_collection_decks', label = {localize('bld_ui_unknown')}, minw = 5}),
      UIBox_button({button = 'your_collection_blindside_relics', label = {localize('bld_ui_relics')}, count = G.DISCOVER_TALLIES.blindrelics, minw = 5, id = 'your_collection_blindside_relics'}),
      {n=G.UIT.R, config={align = "cm", padding = 0.1, r=0.2, colour = G.C.BLACK}, nodes={
        {n=G.UIT.C, config={align = "cm", maxh=2.9}, nodes={
          {n=G.UIT.T, config={text = localize('k_cap_consumables'), scale = 0.45, colour = G.C.L_BLACK, vert = true, maxh=2.2}},
        }},
        {n=G.UIT.C, config={align = "cm", padding = 0.15}, nodes={
          UIBox_button({button = 'your_collection_blindside_filmcards', count = G.DISCOVER_TALLIES.allfilmcards, label = {localize('bld_ui_filmcards')}, minw = 4, id = 'your_collection_blindside_filmcards', colour = G.C.SECONDARY_SET.bld_obj_filmcard}),
          UIBox_button({button = 'your_collection_blindside_minerals', count = G.DISCOVER_TALLIES.allminerals, label = {localize('bld_ui_minerals')}, minw = 4, id = 'your_collection_blindside_minerals', colour = G.C.SECONDARY_SET.bld_obj_mineral}),
          UIBox_button({button = 'your_collection_spectrals', label = {localize('bld_ui_unknown')}, minw = 4, id = 'your_collection_spectrals', colour = G.C.SECONDARY_SET.Spectral}),
          UIBox_button({button = 'your_collection_blindside_runes', label = {localize('bld_ui_runes')}, minw = 4, id = 'your_collection_runes', colour = G.C.SECONDARY_SET.bld_obj_rune}),
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

----------------------------------------------
------------MOD CODE END----------------------
