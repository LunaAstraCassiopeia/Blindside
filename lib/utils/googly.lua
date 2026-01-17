local GOOGLY_OUTER_RADIUS = 11
local GOOGLY_INNER_RADIUS = 7

BLINDSIDE.FORCE_GOOGLY_EYES = false

SMODS.Atlas({
    key = 'bld_googly',
    path = 'googly.png',
    px = 71,
    py = 95
})

local last_dt = 1

local lu = love.update
function love.update(dt)
    lu(dt)
    last_dt = dt
end

-- DRAWSTEP BY NOTMARIO!!! THANK YOU!!!

SMODS.DrawStep({
	key = "googly",
	order = 25,
	func = function(self)
        local should_do = self.googly
        if BLINDSIDE.FORCE_GOOGLY_EYES and 
            BLINDSIDE.is_blindside(self.config.center.key) and
            self.ability.set == "Enhanced" then
            should_do = true
        end
        if not should_do then return nil end

        if not G.googly_sprite then 
            G.googly_sprite = Sprite(
                0, 0, 71, 95, G.ASSET_ATLAS["bld_googly"], {x = 0, y = 0}
            )
        end

        self.xoff = (self.xoff or 0)
        self.yoff = (self.yoff or 0)

        G.googly_sprite.role.draw_major = self

        G.googly_sprite:set_sprite_pos({x=0, y=0})
        G.googly_sprite:draw_shader(shader, nil, nil, nil, self.children.center)

        -- Love That Janker
        local size_mult_x = self.children.center.T.w * 30 / 71 * self.T.scale
        local size_mult_z = self.children.center.T.h * 30 / 71 * self.T.scale
        local scale = G.TILESCALE*G.TILESIZE*G.CANV_SCALE
        local size_scale_x = size_mult_x / 71
        local size_scale_z = size_mult_z / 71
        local size_x = G.TILESCALE*G.TILESIZE * size_scale_x
        local size_z = G.TILESCALE*G.TILESIZE * size_scale_z

        local x_pos = self.children.center.VT.x * scale + scale * size_scale_x / self.T.scale
        local y_pos = self.children.center.VT.y * scale + scale * size_scale_z / self.T.scale
        local x_tilt = (self.tilt_var.mx - x_pos) / 300
        local y_tilt = (self.tilt_var.my - y_pos) / 300

        local gravity_x = (x_tilt - 0.5) * 4 - self.VT.r * 25
        local gravity_y = y_tilt * 4 - 1
        local gravity_mag = (x_tilt * x_tilt + y_tilt * y_tilt) ^ 0.5

        gravity_x = gravity_x / gravity_mag
        gravity_y = gravity_y / gravity_mag

        if self.force_look_dir then
            local fld_mag = (self.force_look_dir[1] ^ 2 + self.force_look_dir[2] ^ 2) ^ 0.5
            if fld_mag == 0 then fld_mag = 1 end
            gravity_x = gravity_x + (self.force_look_dir[1] / fld_mag * (GOOGLY_OUTER_RADIUS - GOOGLY_INNER_RADIUS)) / 2
            gravity_y = gravity_y + (self.force_look_dir[2] / fld_mag * (GOOGLY_OUTER_RADIUS - GOOGLY_INNER_RADIUS)) / 2
        end
        self.xoff = self.xoff + gravity_x * last_dt * 25
        self.yoff = self.yoff + gravity_y * last_dt * 25


        local pos_mag = (self.xoff ^ 2 + self.yoff ^ 2) ^ 0.5 / (GOOGLY_OUTER_RADIUS - GOOGLY_INNER_RADIUS)
        if pos_mag > 1 then
            self.xoff = self.xoff / pos_mag
            self.yoff = self.yoff / pos_mag
        end

        G.googly_sprite:set_sprite_pos({x=1, y=0})
        G.googly_sprite:draw_shader(shader, nil, nil, nil, self.children.center, 0, 0, self.xoff * 2 / 71, self.yoff * 2 / 71)
	end,
	conditions = { vortex = false, facing = "front" },
})