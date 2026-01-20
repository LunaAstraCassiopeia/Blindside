local gameMainMenuRef = Game.main_menu
function Game:main_menu(change_context)
    gameMainMenuRef(self, change_context)
    UIBox({
        definition = {
            n = G.UIT.ROOT,
            config = {
                align = "cm",
                colour = G.C.UI.TRANSPARENT_DARK
            },
            nodes = {
                {
                    n = G.UIT.T,
                    config = {
                        scale = 0.3,
                        text = "Blindside BETA v0.2.1",
                        colour = G.C.UI.TEXT_LIGHT
                    }
                }
            }
        },
        config = {
            align = "tri",
            bond = "Weak",
            offset = {
                x = 0,
                y = 0.6
            },
            major = G.ROOM_ATTACH
        }
    })
    G.SETTINGS.tutorial_complete = true
end

--PROPERLY COMPRESS TAGS
local at = add_tag
function add_tag(tag)
	-- Make tags fit if there's more than 13 of them
	-- This + Tag.remove Hook modify the offset to squeeze in more tags when needed
	at(tag)
	if #G.HUD_tags - #G.vouchers.cards >= 13 then
		for i = #G.vouchers.cards + 2, #G.HUD_tags do
			G.HUD_tags[i].config.offset.y = 0.9 - 0.9 * 13 / (#G.HUD_tags - #G.vouchers.cards)
		end
	end
end

local tr = Tag.remove
function Tag:remove()
	tr(self)
	if #G.HUD_tags - #G.vouchers.cards >= 13 then
		for i = #G.vouchers.cards + 2, #G.HUD_tags do
			G.HUD_tags[i].config.offset.y = 0.9 - 0.9 * 13 / (#G.HUD_tags - #G.vouchers.cards)
		end
	end
end

function generateTagUi()
    if G.HUD_tags then
        for k, v in ipairs(G.HUD_tags) do
            v:remove()
            G.HUD_tags[k] = nil
        end
    end
    for k, tag in pairs (G.GAME.tags) do
        if BLINDSIDE.is_relic(tag.key) then
            local tag_sprite_ui = tag:generate_relic_UI()
            G.HUD_tags[#G.HUD_tags+1] = UIBox{
                definition = {n=G.UIT.ROOT, config={align = "cm",padding = 0.05, colour = G.C.CLEAR}, nodes={
                    tag_sprite_ui,
                }},
                config = {
                    align = G.HUD_tags[1] and 'tm' or 'bri',
                    offset = G.HUD_tags[1] and {x=0,y=0.8} or {x=1,y=0},
                    major = G.HUD_tags[1] and G.HUD_tags[#G.HUD_tags] or G.ROOM_ATTACH
                },
            }
            tag.HUD_tag = G.HUD_tags[#G.HUD_tags]
            G.HUD_tags[#G.HUD_tags].tag = tag
        end
    end
    for k, tag in pairs(G.GAME.tags) do
        if not BLINDSIDE.is_relic(tag.key)then
            local tag_sprite_ui = tag:generate_UI()
            
            G.HUD_tags[#G.HUD_tags+1] = UIBox{
                definition = {n=G.UIT.ROOT, config={align = "cm",padding = 0.05, colour = G.C.CLEAR}, nodes={
                    tag_sprite_ui,
                }},
                config = {
                    align = G.HUD_tags[1] and 'tm' or 'bri',
                    offset = G.HUD_tags[1] and {x=0,y=0} or {x=1,y=0},
                    major = G.HUD_tags[1] and G.HUD_tags[#G.HUD_tags] or G.ROOM_ATTACH
                },
            }
            tag.HUD_tag = G.HUD_tags[#G.HUD_tags]
            G.HUD_tags[#G.HUD_tags].tag = tag
        end
    end
end


function Tag:generate_relic_UI(_size)
    _size = _size or 0.8
    local pretend_tag = Tag("tag_bld_deck")

    local tag_sprite_tab = nil

    local tag_sprite = SMODS.create_sprite(0, 0, _size*1, _size*1, SMODS.get_atlas((not self.hide_ability) and G.P_TAGS[self.key].atlas or "tags"), (self.hide_ability) and G.tag_undiscovered.pos or self.pos)
    tag_sprite.T.scale = 1
    tag_sprite_tab = {n= G.UIT.C, config={align = "cm", ref_table = self, group = self.tally}, nodes={
        {n=G.UIT.O, config={w=_size*1,h=_size*1, colour = G.C.BLUE, object = tag_sprite, focus_with_object = true}},
    }}
    tag_sprite:define_draw_steps({
        {shader = 'dissolve', shadow_height = 0.05},
        {shader = 'dissolve'},
    })
    tag_sprite.float = true
    tag_sprite.states.hover.can = true
    tag_sprite.states.click.can = true
    tag_sprite.states.drag.can = false
    tag_sprite.states.collide.can = true
    tag_sprite.config = {tag = self, force_focus = true}

    tag_sprite.hover = function(_self)
        if not G.CONTROLLER.dragging.target or G.CONTROLLER.using_touch then 
            if not _self.hovering and _self.states.visible then
                _self.hovering = true
                if _self == tag_sprite then
                    _self.hover_tilt = 3
                    _self:juice_up(0.05, 0.02)
                    play_sound('paper1', math.random()*0.1 + 0.55, 0.42)
                    play_sound('tarot2', math.random()*0.1 + 0.55, 0.09)
                end

                pretend_tag:get_uibox_table(tag_sprite)
                _self.config.h_popup =  G.UIDEF.card_h_popup(_self)
                _self.config.h_popup_config = (_self.T.x > G.ROOM.T.w*0.4) and
                    {align =  'cl', offset = {x=-0.1,y=0},parent = _self} or
                    {align =  'cr', offset = {x=0.1,y=0},parent = _self}
                Node.hover(_self)
                if _self.children.alert then 
                    _self.children.alert:remove()
                    _self.children.alert = nil
                    if self.key and G.P_TAGS[self.key] then G.P_TAGS[self.key].alerted = true end
                    G:save_progress()
                end
            end
        end
    end
    tag_sprite.stop_hover = function(_self) _self.hovering = false; Node.stop_hover(_self); _self.hover_tilt = 0 end
    tag_sprite.click = function(self)
        play_sound('button', 1, 0.3)
        G.ROOM.jiggle = G.ROOM.jiggle + 0.5
        G.FUNCS.bought_price_tags()
    end

    tag_sprite:juice_up()
    self.tag_sprite = tag_sprite

    return tag_sprite_tab, tag_sprite
end

G.FUNCS.bought_price_tags = function(e)
  G.SETTINGS.paused = true
  G.FUNCS.overlay_menu{
    definition = G.UIDEF.bought_price_tags(),
  }
end


function G.UIDEF.bought_price_tags()

  local silent = false
  local keys_used = {}
  local area_count = 0
  local voucher_areas = {}
  local voucher_tables = {}
  local voucher_table_rows = {}
  for k, v in ipairs(G.P_CENTER_POOLS["Voucher"]) do
    local key = 1 + math.floor((k-0.1)/2)
    keys_used[key] = keys_used[key] or {}
    if G.GAME.used_vouchers[v.key] then 
      keys_used[key][#keys_used[key]+1] = v
    end
  end
  for k, v in ipairs(keys_used) do 
    if next(v) then
      area_count = area_count + 1
    end
  end
  for k, v in ipairs(keys_used) do 
    if next(v) then
      if #voucher_areas == 5 or #voucher_areas == 10 then 
        table.insert(voucher_table_rows, 
        {n=G.UIT.R, config={align = "cm", padding = 0, no_fill = true}, nodes=voucher_tables}
        )
        voucher_tables = {}
      end
      voucher_areas[#voucher_areas + 1] = CardArea(
      G.ROOM.T.x + 0.2*G.ROOM.T.w/2,G.ROOM.T.h,
      (#v == 1 and 1 or 1.33)*G.CARD_W,
      (area_count >=10 and 0.75 or 1.07)*G.CARD_H, 
      {card_limit = 2, type = 'voucher', highlight_limit = 0})
      for kk, vv in ipairs(v) do 
        local center = G.P_CENTERS[vv.key]
        local card = Card(voucher_areas[#voucher_areas].T.x + voucher_areas[#voucher_areas].T.w/2, voucher_areas[#voucher_areas].T.y, G.CARD_W, G.CARD_H, nil, center, {bypass_discovery_center=true,bypass_discovery_ui=true,bypass_lock=true})
        card.ability.order = vv.order
        card:start_materialize(nil, silent)
        silent = true
        voucher_areas[#voucher_areas]:emplace(card)
      end
      table.insert(voucher_tables, 
      {n=G.UIT.C, config={align = "cm", padding = 0, no_fill = true}, nodes={
        {n=G.UIT.O, config={object = voucher_areas[#voucher_areas]}}
      }}
      )
    end
  end
  table.insert(voucher_table_rows,
          {n=G.UIT.R, config={align = "cm", padding = 0, no_fill = true}, nodes=voucher_tables}
        )

  
  local t = silent and create_UIBox_generic_options({contents ={
        {n=G.UIT.R, config={align = "cm",padding = 0.04}, nodes={
        {n=G.UIT.O, config={object = DynaText({string = {localize('ph_price_tags_redeemed')}, colours = {G.C.UI.TEXT_LIGHT}, bump = true, scale = 0.6})}}
        }},
        {n=G.UIT.R, config={align = "cm", minh = 0.5}, nodes={
        }},
        {n=G.UIT.R, config={align = "cm", colour = G.C.BLACK, r = 1, padding = 0.15, emboss = 0.05}, nodes={
        {n=G.UIT.R, config={align = "cm"}, nodes=voucher_table_rows},
        }}}})
        or 
  {n=G.UIT.ROOT, config={align = "cm", colour = G.C.CLEAR}, nodes={
    {n=G.UIT.O, config={object = DynaText({string = {localize('ph_no_vouchers')}, colours = {G.C.UI.TEXT_LIGHT}, bump = true, scale = 0.6})}}
  }}
  return t
end

to_big = to_big or function(x)
	return x
end