local utils = require "mp.utils"

local cover_filenames = { "folder.jpg", "folder.png", "front.jpg", "front.png",
                          "Folder.jpg", "Folder.png", "Front.jpg", "Front.png",
                          "cover.png", "cover.jpg", "cover.jpeg",
                          "Cover.png", "Cover.jpg", "Cover.jpeg",
                          "Art.jpg", "art.jpg", "Art.png", "Art.jpg",
                          "Album.jpg", "album.jpg", "Album.png", "album.png" }

function notify(summary, body, options, position_percent)
    if summary == "" and body == "" then
        return
    end

    local option_args = {}
    for key, value in pairs(options or {}) do
        table.insert(option_args, string.format("--%s=%s", key, value))
    end

    return mp.command_native({
        "run",
        "dunstify",
        "-a",
        "ignore",
        "-h",
        "string:x-dunst-stack-tag:player",
        "-h",
        string.format("int:value:%d", position_percent),
        unpack(option_args),
        summary,
        body,
    })
end

function escape_pango_markup(str)
    return string.gsub(str, "([\"'<>&])", function (char)
        return string.format("&#%d;", string.byte(char))
    end)
end

function notify_media(title, origin, thumbnail, position_percent)
    return notify(escape_pango_markup(title), origin, {
        -- For some inscrutable reason, GNOME 3.24.2
        -- nondeterministically fails to pick up the notification icon
        -- if either of these two parameters are present.
        --
        -- urgency = "low",
        -- ["app-name"] = "mpv",

        -- ...and this one makes notifications nondeterministically
        -- fail to appear altogether.
        --
        -- hint = "string:desktop-entry:mpv",

        icon = thumbnail or "mpv",
    }, position_percent)
end

function file_exists(path)
    local info, _ = utils.file_info(path)
    return info ~= nil
end

function find_cover(dir)
    -- make dir an absolute path
    if dir[1] ~= "/" then
        dir = utils.join_path(utils.getcwd(), dir)
    end

    --local video = mp.get_property("video")
    --if video ~= "no" then
    --    local path = mp.get_property_native("path")
    --    local cmd = string.format("ffprobe -i '%s' -show_streams -select_streams v -v quiet", path)
    --    local handle = io.popen(cmd)
    --    local result = handle:read("*a")
    --    handle:close()

    --    local position = mp.get_property("playback-time")

    --    if result ~= "" then
    --        local art_file = "/tmp/cover.png"
    --        local cmd = string.format(
    --            "ffmpeg -hide_banner -stats -v panic -ss %s -y -i '%s' -q:v 2 -f image2 -vframes 1 -filter:v scale='-1:120' '%s'", position, path, art_file)
    --        os.execute(cmd)
    --        return art_file
    --    end
    --end

    for _, file in ipairs(cover_filenames) do
        local path = utils.join_path(dir, file)
        if file_exists(path) then
            return path
        end
    end

    return nil
end

function notify_current_media()
    local video = mp.get_property("video")
    if video ~= "no" then
        return
    end

    local path = mp.get_property_native("path")
    if path == nil then
        return
    end

    local dir, file = utils.split_path(path)

    -- TODO: handle embedded covers and videos?
    -- potential options: mpv's take_screenshot, ffprobe/ffmpeg, ...
    -- hooking off existing desktop thumbnails would be good too
    local thumbnail = find_cover(dir)

    local title = mp.get_property_native("media-title") or file
    local origin = dir
    -- local position_percent = 0
    local position = mp.get_property("playback-time")
    local duration = mp.get_property("duration")
    local position_percent = math.floor(100 * (position / duration))

    local metadata = mp.get_property_native("metadata")
    if metadata then
        function tag(name)
            return metadata[string.upper(name)] or metadata[name]
        end

        title = tag("title") or title
        origin = tag("artist_credit") or tag("artist") or ""
        local is_pause = mp.get_property("pause")
        if is_pause == "yes" then
            origin = string.format("Paused : %s", origin)
        else
            origin = string.format("Playing: %s", origin)
        end

        local album = tag("album")
        if album then
            origin = string.format("%s — %s", origin, album)
        end

        local year = tag("original_year") or tag("year")
        if year then
            origin = string.format("%s (%s)", origin, year)
        end
    end

    return notify_media(title, origin, thumbnail, position_percent)
end

function notify_current_media_p(_, _)
    notify_current_media()
end

mp.register_event("file-loaded", notify_current_media)
mp.register_event("seek", notify_current_media)
mp.observe_property("pause", "bool", notify_current_media_p)
