local redis = require "resty.redis"
local red = redis:new()
red:set_timeout(1000) -- 1 second

local ok, err = red:connect("redis", 6379)
if not ok then
    ngx.log(ngx.ERR, "failed to connect to redis: ", err)
    return
end

local ok, err = red:set("my_key", "Hello, Lua with Redis!")
if not ok then
    ngx.log(ngx.ERR, "failed to set my_key: ", err)
    return
end

ngx.log(ngx.NOTICE, "set my_key to Hello, Lua with Redis!")
