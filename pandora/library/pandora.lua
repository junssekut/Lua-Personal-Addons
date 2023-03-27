---@meta _

---
---### PANDORA BUILT-IN SECTION
---

---@alias captchastatus
---| '"Solved(Answer)"' # Captcha is solved
---| '"Wrong Answer"' # Tried to auto captcha but wrong answer
---| '"Couldn\'t Solve"' # Captcha is not solved at all

---@class Bot: _G
---@field public name string The bot name
---@field public world string The bot current world in uppercase
---@field public status string The bot current network status
---@field public x number The bot current world x pixel position
---@field public y number The bot current world y pixel position
---@field public slots number The bot backpack slots
---@field public level number The bot current level
---@field public captcha captchastatus The bot current captcha status

---@class Tile
---@field public fg number The tile foreground
---@field public bg number The tile background
---@field public data number The tile extra data, for example to check item id inside vend or check jammer enabled or not.
---@field public ready boolean The tile ready to harvest status if it's a tree
---@field public flags number Tile flags
---@field public extra number To check if tile is a fire, water, etc

---@class Object
---@field public id number The object item id
---@field public count number The object dropped count
---@field public x number The object current world x pixel position
---@field public y number The object current world y pixel position
---@field public oid number The object oid to collect them via packet

---@class Player
---@field public name string The player name without ticks
---@field public netid number The player net id inside the world TODO: Check validation type
---@field public userid number The player user id globally TODO: Check validation type
---@field public country string The player identification country
---@field public x number The player current world x pixel position
---@field public y number The player current world y pixel position

---@class Item
---@field public name string The item name
---@field public id number The item id
---@field public count number The item count

---@class WebhookData
---@field public url string Webhook url to send
---@field public username string Webhook username to send
---@field public content string Webhook content
---@field public avatar string Webhook avatar
---@field public embed string Embed(s) JSON
---@field public edit boolean Send PATCH or not

---@class RawPacket
---@field public type number Raw packet type
---@field public netid? number Raw packet net id data
---@field public flags? number Raw packet flags data
---@field public int_data? number Raw packet int_data
---@field public pos_x? number Raw packet position x data
---@field public pos_y? number Raw packet position y data
---@field public pos2_x? number Raw packet position 2 x data
---@field public pos2_y? number Raw packet position 2 y data
---@field public int_x? number Raw packet position x data
---@field public int_y? number Raw packet position y data

---@class Cloth
---@field public name string Cloth name
---@field public id number Cloth item id

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