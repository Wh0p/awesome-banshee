--[[
     Awesome-Banshee                                
                                                        
     Licensed under GNU General Public License v2       
      * (c) 2017,      Daniel Opitz
--]]


local dir = os.getenv("HOME") .. "/.config/awesome/banshee"
local logo = dir .. "/logo.png"

local banshee = {}

function capture(cmd)
  local f = assert(io.popen(cmd, 'r'))
  local s = assert(f:read('*a'))
  f:close()
  return s
end

function is_running () 
  local s = capture("pidof banshee")
  return s:len() > 0
end

function banshee.is_playing() 
  if not is_running() then
    return false
  else
    local s = capture("banshee --query-current-state")
    if (string.find(s, "playing") == nil) then 
      return false
    else 
      return true
    end
  end
end

function banshee.notify_now_playing () 
  if not is_running() then
    io.popen("notify-send -t 4000 -i " .. logo .. " banshee not running...")
  else
    local info = capture("{ banshee --query-title; banshee --query-artist; banshee --query-album; }")
    io.popen("notify-send -t 4000 -i " .. dir .. "/logo.png \"" .. info .. "\"")
  end
end

function banshee.next_track() 
  if not is_running() then
    io.popen("notify-send -t 4000 -i " .. logo .. " banshee not running...")
  else
    io.popen("banshee --next")
  end
end

function banshee.prev_track () 
  if not is_running() then
    io.popen("notify-send -t 4000 -i " .. logo .. " banshee not running...")
  else
    io.popen("banshee --previous")
  end
end

function banshee.play () 
  if not is_running() then
    io.popen("notify-send -t 4000 -i " .. logo .. " banshee not running...")
  else
    io.popen("banshee --play")
  end
end

function banshee.pause () 
  if not is_running() then
    io.popen("notify-send -t 4000 -i " .. logo .. " banshee not running...")
  else
    io.popen("banshee --pause")
  end
end

function banshee.toggle_play () 
  if not is_running() then
    io.popen("notify-send -t 4000 -i " .. logo .. " banshee not running...")
  else
    if (banshee.is_playing()) then
      banshee.pause()
    else 
      banshee.play()
    end
  end
end

function banshee.rate (r) 
  if not is_running() then
    io.popen("notify-send -t 4000 -i " .. logo .. " banshee not running...")
  else
    io.popen("banshee --set-rating=" .. tostring(r))
  end
end

return banshee
