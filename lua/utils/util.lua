local M = {}

-- the following two functions were copied straight from
-- https://github.com/folke/tokyonight.nvim/blob/main/lua/tokyonight/util.lua
-- i was importing them before but want to have them locally incase of breaking updates
---@param c  string
local function rgb(c)
	c = string.lower(c)
	return { tonumber(c:sub(2, 3), 16), tonumber(c:sub(4, 5), 16), tonumber(c:sub(6, 7), 16) }
end

---@param foreground string foreground color
---@param background string background color
---@param alpha number|string number between 0 and 1. 0 results in bg, 1 results in fg
function M.blend(foreground, alpha, background)
	alpha = type(alpha) == "string" and (tonumber(alpha, 16) / 0xff) or alpha
	local bg = rgb(background)
	local fg = rgb(foreground)

	local blendChannel = function(i)
		local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
		return math.floor(math.min(math.max(0, ret), 255) + 0.5)
	end

	return string.format("#%02x%02x%02x", blendChannel(1), blendChannel(2), blendChannel(3))
end

-- helper: convert RGB (0-255) to HSL (h in [0,1], s,l in [0,1])
local function rgb_to_hsl(r, g, b)
	r, g, b = r / 255, g / 255, b / 255
	local maxc, minc = math.max(r, g, b), math.min(r, g, b)
	local h, s, l = 0, 0, (maxc + minc) / 2
	if maxc ~= minc then
		local d = maxc - minc
		s = d / (l < 0.5 and (maxc + minc) or (2 - maxc - minc))
		if maxc == r then
			h = ((g - b) / d + (g < b and 6 or 0))
		elseif maxc == g then
			h = ((b - r) / d + 2)
		else
			h = ((r - g) / d + 4)
		end
		h = h / 6
	end
	return h, s, l
end

-- helper: convert HSL (h in [0,1], s,l in [0,1]) back to RGB (0-255)
local function hsl_to_rgb(h, s, l)
	local r, g, b
	if s == 0 then
		r, g, b = l, l, l
	else
		local function hue2rgb(p, q, t)
			if t < 0 then
				t = t + 1
			end
			if t > 1 then
				t = t - 1
			end
			if t < 1 / 6 then
				return p + (q - p) * 6 * t
			end
			if t < 1 / 2 then
				return q
			end
			if t < 2 / 3 then
				return p + (q - p) * (2 / 3 - t) * 6
			end
			return p
		end
		local q = l < 0.5 and (l * (1 + s)) or (l + s - l * s)
		local p = 2 * l - q
		r = hue2rgb(p, q, h + 1 / 3)
		g = hue2rgb(p, q, h)
		b = hue2rgb(p, q, h - 1 / 3)
	end
	return math.floor(r * 255 + 0.5), math.floor(g * 255 + 0.5), math.floor(b * 255 + 0.5)
end

---@param color string hex color (e.g. "#ff0000")
---@param amount number amount to adjust saturation by (positive to increase, negative to decrease)
function M.adjust_saturation(color, amount)
	local c = rgb(color)
	local h, s, l = rgb_to_hsl(c[1], c[2], c[3])
	s = math.min(math.max(s + amount, 0), 1)
	local r, g, b = hsl_to_rgb(h, s, l)
	return string.format("#%02x%02x%02x", r, g, b)
end

---@param color string hex color (e.g. "#ff0000")
---@param amount number amount to adjust lightness by (positive to lighten, negative to darken)
function M.adjust_lightness(color, amount)
	local c = rgb(color)
	local h, s, l = rgb_to_hsl(c[1], c[2], c[3])
	l = math.min(math.max(l + amount, 0), 1)
	local r, g, b = hsl_to_rgb(h, s, l)
	return string.format("#%02x%02x%02x", r, g, b)
end

return M
