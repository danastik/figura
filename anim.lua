vanilla_model.PLAYER:setVisible(false)
-- переменная глаз
eyes = models.model.root.Head.eye1
eyes1 = models.model.root.Head.eye2

-- eyes:setVisible(false)


eyes:setPrimaryRenderType("EMISSIVE")
-- eyes:setSecondaryRenderType("GLINT2")

eyes1:setPrimaryRenderType("EMISSIVE")
-- eyes1:setSecondaryRenderType("GLINT2")

-- имя
nameplate.ALL:setText("§d§ DANASTIK :@deni:")

-- функция обнаружения разных поз
function events.tick()
    local crouching = player:getPose() == "CROUCHING"
    local sprinting = player:isSprinting()
    local blocking = player:isBlocking()
    local fishing = player:isFishing()
    local sleeping = player:getPose() == "SLEEPING"
    local swimming = player:getPose() == "SWIMMING"
    local flying = player:getPose() == "FALL_FLYING"

    animations.model.ears:setPlaying(not sprinting and not swimming)

end