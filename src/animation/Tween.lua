-- Adapted from https://github.com/EmmanuelOga/easing
-- Adapted from https://github.com/kikito/Tween.lua

local Tween = {}

-- private stuff
local function copyTables(destination, keysTable, valuesTable)
    valuesTable = valuesTable or keysTable
    local mt = getmetatable(keysTable)
    if mt and getmetatable(destination) == nil then
        setmetatable(destination, mt)
    end
    for k, v in pairs(keysTable) do
        if type(v) == 'table' then
            destination[k] = copyTables({}, v, valuesTable[k])
        else
            destination[k] = valuesTable[k]
        end
    end
    return destination
end

local function checkSubjectAndTargetRecursively(subject, target, path)
    path = path or {}
    local targetType, newPath
    for k, targetValue in pairs(target) do
        targetType, newPath = type(targetValue), copyTables({}, path)
        table.insert(newPath, tostring(k))
        if targetType == 'number' then
            assert(type(subject[k]) == 'number',
                "Parameter '" .. table.concat(newPath, '/') .. "' is missing from subject or isn't a number")
        elseif targetType == 'table' then
            checkSubjectAndTargetRecursively(subject[k], targetValue, newPath)
        else
            assert(targetType == 'number',
                "Parameter '" .. table.concat(newPath, '/') .. "' must be a number or table of numbers")
        end
    end
end

local function checkNewParams(duration, subject, target, easing)
    assert(type(duration) == 'number' and duration > 0, "duration must be a positive number. Was " .. tostring(duration))
    local tsubject = type(subject)
    assert(tsubject == 'table' or tsubject == 'userdata',
        "subject must be a table or userdata. Was " .. tostring(subject))
    assert(type(target) == 'table', "target must be a table. Was " .. tostring(target))
    assert(type(easing) == 'function', "easing must be a function. Was " .. tostring(easing))
    checkSubjectAndTargetRecursively(subject, target)
end

local function performEasingOnSubject(subject, target, initial, clock, duration, easing)
    local t, b, c, d
    for k, v in pairs(target) do
        if type(v) == 'table' then
            performEasingOnSubject(subject[k], v, initial[k], clock, duration, easing)
        else
            t, b, c, d = clock, initial[k], v - initial[k], duration
            subject[k] = easing(t, b, c, d)
        end
    end
end

-- Tween methods
function Tween:set(clock)
    assert(type(clock) == 'number', "clock must be a positive number or 0")

    self.initial = self.initial or copyTables({}, self.target, self.subject)
    self.clock = clock

    if self.clock <= 0 then

        self.clock = 0
        copyTables(self.subject, self.initial)

    elseif self.clock >= self.duration then -- the Tween has expired

        self.clock = self.duration
        copyTables(self.subject, self.target)

    else

        performEasingOnSubject(self.subject, self.target, self.initial, self.clock, self.duration, self.easing)

    end

    return self.clock >= self.duration
end

function Tween:update(dt)
    assert(type(dt) == 'number', "dt must be a number")
    if self.clock == self.duration then
        self.state = "stopped"
    else
        self.state = "continued"
    end
    return self:set(self.clock + dt)
end

function Tween:new(duration, subject, target, easing)
    local tween = {
        easing = Easing,
        state = "stopped"
    }
    easing = Easing.getEasingFunction(easing)
    checkNewParams(duration, subject, target, easing)
    tween.duration = duration
    tween.subject = subject
    tween.target = target
    tween.easing = easing
    tween.clock = 0
    setmetatable(tween, self)
    self.__index = self
    return tween
end


return Tween
