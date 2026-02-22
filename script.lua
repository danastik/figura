-- создание и выбор основного колеса

local mainPage = action_wheel:newPage()
local EyesPage = action_wheel:newPage()
local MouthPage = action_wheel:newPage()
local secondPage = action_wheel:newPage()
local ToggleEyes = action_wheel:newPage()
local ToggleMouth = action_wheel:newPage()
local Statistics = action_wheel:newPage()
local Iteractions = action_wheel:newPage()

action_wheel:setPage(mainPage)

-- переменные

sitAnimation = animations.model.sit

shying = models.model.root.Head.shying
shying2 = models.model.root.Head.shying2

eyes = models.model.root.Head.eye1
eyes1 = models.model.root.Head.eye2

mouth = models.model.root.Head.mouth
mouth1 = models.model.root.Head.mouth.mouth1
mouth2 = models.model.root.Head.mouth.mouth2
mouth3 = models.model.root.Head.mouth.mouth3
mouth4 = models.model.root.Head.mouth.mouth4
mouth5 = models.model.root.Head.mouth.mouth5
mouth6 = models.model.root.Head.mouth.mouth6
mouth7 = models.model.root.Head.mouth.mouth7

-- сортировка

local exampleKeybind = keybinds:newKeybind("example", "key.keyboard.y")

function exampleKeybind.press()
    action_wheel:isEnabled(true)
    log(action_wheel:isEnabled())
end

-- hello world
function events.entity_init()
    -- Скрывает шлем (текстуру брони на голове)
    vanilla_model.HELMET:setVisible(false)
    -- Если хочешь скрыть и сам предмет в руках/на голове (иногда нужно)
end

-- eyes = {}

mouthes = {mouth1,mouth2,mouth3,mouth4,mouth5,mouth6,mouth7}

-- функция отключения прошлой анимации

IsShocked = false
local current_animation = nil 

function check_if_animation_plays(playing_animation)
    if current_animation ~= nil then
        current_animation:stop()
    end
    
    if playing_animation ~= nil then
        playing_animation:play()
        current_animation = playing_animation    
    else
        current_animation = nil
    end
end

-- отключение видимости элементов при старте

shying:setVisible(false)
shying2:setVisible(false)

shying:setPrimaryRenderType("TRANSLUCENT")
shying2:setPrimaryRenderType("TRANSLUCENT")

-- модель запустилась

print("Model is fine")

-- функции переключения между страницами

function pings.NextPage()
    action_wheel:setPage(secondPage)
end

function pings.GoStatistics()
    action_wheel:setPage(Statistics)
end

function pings.GoToggleEyes()
    action_wheel:setPage(ToggleEyes)
end

function pings.GoToggleMouth()
    action_wheel:setPage(ToggleMouth)
end

function pings.Back()
    action_wheel:setPage(mainPage)
end

function pings.GoAction()
    action_wheel:setPage(Iteractions)
end

-- face1 = models.model.root.Head.eye1
-- face2 = models.model.root.Head.eye2
-- -- face3 = '3'

-- local faces = {face1, face2}

-- for _,face in ipairs(faces) do
--     face:setVisible(false)
-- end

-- функции анимаций

function pings.EyeRoll()
    local playing_animation = animations.model.eyeroll
    check_if_animation_plays(playing_animation)
    log("*You rolled your eyes")
end

function pings.EyesSurprised()
    local playing_animation = animations.model.eyes_surprised
    check_if_animation_plays(playing_animation)
    log("*You're surprised'")
end
    
function pings.Shy()
    shying:setVisible(true)
    shying2:setVisible(true)
    animations.model.shy:play()
    log("*You're shy'")
end

-- кнопки основной страницы

local action = mainPage:newAction()
    :title("Choose Eyes")
    :item("ender_eye")
    :hoverColor(1,0,1)
    :onLeftClick(pings.GoToggleEyes)

local action = mainPage:newAction()
    :title("Choose Mouth")
    :item("ender_eye")
    :hoverColor(1,0,1)
    :onLeftClick(pings.GoToggleMouth)

local action = mainPage:newAction()
    :title("Be Shy")
    :item("blue_orchid")
    :hoverColor(1,0,1)
    :onLeftClick(pings.Shy)

local action = mainPage:newAction()
    :title("Roll Eyes")
    :item("blue_orchid")
    :hoverColor(1,0,1)
    :onLeftClick(pings.EyeRoll)

local action = mainPage:newAction()
    :title("Animations")
    :item("blue_orchid")
    :hoverColor(1,0,1)
    :onLeftClick(pings.GoAction)

local action = mainPage:newAction()
    :title("Eyes Surprise")
    :item("blue_orchid")
    :hoverColor(1,0,1)
    :onLeftClick(pings.EyesSurprised)

local action = mainPage:newAction()
    :title("this stuff is tuff \n§8it will get you on next Page \n§5meow")
    :item("blue_orchid")
    :hoverColor(1,0,1)
    :onLeftClick(pings.NextPage)

