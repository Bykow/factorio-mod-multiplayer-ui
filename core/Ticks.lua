Ticks = {
    classname = "ChlewTicks",
}

-- Format:
--   {d} - days
--   {H} - hour all
--   {h} - rest from days
--   {i} - minutes
--   {s} - seconds
-- Examples:
--   '{d}days {hh}:{ii}:{ss}'
function Ticks.format(ticks, format)
    format = format == nil and '{d}days {h}:{ii}:{ss}' or format
    local seconds = math.floor(ticks / 60)
    local minutes = math.floor(seconds / 60)
    local hours = math.floor(minutes / 60)
    local days = math.floor(hours / 24)

    format = format:gsub("{d}", days)
    format = format:gsub("{H}", hours)
    format = format:gsub("{HH}", string.format('%02d', hours))
    format = format:gsub("{h}", hours % 24)
    format = format:gsub("{hh}", string.format('%02d', hours % 24))
    format = format:gsub("{I}", minutes)
    format = format:gsub("{II}", string.format('%02d', minutes))
    format = format:gsub("{i}", minutes % 60)
    format = format:gsub("{ii}", string.format('%02d', minutes % 60))
    format = format:gsub("{S}", seconds)
    format = format:gsub("{SS}", string.format('%02d', seconds))
    format = format:gsub("{s}", seconds % 60)
    format = format:gsub("{ss}", string.format('%02d', seconds % 60))

    return format
end

function Ticks.smartFormat(ticks)
    local seconds = math.floor(ticks / 60)
    local minutes = math.floor(seconds / 60)
    local hours = math.floor(minutes / 60)
    local days = math.floor(hours / 24)

    if days > 0 then
        return Ticks.format(ticks, '{d}days {hh}:{ii}')
    end

    if hours > 0 then
        return Ticks.format(ticks, '{HH}:{ii}:{ss}')
    end

    if minutes > 0 then
        return Ticks.format(ticks, '{II}:{ss}')
    end

    return Ticks.format(ticks, '{s}')
end
