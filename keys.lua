--[[
     Awesome-Banshee                                
                                                        
     Licensed under GNU General Public License v2       
      * (c) 2017,      Daniel Opitz
--]]

local awful  = require("awful")
local mod    = require("utils.modkeys")
local player = require("banshee.banshee")

return awful.util.table.join(
    awful.key({ mod.alt  }, "b", player.notify_now_playing,
      {description = "banshee currently playing", group = "banshee"}),

    awful.key({ mod.ctrl }, "Insert", player.play,
      {description = "banshee play", group = "banshee"}),
    awful.key({ mod.ctrl }, "Delete", player.pause,
      {description = "banshee pause", group = "banshee"}),
    awful.key({ mod.ctrl }, "Home", player.prev_track,
      {description = "banshee previous track", group = "banshee"}),
    awful.key({ mod.ctrl }, "End", player.next_track,
      {description = "banshee next track", group = "banshee"}),

    awful.key({ mod.alt }, "3", function() player.rate(3) end,
      {description = "banshee set rating to 3", group = "banshee"}),
    awful.key({ mod.alt }, "4", function() player.rate(4) end,
      {description = "banshee set rating to 4", group = "banshee"}),
    awful.key({ mod.alt }, "0", function() player.rate(0) end,
      {description = "banshee set rating to 0", group = "banshee"})
)