local action = mainPage:newAction()
    :title("Statistics (coming soon)")
    :item("barrier")
    :hoverColor(1,0,1)
    :onLeftClick(pings.GoStatistics)

-- функции страницы ToggleEyes

function pings.beshock()
    if current_animation == animations.model.shock then
        current_animation:stop()
        local playing_animation = animations.model.beshock:setTime(0.21)
        check_if_animation_plays(playing_animation)
        log(current_animation)
        return
    end
    if current_animation == animations.model.beshock then
        local playing_animation = animations.model.shock
        check_if_animation_plays(playing_animation)
        log("nice, your eyes are shacking now!")
        log(current_animation)
    else 
        log("ho-ho-ho, no >:c")
        log(current_animation)
    end
end

function pings.shock()
    local playing_animation = animations.model.beshock
    check_if_animation_plays(playing_animation)
    -- IsShocked = true
    log("*You're shocked'")
end

local action = ToggleEyes:newAction()
    :title("Shocked")
    :item("ender_eye")
    :hoverColor(1,0,1)
    :onLeftClick(pings.shock)
    :onRightClick(pings.beshock)

local action = ToggleEyes:newAction()
    :title("Go Back")
    :item("barrier")
    :hoverColor(1,0,1)
    :onLeftClick(pings.Back)


-- функции страницы ToggleMouth

function pings.UwU()
    for _, mouth in ipairs(mouthes) do
        mouth:setVisible(true)
    end
    for _, mouth in ipairs(mouthes) do
        if mouth ~= mouth1 then
            mouth:setVisible(false)
        end
    end
end

function pings.sus()
    for _, mouth in ipairs(mouthes) do
        mouth:setVisible(true)
    end
    for _, mouth in ipairs(mouthes) do
        if mouth ~= mouth2 then
            mouth:setVisible(false)
        end
    end
end

function pings.flat()
    for _, mouth in ipairs(mouthes) do
        mouth:setVisible(true)
    end
    for _, mouth in ipairs(mouthes) do
        if mouth ~= mouth4 then
            mouth:setVisible(false)
        end
    end
end

function pings.smile()
    for _, mouth in ipairs(mouthes) do
        mouth:setVisible(true)
    end
    for _, mouth in ipairs(mouthes) do
        if mouth ~= mouth5 then
            mouth:setVisible(false)
        end
    end
end

function pings.frown()
    for _, mouth in ipairs(mouthes) do
        mouth:setVisible(true)
    end
    for _, mouth in ipairs(mouthes) do
        if mouth ~= mouth6 then
            mouth:setVisible(false)
        end
    end
end

function pings.wave()
    for _, mouth in ipairs(mouthes) do
        mouth:setVisible(true)
    end
    for _, mouth in ipairs(mouthes) do
        if mouth ~= mouth7 then
            mouth:setVisible(false)
        end
    end
end

function pings.empty()
    for _, mouth in ipairs(mouthes) do
        mouth:setVisible(true)
    end
    for _, mouth in ipairs(mouthes) do
        if mouth ~= mouth3 then
            mouth:setVisible(false)
        end
    end
end

-- функции Action

function pings.sitAction()
    local playing_animation = sitAnimation
    check_if_animation_plays(playing_animation)

    -- get block underneath the player, 
    -- centrelize player to block position for a not sitting on the air

    -- os.execute('python centrelize_player.py')
    log("*You're sitting!")
end

    

local action = ToggleMouth:newAction()
    :title("Empty")
    :item("ender_eye")
    :hoverColor(1,0,1)
    :onLeftClick(pings.empty)

local action = ToggleMouth:newAction()
    :title("UwU Mouth")
    :item("ender_eye")
    :hoverColor(1,0,1)
    :onLeftClick(pings.UwU)

local action = ToggleMouth:newAction()
    :title("Mouth2")
    :item("ender_eye")
    :hoverColor(1,0,1)
    :onLeftClick(pings.sus)

local action = ToggleMouth:newAction()
    :title("Flat")
    :item("ender_eye")
    :hoverColor(1,0,1)
    :onLeftClick(pings.flat)

local action = ToggleMouth:newAction()
    :title("Smile")
    :item("ender_eye")
    :hoverColor(1,0,1)
    :onLeftClick(pings.smile)

local action = ToggleMouth:newAction()
    :title("Frown")
    :item("ender_eye")
    :hoverColor(1,0,1)
    :onLeftClick(pings.frown)

local action = ToggleMouth:newAction()
    :title("Wavy")
    :item("ender_eye")
    :hoverColor(1,0,1)
    :onLeftClick(pings.wave)

local action = ToggleMouth:newAction()
    :title("Go Back")
    :item("barrier")
    :hoverColor(1,0,1)
    :onLeftClick(pings.Back)

-- кнопки второй страницы

local action = secondPage:newAction()
    :title("Back")
    :item("barrier")
    :hoverColor(1,0,1)
    :onLeftClick(pings.Back)
    
-- кнопки страницы Iteractions

local action = Iteractions:newAction()
    :title("Sit Iteractions")
    :item("blue_orchid")
    :hoverColor(1,0,1)
    :onLeftClick(pings.sitAction)