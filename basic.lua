---@meta _

---
---Command-line arguments of Lua Standalone.
---
---[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-arg"])
---
---@type string[]
arg = {}

---
---Raises an error if the value of its argument v is false (i.e., `nil` or `false`); otherwise, returns all its arguments. In case of error, `message` is the error object; when absent, it defaults to `"assertion failed!"`
---
---[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-assert"])
---
---@generic T
---@param v? T
---@param message? any
---@return T
---@return any ...
function assert(v, message, ...) end

---@alias gcoptions
---|>"collect"      # Performs a full garbage-collection cycle.
---| "stop"         # Stops automatic execution.
---| "restart"      # Restarts automatic execution.
---| "count"        # Returns the total memory in Kbytes.
---| "step"         # Performs a garbage-collection step.
---| "isrunning"    # Returns whether the collector is running.
---| "incremental"  # Change the collector mode to incremental.
---| "generational" # Change the collector mode to generational.

---
---This function is a generic interface to the garbage collector. It performs different functions according to its first argument, `opt`.
---
---[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-collectgarbage"])
---
---@param opt? gcoptions
---@return any
function collectgarbage(opt, ...) end

---
---Opens the named file and executes its content as a Lua chunk. When called without arguments, `dofile` executes the content of the standard input (`stdin`). Returns all values returned by the chunk. In case of errors, `dofile` propagates the error to its caller. (That is, `dofile` does not run in protected mode.)
---
---[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-dofile"])
---
---@param filename? string
---@return any ...
function dofile(filename) end

---
---Terminates the last protected function called and returns message as the error object.
---
---Usually, `error` adds some information about the error position at the beginning of the message, if the message is a string.
---
---
---[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-error"])
---
---@param message any
---@param level?  integer
function error(message, level) end

---
---A global variable (not a function) that holds the global environment (see [§2.2](command:extension.lua.doc?["en-us/54/manual.html/2.2"])). Lua itself does not use this variable; changing its value does not affect any environment, nor vice versa.
---
---[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-_G"])
---
---@class _G
_G = {}

---@version 5.1
---
---Returns the current environment in use by the function. `f` can be a Lua function or a number that specifies the function at that stack level.
---
---[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-getfenv"])
---
---@param f? integer|async fun(...):...
---@return table
---@nodiscard
function getfenv(f) end

---
---If object does not have a metatable, returns nil. Otherwise, if the object's metatable has a __metatable field, returns the associated value. Otherwise, returns the metatable of the given object.
---
---[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-getmetatable"])
---
---@param object any
---@return table metatable
---@nodiscard
function getmetatable(object) end

---
---Returns three values (an iterator function, the table `t`, and `0`) so that the construction
---```lua
---    for i,v in ipairs(t) do body end
---```
---will iterate over the key–value pairs `(1,t[1]), (2,t[2]), ...`, up to the first absent index.
---
---
---[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-ipairs"])
---
---@generic T: table, V
---@param t T
---@return fun(table: V[], i?: integer):integer, V
---@return T
---@return integer i
function ipairs(t) end

---@alias loadmode
---| "b"  # Only binary chunks.
---| "t"  # Only text chunks.
---|>"bt" # Both binary and text.

---
---Loads a chunk.
---
---If `chunk` is a string, the chunk is this string. If `chunk` is a function, `load` calls it repeatedly to get the chunk pieces. Each call to `chunk` must return a string that concatenates with previous results. A return of an empty string, `nil`, or no value signals the end of the chunk.
---
---
---[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-load"])
---
---@param chunk      string|function
---@param chunkname? string
---@param mode?      loadmode
---@param env?       table
---@return function?
---@return string?   error_message
---@nodiscard
function load(chunk, chunkname, mode, env) end

---
---Loads a chunk from file `filename` or from the standard input, if no file name is given.
---
---[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-loadfile"])
---
---@param filename? string
---@param mode?     loadmode
---@param env?      table
---@return function?
---@return string?  error_message
---@nodiscard
function loadfile(filename, mode, env) end

---@version 5.1
---
---Loads a chunk from the given string.
---
---[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-loadstring"])
---
---@param text       string
---@param chunkname? string
---@return function?
---@return string?   error_message
---@nodiscard
function loadstring(text, chunkname) end

---@version 5.1
---@param proxy boolean|table|userdata
---@return userdata
---@nodiscard
function newproxy(proxy) end

---@version 5.1
---
---Creates a module.
---
---[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-module"])
---
---@param name string
function module(name, ...) end

---
---Allows a program to traverse all fields of a table. Its first argument is a table and its second argument is an index in this table. A call to `next` returns the next index of the table and its associated value. When called with `nil` as its second argument, `next` returns an initial index and its associated value. When called with the last index, or with `nil` in an empty table, `next` returns `nil`. If the second argument is absent, then it is interpreted as `nil`. In particular, you can use `next(t)` to check whether a table is empty.
---
---The order in which the indices are enumerated is not specified, *even for numeric indices*. (To traverse a table in numerical order, use a numerical `for`.)
---
---The behavior of `next` is undefined if, during the traversal, you assign any value to a non-existent field in the table. You may however modify existing fields. In particular, you may set existing fields to nil.
---
---
---[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-next"])
---
---@generic K, V
---@param table table<K, V>
---@param index? K
---@return K?
---@return V?
---@nodiscard
function next(table, index) end

---
---If `t` has a metamethod `__pairs`, calls it with t as argument and returns the first three results from the call.
---
---Otherwise, returns three values: the [next](command:extension.lua.doc?["en-us/54/manual.html/pdf-next"]) function, the table `t`, and `nil`, so that the construction
---```lua
---    for k,v in pairs(t) do body end
---```
---will iterate over all key–value pairs of table `t`.
---
---See function [next](command:extension.lua.doc?["en-us/54/manual.html/pdf-next"]) for the caveats of modifying the table during its traversal.
---
---
---[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-pairs"])
---
---@generic T: table, K, V
---@param t T
---@return fun(table: table<K, V>, index?: K):K, V
---@return T
function pairs(t) end

---
---Calls the function `f` with the given arguments in *protected mode*. This means that any error inside `f` is not propagated; instead, `pcall` catches the error and returns a status code. Its first result is the status code (a boolean), which is true if the call succeeds without errors. In such case, `pcall` also returns all results from the call, after this first result. In case of any error, `pcall` returns `false` plus the error object.
---
---
---[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-pcall"])
---
---@param f     async fun(...):...
---@param arg1? any
---@return boolean success
---@return any result
---@return any ...
function pcall(f, arg1, ...) end

---
---Receives any number of arguments and prints their values to `stdout`, converting each argument to a string following the same rules of [tostring](command:extension.lua.doc?["en-us/54/manual.html/pdf-tostring"]).
---The function print is not intended for formatted output, but only as a quick way to show a value, for instance for debugging. For complete control over the output, use [string.format](command:extension.lua.doc?["en-us/54/manual.html/pdf-string.format"]) and [io.write](command:extension.lua.doc?["en-us/54/manual.html/pdf-io.write"]).
---
---
---[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-print"])
---
function print(...) end

---
---Checks whether v1 is equal to v2, without invoking the `__eq` metamethod.
---
---[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-rawequal"])
---
---@param v1 any
---@param v2 any
---@return boolean
---@nodiscard
function rawequal(v1, v2) end

---
---Gets the real value of `table[index]`, without invoking the `__index` metamethod.
---
---[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-rawget"])
---
---@param table table
---@param index any
---@return any
---@nodiscard
function rawget(table, index) end

---
---Returns the length of the object `v`, without invoking the `__len` metamethod.
---
---[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-rawlen"])
---
---@param v table|string
---@return integer len
---@nodiscard
function rawlen(v) end

---
---Sets the real value of `table[index]` to `value`, without using the `__newindex` metavalue. `table` must be a table, `index` any value different from `nil` and `NaN`, and `value` any Lua value.
---This function returns `table`.
---
---
---[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-rawset"])
---
---@param table table
---@param index any
---@param value any
---@return table
function rawset(table, index, value) end

---
---If `index` is a number, returns all arguments after argument number `index`; a negative number indexes from the end (`-1` is the last argument). Otherwise, `index` must be the string `"#"`, and `select` returns the total number of extra arguments it received.
---
---[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-select"])
---
---@param index integer|"#"
---@return any
---@nodiscard
function select(index, ...) end

---@version 5.1
---
---Sets the environment to be used by the given function.
---
---[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-setfenv"])
---
---@param f     async fun(...):...|integer
---@param table table
---@return function
function setfenv(f, table) end

---
---Sets the metatable for the given table. If `metatable` is `nil`, removes the metatable of the given table. If the original metatable has a `__metatable` field, raises an error.
---
---This function returns `table`.
---
---To change the metatable of other types from Lua code, you must use the debug library ([§6.10](command:extension.lua.doc?["en-us/54/manual.html/6.10"])).
---
---
---[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-setmetatable"])
---
---@param table      table
---@param metatable? table
---@return table
function setmetatable(table, metatable) end

---
---When called with no `base`, `tonumber` tries to convert its argument to a number. If the argument is already a number or a string convertible to a number, then `tonumber` returns this number; otherwise, it returns `fail`.
---
---The conversion of strings can result in integers or floats, according to the lexical conventions of Lua (see [§3.1](command:extension.lua.doc?["en-us/54/manual.html/3.1"])). The string may have leading and trailing spaces and a sign.
---
---
---[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-tonumber"])
---
---@overload fun(e: string, base: integer):integer
---@param e any
---@return number?
---@nodiscard
function tonumber(e) end

---
---Receives a value of any type and converts it to a string in a human-readable format.
---
---If the metatable of `v` has a `__tostring` field, then `tostring` calls the corresponding value with `v` as argument, and uses the result of the call as its result. Otherwise, if the metatable of `v` has a `__name` field with a string value, `tostring` may use that string in its final result.
---
---For complete control of how numbers are converted, use [string.format](command:extension.lua.doc?["en-us/54/manual.html/pdf-string.format"]).
---
---
---[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-tostring"])
---
---@param v any
---@return string
---@nodiscard
function tostring(v) end

---@alias type
---| "nil"
---| "number"
---| "string"
---| "boolean"
---| "table"
---| "function"
---| "thread"
---| "userdata"

---
---Returns the type of its only argument, coded as a string. The possible results of this function are `"nil"` (a string, not the value `nil`), `"number"`, `"string"`, `"boolean"`, `"table"`, `"function"`, `"thread"`, and `"userdata"`.
---
---
---[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-type"])
---
---@param v any
---@return type type
---@nodiscard
function type(v) end

---
---A global variable (not a function) that holds a string containing the running Lua version.
---
---[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-_VERSION"])
---
_VERSION = "Lua 5.4"

---@version >5.4
---
---Emits a warning with a message composed by the concatenation of all its arguments (which should be strings).
---
---[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-warn"])
---
---@param message string
function warn(message, ...) end

---
---Calls function `f` with the given arguments in protected mode with a new message handler.
---
---[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-xpcall"])
---
---@param f     async fun(...):...
---@param msgh  function
---@param arg1? any
---@return boolean success
---@return any result
---@return any ...
function xpcall(f, msgh, arg1, ...) end

---@version 5.1
---
---Returns the elements from the given `list`. This function is equivalent to
---```lua
---    return list[i], list[i+1], ···, list[j]
---```
---
---
---[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-unpack"])
---
---@generic T
---@param list T[]
---@param i?   integer
---@param j?   integer
---@return T   ...
---@nodiscard
function unpack(list, i, j) end

---
---### PANDORA BUILT-IN SECTION
---

---@alias captchastatus
---| '"Solved(Answer)"' # Captcha is solved
---| '"Wrong Answer"' # Tried to auto captcha but wrong answer
---| '"Couldn\'t Solve"' # Captcha is not solved at all

---@class Bot
---@field name string The bot name
---@field world string The bot current world in uppercase
---@field status string The bot current network status
---@field x number The bot current world x pixel position
---@field y number The bot current world y pixel position
---@field slots number The bot backpack slots
---@field level number The bot current level
---@field captcha captchastatus The bot current captcha status

---@class Tile
---@field fg number The tile foreground
---@field bg number The tile background
---@field data number The tile extra data, for example to check item id inside vend or check jammer enabled or not.
---@field ready boolean The tile ready to harvest status if it's a tree
---@field flags number Tile flags
---@field extra number To check if tile is a fire, water, etc

---@class Object
---@field id number The object item id
---@field count number The object dropped count
---@field x number The object current world x pixel position
---@field y number The object current world y pixel position
---@field oid number The object oid to collect them via packet

---@class Player
---@field name string The player name without ticks
---@field netid number The player net id inside the world TODO: Check validation type
---@field userid number The player user id globally TODO: Check validation type
---@field country string The player identification country
---@field x number The player current world x pixel position
---@field y number The player current world y pixel position

---@class Item
---@field name string The item name
---@field id number The item id
---@field count number The item count

---@class WebhookData
---@field url string Webhook url to send
---@field username string Webhook username to send
---@field content string Webhook content
---@field avatar string Webhook avatar
---@field embed string Embed(s) JSON
---@field rawembed table Embed(s) RAW table
---@field edit boolean Send PATCH or not

---@class RawPacket
---@field type number Raw packet type
---@field netid? number Raw packet net id data
---@field flags? number Raw packet flags data
---@field int_data? number Raw packet int_data
---@field pos_x? number Raw packet position x data
---@field pos_y? number Raw packet position y data
---@field pos2_x? number Raw packet position 2 x data
---@field pos2_y? number Raw packet position 2 y data
---@field int_x? number Raw packet position x data
---@field int_y? number Raw packet position y data

---@class Cloth
---@field name string Cloth name
---@field id number Cloth item id

---
---Sleep and wait for n milliseconds.
---
---[Converter](https://www.unitconverters.net/time/milliseconds-to-seconds.htm)
---
---
---@param delay_ms number
function sleep(delay_ms) end

---
---Send a wear packet to wear an clothing item id.
---
---[Item Database](https://raw.githubusercontent.com/junssekut/saraItemDatabase/main/ItemDatabase.lua)
---
---@param item_id number
function wear(item_id) end

---
---Send a drop packet to drop an item id with custom count if there is any.
---
---[Item Database](https://raw.githubusercontent.com/junssekut/saraItemDatabase/main/ItemDatabase.lua)
---
---@param item_id number
---@param count? number
function drop(item_id, count) end

---
---Send a enter door packet on local bot position.
---
function enter() end

---
---Send a punch packet on relative position.
---
---@param rel_x number
---@param rel_y number
function punch(rel_x, rel_y) end

---
---Send a wrench packet on relative position.
---
---@param rel_x number
---@param rel_y number
function wrench(rel_x, rel_y) end

---
---Send move packet on relative position.
---
---@param rel_x number
---@param rel_y number
function move(rel_x, rel_y) end

---
---Send a place packet on relative position with item id.
---
---[Item Database](https://raw.githubusercontent.com/junssekut/saraItemDatabase/main/ItemDatabase.lua)
---
---@param item_id number
---@param rel_x number
---@param rel_y number
function place(item_id, rel_x, rel_y) end

---
---Send a chat packet from the bot.
---
---@param message string
function say(message) end

---
---Send a server packet from the bot.
---
---@param packet_type number
---@param packet string
function sendPacket(packet_type, packet) end

---
---Toggle auto collect items with range.
---
---@param bool boolean
---@param range number
function collectSet(bool, range) end

---
---Send a collect packet and ignore item id if there is any.
---
---[Item Database](https://raw.githubusercontent.com/junssekut/saraItemDatabase/main/ItemDatabase.lua)
---
---@param range number
---@param ignore_item_id? number
function collect(range, ignore_item_id) end

---
---Find item inside the bot inventory.
---
---[Item Database](https://raw.githubusercontent.com/junssekut/saraItemDatabase/main/ItemDatabase.lua)
---
---@param item_id number
---@return number
---@nodiscard
function findItem(item_id) end

---
---Add a bot with SOCKS5 proxy if there is any.
---
---@param name string
---@param password string
---@param proxy? string|nil
function addBot(name, password, proxy) end

---
---Remove bot from the list.
---
---@param name string
function removeBot(name) end

---
---Find path to position.
---
---@param x number
---@param y number
---@return boolean
function findPath(x, y) end

---
---Get current selected bot.
---
---@overload fun(name: string|nil): Bot
---@return Bot
---@nodiscard
function getBot() end

---
---Get all added bots.
---
---@return Bot[]
---@nodiscard
function getBots() end

---
---Get tile data.
---
---@param x number
---@param y number
---@return Tile
---@nodiscard
function getTile(x, y) end

---
---Get tiles data inside the world.
---
---@return Tile[]
---@nodiscard
function getTiles() end

---
---Get all dropped objects inside the world.
---
---@return Object[]
---@nodiscard
function getObjects() end

---
---Get all players inside the world.
---
---@return Player[]
---@nodiscard
function getPlayers() end

---
---Get all items inside bot inventory.
---
---@return Item[]
---@nodiscard
function getInventory() end

---
---Send a discord webhook.
---
---@param data WebhookData
function webhook(data) end

---
---Send raw packet from the bot.
---
---@param rawpacket RawPacket
function sendPacketRaw(rawpacket) end

---
---Send a connect packet.
---
function connect() end

---
---Send disconnect packet.
---
function disconnect() end

---
---Get all weared clothes.
---
---@return Cloth[]
---@nodiscard
function getClothes() end

---
---Check if a clothe is weared or not.
---
---[Item Database](https://raw.githubusercontent.com/junssekut/saraItemDatabase/main/ItemDatabase.lua)
---
---@param item_id number
---@return boolean
---@nodiscard
function findClothes(item_id) end

---@alias booltype
---| '"Select All"' # Select all bot
---| '"Guest Account"' # Use guest account on adding next bot
---| '"External"' # Execute externally checkbox
---| '"Auto Access"' # Auto access check box
---| '"Auto Reconnect"' # Auto reconnect check box
---| '"Auto Leave"' # Auto leave check box
---| '"Ignore Gems"' # Ignore gems check box

---
---Set a boolean value inside a pandora.
---
---@param bool_name booltype
---@param bool boolean
function setBool(bool_name, bool) end

---@alias geigersignal
---| '"null"' # Null signal
---| '"red"' # Red signal
---| '"yellow"' # Yellow signal
---| '"green"' # Green signal
---| '"rapid green"' # Rapid green signal

---
---Get current geiger signal on bot position.
---
---@return geigersignal
---@nodiscard
function getSignal() end

---
---Get current network ping.
---
---@return number
---@nodiscard
function getPing() end

---@alias requesttype
---| '"GET"' # Get http request
---| '"POST"' # Post http request
---| '"PATCH"' # Patch http request

---
---Make a http request.
---
---@param request_type requesttype
---@param url string
---@return string
function request(request_type, url) end

---
---Start fishing with a bait.
---
---@param item_id number
function startFishing(item_id) end

---
---Stop current fishing task.
---
function stopFishing() end