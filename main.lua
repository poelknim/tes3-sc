-- ============================================================================
-- BOLONG-HUB v4.3.7 - VERSI SANGAT TERBACA (STATIC DEOBFUSCATION)
-- ============================================================================
-- Tujuan file ini: menerjemahkan struktur dan identifier hasil obfuscation
-- menjadi nama yang dapat dipahami manusia. Payload TIDAK dijalankan saat
-- proses pembersihan. String UI asli dipertahankan agar tidak mengubah perilaku.
--
-- Catatan penting:
--   1) Nama seperti value/player/rootPart adalah inferensi berbasis konteks.
--   2) Identifier yang tidak dapat dipastikan diberi nama internalVarXXXX.
--   3) Kode remote/executor tetap dipertahankan dan TIDAK dieksekusi.
--   4) Versi ini ditujukan untuk membaca dan mengaudit logika, bukan sebagai
--      jaminan bahwa hasil rename identik secara semantik dengan sumber asli.
-- ============================================================================

-- [MASUK] Payload utama setelah wrapper obfuscation dibuka
local function BolongHub()

        local Players             = game:GetService("Players")
        local RunService          = game:GetService("RunService")
        local UserInputService    = game:GetService("UserInputService")
        local VirtualInputManager = game:GetService("VirtualInputManager")
        local VirtualUser         = game:GetService("VirtualUser")
        local GuiService          = game:GetService("GuiService")
        local Lighting            = game:GetService("Lighting")
        local Stats               = game:GetService("Stats")
        local WorkspaceService      = game:GetService("Workspace")
        local ReplicatedStorage   = game:GetService("ReplicatedStorage")
        local CollectionService   = game:GetService("CollectionService")

        local LocalPlayer = Players.LocalPlayer
        local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

        local var_player_9085  = math.rad(30)
        local var_playerGui_6790  = math.rad(45)
        local var_playerGui_106d  = math.rad(42)
        local var_playerGui_8190  = math.rad(28)
        local var_playerGui_2578  = math.rad(18)
        local var_error_eb01  = math.rad(72)
        local var_distance_2323 = -0.95
        local var_distance_274c =  0.95
        local var_distance_ca0a = WorkspaceService.Gravity

        local var_predictedPosition_74a8        = 2
        local var_predictedPosition_d6dc   = 1.5
        local var_color_d0dd         = 0.15
        local var_color_600b      = (3.0)

        local UI = loadstring(game.HttpGet(game,"https://raw.githubusercontent.com/RillBoys/bolong.catui/refs/heads/main/b0lngUi.lua"))()

        local VERSION = "v4.3.7"
        local NOTIFY_COLOR = Color3.fromRGB(255, 255, 255)
        -- [UI] Fungsi pembuat notifikasi
        local function Notify(var_button_a241, content, delay)
            UI.MakeNotify(UI,{
                Title = var_button_a241 or "BOLONG-HUB",
                Description = "Info",
                Content = content or "",
                Color = NOTIFY_COLOR,
                Time = 0.4,
                Delay = delay or 2,
            })
        end

        local Config = {
            cfg_showName_58b7=false, cfg_showName_435d=true, cfg_enableSCPESP_f2ce=true,
            cfg_showName_957b=Color3.fromRGB(255,60,(60.0)),
            cfg_showName_4ad0=false, cfg_showName_4d79=true, cfg_enableSCPESP_dd03=true,
            cfg_showName_a907=Color3.fromRGB(60,(200.0),255),
            maxDistance=500, cfg_showName_99cf=500, cfg_showName_addf=500, fillTransparency=0.6,
            cfg_showName_ff90=false, cfg_showName_75a4=true, cfg_showOutline_7bb8=500,
            cfg_showName_673f=Color3.fromRGB(200,60,255),
            cfg_enableKillerWarn_fa0d=false, cameraZoomValue=(1000.0),
            cfg_showPerformanceWindow_3f44=false, cfg_showSpectatorCounter_d192=5.0,
            cfg_maxCameraZoom_a6e2=false, cfg_stiffness_28c2=((16.0)/(9.0)),
            cfg_fullbright_2910=false, warnDist1=60, warnDist2=40, warnDist3=20,
            cfg_showName_8138=70, cfg_showName_9982=false,
            cfg_antiLoopWindow_9682=true, cfg_autoDropAllPallets_f46e="Instant",
            cfg_enableKillerPerksInfo_53d3=false,
            cfg_survivorESPDistance_e369=false,
            aimLockEnabled=false, aimLockTargetType="Zombie",
            aimLockMaxDistance=700, aimLockCameraSmoothness=1, aimLockMode="Always Lock",
            aimLockPart="Torso",
            hitboxModifierEnabled=false, survivorHitboxPercent=100, killerHitboxPercent=(100.0),
            hitboxEspEnabled=false, survivorHitboxColor=Color3.fromRGB((0.0),(255.0),120),
            killerHitboxColor=Color3.fromRGB(255,60,60), hitboxFillTransparency=0.5, hitboxEspOutlineOnly=false,
            cfg_showGeneratorInfo_9e74=false, cfg_outlineOnly_2e99=false, cfg_showGeneratorInfo_8492=Color3.fromRGB((200.0),(100.0),(0.0)),
            cfg_showEquippedItem_e752 = false, cfg_espWindow_51ce = Color3.fromRGB(255, 223, (0.0)),
            cfg_espGenerator_21a5=false, cfg_espHook_ce98=Color3.fromRGB(53,(189.0),166),
            cfg_progressGen_4bd4=false, cfg_generatorColor_f209=Color3.fromRGB(252,(116.0),116),
            cfg_showGeneratorInfo_4daa=false, cfg_palletColor_6b93=Color3.fromRGB((255.0),255,255),
            cameraVeilEnabled=false, cameraVeilSnaplineEnabled=false, cameraVeilMaxDistance=(175.0),
            cameraVeilSmoothness=1, cameraVeilSpearSpeed=220, cameraVeilGravityMult=0.5,
            cameraVeilTargetType="Survivor",
            cfg_toggleKeybind_3cc7=false,
            cfg_toggleKeybind_cb2f=false,
            silentAimFovRadius = (150.0),
            silentAimTargetType = "Killer",
            silentAimAutoPrediction = true,
            silentAimAdaptiveDamping = true,
            spearFovRadius = 150,
            spearAutoPrediction = true,
            spearAntiStrafing = true,

            spearPingLead = 1.0,
            spearSnaplineMaxDistance = (400.0),
            spearShowNameStuds = true,
            cfg_boostMultiplier_5533=false, cfg_countSpeedPerks_b7f3=18,
            cfg_smoothness_d9e8 = false,
            cfg_scpESPDistance_66fd=false,
            cfg_stretchedRes_63a4 = false,
            cfg_enableMoonwalkMobileGUI_29e3 = false,
            cfg_autoCrouch_7b00 = "Classic",
            cfg_autoCrouch_bdbb = 0.55,
            cfg_crouchRadiusStud_b8d0 = 6,
            cfg_enableMayersNoCooldown_b604 = false,
            cfg_moonwalkMode_1943 = false,
            cfg_moonwalkMode_32f7 = false,
            cfg_swaySpeed_4309 = (15.0),
            cfg_pcLockForwardKey_89cf = false,
            cfg_deactivatePower_e908 = false,
            cfg_antiFlashlightBlind_774e = false,
            cfg_gateColor_fa96 = false,
        }

        local State = {
            espObjects     = {},
            outlineObjects = {},
            playerRoles    = {},
            playerTeamConns = {},
            playerCharConns = {},
            state_espHook_4896 = { Generators={}, Pallets={}, Hooks={}, Gates={} },
            var_descendant_b8d3 = {},
            state_windowColor_5aaf = {},
            var_descendant_ada3 = {},
            var_descendant_ef74 = {},
            var_descendant_61c2 = (1.0),
            var_playerGui_4d72=nil, var_playerGui_4d80=nil,
            var_descendant_18df = false,
            state_espWindow_920d = {},
            state_antiFallSlow_dab5=false, SpeedBoost=false, state_showGenBoostButton_f0c8=0.3, state_showGenBoostButton_f398=true, state_autoGenerator_e4d4=false, safeModeSpeed=true, state_speedBoost_2538=true, state_genboostKeybind_a660=false,
            var_rootPart_b267=(0.0), scpEspObjects={},
            autoParryEnabled    = false,
            parryRadiusEspEnabled  = false,
            parryRadius     = (10.0),
            var_originalValue_a386       = (0.0),
            state_unhookYourself_bfd8     = {},
            aimStrictness       = 0.1,
            autoParryAutoFace = true,
            autoParryFaceSmoothness = 14,
            autoParryFaceLead = 0.08,
            var_originalValue_b002  = (0.0),
            state_unhookYourself_d58e      = {},
            state_unhookYourself_c84b = {},
            killerCharacters = {},
            var_head_dacf=false,
            var_humanoid_4458=false, var_humanoid_ffa8=nil,
            hitboxOriginalSizes = {},
            hitboxEspObjects = {},
            var_originalValue_4383 = false,
            var_originalValue_506f = (0.0),
            var_originalValue_20f2 = 0,
            var_originalValue_9705 = false,
            var_originalValue_1103 = nil,
            var_distance_b26a = nil,
            cursorBackupIcon = nil,
            cursorBackupBehavior = nil,
            var_connection_e47c = nil,
            var_connection_1cb6 = nil,
            var_connection_a95a = nil,
            var_connection_640a = nil,
            var_name_d998 = nil,
            var_player_609f = false,
            var_player_2b0c = {},
            pnameNameConns = {},
            pnameSlotConns = {},
            var_descendant_cffb = nil,
            var_player_5d54 = nil,
            var_userId_f2d0 = nil,
            var_head_ef35 = nil,
            var_playerGui_4fab = nil,
            var_userId_b305 = false,
            avatarUiSlotConns = {},
            var_playerGui_4092 = nil,
            var_connection_c519 = nil,
            var_connection_6698 = false,
            var_rootPart_23f6 = nil, var_rootPart_1d78 = false, var_connection_dd8d = false, var_connection_eef0 = false,
            var_position_9df3 = nil, var_uiCorner_8f5b = nil, state_maxDistance_7c1c = nil, state_maxDistance_b5b0 = nil,
            var_vector_fe4d = nil, var_distance_dfbb = nil,
            var_target_a7bf = 0, var_success_8f30 = (-99.0), var_success_fbc8 = false, var_success_7a54 = (-99.0),
            var_target_8d7a = nil, var_predictedPosition_9437 = (-99.0), var_predictedPosition_ad18 = nil, var_predictedPosition_66d8 = nil,
            var_predictedPosition_b98d = nil, var_predictedPosition_1a91 = nil,
            var_descendant_9c1a = {}, var_connection_2821 = nil, var_connection_47dd = nil, var_descendant_c27f = nil,
            var_descendant_b0c2 = nil, var_connection_238b = {}, CV_RenderStepName = "BOLONGHUB_CameraVeil",
            skipEndScreenConns = {},
            state_hookColor_83ac = false,
            state_gateColor_965a = false,
            silentAimEnabled     = false,
            var_vector_2d26      = nil,
            var_buffer_e700  = nil,
            var_vector_e9ab   = Vector3.new((0.0),(0.0),(0.0)),
            var_vector_abac = Vector3.new(0,(0.0),0),
            var_rootPart_7d5a     = {},
            var_humanoid_89e9   = nil,
            var_vector_2cd6 = nil,
            var_rootPart_7d39    = nil,
            silentAimLaserEspEnabled      = true,
            var_buffer_2078         = false,
            var_vector_43f4     = nil,
            var_vector_bf76     = nil,
            var_basePart_5701            = nil,
            silentAimFovCircleEnabled  = false,
            silentSpearEnabled = false,
            var_predictedPosition_a992 = nil,
            var_predictedPosition_615c = Vector3.new((0.0),0,0),
            var_predictedPosition_ff6d = nil,
            spearAimIndicatorEnabled = false,
            spearFovCircleEnabled = false,
            var_connection_2a07 = false,
            var_connection_67ee = nil,
            state_unhookYourself_bc03 = 142.5,
            state_unhookYourself_1454 = 0.5,
            var_predictionResult_36d0 = 1.0,
            SPEAR_SNAPLINE = {
                enabled = false, var_humanoid_fb34 = false, var_humanoid_bb46 = nil, var_success_ae01 = "",
                var_position_61e3 = math.huge, lockPulse = 0,
            },
            var_uiCorner_8eda = nil,
            var_rootPart_9387 = nil, var_uiCorner_3eed = nil, var_backgroundTransparency_c521 = nil, var_viewportSize_69bb = nil, var_uiCorner_db85 = nil,
            var_uiCorner_3435 = nil, var_backgroundTransparency_b0a6 = nil, var_uiCorner_ca7b = nil, var_uiCorner_8bbb = nil,
            var_success_f48f=false,
            autoCrouchActiveSlashers={},
            autoCrouchAnimConns={},
            _hookedMobButtons = {},
            _hookedSlasherButtons = {},
            var_unknownValue_0053_6355 = 0,
            var_unknownValue_0001_6fb8 = 0,
            var_originalValue_ddfb = false,
            state_flowstateCooldownS_9e95 = false,
            movConns = { antiFall = nil, noSlow = nil },
            var_connection_81db = nil,
            var_connection_fe5a = nil,
            var_connection_b6c9 = nil,
            var_connection_cb5a = nil,
            var_rootPart_e75d = nil,
            var_rootPart_3ecf = 0,
            var_rootPart_43ac = nil,
            ghostGateOriginals = {},
            state_selectMaskPower_a0a0 = false,
            var_player_e1db = nil,
            var_player_6e04 = nil,
            var_connection_cb0c = false,
            var_buffer_511f = "Unknown",
            var_backgroundTransparency_3fa4 = nil,
            var_remoteEvent_cd2c = nil,
            state_pauseWhenCrouching_1ac5 = false,
            state_pauseWhenCrouching_82c7 = nil,
            var_descendant_5fcf = 0,
            var_descendant_dc63 = false,
            state_safeModeNoSlowdown_1609 = (0.0),
            state_moonwalkMode_6f50 = false,
            state_enableMoonwalkMobileGUI_4fa3 = false,
            state_safeModeNoSlowdown_14dc = nil,

            var_vector_4df7 = 0,
            var_unknownValue_0011_6829 = 1,
            var_unknownValue_0066_259d = 0,
            fastVaultPoints = {},
            fastVaultLastScan = 0,
            var_basePart_25b0 = 0,
            var_basePart_f944 = 0,

            var_player_a579 = true,
            var_player_1075 = {},
            hookCounterAttrConns = {},
            var_player_d43b = nil,
            var_player_ae6d = nil,
            var_player_4319 = nil,

            var_player_4cf2=false,
            state_potatoGraphics_4818=250,
            stunTimerBoards={},
            stunTimerForced={},
            stunTimerAnim={},
            stunTimerConns={},
            var_success_d31c=false,
            stunTimerLens={},

            flashlightAimlockEnabled=false,
            flashlightAimlockLocked=false,
            flashlightAimlockSmoothness=0.35,

            var_connection_e78f=false,
            var_connection_9ebe=nil,
            var_success_187c=false,
            var_connection_eb22=nil,
            var_success_c819=0,
            var_remote_e566=0,
            var_success_c371=0,

            state_fireLeapHidden_d47b=false,
            state_fireLeapHidden_6108=1.0,
            var_connection_cf5f=(0.0),
            var_remoteEvent_1d7c=nil,

            state_hitboxKillerColor_98d5=false,
            state_fireCorruptAbyss_bb68=false,
            var_rootPart_2ef6=false,
            var_descendant_1903={},
            var_descendant_40fb=nil,
            var_descendant_6b69=nil,
            var_connection_2710={},
            var_connection_8b3c=nil,

            var_player_edbf=false,
            var_player_5f10=nil,
            specConns={},
            specDetected={},
            specStreamTimes={},

            state_gateColor_339a = false,
            potatoProcessed = {},
            potatoPallets = {},
            var_descendant_eaf3 = {},
            var_descendant_80a1 = nil,
            var_descendant_f24e = (1.0),
            var_success_f3dd = {},
            var_success_12b6 = (1.0),
            var_success_4a66 = 0,
            var_success_8270 = {},
            var_player_f65b = {},
            var_originalValue_3fb0 = {},
            var_success_7811 = {},
            var_endScreen_73dc = nil,
            var_success_2056 = nil,
            var_success_ee37 = nil,
            var_player_7669 = {},

            var_connection_4945=false,
        }

        local var_buffer_9fb0 = {
            ["Adrenaline Shot"] = "rbxassetid://135388781922226",
            ["Bandage"] = "rbxassetid://97791520639443",
            ["Flashlight"] = "rbxassetid://103299939715311",
            ["Gate"] = "rbxassetid://131249244284700",
            ["Holy Water"] = (function() if var_section_a5d6 and buffer then local _bf=buffer.create(27) local _by={114,98,120,97,115,115,101,116,105,100,58,47,47,56,54,49,51,48,50,48,56,54,49,52,49,52,51} for _i=1,#_by do buffer.writeu8(_bf,_i-1,_by[_i]) end local _s={} for _i=1,#_by do _s[_i]=string.char(buffer.readu8(_bf,_i-1)) end return table.concat(_s) else local _by={114,98,120,97,115,115,101,116,105,100,58,47,47,56,54,49,51,48,50,48,56,54,49,52,49,52,51} local _s={} for _i=1,#_by do _s[_i]=string.char(_by[_i]) end return table.concat(_s) end end)(),
            ["Motion Tracker"] = "rbxassetid://92303584765773",
            ["Parrying Dagger"] = "rbxassetid://76822757630703",
            ["Riot Shield"] = "rbxassetid://95718705901699",
            ["Shadow Clone"] = "rbxassetid://134088840518889",
            ["Twist of Fate"] = "rbxassetid://98397448432071",
            ["WaxBound Candle"] = "rbxassetid://110413686590821",
        }

        local function GetItemAssetId(var_originalValue_4ef4)
            if not var_originalValue_4ef4 or type(var_originalValue_4ef4) ~= "string" then return nil end

            var_originalValue_4ef4 = var_originalValue_4ef4.match(var_originalValue_4ef4,"^%s*(.-)%s*$")

            local var_rootPart_dc09 = var_buffer_9fb0[var_originalValue_4ef4]
            if var_rootPart_dc09 then return var_rootPart_dc09 end


            for name, id in pairs(var_buffer_9fb0) do
                if name.lower(name) == var_originalValue_4ef4.lower(var_originalValue_4ef4) then
                    return id
                end
            end
            return nil
        end

        local ESP_LAYER_ORDER = 17
        local SUPPORTED_UI_IDS = { "BOLONGHUB" }

        local ESPFolder = Instance.new("Folder")
        ESPFolder.Name = "__BolongESP__"
        ESPFolder.Parent = workspace

        local function EnsureESPFolder()
            if ESPFolder and ESPFolder.Parent then return ESPFolder end
            ESPFolder = Instance.new("Folder")
            ESPFolder.Name = "__BolongESP__"
            ESPFolder.Parent = workspace
            return ESPFolder
        end

        local tasks = {}

        local function RegisterTask(name, interval, fn)
            tasks[#tasks + 1] = { name=name, interval=interval, timer=0, fn=fn }
        end

        local noCooldownEnabled = false
        local originalTaskDelay

        local var_cachedValue_dfd2 = { [25] = true, [17] = true, [30] = true, [67.8] = true, [2] = true, [4] = true, [0.25] = true, [70] = true, [0.65] = true }

        local var_cachedValue_1cf1 = { [1] = true, [(10.0)] = true }

        local cachedKillerType, cachedKillerTime = nil, 0
        local function GetKillerType()
            local var_now_2834 = tick()
            if var_now_2834 - cachedKillerTime < 2 and cachedKillerType ~= nil then
                return cachedKillerType
            end
            local detectedKiller = nil
            pcall(function()
                local var_attributeValue_a33a = LocalPlayer.GetAttribute(LocalPlayer,"SelectedKiller")
                local name = tostring(var_attributeValue_a33a or ""):lower()
                if name.find(name,"hidden") then
                    detectedKiller = "hidden"
                elseif name.find(name,"mayers") or name.find(name,"stalker") or name.find(name,"michael") then
                    detectedKiller = "mayers"
                end
                if not detectedKiller then
                    local var_replicatedStorage_2561 = game:GetService("ReplicatedStorage")
                    local KillerRemotes = var_replicatedStorage_2561.FindFirstChild(var_replicatedStorage_2561,"Remotes") and var_replicatedStorage_2561.Remotes.FindFirstChild(var_replicatedStorage_2561.Remotes,"Killers")
                    if KillerRemotes then
                        if KillerRemotes.FindFirstChild(KillerRemotes,"Stalker") then detectedKiller = "mayers"
                        elseif KillerRemotes.FindFirstChild(KillerRemotes,"Hidden") then detectedKiller = "hidden"
                        end
                    end
                end
            end)
            cachedKillerType, cachedKillerTime = detectedKiller, var_now_2834
            return detectedKiller
        end

        -- [KILLER] Hook No Cooldown: mencegat task.delay untuk durasi tertentu
        local function EnableNoCooldownHook()
            if originalTaskDelay then return end
            if not hookfunction then
                Notify("No Cooldown", "Executor tidak support hookfunction", 2)
                return
            end
            local var_success_abb9, err = pcall(function()
                local var_originalValue_3a57 = newcclosure or function(var_backgroundTransparency_fed2) return var_backgroundTransparency_fed2 end
                originalTaskDelay = hookfunction(task.delay, var_originalValue_3a57(function(delayTime, callback)

                    if not originalTaskDelay then
                        return task.delay and task.delay(0, callback) or task.spawn(callback)
                    end
                    if not noCooldownEnabled then
                        return originalTaskDelay(delayTime, callback)
                    end
                    if var_cachedValue_dfd2[delayTime] then
                        return originalTaskDelay(0, callback)
                    end


                    if var_cachedValue_1cf1[delayTime] and GetKillerType() == "mayers" then
                        return originalTaskDelay(0, callback)
                    end
                    return originalTaskDelay(delayTime, callback)
                end))
            end)
            if not var_success_abb9 then
                Notify("No Cooldown", "Gagal hook task.delay: " .. tostring(err), (2.0))
                originalTaskDelay = nil
            end
        end

        -- [KILLER] Melepas hook No Cooldown
        local function DisableNoCooldownHook()
            if originalTaskDelay then
                if restorefunction then
                    pcall(restorefunction, task.delay)
                end
                originalTaskDelay = nil
            end
        end

        local function GetPlayerRole(player)
            return State.playerRoles[player] or "survivor"
        end

        local function UpdatePlayerRole(player)
            local var_success_abb9, teamName = pcall(function() return player.Team and player.Team.Name.lower(player.Team.Name) or "" end)
            State.playerRoles[player] = (var_success_abb9 and teamName.find(teamName,"killer")) and "killer" or "survivor"
        end

        local RunMayersMobileAction, GetNearestSurvivorForMayers, StartMayersMobileHook, StopMayersMobileHook
        do
                function GetNearestSurvivorForMayers(maxDist)
                    maxDist = maxDist or (5.0)
                    local char = LocalPlayer.Character
                    local var_rootPart_2226 = char and char.FindFirstChild(char,"HumanoidRootPart")
                    if not var_rootPart_2226 then return nil, math.huge end
                    local var_player_d377, var_nearestDistance_7fa2 = nil, maxDist + 0.01
                    for _, var_player_2e5f in ipairs(Players.GetPlayers(Players)) do
                        if var_player_2e5f ~= LocalPlayer and var_player_2e5f.Character then
                            local var_targetRootPart_cdca = var_player_2e5f.Character.FindFirstChild(var_player_2e5f.Character,"HumanoidRootPart")
                            local var_humanoid_3937 = var_player_2e5f.Character.FindFirstChildOfClass(var_player_2e5f.Character,"Humanoid")
                            if var_targetRootPart_cdca and var_humanoid_3937 and var_humanoid_3937.Health > 0 then
                                local var_distance_8193 = (var_targetRootPart_cdca.Position - var_rootPart_2226.Position).Magnitude
                                if var_distance_8193 < var_nearestDistance_7fa2 then var_player_d377, var_nearestDistance_7fa2 = var_player_2e5f.Character, var_distance_8193 end
                            end
                        end
                    end
                    return var_player_d377, var_nearestDistance_7fa2
                end

                function RunMayersMobileAction()
                    if not (State.state_hitboxKillerColor_98d5 or noCooldownEnabled) then return end
                    if GetKillerType() ~= "mayers" then return end
                    if State.var_rootPart_2ef6 then return end
                    local char = LocalPlayer.Character
                    if not char then return end
                    local var_rootPart_2226 = char.FindFirstChild(char,"HumanoidRootPart")
                    local var_humanoid_3937 = char.FindFirstChildOfClass(char,"Humanoid")
                    if not (var_rootPart_2226 and var_humanoid_3937 and var_humanoid_3937.Health > 0) then return end
                    State.var_rootPart_2ef6 = true
                    task.delay(0.35, function() State.var_rootPart_2ef6 = false end)
                    local var_animationId_b5b6 = nil
                    pcall(function()
                        local var_animationId_3e25 = Instance.new("Animation")
                        var_animationId_3e25.AnimationId = "rbxassetid://77477445889320"
                        local var_animationId_f037 = var_humanoid_3937.FindFirstChildOfClass(var_humanoid_3937,"Animator") or var_humanoid_3937
                        var_animationId_b5b6 = var_animationId_f037.LoadAnimation(var_animationId_f037,var_animationId_3e25)
                        var_animationId_b5b6.Priority = Enum.AnimationPriority.Action
                        var_animationId_b5b6.Play(var_animationId_b5b6)
                    end)
                    local var_replicatedStorage_2561 = game:GetService("ReplicatedStorage")
                    pcall(function() var_replicatedStorage_2561.Remotes.SoundPlayer.FireServer(var_replicatedStorage_2561.Remotes.SoundPlayer,"132736711620405", var_rootPart_2226, 0.3, (70.0)) end)
                    pcall(function() var_replicatedStorage_2561.Remotes.Attacks.BasicAttack.FireServer(var_replicatedStorage_2561.Remotes.Attacks.BasicAttack,true) end)
                    pcall(function()
                        local var_player_b518 = var_replicatedStorage_2561.FindFirstChild(var_replicatedStorage_2561,"Remotes") and var_replicatedStorage_2561.Remotes.FindFirstChild(var_replicatedStorage_2561.Remotes,"Killers") and var_replicatedStorage_2561.Remotes.Killers.FindFirstChild(var_replicatedStorage_2561.Remotes.Killers,"Stalker") and var_replicatedStorage_2561.Remotes.Killers.Stalker.FindFirstChild(var_replicatedStorage_2561.Remotes.Killers.Stalker,"ConsumeReady")
                        if var_player_b518 then var_player_b518.FireServer(var_player_b518) end
                    end)
                    task.spawn(function()
                        local var_humanoid_db43 = tick()
                        local var_child_ae3b = false
                        while tick() - var_humanoid_db43 < 2 and not var_child_ae3b do
                            RunService.Heartbeat.Wait(RunService.Heartbeat)
                            local target, dist = GetNearestSurvivorForMayers(5)
                            if target and dist <= 5 then
                                pcall(function()
                                    local var_remote_b96e = var_replicatedStorage_2561.Remotes.Killers.Stalker.FindFirstChild(var_replicatedStorage_2561.Remotes.Killers.Stalker,"grab")
                                    if var_remote_b96e then var_remote_b96e.FireServer(var_remote_b96e,target) end
                                end)
                                if var_animationId_b5b6 then pcall(function() var_animationId_b5b6.Stop(var_animationId_b5b6,0.1) end) end
                                var_child_ae3b = true
                                break
                            end
                        end
                        if var_animationId_b5b6 then pcall(function() var_animationId_b5b6.Stop(var_animationId_b5b6,0.1) end) end
                    end)
                end

                RegisterTask("MayersStalkWhileMoving", 0.2, function()
                    if not State.state_fireCorruptAbyss_bb68 then return end
                    pcall(function()
                        local var_replicatedStorage_2561 = game:GetService("ReplicatedStorage")
                        local var_player_c1cb = var_replicatedStorage_2561.FindFirstChild(var_replicatedStorage_2561,"Remotes") and var_replicatedStorage_2561.Remotes.FindFirstChild(var_replicatedStorage_2561.Remotes,"Killers") and var_replicatedStorage_2561.Remotes.Killers.FindFirstChild(var_replicatedStorage_2561.Remotes.Killers,"Stalker")
                        local var_player_b518 = var_player_c1cb and var_player_c1cb.FindFirstChild(var_player_c1cb,"StartStalking")
                        if not var_player_b518 then return end
                        for _, var_player_2e5f in ipairs(Players.GetPlayers(Players)) do
                            if var_player_2e5f ~= LocalPlayer and var_player_2e5f.Character then
                                local var_humanoid_3937 = var_player_2e5f.Character.FindFirstChildOfClass(var_player_2e5f.Character,"Humanoid")
                                if var_humanoid_3937 and var_humanoid_3937.Health > 0 then
                                    pcall(function() var_player_b518.FireServer(var_player_b518,var_player_2e5f) end)
                                end
                            end
                        end
                    end)
                end)

                    State.var_connection_8b3c = UserInputService.InputBegan.Connect(UserInputService.InputBegan,function(input, var_descendant_ba91)
                        if var_descendant_ba91 then return end
                        if input.KeyCode ~= Enum.KeyCode.Q then return end
                        if not (State.state_hitboxKillerColor_98d5 or noCooldownEnabled) then return end
                        pcall(RunMayersMobileAction)
                    end)


                local function fn_updateSomething_65e9(var_rootPart_cb24)
                    if not (var_rootPart_cb24 and var_rootPart_cb24.IsA(var_rootPart_cb24,"GuiButton")) then return false end
                    if var_rootPart_cb24.Name ~= "move2" then return false end
                    local var_child_a03d = var_rootPart_cb24.Parent
                    if not (var_child_a03d and var_child_a03d.Name == "Controls") then return false end
                    local var_descendant_ba91 = var_child_a03d.Parent
                    if not (var_descendant_ba91 and var_descendant_ba91.Name == "Slasher-mob") then return false end
                    return true
                end

                local function fn_MayersHelper_7cfe(var_connection_a646)
                    if not State.state_hitboxKillerColor_98d5 then return end
                    if GetKillerType() ~= "mayers" then return end
                    if not fn_updateSomething_65e9(var_connection_a646) then return end
                    if State.var_connection_2710[var_connection_a646] then return end
                    State.var_connection_2710[var_connection_a646] = true
                    pcall(function() var_connection_a646.Active = true end)
                    local function fn_MayersHelper_8b43()
                        if not State.state_hitboxKillerColor_98d5 then return end
                        pcall(RunMayersMobileAction)
                    end



                    local var_connection_1aaf = var_connection_a646.Activated.Connect(var_connection_a646.Activated,fn_MayersHelper_8b43)
                    table.insert(State.var_descendant_1903, var_connection_1aaf)
                end

                local function fn_MayersHelper_b97d()
                    if not State.state_hitboxKillerColor_98d5 then return end
                    if GetKillerType() ~= "mayers" then return end
                    local var_descendant_5584 = LocalPlayer.FindFirstChildOfClass(LocalPlayer,"PlayerGui") or PlayerGui
                    if not var_descendant_5584 then return end
                    pcall(function()
                        local var_descendant_a5da = var_descendant_5584.FindFirstChild(var_descendant_5584,"Slasher-mob")
                        if var_descendant_a5da then
                            local var_descendant_180a = var_descendant_a5da.FindFirstChild(var_descendant_a5da,"Controls")
                            if var_descendant_180a then
                                local var_descendant_174c = var_descendant_180a.FindFirstChild(var_descendant_180a,"move2")
                                if var_descendant_174c then fn_MayersHelper_7cfe(var_descendant_174c) end

                                for _, var_instance_4e7f in ipairs(var_descendant_180a.GetDescendants(var_descendant_180a)) do
                                    if var_instance_4e7f.Name == "move2" then fn_MayersHelper_7cfe(var_instance_4e7f) end
                                end
                            end
                        end
                    end)

                    if State.var_descendant_6b69 then pcall(function() State.var_descendant_6b69.Disconnect(State.var_descendant_6b69) end) end
                    State.var_descendant_6b69 = var_descendant_5584.ChildAdded.Connect(var_descendant_5584.ChildAdded,function(var_instance_4e7f)
                        if var_instance_4e7f.Name == "Slasher-mob" then
                            task.wait(0.5)
                            fn_MayersHelper_b97d()

                            if State.var_descendant_40fb then pcall(function() State.var_descendant_40fb.Disconnect(State.var_descendant_40fb) end) end
                            State.var_descendant_40fb = var_instance_4e7f.DescendantAdded.Connect(var_instance_4e7f.DescendantAdded,function(var_descendant_fe40)
                                if var_descendant_fe40.Name == "move2" then fn_MayersHelper_7cfe(var_descendant_fe40) end
                            end)
                            table.insert(State.var_descendant_1903, State.var_descendant_40fb)
                        end
                    end)
                    table.insert(State.var_descendant_1903, State.var_descendant_6b69)

                    pcall(function()
                        local var_descendant_a5da = var_descendant_5584.FindFirstChild(var_descendant_5584,"Slasher-mob")
                        if var_descendant_a5da and not State.var_descendant_40fb then
                            State.var_descendant_40fb = var_descendant_a5da.DescendantAdded.Connect(var_descendant_a5da.DescendantAdded,function(var_descendant_fe40)
                                if var_descendant_fe40.Name == "move2" then fn_MayersHelper_7cfe(var_descendant_fe40) end
                            end)
                            table.insert(State.var_descendant_1903, State.var_descendant_40fb)
                        end
                    end)
                end

        -- [KILLER] Hook aksi mobile Mayers/Stalker
        function StartMayersMobileHook()
                    fn_MayersHelper_b97d()
                end

                function StopMayersMobileHook()
                    for _, var_connection_90bd in ipairs(State.var_descendant_1903) do pcall(function() var_connection_90bd.Disconnect(var_connection_90bd) end) end
                    State.var_descendant_1903 = {}
                    State.var_connection_2710 = {}
                    if State.var_descendant_6b69 then pcall(function() State.var_descendant_6b69.Disconnect(State.var_descendant_6b69) end) State.var_descendant_6b69 = nil end
                    if State.var_descendant_40fb then pcall(function() State.var_descendant_40fb.Disconnect(State.var_descendant_40fb) end) State.var_descendant_40fb = nil end
                end
        end

        local function TriggerMayersAttack()
            if State.var_connection_fe5a then
                State.var_connection_fe5a.Disconnect(State.var_connection_fe5a)
                State.var_connection_fe5a = nil
            end


            if State.var_connection_81db ~= nil then
                local char = LocalPlayer.Character
                if char then
                    pcall(function() char.SetAttribute(char,"lungeboost", State.var_connection_81db) end)
                end
                State.var_connection_81db = nil
            end


            if State.var_connection_b6c9 then
                for var_remoteEvent_5dde = 1, #State.var_connection_b6c9 do
                    local var_connection_90bd = State.var_connection_b6c9[var_remoteEvent_5dde]
                    if var_connection_90bd then
                        pcall(function() var_connection_90bd.Enable(var_connection_90bd) end)
                    end
                end
                State.var_connection_b6c9 = nil
            end
        end

        local function HandleMayersTarget()
            if GetPlayerRole(LocalPlayer) ~= "killer" then return end
            if State.var_connection_fe5a then return end

            local char = LocalPlayer.Character


            if char then
                pcall(function()
                    State.var_connection_81db = char.GetAttribute(char,"lungeboost")
                    char.SetAttribute(char,"lungeboost", 999999)
                end)
            end


            pcall(function()
                local var_remoteEvent_d696 = ReplicatedStorage.FindFirstChild(ReplicatedStorage,"Remotes")
                local var_remoteEvent_d577 = var_remoteEvent_d696 and var_remoteEvent_d696.FindFirstChild(var_remoteEvent_d696,"Attacks")
                local var_remoteEvent_a5ff = var_remoteEvent_d577 and var_remoteEvent_d577.FindFirstChild(var_remoteEvent_d577,"LungeDetect")
                if var_remoteEvent_a5ff and var_remoteEvent_a5ff.IsA(var_remoteEvent_a5ff,"RemoteEvent") then
                    local var_remoteEvent_9f04 = getconnections(var_remoteEvent_a5ff.OnClientEvent)
                    local var_remoteEvent_197c = {}
                    for var_remoteEvent_5dde = 1, #var_remoteEvent_9f04 do
                        local var_connection_90bd = var_remoteEvent_9f04[var_remoteEvent_5dde]
                        pcall(function()
                            var_connection_90bd.Disable(var_connection_90bd)
                            var_remoteEvent_197c[#var_remoteEvent_197c + 1] = var_connection_90bd
                        end)
                    end
                    State.var_connection_b6c9 = var_remoteEvent_197c
                end
            end)


            State.var_connection_fe5a = LocalPlayer.CharacterAdded.Connect(LocalPlayer.CharacterAdded,function(newChar)
                if not Config.cfg_enableMayersNoCooldown_b604 then return end
                pcall(function()
                    State.var_connection_81db = newChar.GetAttribute(newChar,"lungeboost")
                    newChar.SetAttribute(newChar,"lungeboost", (999999.0))
                end)
            end)
        end

        local fn_ServerHandler_163d
        do
            local var_hiddenBlindGuis_c8a8 = {}
            local function fn_disableBlindGui_b5bb(gui)
                if gui.Name == "Blind" then
                    var_hiddenBlindGuis_c8a8[gui] = true
                    if gui.IsA(gui,"ScreenGui") then
                        gui.Enabled = false
                    elseif gui.IsA(gui,"GuiObject") then
                        gui.Visible = false
                        gui.BackgroundTransparency = 1
                    end
                end
            end

            local var_antiBlindHookInstalled_a99d = false
            local function fn_setupAntiBlindHook_4c6c()
                if var_antiBlindHookInstalled_a99d then return end
                local var_success_abb9 = pcall(function()
                    assert(typeof(hookmetamethod) == "function", "hookmetamethod missing")
                    assert(typeof(getnamecallmethod) == "function", "getnamecallmethod missing")
                    assert(typeof(checkcaller) == "function", "checkcaller missing")
                    local var_remoteEvent_19f1  = ReplicatedStorage.FindFirstChild(ReplicatedStorage,"Remotes")
                    local var_remoteEvent_5dde  = var_remoteEvent_19f1 and var_remoteEvent_19f1.FindFirstChild(var_remoteEvent_19f1,"Items")
                    local var_remoteEvent_65fc = var_remoteEvent_5dde and var_remoteEvent_5dde.FindFirstChild(var_remoteEvent_5dde,"Flashlight")
                    local var_remoteEvent_951b = var_remoteEvent_65fc and var_remoteEvent_65fc.FindFirstChild(var_remoteEvent_65fc,"GotBlinded")
                    if not (var_remoteEvent_951b and var_remoteEvent_951b.IsA(var_remoteEvent_951b,"RemoteEvent")) then return end

                    local var_descendant_9c68
                    var_descendant_9c68 = hookmetamethod(game, "__namecall", function(self, ...)
                        if not checkcaller()
                            and Config.cfg_smoothness_d9e8
                            and rawequal(self, var_remoteEvent_951b)
                            and getnamecallmethod() == "FireServer"
                            and GetPlayerRole(LocalPlayer) == "killer"
                        then
                            return
                        end
                        return var_descendant_9c68(self, ...)
                    end)
                    var_antiBlindHookInstalled_a99d = true
                end)
                return var_success_abb9
            end
            getgenv().SetupAntiBlindHook = fn_setupAntiBlindHook_4c6c

            PlayerGui.DescendantAdded.Connect(PlayerGui.DescendantAdded,function(var_descendant_fe40)
                if Config.cfg_smoothness_d9e8 then fn_disableBlindGui_b5bb(var_descendant_fe40) end
            end)



            RegisterTask("AntiBlindForce", 1.0, function()
                if not Config.cfg_smoothness_d9e8 then return end
                fn_setupAntiBlindHook_4c6c()
                for gui, _ in pairs(var_hiddenBlindGuis_c8a8) do
                    if not gui.Parent then
                        var_hiddenBlindGuis_c8a8[gui] = nil
                    else
                        fn_disableBlindGui_b5bb(gui)
                    end
                end
            end)




            local var_connection_5ffb
            function fn_ServerHandler_163d(var_rootPart_42db)
                if var_rootPart_42db then
                    if not var_connection_5ffb then
                        var_connection_5ffb = LocalPlayer.Idled.Connect(LocalPlayer.Idled,function()
                            VirtualUser.CaptureController(VirtualUser)
                            VirtualUser.ClickButton2(VirtualUser,Vector2.new())
                        end)
                    end
                else
                    if var_connection_5ffb then
                        var_connection_5ffb.Disconnect(var_connection_5ffb)
                        var_connection_5ffb = nil
                    end
                end
            end
        end

        local fn_RemoveHandler_4a9f, Spear_PingSec
        do


            local var_connection_7520 = nil
            function Spear_PingSec()
                if var_connection_7520 == nil then
                    pcall(function()
                        var_connection_7520 = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]
                    end)
                end
                local var_value_d1f9 = 0
                if var_connection_7520 ~= nil then
                    pcall(function() var_value_d1f9 = var_connection_7520.GetValue(var_connection_7520) end)
                end
                var_value_d1f9 = tonumber(var_value_d1f9) or 0
                return math.clamp(var_value_d1f9 / 1000, 0, 1)
            end
            function fn_RemoveHandler_4a9f(var_vector_b1de, char, posNow)
                local var_now_2834 = tick()
                if var_vector_b1de.char ~= char then
                    var_vector_b1de.char = char
                    var_vector_b1de.hist = {}
                    var_vector_b1de.var_playerGui_e1fe = Vector3.new(0, 0, (0.0))
                    var_vector_b1de.turn = (0.0)
                end
                if var_vector_b1de.turn == nil then var_vector_b1de.turn = 0 end
                local hist = var_vector_b1de.hist
                table.insert(hist, { pos = posNow, t = var_now_2834 })
                while #hist > 1 and hist[(1.0)].t < var_now_2834 - 0.4 do table.remove(hist, 1) end
                if #hist >= 2 then
                    local var_rootPart_4e4c = hist[#hist - 1]
                    local var_rootPart_b34c = hist[#hist]
                    local var_rootPart_6336 = var_rootPart_b34c.t - var_rootPart_4e4c.t
                    if var_rootPart_6336 > 0.001 then
                        local var_rootPart_bbe4 = (var_rootPart_b34c.pos - var_rootPart_4e4c.pos) / var_rootPart_6336
                        local var_rootPart_cb24 = Vector3.new(var_rootPart_bbe4.X, 0, var_rootPart_bbe4.Z)
                        local var_rootPart_186c = char and char.FindFirstChild(char,"HumanoidRootPart")
                        if var_rootPart_186c and var_rootPart_186c.IsA(var_rootPart_186c,"BasePart") then
                            local var_success_abb9, av = pcall(function() return var_rootPart_186c.AssemblyLinearVelocity end)
        do local var_basePart_8c93=7227%42 end
                            if var_success_abb9 and typeof(av) == "Vector3" then
                                local var_velocity_577f = Vector3.new(av.X, 0, av.Z)
                                if var_velocity_577f.Magnitude > 0.5 and var_velocity_577f.Magnitude < 100 then
                                    var_rootPart_cb24 = var_rootPart_cb24.Lerp(var_rootPart_cb24,var_velocity_577f, 0.5)
                                end
                            end
                        end



                        if var_rootPart_cb24.Magnitude > 24 then var_rootPart_cb24 = var_rootPart_cb24.Unit * 24 end


                        local var_vector_cf43 = 0
                        if var_vector_b1de.var_playerGui_e1fe.Magnitude > 2 and var_rootPart_cb24.Magnitude > (2.0) then
                            local var_distance_8193 = var_vector_b1de.var_playerGui_e1fe.Dot(var_vector_b1de.var_playerGui_e1fe,var_rootPart_cb24) / (var_vector_b1de.var_playerGui_e1fe.Magnitude * var_rootPart_cb24.Magnitude)
                            if Config.spearAntiStrafing and var_distance_8193 < 0 then var_rootPart_cb24 = var_rootPart_cb24 * 0.7 end
                            var_vector_cf43 = math.clamp(1 - var_distance_8193, (0.0), (1.0))
                        end
                        var_vector_b1de.turn = var_vector_b1de.turn * 0.7 + var_vector_cf43 * 0.3
                        var_vector_b1de.var_playerGui_e1fe = var_vector_b1de.var_playerGui_e1fe.Lerp(var_vector_b1de.var_playerGui_e1fe,var_rootPart_cb24, 0.45)
                    end
                end
                local var_vector_559c = Vector3.new(var_vector_b1de.var_playerGui_e1fe.X, 0, var_vector_b1de.var_playerGui_e1fe.Z)
                if var_vector_559c.Magnitude > 24 then var_vector_559c = var_vector_559c.Unit * 24 end
                var_vector_b1de.var_playerGui_e1fe = var_vector_559c
                local stab = 1 - math.clamp(var_vector_b1de.turn, (0.0), (1.0))
                return var_vector_559c, stab
            end
        end

        local fn_RemoveHelper_ac9a, StopCameraVeil, CV_ScanAttackButtons, CV_ClearLock
        do
            local var_rootPart_8420 = { hist = {}, char = nil, var_playerGui_e1fe = Vector3.new(0, (0.0), 0) }
            local function fn_GetHelper_31d3()
                local var_success_abb9, var_child_a03d = pcall(function() if gethui then return gethui() end return game.GetService(game,"CoreGui") end)
                return (var_success_abb9 and var_child_a03d) or PlayerGui
            end
            local function fn_FindHelper_a032(char)
                if not char then return nil end
                local var_rootPart_6233 = char.FindFirstChild(char,"Head")
                if var_rootPart_6233 then return var_rootPart_6233.Position end
                local var_rootPart_186c = char.FindFirstChild(char,"HumanoidRootPart")
                if var_rootPart_186c then return var_rootPart_186c.Position end
                local var_rootPart_6242 = char.FindFirstChild(char,"UpperTorso")
                if var_rootPart_6242 then return var_rootPart_6242.Position end
                local t = char.FindFirstChild(char,"Torso")
                if t then return t.Position end
                return char.PrimaryPart and char.PrimaryPart.Position or nil
            end
            local function fn_FindHelper_ef8c(rootPart)
                if not rootPart then return Vector3.new((0.0), 0, 0) end
                local vel = rootPart.AssemblyLinearVelocity
                local var_rootPart_5810 = Vector3.new(vel.X, 0, vel.Z)
                if var_rootPart_5810.Magnitude > 65 then var_rootPart_5810 = var_rootPart_5810.Unit * 65 end
                return var_rootPart_5810
            end
            local function fn_FindHelper_43d4()
                local char = LocalPlayer.Character
                local var_rootPart_186c = char and char.FindFirstChild(char,"HumanoidRootPart")
                if not var_rootPart_186c then return nil end
                local var_rootPart_2947 = WorkspaceService.CurrentCamera
                local var_rootPart_83b3 = (var_rootPart_2947 and var_rootPart_2947.CFrame.LookVector) or var_rootPart_186c.CFrame.LookVector
                return var_rootPart_186c.Position + var_rootPart_83b3 * 3 + Vector3.new(0, 1.5, 0)
            end
            local function fn_internalFunction_45af(var_rootPart_507f)
                local speed = tonumber(State.var_vector_fe4d) or tonumber(Config.cameraVeilSpearSpeed) or 220
                return math.clamp(speed, (35.0), 800)
            end
            local function fn_internalFunction_eb6a(var_vector_8bc5, var_error_6022, speed, var_vector_b7cd)
                local var_unknownValue_0036_1a36 = math.cos(var_error_6022)
                if var_unknownValue_0036_1a36 <= 0.015 then return nil, nil end
                local travelTime = var_vector_8bc5 / (speed * var_unknownValue_0036_1a36)
                if travelTime ~= travelTime or travelTime <= 0 then return nil, nil end
                local var_unknownValue_0005_76f1 = (1.0) / 60
                local var_unknownValue_0017_de8a = 0.5 * var_vector_b7cd * var_unknownValue_0005_76f1 * travelTime
                local var_unknownValue_0042_e35c = speed * math.sin(var_error_6022) * travelTime - (0.5 * var_vector_b7cd * travelTime * travelTime) - var_unknownValue_0017_de8a
                return var_unknownValue_0042_e35c, travelTime
            end
            local function fn_internalFunction_1d87(var_vector_8bc5, var_vector_da8e, var_error_6022, speed, var_vector_b7cd)
                local var_unknownValue_0028_de6d, travelTime = fn_internalFunction_eb6a(var_vector_8bc5, var_error_6022, speed, var_vector_b7cd)
                if not var_unknownValue_0028_de6d or not travelTime then return nil end
                if travelTime < 0.025 or travelTime > 4 then return nil end
                local var_vector_39ee = math.abs(var_unknownValue_0028_de6d - var_vector_da8e)
                local var_vector_87eb = math.max(var_error_6022 - var_playerGui_106d, 0) * 0.35
                local var_vector_65b3 = math.max(travelTime - 1.3, (0.0)) * 0.25
                return var_vector_39ee + var_vector_87eb + var_vector_65b3, var_vector_39ee, travelTime
            end
            local function fn_internalFunction_3308(var_vector_1014, var_rootPart_e5eb, speed, var_vector_b7cd)
                local var_vector_d809 = var_rootPart_e5eb - var_vector_1014
                local var_rootPart_5810 = Vector3.new(var_vector_d809.X, 0, var_vector_d809.Z)
                local var_vector_8bc5 = var_rootPart_5810.Magnitude
                local var_vector_da8e = var_vector_d809.Y
                if var_vector_d809.Magnitude <= 0.001 then return nil end
                if var_vector_8bc5 <= 0.35 or var_vector_b7cd <= 0.001 then return var_vector_d809.Unit, math.clamp(var_vector_d809.Magnitude / speed, 0.025, (4.0)) end
                local var_vector_4451 = var_rootPart_5810.Unit
                local var_error_af43 = math.atan2(var_vector_da8e, var_vector_8bc5)
                local var_error_655c = math.max(-var_playerGui_8190, var_error_af43 - var_playerGui_2578)
                local var_error_a1ba = var_error_eb01
                local var_player_a388, bestScore, bestError, bestTime = nil, math.huge, math.huge, nil

                local var_error_c8fe = var_vector_8bc5 > 80
                local var_error_f5dc = var_error_c8fe and (40.0) or 24
                local var_error_de37 = var_error_c8fe and 0.08 or var_color_d0dd
                for var_remoteEvent_5dde = (0.0), var_error_f5dc do
                    local var_error_6022 = var_error_655c + (var_error_a1ba - var_error_655c) * (var_remoteEvent_5dde / var_error_f5dc)
                    local var_error_4254, var_vector_39ee, travelTime = fn_internalFunction_1d87(var_vector_8bc5, var_vector_da8e, var_error_6022, speed, var_vector_b7cd)
                    if var_error_4254 and var_error_4254 < bestScore then
                        bestScore, bestError, var_player_a388, bestTime = var_error_4254, var_vector_39ee, var_error_6022, travelTime
                        if bestError < var_error_de37 then break end
                    end
                end
                if var_player_a388 then
                    local var_error_8ff4 = (var_error_a1ba - var_error_655c) / var_error_f5dc * 2.5
                    local var_error_5a1a = (bestError < var_error_de37) and 1 or (var_error_c8fe and 5 or 3)
                    for _ = 1, var_error_5a1a do
                        local var_error_8931, localBestScore, localBestError, localBestTime = var_player_a388, bestScore, bestError, bestTime
                        for var_error_358e = (-3.0), 3 do
                            local var_error_6022 = math.clamp(var_player_a388 + var_error_8ff4 * (var_error_358e / (3.0)), var_error_655c, var_error_a1ba)
                            local var_error_4254, var_vector_39ee, travelTime = fn_internalFunction_1d87(var_vector_8bc5, var_vector_da8e, var_error_6022, speed, var_vector_b7cd)
                            if var_error_4254 and var_error_4254 < localBestScore then
                                localBestScore, localBestError, var_error_8931, localBestTime = var_error_4254, var_vector_39ee, var_error_6022, travelTime
                            end
                        end
                        var_player_a388, bestScore, bestError, bestTime = var_error_8931, localBestScore, localBestError, localBestTime
                        if bestError < var_error_de37 then break end
                        var_error_8ff4 = var_error_8ff4 * 0.38
                    end
                end
                if not var_player_a388 then
                    local var_vector_4986 = math.clamp(var_vector_8bc5 / speed, 0.025, 4)


                    local var_vector_b605 = math.min(0.5 * var_vector_b7cd * var_vector_4986 * var_vector_4986, (15.0))
                    local var_vector_e5a4 = var_rootPart_e5eb + Vector3.new(0, var_vector_b605, (0.0))
                    local var_vector_8e36 = var_vector_e5a4 - var_vector_1014
                    if var_vector_8e36.Magnitude <= 0.001 then return nil end
                    return var_vector_8e36.Unit, var_vector_4986
                end
                local var_connection_fd87 = var_vector_4451 * math.cos(var_player_a388) + Vector3.new(0, math.sin(var_player_a388), (0.0))
                if var_connection_fd87.Magnitude <= 0.001 then return nil end
                return var_connection_fd87.Unit, bestTime
            end
            local function fn_FindHelper_f396(var_rootPart_e5eb)
                local var_vector_1014 = fn_FindHelper_43d4()
                if not var_vector_1014 or not var_rootPart_e5eb then return nil end
                local speed = fn_internalFunction_45af((var_rootPart_e5eb - var_vector_1014).Magnitude)
                local var_distance_fc8e = math.max(tonumber(State.var_distance_dfbb) or tonumber(Config.cameraVeilGravityMult) or 1, 0)
                local var_vector_b7cd = var_distance_ca0a * var_distance_fc8e
                return fn_internalFunction_3308(var_vector_1014, var_rootPart_e5eb, speed, var_vector_b7cd)
            end
            local function fn_GetHelper_a657(var_humanoid_3232, var_rootPart_bd26)
                if not var_humanoid_3232 then return nil end
                local var_vector_1014 = fn_FindHelper_43d4()
                if var_vector_1014 then
                    local var_distance_5939 = var_humanoid_3232 - var_vector_1014
                    local var_distance_5e3d = var_distance_5939.Magnitude
                    if var_distance_5e3d < 6 then
                        if var_distance_5e3d < 0.001 then return nil end
                        local var_animationTrack_77c4 = tonumber(State.var_vector_fe4d) or tonumber(Config.cameraVeilSpearSpeed) or (220.0)
                        return var_distance_5939.Unit, var_humanoid_3232, math.clamp(var_distance_5e3d / math.max(var_animationTrack_77c4, (1.0)), 0.01, 1)
                    end
                end
                local var_predictedPosition_c9fb = State.var_target_a7bf
                local var_predictedPosition_fa9b = var_predictedPosition_c9fb - State.var_predictedPosition_9437
                local var_predictedPosition_9bf7 = State.var_predictedPosition_ad18 and (var_humanoid_3232 - State.var_predictedPosition_ad18).Magnitude < var_predictedPosition_d6dc
                if var_predictedPosition_fa9b < var_predictedPosition_74a8 and var_predictedPosition_9bf7 and State.var_predictedPosition_66d8 then
                    return State.var_predictedPosition_66d8, State.var_predictedPosition_b98d, State.var_predictedPosition_1a91
                end
                local predictedPos = var_humanoid_3232
                local var_predictedPosition_c4d9, travelTime = fn_FindHelper_f396(predictedPos)
                if var_predictedPosition_c4d9 and travelTime and var_rootPart_bd26 and var_rootPart_bd26.Magnitude > 1.25 then

                    local var_predictedPosition_fc6d = 0.68 + 0.32 * math.clamp(travelTime / 0.6, (0.0), 1)

                    local var_distance_ecc5 = (var_vector_1014 and var_humanoid_3232) and (var_humanoid_3232 - var_vector_1014).Magnitude or 0
        if false then local var_distance_58d4=131 end
                    local var_predictedPosition_1dce = math.max(var_distance_ecc5 * 0.4, 4)

                    local var_predictedPosition_b43d = Spear_PingSec() * (tonumber(Config.spearPingLead) or 1.0)
                    local var_distance_853d = math.clamp(travelTime * var_predictedPosition_fc6d, 0, 1.1)
                    local lead = var_rootPart_bd26 * ((var_distance_853d + var_predictedPosition_b43d) * var_rootPart_d1d6)
                    if lead.Magnitude > 32 then lead = lead.Unit * 32 end
                    if lead.Magnitude > var_predictedPosition_1dce then lead = lead.Unit * var_predictedPosition_1dce end
                    local var_predictedPosition_45ca = var_humanoid_3232 + lead
                    local var_humanoid_b7f7, newTime = fn_FindHelper_f396(var_predictedPosition_45ca)
                    if var_humanoid_b7f7 and newTime then var_predictedPosition_c4d9, travelTime, predictedPos = var_humanoid_b7f7, newTime, var_predictedPosition_45ca end

                    if var_humanoid_b7f7 and newTime and newTime > 0.35 then
                        local var_predictedPosition_9ab6 = math.clamp(newTime * var_predictedPosition_fc6d, 0, 1.1)
                        local var_predictedPosition_962f = var_rootPart_bd26 * ((var_predictedPosition_9ab6 + var_predictedPosition_b43d) * var_rootPart_d1d6)
                        if var_predictedPosition_962f.Magnitude > (32.0) then var_predictedPosition_962f = var_predictedPosition_962f.Unit * 32 end
                        if var_predictedPosition_962f.Magnitude > var_predictedPosition_1dce then var_predictedPosition_962f = var_predictedPosition_962f.Unit * var_predictedPosition_1dce end
                        local var_predictedPosition_b6d3 = var_humanoid_3232 + var_predictedPosition_962f
                        local var_predictedPosition_b4fe, newTime2 = fn_FindHelper_f396(var_predictedPosition_b6d3)
                        if var_predictedPosition_b4fe and newTime2 then var_predictedPosition_c4d9, travelTime, predictedPos = var_predictedPosition_b4fe, newTime2, var_predictedPosition_b6d3 end
                    end
                end
                State.var_predictedPosition_9437 = var_predictedPosition_c9fb
                State.var_predictedPosition_ad18 = var_humanoid_3232
                State.var_predictedPosition_66d8 = var_predictedPosition_c4d9
                State.var_predictedPosition_b98d = predictedPos
                State.var_predictedPosition_1a91 = travelTime
                return var_predictedPosition_c4d9, predictedPos, travelTime
            end
            local var_connection_3b17
            local function fn_ResetHelper_3528()
                local var_rootPart_2947 = WorkspaceService.CurrentCamera
                if not var_rootPart_2947 then return nil end
                local var_rootPart_95b4, camDir = var_rootPart_2947.CFrame.Position, var_rootPart_2947.CFrame.LookVector
                local var_player_150a, var_player_a388 = nil, var_player_9085
                local var_player_22b6 = LocalPlayer.Character
                local var_player_503c = var_player_22b6 and var_player_22b6.FindFirstChild(var_player_22b6,"HumanoidRootPart")
                if not var_player_503c then return nil end
                for _, player in ipairs(Players.GetPlayers(Players)) do
                    if player ~= LocalPlayer then
                        local var_player_939c = GetPlayerRole(player)
                        if var_player_939c == "survivor" then
                            local char = player.Character
                            local var_humanoid_3937 = char and char.FindFirstChildOfClass(char,"Humanoid")
                            if char and var_humanoid_3937 and var_humanoid_3937.Health > 0 then
                                local var_humanoid_3232 = fn_FindHelper_a032(char)
                                if var_humanoid_3232 then
                                    local dist = (var_humanoid_3232 - var_player_503c.Position).Magnitude
                                    if dist <= Config.cameraVeilMaxDistance then
                                        local var_position_bc77 = var_humanoid_3232 - var_rootPart_95b4
                                        if var_position_bc77.Magnitude > 0.001 then
                                            local var_error_6022 = math.acos(math.clamp(camDir.Dot(camDir,var_position_bc77.Unit), (-1.0), 1))
                                            if var_error_6022 < var_player_a388 then var_player_a388 = var_error_6022
                                            var_player_150a = player end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                return var_player_150a
            end
            local function fn_ResetHelper_55f7()
                if State.var_uiCorner_8f5b and State.var_uiCorner_8f5b.Parent and State.state_maxDistance_7c1c and State.state_maxDistance_7c1c.Parent and State.state_maxDistance_b5b0 and State.state_maxDistance_b5b0.Parent then return end
                local gui = Instance.new("ScreenGui")
                gui.Name = "CameraVeil_SnapLine"
                gui.IgnoreGuiInset = true
                gui.ResetOnSpawn = false
                gui.Parent = fn_GetHelper_31d3()
                local var_uiCorner_d268 = Instance.new("Frame")
                var_uiCorner_d268.Name = "Line"
                var_uiCorner_d268.AnchorPoint = Vector2.new(0.5, 0.5)
                var_uiCorner_d268.BorderSizePixel = (0.0)
                var_uiCorner_d268.BackgroundColor3 = Color3.fromRGB((0.0), 255, 120)
                var_uiCorner_d268.BackgroundTransparency = 0.08
                var_uiCorner_d268.Visible = false
                var_uiCorner_d268.Parent = gui
                local dot = Instance.new("Frame")
                dot.Name = "Dot"
                dot.AnchorPoint = Vector2.new(0.5, 0.5)
                dot.BorderSizePixel = (0.0)
                dot.BackgroundColor3 = Color3.fromRGB(0, 255, 120)
                dot.BackgroundTransparency = 0
                dot.Size = UDim2.fromOffset((7.0), 7)
                dot.Visible = false
                dot.Parent = gui
                local var_uiCorner_be7b = Instance.new("UICorner")
                var_uiCorner_be7b.CornerRadius = UDim.new(1, (0.0))
                var_uiCorner_be7b.Parent = dot
                State.var_uiCorner_8f5b = gui
                State.state_maxDistance_7c1c = var_uiCorner_d268
                State.state_maxDistance_b5b0 = dot
            end
            local function fn_GetHandler_5372(var_rootPart_e5eb)
                if not Config.cameraVeilSnaplineEnabled or not State.var_connection_6698 then
                    if State.state_maxDistance_7c1c then State.state_maxDistance_7c1c.Visible = false end
                    if State.state_maxDistance_b5b0 then State.state_maxDistance_b5b0.Visible = false end
                    return
                end
                if not var_connection_3b17() then
                    if State.state_maxDistance_7c1c then State.state_maxDistance_7c1c.Visible = false end
                    if State.state_maxDistance_b5b0 then State.state_maxDistance_b5b0.Visible = false end
                    return
                end
                local var_predictedPosition_c9fb = State.var_target_a7bf
                if var_rootPart_e5eb and (var_predictedPosition_c9fb - State.var_success_8f30) < 2 then return end
                State.var_success_8f30 = var_predictedPosition_c9fb
                local var_success_abb9 = pcall(function()
                    fn_ResetHelper_55f7()
                    local var_uiCorner_d268 = State.state_maxDistance_7c1c
                    local dot = State.state_maxDistance_b5b0
                    local var_rootPart_2947 = WorkspaceService.CurrentCamera
                    if not var_uiCorner_d268 or not var_rootPart_2947 then if var_uiCorner_d268 then var_uiCorner_d268.Visible = false end if dot then dot.Visible = false end return end
                    local var_viewportSize_677e = var_rootPart_e5eb
                    local var_backgroundTransparency_bad9 = (State.var_rootPart_23f6 ~= nil and State.var_rootPart_1d78)
                    if not var_backgroundTransparency_bad9 then
                        local var_character_80c0 = fn_ResetHelper_3528()
                        if var_character_80c0 then
                            local char = var_character_80c0.Character
                            if char then var_viewportSize_677e = fn_FindHelper_a032(char) end
                        else var_viewportSize_677e = nil end
                    end
                    if not var_viewportSize_677e then var_uiCorner_d268.Visible = false
                    if dot then dot.Visible = false end return end
                    local var_viewportSize_ced1, onScreen = var_rootPart_2947.WorldToViewportPoint(var_rootPart_2947,var_viewportSize_677e)
                    if not onScreen or var_viewportSize_ced1.Z <= 0 then var_uiCorner_d268.Visible = false
                    if dot then dot.Visible = false end return end
                    local var_viewportSize_5cb2 = var_rootPart_2947.ViewportSize
                    local var_viewportSize_a48c = Vector2.new(var_viewportSize_5cb2.X * 0.5, var_viewportSize_5cb2.Y * 0.5)
                    local var_viewportSize_8541 = Vector2.new(var_viewportSize_ced1.X, var_viewportSize_ced1.Y)
                    local var_vector_d809 = var_viewportSize_8541 - var_viewportSize_a48c
                    local length = var_vector_d809.Magnitude
                    if length < 2 then var_uiCorner_d268.Visible = false
                    if dot then dot.Visible = false end return end
                    local var_backgroundTransparency_45bf = var_backgroundTransparency_bad9 and Color3.fromRGB(0, (255.0), 120) or Color3.fromRGB(255, 220, 0)
                    local var_backgroundTransparency_e30f = var_backgroundTransparency_bad9 and 0.08 or 0.35
                    var_uiCorner_d268.BackgroundColor3 = var_backgroundTransparency_45bf
                    var_uiCorner_d268.BackgroundTransparency = var_backgroundTransparency_e30f
                    var_uiCorner_d268.Size = UDim2.fromOffset(length, var_backgroundTransparency_bad9 and (2.0) or (1.0))
                    var_uiCorner_d268.Position = UDim2.fromOffset((var_viewportSize_a48c.X + var_viewportSize_8541.X) * 0.5, (var_viewportSize_a48c.Y + var_viewportSize_8541.Y) * 0.5)
                    var_uiCorner_d268.Rotation = math.deg(math.atan2(var_vector_d809.Y, var_vector_d809.X))
                    var_uiCorner_d268.Visible = true
                    if dot then
                        dot.BackgroundColor3 = var_backgroundTransparency_45bf
                        dot.Position = UDim2.fromOffset(var_viewportSize_8541.X, var_viewportSize_8541.Y)
                        dot.Visible = true
                    end
                end)
                if not var_success_abb9 then
                    if State.state_maxDistance_7c1c then State.state_maxDistance_7c1c.Visible = false end
                    if State.state_maxDistance_b5b0 then State.state_maxDistance_b5b0.Visible = false end
                end
            end
            function CV_ClearLock()
                State.var_rootPart_23f6 = nil
                State.var_rootPart_1d78 = false
                State.var_position_9df3 = nil
                State.var_target_8d7a = nil
                fn_GetHandler_5372(nil)
            end
            var_connection_3b17 = function()
                local var_predictedPosition_c9fb = State.var_target_a7bf
                if var_predictedPosition_c9fb == State.var_success_7a54 then return State.var_success_fbc8 end
                State.var_success_7a54 = var_predictedPosition_c9fb
                local char = LocalPlayer.Character
                local var_vector_a5bb = false
                if char then
                    local var_success_abb9, var_value_d1f9 = pcall(char.GetAttribute, char, "spearmode")
                    var_vector_a5bb = var_success_abb9 and var_value_d1f9 == true
                end
                State.var_success_fbc8 = var_vector_a5bb
                return var_vector_a5bb
            end
            local function fn_PredictionHelper_905c()
                if not var_connection_3b17() then return false end
                return State.var_connection_dd8d or State.var_connection_eef0
            end
            local function fn_PredictionHelper_7591()
                State.var_target_a7bf = State.var_target_a7bf + 1
                if not State.var_connection_6698 then return end
                local var_unknownValue_0021_8e94 = fn_PredictionHelper_905c()
                if not var_unknownValue_0021_8e94 then
                    if State.var_rootPart_1d78 then CV_ClearLock() else fn_GetHandler_5372(nil) end
                    return
                end
                if not State.var_rootPart_1d78 then
                    State.var_position_9df3 = nil
                    State.var_rootPart_23f6 = fn_ResetHelper_3528()
                    State.var_rootPart_1d78 = true
                    State.var_target_8d7a = State.var_target_a7bf
                end
                if State.var_target_8d7a and (State.var_target_a7bf - State.var_target_8d7a) < var_color_600b then
                    local var_humanoid_7111 = fn_ResetHelper_3528()
                    if var_humanoid_7111 then State.var_rootPart_23f6 = var_humanoid_7111 end
                end
                local target = State.var_rootPart_23f6
                if not target then State.var_rootPart_1d78 = false
                return end
                local char = target.Character
                local var_humanoid_3937 = char and char.FindFirstChildOfClass(char,"Humanoid")
                local var_player_939c = GetPlayerRole(target)
                if not char or not var_humanoid_3937 or var_humanoid_3937.Health <= (0.0) or var_player_939c ~= "survivor" then
                    State.var_rootPart_1d78 = false
                    State.var_rootPart_23f6 = nil
                    return
                end
                local var_humanoid_3232 = fn_FindHelper_a032(char)
                if not var_humanoid_3232 then State.var_rootPart_1d78 = false
                State.var_rootPart_23f6 = nil
                return end
                local var_rootPart_2947 = WorkspaceService.CurrentCamera
                local var_player_22b6 = LocalPlayer.Character
                local var_rootPart_f542 = var_player_22b6 and var_player_22b6.FindFirstChild(var_player_22b6,"HumanoidRootPart")
                if not var_rootPart_2947 or not var_rootPart_f542 then return end
                if (var_humanoid_3232 - var_rootPart_f542.Position).Magnitude > Config.cameraVeilMaxDistance then
                    State.var_rootPart_1d78 = false
                    State.var_rootPart_23f6 = nil
                    return
                end
                local var_rootPart_bd26, stabNow = nil, 1
                if Config.spearAutoPrediction then
                    var_rootPart_bd26, stabNow = fn_RemoveHandler_4a9f(var_rootPart_8420, char, var_humanoid_3232)
                else
                    var_rootPart_8420.char, var_rootPart_8420.hist, var_rootPart_8420.var_playerGui_e1fe = nil, {}, Vector3.new((0.0), 0, 0)
                    var_rootPart_8420.turn = 0
                    var_rootPart_bd26 = fn_FindHelper_ef8c(char.FindFirstChild(char,"HumanoidRootPart"))
                end


                local var_rootPart_d1d6 = 1
                if Config.spearAntiStrafing then var_rootPart_d1d6 = 0.55 + 0.45 * math.clamp(stabNow or 1, 0, (1.0)) end
                local var_position_fe5d = fn_GetHelper_a657(var_humanoid_3232, var_rootPart_bd26)
                local var_distance_3e05 = var_position_fe5d and var_position_fe5d.Magnitude > 0.001 and var_position_fe5d.Y < var_distance_274c and var_position_fe5d.Y > var_distance_2323
                if var_distance_3e05 then
                    if State.var_position_9df3 then
                        local var_distance_741e = math.acos(math.clamp(State.var_position_9df3.Dot(State.var_position_9df3,var_position_fe5d.Unit), -1, 1))
                        if var_distance_741e < var_playerGui_6790 then State.var_position_9df3 = var_position_fe5d.Unit end
                    else
                        State.var_position_9df3 = var_position_fe5d.Unit
                    end
                    var_position_fe5d = State.var_position_9df3
                elseif State.var_position_9df3 then
                    var_position_fe5d = State.var_position_9df3
                else
                    var_position_fe5d = var_rootPart_2947.CFrame.LookVector
                end
                local var_humanoid_c81c = var_rootPart_2947.CFrame.Position
                local var_humanoid_1258 = math.clamp(Config.cameraVeilSmoothness or 1, 0.05, 1)
                local var_humanoid_b7f7 = var_rootPart_2947.CFrame.LookVector.Lerp(var_rootPart_2947.CFrame.LookVector,var_position_fe5d, var_humanoid_1258)
                if var_humanoid_b7f7.Magnitude > 0.001 then
                    var_rootPart_2947.CFrame = CFrame.new(var_humanoid_c81c, var_humanoid_c81c + var_humanoid_b7f7.Unit)
                    fn_GetHandler_5372(var_humanoid_3232)
                end
            end
            local function fn_GetHelper_e205(var_rootPart_cb24, name)
                local var_child_3f4a = var_rootPart_cb24 and var_rootPart_cb24.Parent
                while var_child_3f4a do
                    if var_child_3f4a.Name == name then return true end
                    var_child_3f4a = var_child_3f4a.Parent
                end
                return false
            end
            local function fn_GetHelper_cf95(var_rootPart_cb24)
                if not (var_rootPart_cb24 and var_rootPart_cb24.IsA(var_rootPart_cb24,"GuiButton")) then return false end
                if var_rootPart_cb24.Name ~= "attack" then return false end
                if not fn_GetHelper_e205(var_rootPart_cb24, "Slasher-mob") then return false end
                if not fn_GetHelper_e205(var_rootPart_cb24, "Control") and not fn_GetHelper_e205(var_rootPart_cb24, "Controls") then return false end
                return true
            end
            local function fn_GetHelper_2d94(var_connection_a646)
                if not fn_GetHelper_cf95(var_connection_a646) then return end
                if State.var_connection_238b[var_connection_a646] then return end
                State.var_connection_238b[var_connection_a646] = true
                local function fn_GetHelper_34d6()
                    if not State.var_connection_6698 or not var_connection_3b17() then return end
                    State.var_connection_eef0 = true
                end
        do local var_connection_3da4=409%36 end
                local function fn_GetHandler_e0ea() State.var_connection_eef0 = false end
                local var_connection_accd = var_connection_a646.InputBegan.Connect(var_connection_a646.InputBegan,function(input)
                    local t = input.UserInputType
                    if t ~= Enum.UserInputType.Touch and t ~= Enum.UserInputType.MouseButton1 then return end
                    fn_GetHelper_34d6()
                    local var_connection_88fe
                    var_connection_88fe = UserInputService.InputEnded.Connect(UserInputService.InputEnded,function(ended)
                        if ended == input then fn_GetHandler_e0ea()
                        if var_connection_88fe then var_connection_88fe.Disconnect(var_connection_88fe) end end
                    end)
                end)
                table.insert(State.var_descendant_9c1a, var_connection_accd)
                local var_connection_a512 = var_connection_a646.InputEnded.Connect(var_connection_a646.InputEnded,function(input)
                    local t = input.UserInputType
                    if t ~= Enum.UserInputType.Touch and t ~= Enum.UserInputType.MouseButton1 then return end
                    fn_GetHandler_e0ea()
                end)
                table.insert(State.var_descendant_9c1a, var_connection_a512)
            end
            function CV_ScanAttackButtons()
                local var_descendant_5584 = LocalPlayer.FindFirstChildOfClass(LocalPlayer,"PlayerGui") or PlayerGui
                if not var_descendant_5584 then return end
                pcall(function()
                    local var_descendant_a5da = var_descendant_5584.FindFirstChild(var_descendant_5584,"Slasher-mob", true)
                    if var_descendant_a5da then
                        local var_descendant_2feb = var_descendant_a5da.FindFirstChild(var_descendant_a5da,"Control") or var_descendant_a5da.FindFirstChild(var_descendant_a5da,"Controls")
                        if var_descendant_2feb then
                            local function fn_RemoveHandler_79bf(var_child_a03d)
                                for _, var_instance_4e7f in ipairs(var_child_a03d.GetChildren(var_child_a03d)) do
                                    fn_GetHelper_2d94(var_instance_4e7f)
                                    fn_RemoveHandler_79bf(var_instance_4e7f)
                                end
                            end
                            fn_RemoveHandler_79bf(var_descendant_2feb)
                        end
                    end
                end)
                if State.var_descendant_c27f then State.var_descendant_c27f.Disconnect(State.var_descendant_c27f) end
                State.var_descendant_c27f = var_descendant_5584.DescendantAdded.Connect(var_descendant_5584.DescendantAdded,fn_GetHelper_2d94)
                table.insert(State.var_descendant_9c1a, State.var_descendant_c27f)
            end
            local function fn_RemoveHelper_16d3()
                if State.var_descendant_b0c2 then return end
                local var_success_abb9, remote = pcall(function()
                    local var_replicatedStorage_2561 = game:GetService("ReplicatedStorage")
                    local var_remoteEvent_d696 = var_replicatedStorage_2561.FindFirstChild(var_replicatedStorage_2561,"Remotes")
                    local mechanics = var_remoteEvent_d696 and var_remoteEvent_d696.FindFirstChild(var_remoteEvent_d696,"Mechanics")
                    return mechanics and mechanics.FindFirstChild(mechanics,"visualize")
                end)
                if var_success_abb9 and remote and remote.IsA(remote,"RemoteEvent") then
                    State.var_descendant_b0c2 = remote.OnClientEvent.Connect(remote.OnClientEvent,function(ownerChar, spearDir, spearSpeed, gravityMult)
                        if ownerChar ~= LocalPlayer.Character then return end

                        if type(spearSpeed) == "number" and spearSpeed >= 15 and spearSpeed <= (800.0) then State.var_vector_fe4d = spearSpeed end
                        if type(gravityMult) == "number" and gravityMult > 0.2 and gravityMult <= 5 then State.var_distance_dfbb = gravityMult end
                    end)
                    table.insert(State.var_descendant_9c1a, State.var_descendant_b0c2)
                end
            end
            function fn_RemoveHelper_ac9a()
                if State.var_connection_6698 then return end
                State.var_connection_6698 = true
                State.var_connection_dd8d = false
                State.var_connection_eef0 = false
                CV_ClearLock()
                fn_RemoveHelper_16d3()
                CV_ScanAttackButtons()
                State.var_connection_2821 = UserInputService.InputBegan.Connect(UserInputService.InputBegan,function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton2 and var_connection_3b17() then State.var_connection_dd8d = true end
                end)
                table.insert(State.var_descendant_9c1a, State.var_connection_2821)
                State.var_connection_47dd = UserInputService.InputEnded.Connect(UserInputService.InputEnded,function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton2 then State.var_connection_dd8d = false end
                end)
                table.insert(State.var_descendant_9c1a, State.var_connection_47dd)
                pcall(function() RunService.UnbindFromRenderStep(RunService,State.CV_RenderStepName) end)
                pcall(function() RunService.BindToRenderStep(RunService,State.CV_RenderStepName, Enum.RenderPriority.Camera.Value + 2, fn_PredictionHelper_7591) end)
            end
            function StopCameraVeil()

                State.var_vector_fe4d = nil
                State.var_distance_dfbb = nil
                State.var_connection_6698 = false
                State.var_connection_dd8d = false
                State.var_connection_eef0 = false
                CV_ClearLock()
                State.var_target_a7bf = 0
                State.var_success_8f30 = -99
                State.var_success_7a54 = -99
                State.var_success_fbc8 = false
                State.var_predictedPosition_9437 = (-99.0)
                State.var_predictedPosition_ad18 = nil
                State.var_predictedPosition_66d8 = nil
                State.var_predictedPosition_b98d = nil
                State.var_predictedPosition_1a91 = nil
                pcall(function() RunService.UnbindFromRenderStep(RunService,State.CV_RenderStepName) end)
                for _, var_connection_90bd in ipairs(State.var_descendant_9c1a) do pcall(function() var_connection_90bd.Disconnect(var_connection_90bd) end) end
                State.var_descendant_9c1a = {}
                State.var_connection_238b = {}
                State.var_connection_2821 = nil
                State.var_connection_47dd = nil
                State.var_descendant_c27f = nil
                State.var_descendant_b0c2 = nil
            end
        end

        local var_player_1981
        local var_player_edf8
        local var_billboard_763c
        local fn_GetHandler_d1b6, ForceRefreshAllESP, GetCamPosition, AttachESPToChar, RemovePlayerESP, AttachOutlineToChar, ValidateAndReattachESP, CreateBillboardTag
        do
            function CreateBillboardTag(text, color, size, var_font_7941)
                local var_backgroundTransparency_2a69 = Instance.new("BillboardGui")
                var_backgroundTransparency_2a69.AlwaysOnTop = true
                var_backgroundTransparency_2a69.Size = size or UDim2.new((0.0), 40, 0, (40.0))
                var_backgroundTransparency_2a69.StudsOffset = Vector3.new((0.0), 3.5, 0)
                local var_backgroundTransparency_dd44 = Instance.new("TextLabel")
                var_backgroundTransparency_dd44.Name = "Label"
                var_backgroundTransparency_dd44.Size = UDim2.new(1, 0, 1, (0.0))
                var_backgroundTransparency_dd44.BackgroundTransparency = 1
                var_backgroundTransparency_dd44.Text = text
                var_backgroundTransparency_dd44.TextColor3 = color
                var_backgroundTransparency_dd44.TextStrokeTransparency = 0
                var_backgroundTransparency_dd44.TextStrokeColor3 = Color3.new(0, 0, (0.0))
                var_backgroundTransparency_dd44.TextSize = var_font_7941 or 22
                var_backgroundTransparency_dd44.Font = Enum.Font.GothamBold
                var_backgroundTransparency_dd44.RichText = true
                var_backgroundTransparency_dd44.Parent = var_backgroundTransparency_2a69
                return var_backgroundTransparency_2a69
            end

            local function fn_GetHelper_5e2a(isKiller)
                return isKiller and Config.cfg_showName_99cf or Config.cfg_showName_addf
            end

            function fn_GetHandler_d1b6()
                for player, var_rootPart_a28d in pairs(State.espObjects) do
                    if var_rootPart_a28d and var_rootPart_a28d.billboard and var_rootPart_a28d.billboard.Parent then
                        local var_player_939c = GetPlayerRole(player)
                        local isKiller = var_player_939c == "killer"
                        var_rootPart_a28d.nameLabel.Visible = (isKiller and Config.cfg_showName_58b7) or (not isKiller and Config.cfg_showName_4ad0)
                        var_rootPart_a28d.nameLabel.Text = State.var_player_609f and (State.var_player_2b0c[player] or player.Name) or player.Name
                        var_rootPart_a28d.billboard.MaxDistance = fn_GetHelper_5e2a(isKiller)
                        if var_rootPart_a28d.itemBillboard then var_rootPart_a28d.itemBillboard.MaxDistance = fn_GetHelper_5e2a(isKiller) end
                    end
                end
                for player, var_connection_e4b3 in pairs(State.outlineObjects) do
                    if var_connection_e4b3 and var_connection_e4b3.Parent then
                        local var_player_939c = GetPlayerRole(player)
                        local isKiller = var_player_939c == "killer"
                        local color = isKiller and Config.cfg_showName_957b or Config.cfg_showName_a907
                        local var_error_e455 = (isKiller and Config.cfg_showName_435d) or (not isKiller and Config.cfg_showName_4d79)
                        local var_unknownValue_0045_4bd7 = (isKiller and Config.cfg_enableSCPESP_f2ce) or (not isKiller and Config.cfg_enableSCPESP_dd03)
                        var_connection_e4b3.FillColor = color
                        var_connection_e4b3.OutlineColor = color
                        var_connection_e4b3.Enabled = var_error_e455
                        var_connection_e4b3.FillTransparency = var_unknownValue_0045_4bd7 and (1.0) or Config.fillTransparency
                    end
                end
                var_billboard_763c()
            end

            local function fn_GetHelper_1caf(player)
                if player == LocalPlayer or not player or not player.Parent then return end
                local var_unknownValue_0025_2de6 = State.espObjects[player]
                if var_unknownValue_0025_2de6 then
                    if var_unknownValue_0025_2de6.billboard and var_unknownValue_0025_2de6.billboard.Parent then var_unknownValue_0025_2de6.billboard.Destroy(var_unknownValue_0025_2de6.billboard) end
                    if var_unknownValue_0025_2de6.itemBillboard and var_unknownValue_0025_2de6.itemBillboard.Parent then var_unknownValue_0025_2de6.itemBillboard.Destroy(var_unknownValue_0025_2de6.itemBillboard) end
                end
                local var_player_9e6f = State.outlineObjects[player]
                if var_player_9e6f and var_player_9e6f.Parent then var_player_9e6f.Destroy(var_player_9e6f) end
                State.espObjects[player] = nil
                State.outlineObjects[player] = nil
                var_player_1981(player)
                var_player_edf8(player)
            end

        -- [VISUAL] Manajemen ESP pemain dan objek
        function ForceRefreshAllESP()
                for _, player in ipairs(Players.GetPlayers(Players)) do
                    if player ~= LocalPlayer then fn_GetHelper_1caf(player) end
                end
            end

            function GetCamPosition()
                local var_rootPart_2947 = workspace.CurrentCamera
                if var_rootPart_2947 then return var_rootPart_2947.CFrame.Position end
        if (456%2==0) then local var_position_d9da=693 else local var_position_d9da=675 end
                return nil
            end

            var_billboard_763c = function()
                local var_rootPart_95b4 = GetCamPosition()
                if not var_rootPart_95b4 then return end
                for player, var_rootPart_a28d in pairs(State.espObjects) do
                    if player and player.Parent then
                        local char = player.Character
                        local var_rootPart_186c = char and (char.FindFirstChild(char,"HumanoidRootPart") or char.FindFirstChild(char,"Torso") or char.FindFirstChild(char,"UpperTorso") or char.FindFirstChild(char,"Head"))
                        if var_rootPart_186c then
                            local dist = (var_rootPart_186c.Position - var_rootPart_95b4).Magnitude
                            local isKiller = GetPlayerRole(player) == "killer"
                            local var_player_7bdc = fn_GetHelper_5e2a(isKiller)
                            local var_head_f7e2 = dist <= var_player_7bdc

                            local var_connection_e4b3 = State.outlineObjects[player]
                            if var_connection_e4b3 then
                                local var_error_e455 = (isKiller and Config.cfg_showName_435d) or (not isKiller and Config.cfg_showName_4d79)
                                local var_userId_729b = var_error_e455 and var_head_f7e2
                                if var_connection_e4b3.Enabled ~= var_userId_729b then var_connection_e4b3.Enabled = var_userId_729b end
                            end
                            if var_rootPart_a28d then
                                if var_rootPart_a28d.billboard then
                                    local var_distance_f1f5 = (isKiller and Config.cfg_showName_58b7) or (not isKiller and Config.cfg_showName_4ad0)
                                    local var_distance_7299 = var_head_f7e2 and var_distance_f1f5
                                    if var_rootPart_a28d.billboard.Enabled ~= var_distance_7299 then var_rootPart_a28d.billboard.Enabled = var_distance_7299 end
                                    var_rootPart_a28d.billboard.MaxDistance = var_player_7bdc
                                end
                                if var_rootPart_a28d.itemBillboard and Config.cfg_scpESPDistance_66fd then
                                    if var_rootPart_a28d.itemBillboard.Enabled ~= var_head_f7e2 then var_rootPart_a28d.itemBillboard.Enabled = var_head_f7e2 end
                                end
                            end
                        end
                    end
                end
            end

            function AttachESPToChar(player, char)
                local var_rootPart_a28d = State.espObjects[player]
                if not var_rootPart_a28d then return end
                if not char or not char.Parent or player.Character ~= char then return end

                local var_rootPart_186c = char.FindFirstChild(char,"HumanoidRootPart")
                    or char.FindFirstChild(char,"Torso")
                    or char.FindFirstChild(char,"UpperTorso")
                    or char.FindFirstChild(char,"Head")

                if not var_rootPart_186c then
                    task.spawn(function()
                        local var_success_abb9, waitedRoot = pcall(function() return char.WaitForChild(char,"HumanoidRootPart", (3.0)) end)
                        if var_success_abb9 and waitedRoot and waitedRoot.Parent and char.Parent and player.Character == char then
                            if var_rootPart_a28d.billboard then
                                var_rootPart_a28d.billboard.Adornee = waitedRoot
                                var_rootPart_a28d.billboard.Enabled = true
                            end
                            if var_rootPart_a28d.itemBillboard then
                                var_rootPart_a28d.itemBillboard.Adornee = waitedRoot
                                var_rootPart_a28d.itemBillboard.Enabled = true
                            end
                        end
                    end)
                    return
                end

                if var_rootPart_a28d.billboard then
                    var_rootPart_a28d.billboard.Adornee = var_rootPart_186c
                    var_rootPart_a28d.billboard.Enabled = true
                end
                if var_rootPart_a28d.itemBillboard then
                    var_rootPart_a28d.itemBillboard.Adornee = var_rootPart_186c
                    var_rootPart_a28d.itemBillboard.Enabled = true
                end

                local var_player_939c = GetPlayerRole(player)
                local isKiller = var_player_939c == "killer"
                var_rootPart_a28d.nameLabel.Visible = (isKiller and Config.cfg_showName_58b7) or (not isKiller and Config.cfg_showName_4ad0)
                var_rootPart_a28d.nameLabel.Text = State.var_player_609f and (State.var_player_2b0c[player] or player.Name) or player.Name
            end

            function RemovePlayerESP(player)
                if State.espObjects[player] then

                    if State.espObjects[player].billboard then
                        State.espObjects[player].billboard.Destroy(State.espObjects[player].billboard)
                    end

                    if State.espObjects[player].itemBillboard then
                        State.espObjects[player].itemBillboard.Destroy(State.espObjects[player].itemBillboard)
                    end
                    State.espObjects[player] = nil
                end
                if State.outlineObjects[player] then
                    State.outlineObjects[player].Destroy(State.outlineObjects[player])
                    State.outlineObjects[player] = nil
                end
                State.playerRoles[player] = nil
                if State.playerTeamConns[player] then
                    State.playerTeamConns[player].Disconnect(State.playerTeamConns[player])
                    State.playerTeamConns[player] = nil
                end
            end

            function AttachOutlineToChar(player, char)
                local var_connection_e4b3 = State.outlineObjects[player]
                if not var_connection_e4b3 then return end
                if not char or not char.Parent or player.Character ~= char then return end

                local var_player_939c = GetPlayerRole(player)
                local isKiller = var_player_939c == "killer"
                local color = isKiller and Config.cfg_showName_957b or Config.cfg_showName_a907
                local var_error_e455 = (isKiller and Config.cfg_showName_435d) or (not isKiller and Config.cfg_showName_4d79)
                local var_unknownValue_0045_4bd7 = (isKiller and Config.cfg_enableSCPESP_f2ce) or (not isKiller and Config.cfg_enableSCPESP_dd03)

                var_connection_e4b3.Adornee = char
                var_connection_e4b3.FillColor = color
                var_connection_e4b3.OutlineColor = color
                var_connection_e4b3.FillTransparency = var_unknownValue_0045_4bd7 and 1 or Config.fillTransparency
                var_connection_e4b3.OutlineTransparency = (0.0)
                var_connection_e4b3.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                var_connection_e4b3.Enabled = var_error_e455
            end

            function ValidateAndReattachESP(player)
                if player == LocalPlayer then return end
                if not player or not player.Parent then return end

                local var_rootPart_a28d = State.espObjects[player]
                local var_connection_e4b3 = State.outlineObjects[player]
                if not var_rootPart_a28d and not var_connection_e4b3 then return end



                if (var_rootPart_a28d and var_rootPart_a28d.billboard and not var_rootPart_a28d.billboard.Parent) or (var_connection_e4b3 and not var_connection_e4b3.Parent) then
                    fn_GetHelper_1caf(player)
                    return
                end

                local char = player.Character
        if false then local var_character_6859=563 end
                if not char or not char.Parent then
                    if var_rootPart_a28d and var_rootPart_a28d.billboard then var_rootPart_a28d.billboard.Adornee = nil end
                    if var_rootPart_a28d and var_rootPart_a28d.itemBillboard then var_rootPart_a28d.itemBillboard.Adornee = nil end
                    if var_connection_e4b3 then var_connection_e4b3.Adornee = nil
                    var_connection_e4b3.Enabled = false end
                    return
                end

                local var_rootPart_186c = char.FindFirstChild(char,"HumanoidRootPart")
                    or char.FindFirstChild(char,"Torso")
                    or char.FindFirstChild(char,"UpperTorso")
                    or char.FindFirstChild(char,"Head")
                if not var_rootPart_186c then return end


                local var_rootPart_95b4 = GetCamPosition()
                local var_head_f7e2 = true
                if var_rootPart_95b4 then
                    local dist = (var_rootPart_186c.Position - var_rootPart_95b4).Magnitude
                    local var_position_2a88 = GetPlayerRole(player) == "killer"
                    var_head_f7e2 = dist <= fn_GetHelper_5e2a(var_position_2a88)
                end
                local var_error_4bbb = GetPlayerRole(player) == "killer"
                local var_error_6ba7 = (var_error_4bbb and Config.cfg_showName_58b7) or (not var_error_4bbb and Config.cfg_showName_4ad0)
                local var_error_895c = (var_error_4bbb and Config.cfg_showName_435d) or (not var_error_4bbb and Config.cfg_showName_4d79)


                if var_rootPart_a28d and var_rootPart_a28d.billboard then
                    if var_rootPart_a28d.billboard.Adornee ~= var_rootPart_186c then var_rootPart_a28d.billboard.Adornee = var_rootPart_186c end
                    local var_distance_7299 = var_head_f7e2 and var_error_6ba7
                    if var_rootPart_a28d.billboard.Enabled ~= var_distance_7299 then var_rootPart_a28d.billboard.Enabled = var_distance_7299 end
                end
                if var_rootPart_a28d and var_rootPart_a28d.itemBillboard then
                    if var_rootPart_a28d.itemBillboard.Adornee ~= var_rootPart_186c then var_rootPart_a28d.itemBillboard.Adornee = var_rootPart_186c end
                    if var_rootPart_a28d.itemBillboard.Enabled ~= var_head_f7e2 then var_rootPart_a28d.itemBillboard.Enabled = var_head_f7e2 end
                end

                if var_connection_e4b3 then
                    if var_connection_e4b3.Adornee ~= char then
                        AttachOutlineToChar(player, char)
                    else
                        local var_billboard_7373 = var_head_f7e2 and var_error_895c
                        if var_connection_e4b3.Enabled ~= var_billboard_7373 then var_connection_e4b3.Enabled = var_billboard_7373 end
                    end
                end
            end

            var_player_1981 = function(player)
                if player == LocalPlayer then return end
                UpdatePlayerRole(player)
                local var_player_939c = GetPlayerRole(player)


                local billboard = Instance.new("BillboardGui")
                billboard.Name = "ESP_BB_" .. player.Name
                billboard.AlwaysOnTop = true
                billboard.Size = UDim2.new(0, (150.0), 0, (18.0))
                billboard.StudsOffset = Vector3.new(0, 3.5, 0)
                billboard.MaxDistance = fn_GetHelper_5e2a(var_player_939c == "killer")
                billboard.Parent = EnsureESPFolder()

                local nameLabel = Instance.new("TextLabel")
                nameLabel.Name = "NameLabel"
                nameLabel.Size = UDim2.new(1, 0, 1, (0.0))
                nameLabel.BackgroundTransparency = 1
                nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                nameLabel.TextStrokeTransparency = 0
                nameLabel.TextStrokeColor3 = Color3.new((0.0), 0, (0.0))
                nameLabel.TextSize = 12
                nameLabel.Font = Enum.Font.GothamBold
                nameLabel.Text = State.var_player_609f and (State.var_player_2b0c[player] or player.Name) or player.Name
                nameLabel.Visible = (var_player_939c == "killer" and Config.cfg_showName_58b7) or (var_player_939c ~= "killer" and Config.cfg_showName_4ad0)
                nameLabel.Parent = billboard


                local itemBillboard = Instance.new("BillboardGui")
                itemBillboard.Name = "ESP_Item_" .. player.Name
                itemBillboard.AlwaysOnTop = true


                itemBillboard.Size = UDim2.new(1.5, (0.0), 1.5, (0.0))

                itemBillboard.StudsOffset = Vector3.new((0.0), -5, (0.0))
                itemBillboard.MaxDistance = fn_GetHelper_5e2a(var_player_939c == "killer")
                itemBillboard.Parent = EnsureESPFolder()

                local itemImage = Instance.new("ImageLabel")
                itemImage.Name = "ItemImage"
                itemImage.Size = UDim2.new(1, 0, 1, 0)
                itemImage.BackgroundTransparency = 1
                itemImage.Visible = false
                itemImage.Parent = itemBillboard


                State.espObjects[player] = {
                    billboard = billboard,
                    nameLabel = nameLabel,
                    itemBillboard = itemBillboard,
                    itemImage = itemImage
                }

                if player.Character then AttachESPToChar(player, player.Character) end
                if not State.playerTeamConns[player] then
                    State.playerTeamConns[player] = player:GetPropertyChangedSignal("Team"):Connect(function()
                        UpdatePlayerRole(player)
                        fn_GetHandler_d1b6()

                        task.delay(0.5, function() ValidateAndReattachESP(player) end)
                        task.delay(2, function() ValidateAndReattachESP(player) end)
                    end)
                end
            end

            var_player_edf8 = function(player)
                if player == LocalPlayer then return end
                local var_connection_e4b3 = Instance.new("Highlight")
                var_connection_e4b3.Parent = EnsureESPFolder()
                State.outlineObjects[player] = var_connection_e4b3
                if player.Character then AttachOutlineToChar(player, player.Character) end
            end
        end

        local fn_GeneratorHelper_f945, ApplyAntiLoopWindow, DisableAntiLoopWindow, DropAllPallets, ApplyGhostGateToObj
        do
            local function fn_GeneratorHelper_78f0(var_instance_5397, name)
                if typeof(var_instance_5397) ~= "Instance" then return nil end
                local var_attributeValue_a33a = var_instance_5397.GetAttribute(var_instance_5397,name)
                if var_attributeValue_a33a ~= nil then return var_attributeValue_a33a end
                local var_instance_4e7f = var_instance_5397.FindFirstChild(var_instance_5397,name)
                if var_instance_4e7f and var_instance_4e7f.IsA(var_instance_4e7f,"ValueBase") then return var_instance_4e7f.Value end
                return nil
            end

            local function fn_GeneratorHelper_3645(object, color)
                if not object or not object.Parent then return end
                local var_highlight_980e = object.FindFirstChild(object,"__BolongHL__")
                if not var_highlight_980e then
                    var_highlight_980e = Instance.new("Highlight")
                    var_highlight_980e.Name = "__BolongHL__"
                    var_highlight_980e.Adornee = object
                    var_highlight_980e.FillTransparency = 1
                    var_highlight_980e.OutlineTransparency = (0.0)
                    var_highlight_980e.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    var_highlight_980e.FillColor = color
                    var_highlight_980e.OutlineColor = color
                    var_highlight_980e.Parent = object
                    return
                end
                if var_highlight_980e.FillColor ~= color then var_highlight_980e.FillColor = color
                var_highlight_980e.OutlineColor = color end
                if not var_highlight_980e.Enabled then var_highlight_980e.Enabled = true end
            end

            local function fn_GeneratorHelper_d2f0(object)
                if not object then return end
                local var_highlight_980e = object.FindFirstChild(object,"__BolongHL__")
                if var_highlight_980e then var_highlight_980e.Destroy(var_highlight_980e) end
            end

            local function fn_GeneratorHelper_2322(generator)
                if not generator or not generator.Parent then return true end
                if State.var_descendant_ada3[generator] then return true end

                local var_color_4016 = generator.GetAttribute(generator,"RepairProgress") or generator.GetAttribute(generator,"Progress") or 0
                local var_unknownValue_0014_e119 = (var_color_4016 >= (100.0)) or (generator.GetAttribute(generator,"Completed") == true) or (generator.GetAttribute(generator,"IsCompleted") == true) or (generator.GetAttribute(generator,"Done") == true)

                local billboard = generator.FindFirstChild(generator,"__BolongGenProgress__")


                if var_unknownValue_0014_e119 then
                    if billboard then billboard.Destroy(billboard) end
                    fn_GeneratorHelper_d2f0(generator)
                    generator.SetAttribute(generator,"__BolongGenLastPct__", nil)
                    generator.SetAttribute(generator,"__BolongGenLastInfo__", nil)
                    State.var_descendant_ada3[generator] = true
                    State.var_descendant_ef74[generator] = nil
                    return var_unknownValue_0014_e119
                end


                if Config.cfg_showGeneratorInfo_9e74 then
                    fn_GeneratorHelper_3645(generator, Config.cfg_showGeneratorInfo_8492)
                else
                    fn_GeneratorHelper_d2f0(generator)
                end


                if Config.cfg_outlineOnly_2e99 then
                    local var_billboard_a071 = generator.GetAttribute(generator,"PlayersRepairingCount") or 0
                    local var_billboard_b9bb = generator.GetAttribute(generator,"kickcount") or 0

                    local var_color_a65a = math.floor(var_color_4016 + 0.5)
                    local var_unknownValue_0038_258d = generator.GetAttribute(generator,"__BolongGenLastPct__")
                    local var_unknownValue_0044_fe3b = generator.GetAttribute(generator,"__BolongGenLastInfo__")
                    local var_color_53f8 = State.var_descendant_ef74[generator] or 1


                    local var_color_9ffa = string.format("%d_%d_%d_%s_%d", var_color_a65a, var_billboard_a071, var_billboard_b9bb, tostring(Config.cfg_survivorESPDistance_e369), var_color_53f8)

                    if var_unknownValue_0038_258d == var_color_a65a and var_unknownValue_0044_fe3b == var_color_9ffa and billboard then return false end

                    generator.SetAttribute(generator,"__BolongGenLastPct__", var_color_a65a)
                    generator.SetAttribute(generator,"__BolongGenLastInfo__", var_color_9ffa)

                    local var_color_6a12 = math.clamp(var_color_4016, 0, 100)
                    local var_color_ac3e = (var_color_6a12 < (50.0)) and Config.cfg_showGeneratorInfo_8492.Lerp(Config.cfg_showGeneratorInfo_8492,Color3.fromRGB(255, 200, 0), var_color_6a12 / 50) or Color3.fromRGB(255, 200, 0):Lerp(Color3.fromRGB(100, (255.0), 80), (var_color_6a12 - 50) / (50.0))
                    local var_color_f358 = var_color_ac3e.ToHex(var_color_ac3e)

                    local var_color_f13b = string.format("GEN%d", var_color_53f8)
                    local var_part_d683 = string.format("%d%%", var_color_a65a)

                    local var_descendant_9d5f = generator.FindFirstChild(generator,"GeneratorBody", true)
                                    or generator.FindFirstChild(generator,"defaultMaterial", true)
                                    or (generator.IsA(generator,"Model") and generator.PrimaryPart)
                                    or generator.FindFirstChildWhichIsA(generator,"BasePart", true)

                    if not var_descendant_9d5f then return false end

                    local var_basePart_dfd2 = "F4D03F"


                    local var_basePart_8dc9 = string.format(
                        (function() if var_section_a5d6 and buffer then local _bf=buffer.create(97) local _by={60,102,111,110,116,32,115,105,122,101,61,34,57,34,32,99,111,108,111,114,61,34,35,37,115,34,62,37,115,60,47,102,111,110,116,62,32,60,102,111,110,116,32,99,111,108,111,114,61,34,35,53,53,53,53,53,53,34,62,226,148,130,60,47,102,111,110,116,62,32,60,102,111,110,116,32,99,111,108,111,114,61,34,35,37,115,34,62,37,115,60,47,102,111,110,116,62} for _i=1,#_by do buffer.writeu8(_bf,_i-1,_by[_i]) end local _s={} for _i=1,#_by do _s[_i]=string.char(buffer.readu8(_bf,_i-1)) end return table.concat(_s) else local _by={60,102,111,110,116,32,115,105,122,101,61,34,57,34,32,99,111,108,111,114,61,34,35,37,115,34,62,37,115,60,47,102,111,110,116,62,32,60,102,111,110,116,32,99,111,108,111,114,61,34,35,53,53,53,53,53,53,34,62,226,148,130,60,47,102,111,110,116,62,32,60,102,111,110,116,32,99,111,108,111,114,61,34,35,37,115,34,62,37,115,60,47,102,111,110,116,62} local _s={} for _i=1,#_by do _s[_i]=string.char(_by[_i]) end return table.concat(_s) end end)(),
                        var_basePart_dfd2, var_color_f13b, var_color_f358, var_part_d683
                    )

                    if Config.cfg_survivorESPDistance_e369 then
                        var_basePart_8dc9 = var_basePart_8dc9 .. string.format(" <font color=\"#555555\">|</font> <font color=\"#76D7C4\">P:%d</font> <font color=\"#555555\">|</font> <font color=\"#FF6B6B\">K:%d</font>", var_billboard_a071, var_billboard_b9bb)
                    end

                    if not billboard then
                        billboard = Instance.new("BillboardGui")
                        billboard.Name = "__BolongGenProgress__"
                        billboard.Adornee = var_descendant_9d5f
                        billboard.AlwaysOnTop = true
                        billboard.LightInfluence = 0
                        billboard.ResetOnSpawn = false
                        billboard.MaxDistance = (260.0)
                        billboard.Size = UDim2.new(0, (100.0), (0.0), 14)

                        local var_backgroundTransparency_7852 = (var_descendant_9d5f.Size.Y / 2) + 3.5
                        billboard.StudsOffset = Vector3.new(0, var_backgroundTransparency_7852, 0)

                        billboard.Parent = generator

                        local var_backgroundTransparency_dd44 = Instance.new("TextLabel")
                        var_backgroundTransparency_dd44.Name = "Label"
                        var_backgroundTransparency_dd44.BackgroundTransparency = 1
                        var_backgroundTransparency_dd44.Size = UDim2.new((1.0), 0, 1, 0)
                        var_backgroundTransparency_dd44.Position = UDim2.new(0, (0.0), 0, 0)
                        var_backgroundTransparency_dd44.Font = Enum.Font.GothamBlack
                        var_backgroundTransparency_dd44.TextSize = 11
                        var_backgroundTransparency_dd44.RichText = true
                        var_backgroundTransparency_dd44.Text = var_basePart_8dc9
                        var_backgroundTransparency_dd44.TextColor3 = Color3.fromRGB(255, 255, (255.0))
                        var_backgroundTransparency_dd44.TextXAlignment = Enum.TextXAlignment.Center
                        var_backgroundTransparency_dd44.Parent = billboard

                        local var_uiStroke_ef07 = Instance.new("UIStroke")
                        var_uiStroke_ef07.Thickness = 0.8
                        var_uiStroke_ef07.Transparency = 0.4
                        var_uiStroke_ef07.Color = Color3.new(0, 0, 0)
                        var_uiStroke_ef07.Parent = var_backgroundTransparency_dd44
                    else
                        if billboard.Adornee ~= var_descendant_9d5f then billboard.Adornee = var_descendant_9d5f end

                        local var_backgroundTransparency_7852 = (var_descendant_9d5f.Size.Y / 2) + 3.5
                        billboard.StudsOffset = Vector3.new(0, var_backgroundTransparency_7852, 0)

                        local var_backgroundTransparency_dd44 = billboard.FindFirstChild(billboard,"Label")
                        if var_backgroundTransparency_dd44 then var_backgroundTransparency_dd44.Text = var_basePart_8dc9 end
                    end
                else
                    if billboard then
                        billboard.Destroy(billboard)
                        generator.SetAttribute(generator,"__BolongGenLastPct__", nil)
                        generator.SetAttribute(generator,"__BolongGenLastInfo__", nil)
                    end
                end
                return false
            end

            local function fn_GeneratorHelper_b8f1(generator)
                local function fn_GeneratorHelper_b8d6()

                    if not Config.cfg_showGeneratorInfo_9e74 and not Config.cfg_outlineOnly_2e99 then return end
                    fn_GeneratorHelper_2322(generator)
                end

                pcall(function()
                    generator:GetAttributeChangedSignal("RepairProgress"):Connect(fn_GeneratorHelper_b8d6)
                    generator:GetAttributeChangedSignal("Progress"):Connect(fn_GeneratorHelper_b8d6)
                    generator:GetAttributeChangedSignal("Completed"):Connect(fn_GeneratorHelper_b8d6)
                    generator:GetAttributeChangedSignal("IsCompleted"):Connect(fn_GeneratorHelper_b8d6)
                    generator:GetAttributeChangedSignal("PlayersRepairingCount"):Connect(fn_GeneratorHelper_b8d6)
                    generator:GetAttributeChangedSignal("kickcount"):Connect(fn_GeneratorHelper_b8d6)
                end)
            end

            local function fn_GeneratorHandler_5aec(var_connection_5b02, var_name_8753)
                local function fn_GeneratorHandler_711b()
                    local var_unknownValue_0039_acac = fn_GeneratorHelper_78f0(var_connection_5b02, "Dropped") or fn_GeneratorHelper_78f0(var_connection_5b02, "IsDropped")
                    local var_unknownValue_0004_38bc = fn_GeneratorHelper_78f0(var_connection_5b02, "Broken") or fn_GeneratorHelper_78f0(var_connection_5b02, "IsBroken") or fn_GeneratorHelper_78f0(var_connection_5b02, "Destroyed")
                    if var_unknownValue_0039_acac or var_unknownValue_0004_38bc or var_name_8753.isFake then
                        fn_GeneratorHelper_d2f0(var_connection_5b02)
                        for var_remoteEvent_5dde, var_player_2e5f in ipairs(State.state_espHook_4896.Pallets) do
                            if var_player_2e5f == var_connection_5b02 then table.remove(State.state_espHook_4896.Pallets, var_remoteEvent_5dde)
                            break end
                        end
                        State.var_descendant_b8d3[var_connection_5b02] = nil
                    end
                end
                for _, var_attributeValue_a33a in ipairs({"Dropped","IsDropped","Broken","IsBroken","Destroyed"}) do
                    var_connection_5b02:GetAttributeChangedSignal(var_attributeValue_a33a):Connect(fn_GeneratorHandler_711b)
                end
                var_connection_5b02.ChildAdded.Connect(var_connection_5b02.ChildAdded,function(var_instance_4e7f)
                    if var_instance_4e7f.IsA(var_instance_4e7f,"ValueBase") and (var_instance_4e7f.Name=="Dropped" or var_instance_4e7f.Name=="IsDropped" or var_instance_4e7f.Name=="Broken" or var_instance_4e7f.Name=="IsBroken" or var_instance_4e7f.Name=="Destroyed") then
                        var_instance_4e7f.Changed.Connect(var_instance_4e7f.Changed,fn_GeneratorHandler_711b)
                    end
                end)
            end

            function ApplyGhostGateToObj(var_child_897f, enabled)
                if not var_child_897f or not var_child_897f.Parent then return end
                local var_child_33e9 = var_child_897f.IsA(var_child_897f,"BasePart") and {var_child_897f} or {}
                if not var_child_897f.IsA(var_child_897f,"BasePart") then
                    local function fn_GeneratorHandler_b3b0(var_child_a03d)
                        for _, var_instance_4e7f in ipairs(var_child_a03d.GetChildren(var_child_a03d)) do
                            if var_instance_4e7f.IsA(var_instance_4e7f,"BasePart") then table.insert(var_child_33e9, var_instance_4e7f) end
                            fn_GeneratorHandler_b3b0(var_instance_4e7f)
                        end
                    end
                    fn_GeneratorHandler_b3b0(var_child_897f)
                end
                for _, part in ipairs(var_child_33e9) do
                    if part.IsA(part,"BasePart") then
                        if enabled then
                            if not State.ghostGateOriginals[part] then
                                State.ghostGateOriginals[part] = { CanCollide = part.CanCollide, Transparency = part.Transparency }
                            end
                            part.CanCollide = false
                            part.Transparency = 0.6
                        else
                            if State.ghostGateOriginals[part] then
                                part.CanCollide = State.ghostGateOriginals[part].CanCollide
                                part.Transparency = State.ghostGateOriginals[part].Transparency
                            end
                        end
                    end
                end
            end

            local function fn_GeneratorHandler_9919(var_descendant_fe40)
                local n = var_descendant_fe40.Name
                if n == "Generator" then
                    table.insert(State.state_espHook_4896.Generators, var_descendant_fe40)
                    if not State.var_descendant_ef74[var_descendant_fe40] then

                        if next(State.var_descendant_ef74) == nil then
                            State.var_descendant_61c2 = (1.0)
                        end
                        State.var_descendant_ef74[var_descendant_fe40] = State.var_descendant_61c2
                        State.var_descendant_61c2 = State.var_descendant_61c2 + 1
                    end
                    if Config.cfg_showGeneratorInfo_9e74 then fn_GeneratorHelper_2322(var_descendant_fe40)
                    fn_GeneratorHelper_b8f1(var_descendant_fe40) end
                elseif n == "Hook" then
                    table.insert(State.state_espHook_4896.Hooks, var_descendant_fe40)
                    local var_child_33e9 = {}
                    local m = var_descendant_fe40.FindFirstChild(var_descendant_fe40,"Model")
                    if m then
                        local function fn_GeneratorHandler_e146(var_child_a03d)
                            for _, var_instance_4e7f in ipairs(var_child_a03d.GetChildren(var_child_a03d)) do
                                if var_instance_4e7f.IsA(var_instance_4e7f,"MeshPart") then table.insert(var_child_33e9, var_instance_4e7f) end
                                fn_GeneratorHandler_e146(var_instance_4e7f)
                            end
                        end
                        fn_GeneratorHandler_e146(m)
                    end
                    State.state_windowColor_5aaf[var_descendant_fe40] = var_child_33e9
                    if Config.cfg_progressGen_4bd4 then
                        if #var_child_33e9 > (0.0) then for _, var_player_2e5f in ipairs(var_child_33e9) do fn_GeneratorHelper_3645(var_player_2e5f, Config.cfg_generatorColor_f209) end
                        else fn_GeneratorHelper_3645(var_descendant_fe40, Config.cfg_generatorColor_f209) end
                    end
                elseif n == "Gate" then
                    table.insert(State.state_espHook_4896.Gates, var_descendant_fe40)
                    if Config.cfg_showGeneratorInfo_4daa then fn_GeneratorHelper_3645(var_descendant_fe40, Config.cfg_palletColor_6b93) end
                    if State.state_flowstateCooldownS_9e95 then ApplyGhostGateToObj(var_descendant_fe40, true) end
                elseif n == "Pallet" or n == "Palletwrong" then
                    table.insert(State.state_espHook_4896.Pallets, var_descendant_fe40)
                    local var_basePart_1a91 = n.lower(n)
                    local part = (var_descendant_fe40.IsA(var_descendant_fe40,"Model") and var_descendant_fe40.PrimaryPart) or var_descendant_fe40.FindFirstChildWhichIsA(var_descendant_fe40,"BasePart", true) or (var_descendant_fe40.IsA(var_descendant_fe40,"BasePart") and var_descendant_fe40)
                    local fake = var_basePart_1a91.find(var_basePart_1a91,"fake") or var_basePart_1a91.find(var_basePart_1a91,"broken") or var_basePart_1a91.find(var_basePart_1a91,"destroyed")
                    local var_name_8753 = { part = part, isFake = fake and true or false }
                    State.var_descendant_b8d3[var_descendant_fe40] = var_name_8753
                    if Config.cfg_espGenerator_21a5 and not var_name_8753.isFake then fn_GeneratorHelper_3645(var_descendant_fe40, Config.cfg_espHook_ce98) end
                    fn_GeneratorHandler_5aec(var_descendant_fe40, var_name_8753)
                end
            end

            local function fn_GeneratorHandler_45a1(var_descendant_fe40)
        do local var_name_c4cb=2513%21 end
                local n = var_descendant_fe40.Name
                if n == "Generator" then
                    for var_remoteEvent_5dde, var_value_d1f9 in ipairs(State.state_espHook_4896.Generators) do
                        if var_value_d1f9 == var_descendant_fe40 then table.remove(State.state_espHook_4896.Generators, var_remoteEvent_5dde)
                        break end
                    end
                    State.var_descendant_ef74[var_descendant_fe40] = nil
                    State.var_descendant_ada3[var_descendant_fe40] = nil
                    fn_GeneratorHelper_d2f0(var_descendant_fe40)
                    local var_rootPart_b34c = var_descendant_fe40.FindFirstChild(var_descendant_fe40,"__BolongGenProgress__")
                    if var_rootPart_b34c then var_rootPart_b34c.Destroy(var_rootPart_b34c) end

                    if next(State.var_descendant_ef74) == nil then
                        State.var_descendant_61c2 = (1.0)
                    end
                elseif n == "Hook" then
                    for var_remoteEvent_5dde, var_value_d1f9 in ipairs(State.state_espHook_4896.Hooks) do
                        if var_value_d1f9 == var_descendant_fe40 then table.remove(State.state_espHook_4896.Hooks, var_remoteEvent_5dde)
                        break end
                    end
                    local var_child_33e9 = State.state_windowColor_5aaf[var_descendant_fe40]
                    if var_child_33e9 then for _, var_player_2e5f in ipairs(var_child_33e9) do fn_GeneratorHelper_d2f0(var_player_2e5f) end else fn_GeneratorHelper_d2f0(var_descendant_fe40) end
                    State.state_windowColor_5aaf[var_descendant_fe40] = nil
                elseif n == "Gate" then
                    for var_remoteEvent_5dde, var_value_d1f9 in ipairs(State.state_espHook_4896.Gates) do
                        if var_value_d1f9 == var_descendant_fe40 then table.remove(State.state_espHook_4896.Gates, var_remoteEvent_5dde)
                        break end
                    end
                    fn_GeneratorHelper_d2f0(var_descendant_fe40)
                elseif n == "Pallet" or n == "Palletwrong" then
                    for var_remoteEvent_5dde, var_value_d1f9 in ipairs(State.state_espHook_4896.Pallets) do
                        if var_value_d1f9 == var_descendant_fe40 then table.remove(State.state_espHook_4896.Pallets, var_remoteEvent_5dde)
                        break end
                    end
                    fn_GeneratorHelper_d2f0(var_descendant_fe40)
                    State.var_descendant_b8d3[var_descendant_fe40] = nil
                end
            end

            local function fn_GeneratorHelper_77b1(var_descendant_b2cb)
                if not var_descendant_b2cb then return end
                State.state_espHook_4896 = { Generators={}, Pallets={}, Hooks={}, Gates={} }
                State.var_descendant_b8d3 = {}
                State.state_windowColor_5aaf = {}
                State.var_descendant_ada3 = {}
                State.var_descendant_ef74 = {}
                State.var_descendant_61c2 = 1
                for _, var_instance_5397 in ipairs(var_descendant_b2cb.GetDescendants(var_descendant_b2cb)) do fn_GeneratorHandler_9919(var_instance_5397) end
            end

            local function fn_RemoveHelper_8e0c(var_descendant_b2cb)
                if not var_descendant_b2cb then return end
                fn_GeneratorHelper_77b1(var_descendant_b2cb)
                var_descendant_b2cb.DescendantAdded.Connect(var_descendant_b2cb.DescendantAdded,fn_GeneratorHandler_9919)
                var_descendant_b2cb.DescendantRemoving.Connect(var_descendant_b2cb.DescendantRemoving,fn_GeneratorHandler_45a1)
                State.var_descendant_18df = true
            end




            State.state_espWindow_920d = {}
            State._windowParts = {}
            State._windowPartMap = {}

            local function fn_GeneratorHelper_fdde(part)
                if not part or not part.Parent or State.state_espWindow_920d[part] then return end

                local color = Config.cfg_espWindow_51ce


                local var_color_5039 = Instance.new("BoxHandleAdornment")
                var_color_5039.Name = "WindowESP_Box"
                var_color_5039.Adornee = part
                var_color_5039.Color3 = color
                var_color_5039.Transparency = 0.3
                var_color_5039.Size = part.Size
                var_color_5039.AlwaysOnTop = true
                var_color_5039.ZIndex = (10.0)
                var_color_5039.Parent = EnsureESPFolder()

                State.state_espWindow_920d[part] = var_color_5039
            end

            local function fn_GeneratorHandler_bd5b(part)
                local var_color_5039 = State.state_espWindow_920d[part]
                if var_color_5039 then
                    pcall(function() var_color_5039.Destroy(var_color_5039) end)
                    State.state_espWindow_920d[part] = nil
                end
            end


            local function fn_GeneratorHelper_e99b(var_descendant_fe40)
                if typeof(var_descendant_fe40) ~= "Instance" then return nil end
                local n = string.lower(var_descendant_fe40.Name)


                if n == "window" and var_descendant_fe40.IsA(var_descendant_fe40,"Model") then
                    local var_basePart_d79f = var_descendant_fe40.FindFirstChild(var_descendant_fe40,"Bottom", true)
                    if var_basePart_d79f and var_basePart_d79f.IsA(var_basePart_d79f,"BasePart") then
                        return var_basePart_d79f
                    end
                    return var_descendant_fe40.PrimaryPart
                end


                if n == "bottom" and var_descendant_fe40.IsA(var_descendant_fe40,"BasePart") then
                    if var_descendant_fe40.Parent and string.lower(var_descendant_fe40.Parent.Name) == "window" then
                        return var_descendant_fe40
                    end
                end


                return nil
            end

            local function fn_GeneratorHandler_2bbf(var_descendant_fe40)
                local var_descendant_9d5f = fn_GeneratorHelper_e99b(var_descendant_fe40)
                if var_descendant_9d5f then
                    if not State._windowPartMap[var_descendant_9d5f] then
                        State._windowPartMap[var_descendant_9d5f] = true
                        table.insert(State._windowParts, var_descendant_9d5f)
                    end
                    if Config.cfg_showEquippedItem_e752 and not State.state_espWindow_920d[var_descendant_9d5f] then
                        fn_GeneratorHelper_fdde(var_descendant_9d5f)
                    end
                end
            end

            WorkspaceService.DescendantAdded.Connect(WorkspaceService.DescendantAdded,function(var_descendant_fe40)
                fn_GeneratorHandler_2bbf(var_descendant_fe40)
            end)

            WorkspaceService.DescendantRemoving.Connect(WorkspaceService.DescendantRemoving,function(var_descendant_fe40)
                local var_descendant_9d5f = fn_GeneratorHelper_e99b(var_descendant_fe40) or var_descendant_fe40
                if State._windowPartMap[var_descendant_9d5f] then
                    State._windowPartMap[var_descendant_9d5f] = nil
                    for var_remoteEvent_5dde, e in ipairs(State._windowParts) do
                        if e == var_descendant_9d5f then table.remove(State._windowParts, var_remoteEvent_5dde) break end
                    end
                end
                if State.state_espWindow_920d[var_descendant_9d5f] then
                    fn_GeneratorHandler_bd5b(var_descendant_9d5f)
                end
            end)

            local function fn_GeneratorHandler_1381()

                for part, var_color_5039 in pairs(State.state_espWindow_920d) do
                    if not part or not part.Parent then
                        fn_GeneratorHandler_bd5b(part)
                    end
                end


                if Config.cfg_showEquippedItem_e752 then
                    for _, target in ipairs(State._windowParts) do
                        if target and target.Parent and not State.state_espWindow_920d[target] then
                            fn_GeneratorHelper_fdde(target)
                        end
                    end
                end
            end


            task.spawn(function()
                task.wait(3)

                for _, var_instance_5397 in ipairs(WorkspaceService.GetDescendants(WorkspaceService)) do
                    local target = fn_GeneratorHelper_e99b(var_instance_5397)
                    if target and not State._windowPartMap[target] then
                        State._windowPartMap[target] = true
                        table.insert(State._windowParts, target)
                    end
                end
                fn_GeneratorHandler_1381()
            end)

            function fn_GeneratorHelper_f945()
                if not State.var_descendant_18df then return end


                local var_unknownValue_0015_3368 = Config.cfg_showGeneratorInfo_9e74 or Config.cfg_outlineOnly_2e99
                if var_unknownValue_0015_3368 then
                    local var_unknownValue_0062_4492 = {}
                    for _, var_instance_5397 in ipairs(State.state_espHook_4896.Generators) do
                        if var_instance_5397 and var_instance_5397.Parent then
                            local var_unknownValue_0035_3c16 = fn_GeneratorHelper_2322(var_instance_5397)
                            if not var_unknownValue_0035_3c16 then table.insert(var_unknownValue_0062_4492, var_instance_5397) end
                        end
                    end
                    State.state_espHook_4896.Generators = var_unknownValue_0062_4492
                else

                    for _, var_instance_5397 in ipairs(State.state_espHook_4896.Generators) do
                        if var_instance_5397 and var_instance_5397.Parent then
                            fn_GeneratorHelper_d2f0(var_instance_5397)
                            local var_rootPart_b34c = var_instance_5397.FindFirstChild(var_instance_5397,"__BolongGenProgress__")
                            if var_rootPart_b34c then var_rootPart_b34c.Destroy(var_rootPart_b34c) end
                            var_instance_5397.SetAttribute(var_instance_5397,"__BolongGenLastPct__", nil)
                        end
                    end
                end


                if Config.cfg_espGenerator_21a5 then
                    for _, var_connection_5b02 in ipairs(State.state_espHook_4896.Pallets) do
        if false then local var_unknownValue_0033_8e14=698 end
                        if var_connection_5b02 and var_connection_5b02.Parent then
                            local var_name_8753 = State.var_descendant_b8d3[var_connection_5b02]
                            if var_name_8753 and not var_name_8753.isFake then fn_GeneratorHelper_3645(var_connection_5b02, Config.cfg_espHook_ce98) end
                        end
                    end
                else
                    for _, var_connection_5b02 in ipairs(State.state_espHook_4896.Pallets) do
                        if var_connection_5b02 then fn_GeneratorHelper_d2f0(var_connection_5b02) end
                    end
                end


                if Config.cfg_progressGen_4bd4 then
                    for _, var_callback_f4cc in ipairs(State.state_espHook_4896.Hooks) do
                        if var_callback_f4cc and var_callback_f4cc.Parent then
                            local var_child_33e9 = State.state_windowColor_5aaf[var_callback_f4cc]
                            if var_child_33e9 then for _, var_player_2e5f in ipairs(var_child_33e9) do fn_GeneratorHelper_3645(var_player_2e5f, Config.cfg_generatorColor_f209) end
                            else fn_GeneratorHelper_3645(var_callback_f4cc, Config.cfg_generatorColor_f209) end
                        end
                    end
                else
                    for _, var_callback_f4cc in ipairs(State.state_espHook_4896.Hooks) do
                        if var_callback_f4cc and var_callback_f4cc.Parent then
                            local var_child_33e9 = State.state_windowColor_5aaf[var_callback_f4cc]
        if (612%2==0) then local var_unknownValue_0007_e37e=635 else local var_unknownValue_0007_e37e=630 end
                            if var_child_33e9 then for _, var_player_2e5f in ipairs(var_child_33e9) do fn_GeneratorHelper_d2f0(var_player_2e5f) end
                            else fn_GeneratorHelper_d2f0(var_callback_f4cc) end
                        end
                    end
                end


                if Config.cfg_showGeneratorInfo_4daa then
                    for _, var_child_897f in ipairs(State.state_espHook_4896.Gates) do
                        if var_child_897f and var_child_897f.Parent then fn_GeneratorHelper_3645(var_child_897f, Config.cfg_palletColor_6b93) end
                    end
                else
                    for _, var_child_897f in ipairs(State.state_espHook_4896.Gates) do
                        if var_child_897f and var_child_897f.Parent then fn_GeneratorHelper_d2f0(var_child_897f) end
                    end
                end


                if Config.cfg_showEquippedItem_e752 then
                    fn_GeneratorHandler_1381()
                    for part, var_color_5039 in pairs(State.state_espWindow_920d) do
                        if part and part.Parent and var_color_5039 and var_color_5039.Parent then
                            pcall(function()
                                local color = Config.cfg_espWindow_51ce
                                var_color_5039.Color3 = color
                                var_color_5039.Size = part.Size
                            end)
                        else
                            fn_GeneratorHandler_bd5b(part)
                        end
                    end
                else
                    for part, var_color_5039 in pairs(State.state_espWindow_920d) do
                        fn_GeneratorHandler_bd5b(part)
                    end
                end
            end





            State._antiLoopWindowCache = {}
            State._antiLoopWindowMap = {}
            WorkspaceService.DescendantAdded.Connect(WorkspaceService.DescendantAdded,function(var_descendant_fe40)
                if typeof(var_descendant_fe40) ~= "Instance" then return end
                if not (var_descendant_fe40.IsA(var_descendant_fe40,"BasePart") or var_descendant_fe40.IsA(var_descendant_fe40,"Model")) then return end
                local n = var_descendant_fe40.Name
                if n ~= "Window" and n ~= "VaultPoint" and not string.find(n, "Window") then return end
                if State._antiLoopWindowMap[var_descendant_fe40] then return end
                State._antiLoopWindowMap[var_descendant_fe40] = true
                table.insert(State._antiLoopWindowCache, var_descendant_fe40)
            end)
            WorkspaceService.DescendantRemoving.Connect(WorkspaceService.DescendantRemoving,function(var_descendant_fe40)
                if not State._antiLoopWindowMap[var_descendant_fe40] then return end
                State._antiLoopWindowMap[var_descendant_fe40] = nil
                for var_remoteEvent_5dde, e in ipairs(State._antiLoopWindowCache) do
                    if e == var_descendant_fe40 then table.remove(State._antiLoopWindowCache, var_remoteEvent_5dde) break end
                end
            end)
            task.spawn(function()
                local var_descendant_b2cb = workspace.FindFirstChild(workspace,"Map")
                if var_descendant_b2cb then
                    for _, var_descendant_fe40 in ipairs(var_descendant_b2cb.GetDescendants(var_descendant_b2cb)) do
                        if typeof(var_descendant_fe40) == "Instance" and (var_descendant_fe40.IsA(var_descendant_fe40,"BasePart") or var_descendant_fe40.IsA(var_descendant_fe40,"Model")) then
                            local n = var_descendant_fe40.Name
                            if n == "Window" or n == "VaultPoint" or string.find(n, "Window") then
                                if not State._antiLoopWindowMap[var_descendant_fe40] then
                                    State._antiLoopWindowMap[var_descendant_fe40] = true
                                    table.insert(State._antiLoopWindowCache, var_descendant_fe40)
                                end
                            end
                        end
                    end
                end
            end)

            local function fn_GeneratorHandler_38aa()
                local var_remote_4ae2 = {}
                for _, var_connection_9c26 in ipairs(State._antiLoopWindowCache) do
                    if var_connection_9c26 and var_connection_9c26.Parent then table.insert(var_remote_4ae2, var_connection_9c26) end
                end

                for _, var_descendant_186f in ipairs(CollectionService.GetTagged(CollectionService,"VaultPoint")) do
                    local var_unknownValue_0023_6d4b = false
                    for _, var_connection_9c26 in ipairs(var_remote_4ae2) do
                        if var_connection_9c26 == var_descendant_186f then var_unknownValue_0023_6d4b = true break end
                    end
                    if not var_unknownValue_0023_6d4b then table.insert(var_remote_4ae2, var_descendant_186f) end
                end
                return var_remote_4ae2
            end

            function ApplyAntiLoopWindow()
                if not State.state_selectMaskPower_a0a0 then return end

                local var_remoteEvent_d696 = ReplicatedStorage.FindFirstChild(ReplicatedStorage,"Remotes")
                if not var_remoteEvent_d696 then return end
                local var_success_29ba = var_remoteEvent_d696.FindFirstChild(var_remoteEvent_d696,"Window")
                if not var_success_29ba then return end
                local var_remote_829e = var_success_29ba.FindFirstChild(var_success_29ba,"VaultEvent")
                if not var_remote_829e then return end

                task.spawn(function()
                    task.wait(1)

                    local var_remote_4ae2 = fn_GeneratorHandler_38aa()

                    for _, var_remote_7aef in ipairs(var_remote_4ae2) do
                        task.spawn(function()
                            pcall(function()

                                var_remote_829e.FireServer(var_remote_829e,var_remote_7aef, true)
                            end)
                        end)
                        task.wait(0.05)
                    end
                end)
            end


            function DisableAntiLoopWindow()
                local var_remoteEvent_d696 = ReplicatedStorage.FindFirstChild(ReplicatedStorage,"Remotes")
                if not var_remoteEvent_d696 then return end
                local var_success_29ba = var_remoteEvent_d696.FindFirstChild(var_remoteEvent_d696,"Window")
                if not var_success_29ba then return end

                local var_remote_5c4a = var_success_29ba.FindFirstChild(var_success_29ba,"VaultCompleteEvent")
                local var_remote_2a5c = var_success_29ba.FindFirstChild(var_success_29ba,"VaultCompleteEventpart1")

                task.spawn(function()
                    local var_remote_4ae2 = fn_GeneratorHandler_38aa()

                    for _, var_remote_7aef in ipairs(var_remote_4ae2) do
                        task.spawn(function()
                            pcall(function()

                                if var_remote_5c4a then
                                    var_remote_5c4a.FireServer(var_remote_5c4a,var_remote_7aef, false)
                                end

                                if var_remote_2a5c then
                                    var_remote_2a5c.FireServer(var_remote_2a5c)
                                end
                            end)
                        end)
                        task.wait(0.05)
                    end
                end)
            end


            do
                local var_connection_2897 = workspace.FindFirstChild(workspace,"Map")
                if var_connection_2897 then
                    fn_RemoveHelper_8e0c(var_connection_2897)
                    ApplyAntiLoopWindow()
                end
                workspace.ChildAdded.Connect(workspace.ChildAdded,function(var_instance_4e7f)
                    if var_instance_4e7f.Name == "Map" then
                        task.wait((2.0))
                        fn_RemoveHelper_8e0c(var_instance_4e7f)
                        ApplyAntiLoopWindow()
                    end
                end)
                workspace.ChildRemoved.Connect(workspace.ChildRemoved,function(var_instance_4e7f)
                    if var_instance_4e7f.Name == "Map" then
                        State.state_espHook_4896 = { Generators={}, Pallets={}, Hooks={}, Gates={} }
                        State.var_descendant_b8d3 = {}
                        State.state_windowColor_5aaf = {}
                        State.var_descendant_ada3 = {}
                        State.var_descendant_18df = false
                        State.var_descendant_ef74 = {}
                        State.var_descendant_61c2 = 1
                    end
                end)
            end

            RegisterTask("GenESPUpdater", 0.2, function()
                if not Config.cfg_showGeneratorInfo_9e74 and not Config.cfg_outlineOnly_2e99 then return end
                for _, var_instance_5397 in ipairs(State.state_espHook_4896.Generators) do
                    if var_instance_5397 and var_instance_5397.Parent and not State.var_descendant_ada3[var_instance_5397] then fn_GeneratorHelper_2322(var_instance_5397) end
                end
            end)

            function DropAllPallets()
                if not getnilinstances then
                    Notify("Error", "Executor tidak support getnilinstances()", 2)
                    return
                end

                task.spawn(function()
                    local var_remoteEvent_d696 = ReplicatedStorage.FindFirstChild(ReplicatedStorage,"Remotes")
                    if not var_remoteEvent_d696 then return end
                    local var_remote_6186 = var_remoteEvent_d696.FindFirstChild(var_remoteEvent_d696,"Pallet")
                    var_remote_6186 = var_remote_6186 and var_remote_6186.FindFirstChild(var_remote_6186,"PalletDropEvent")
                    if not var_remote_6186 then return end

                    local var_remote_1e9d = {}
                    local var_success_7d07 = {}

                    local var_success_abb9, nilInstances = pcall(getnilinstances)
                    if var_success_abb9 and type(nilInstances) == "table" then
                        for _, var_instance_5397 in ipairs(nilInstances) do
                            if typeof(var_instance_5397) == "Instance" then
                                local name = var_instance_5397.Name
                                if name == "PalletPointSlide" or name == "palletDropPoint" or name == "PalletDropPoint" or name == "PalletPoint" then
                                    if not var_success_7d07[var_instance_5397] then
                                        table.insert(var_remote_1e9d, var_instance_5397)
                                        var_success_7d07[var_instance_5397] = true
                                    end
                                end
                            end
                        end
                    end


                    if State.state_pauseWhenCrouching_82c7 then
                        for _, var_instance_5397 in ipairs(State.state_pauseWhenCrouching_82c7) do
                            if var_instance_5397 and var_instance_5397.Parent and not var_success_7d07[var_instance_5397] then
                                table.insert(var_remote_1e9d, var_instance_5397)
                                var_success_7d07[var_instance_5397] = true
                            end
                        end
                    end

                    if #var_remote_1e9d == (0.0) then
                        return
                    end
                    for _, var_child_702a in ipairs(var_remote_1e9d) do
                        pcall(function()
                            var_remote_6186.FireServer(var_remote_6186,var_child_702a)
                        end)
                    end
                end)
            end
        do local var_remote_c691=3944%85 end

            local function fn_PalletHelper_e0f9(var_instance_5397)
                if typeof(var_instance_5397) ~= "Instance" then return end
                local name = var_instance_5397.Name
                if name ~= "PalletPointSlide" and name ~= "palletDropPoint" and name ~= "PalletDropPoint" and name ~= "PalletPoint" then return end
                if not State.state_pauseWhenCrouching_82c7 then State.state_pauseWhenCrouching_82c7 = {} end
                if State._palletPointMap[var_instance_5397] then return end
                State._palletPointMap[var_instance_5397] = true
                table.insert(State.state_pauseWhenCrouching_82c7, var_instance_5397)
            end
            State._palletPointMap = {}
            WorkspaceService.DescendantAdded.Connect(WorkspaceService.DescendantAdded,fn_PalletHelper_e0f9)
            WorkspaceService.DescendantRemoving.Connect(WorkspaceService.DescendantRemoving,function(var_instance_5397)
                if not State._palletPointMap[var_instance_5397] then return end
                State._palletPointMap[var_instance_5397] = nil
                if State.state_pauseWhenCrouching_82c7 then
                    for var_remoteEvent_5dde, e in ipairs(State.state_pauseWhenCrouching_82c7) do
                        if e == var_instance_5397 then table.remove(State.state_pauseWhenCrouching_82c7, var_remoteEvent_5dde) break end
                    end
                end
            end)
            if getnilinstances then
                local var_success_abb9, nilInstances = pcall(getnilinstances)
                if var_success_abb9 and type(nilInstances) == "table" then
                    for _, var_instance_5397 in ipairs(nilInstances) do fn_PalletHelper_e0f9(var_instance_5397) end
                end
            end
            for _, var_instance_5397 in ipairs(workspace.GetDescendants(workspace)) do fn_PalletHelper_e0f9(var_instance_5397) end

            RegisterTask("AutoDropNearbyPallets", 0.2, function()
                if not State.state_pauseWhenCrouching_1ac5 then return end
                if State.var_descendant_dc63 then return end

                local char = LocalPlayer.Character
                if not char then return end
                local var_rootPart_186c = char.FindFirstChild(char,"HumanoidRootPart")
                if not var_rootPart_186c then return end

                local var_remoteEvent_d696 = ReplicatedStorage.FindFirstChild(ReplicatedStorage,"Remotes")
                if not var_remoteEvent_d696 then return end
                local var_remote_6186 = var_remoteEvent_d696.FindFirstChild(var_remoteEvent_d696,"Pallet")
                var_remote_6186 = var_remote_6186 and var_remote_6186.FindFirstChild(var_remote_6186,"PalletDropEvent")
                if not var_remote_6186 then return end

                local var_basePart_a3d5 = var_rootPart_186c.Position

                if not State.state_pauseWhenCrouching_82c7 then
                    State.state_pauseWhenCrouching_82c7 = {}
                    State._palletPointMap = {}
                    if getnilinstances then
                        local var_success_abb9, nilInstances = pcall(getnilinstances)
                        if var_success_abb9 and type(nilInstances) == "table" then
                            for _, var_instance_5397 in ipairs(nilInstances) do fn_PalletHelper_e0f9(var_instance_5397) end
                        end
                    end
                    for _, var_instance_5397 in ipairs(workspace.GetDescendants(workspace)) do fn_PalletHelper_e0f9(var_instance_5397) end
                end


                if tick() - (State.var_descendant_5fcf or 0) > 5 then
                    State.var_descendant_5fcf = tick()
                    if getnilinstances then
                        local var_success_abb9, nilInstances = pcall(getnilinstances)
                        if var_success_abb9 and type(nilInstances) == "table" then
                            for _, var_instance_5397 in ipairs(nilInstances) do fn_PalletHelper_e0f9(var_instance_5397) end
                        end
                    end
                end

                local var_remote_f4f9 = nil
                local var_remote_ef51 = math.huge


                for var_remoteEvent_5dde = #State.state_pauseWhenCrouching_82c7, 1, -1 do
                    local var_instance_5397 = State.state_pauseWhenCrouching_82c7[var_remoteEvent_5dde]
                    if not var_instance_5397 or not var_instance_5397.Parent then
                        State._palletPointMap[var_instance_5397] = nil
                        table.remove(State.state_pauseWhenCrouching_82c7, var_remoteEvent_5dde)
                    else
                        local pos = nil

                        pcall(function()
                            if var_instance_5397.IsA(var_instance_5397,"BasePart") then
                                pos = var_instance_5397.Position
                            elseif var_instance_5397.IsA(var_instance_5397,"Model") then
                                pos = var_instance_5397:GetPivot().Position
                            elseif var_instance_5397.IsA(var_instance_5397,"Attachment") then
                                pos = var_instance_5397.WorldPosition
                            end
                        end)


                        if not pos then
                            local part = var_instance_5397.FindFirstChildWhichIsA(var_instance_5397,"BasePart", true)
                            if part then pos = part.Position end
                        end

                        if pos then
                            local dist = (pos - var_basePart_a3d5).Magnitude
                            if dist < var_remote_ef51 then
                                var_remote_ef51 = dist
                                var_remote_f4f9 = var_instance_5397
                            end
                        end
                    end
                end


                if var_remote_f4f9 and var_remote_ef51 <= 4 then
                    pcall(function()
                        var_remote_6186.FireServer(var_remote_6186,var_remote_f4f9)
                    end)
                    for var_remoteEvent_5dde, var_instance_5397 in ipairs(State.state_pauseWhenCrouching_82c7) do
                        if var_instance_5397 == var_remote_f4f9 then
                            State._palletPointMap[var_instance_5397] = nil
                            table.remove(State.state_pauseWhenCrouching_82c7, var_remoteEvent_5dde)
                            break
                        end
                    end

                    State.var_descendant_dc63 = true
                    task.delay(2, function()
                        State.var_descendant_dc63 = false
                    end)
                end
            end)
        end

        local function fn_HitboxHelper_f984(player, char)
            if not Config.hitboxModifierEnabled then return end
            if not char then return end

            local var_player_939c = GetPlayerRole(player)
            local var_rootPart_9a3c = (var_player_939c == "killer") and Config.killerHitboxPercent or Config.survivorHitboxPercent
            local var_rootPart_e3d5 = var_rootPart_9a3c / (100.0)


            local var_rootPart_186c = char.FindFirstChild(char,"HumanoidRootPart")
            if var_rootPart_186c and var_rootPart_186c.IsA(var_rootPart_186c,"BasePart") then
                if not State.hitboxOriginalSizes[var_rootPart_186c] then
                    State.hitboxOriginalSizes[var_rootPart_186c] = var_rootPart_186c.Size
                end



                local var_vector_9886 = 2
                local var_rootPart_ab42 = Vector3.new(var_vector_9886 * var_rootPart_e3d5, var_vector_9886 * var_rootPart_e3d5, var_vector_9886 * var_rootPart_e3d5)

                pcall(function()
                    var_rootPart_186c.Size = var_rootPart_ab42
                    var_rootPart_186c.Transparency = 1
                    var_rootPart_186c.CanCollide = false
                end)
            end
        end

        local function fn_HitboxHelper_ffd1(player, char)
            if not char then return end
            local var_rootPart_186c = char.FindFirstChild(char,"HumanoidRootPart")
            if var_rootPart_186c and var_rootPart_186c.IsA(var_rootPart_186c,"BasePart") then
                local var_player_7c22 = State.hitboxOriginalSizes[var_rootPart_186c]
                if var_player_7c22 then
                    pcall(function()
                        var_rootPart_186c.Size = var_player_7c22
                        var_rootPart_186c.Transparency = 1
                    end)
                    State.hitboxOriginalSizes[var_rootPart_186c] = nil
                end
            end
        end

        local function fn_HitboxHelper_b4e9()
            if not Config.hitboxModifierEnabled then return end
            for _, player in ipairs(Players.GetPlayers(Players)) do
                if player ~= LocalPlayer and player.Character then fn_HitboxHelper_f984(player, player.Character) end
            end
        end

        local function fn_HitboxHandler_76e8()
            for _, player in ipairs(Players.GetPlayers(Players)) do
                if player ~= LocalPlayer and player.Character then fn_HitboxHelper_ffd1(player, player.Character) end
            end
        end

        local function fn_HitboxHelper_cca4(player, char)
            if player == LocalPlayer then return end
            local var_rootPart_186c = char and char.FindFirstChild(char,"HumanoidRootPart")
            if not var_rootPart_186c then return end
            local var_descendant_b578 = State.hitboxEspObjects[player]

            if var_descendant_b578 and var_descendant_b578.Parent then
                if var_descendant_b578.Adornee == var_rootPart_186c then return end
                var_descendant_b578.Destroy(var_descendant_b578)
            end

            local var_player_939c = GetPlayerRole(player)
            local color = (var_player_939c == "killer") and Config.killerHitboxColor or Config.survivorHitboxColor
            local var_color_5f73 = Instance.new("SelectionBox")
            var_color_5f73.Adornee = var_rootPart_186c
            var_color_5f73.Color3 = color
            var_color_5f73.LineThickness = 0.10
            var_color_5f73.SurfaceTransparency = Config.hitboxEspOutlineOnly and (1.0) or Config.hitboxFillTransparency
            var_color_5f73.SurfaceColor3 = color
            var_color_5f73.Parent = EnsureESPFolder()
            State.hitboxEspObjects[player] = var_color_5f73
        end

        local function fn_HitboxHandler_6f00(player)
            local var_color_5f73 = State.hitboxEspObjects[player]
            if var_color_5f73 then pcall(function() var_color_5f73.Destroy(var_color_5f73) end)
            State.hitboxEspObjects[player] = nil end
        end

        local function fn_HitboxHandler_d51b()
            for player, var_color_5f73 in pairs(State.hitboxEspObjects) do
                if var_color_5f73 and var_color_5f73.Parent then
                    local var_player_939c = GetPlayerRole(player)
                    local color = (var_player_939c == "killer") and Config.killerHitboxColor or Config.survivorHitboxColor
                    var_color_5f73.Color3 = color
                    var_color_5f73.SurfaceColor3 = color
                    var_color_5f73.SurfaceTransparency = Config.hitboxEspOutlineOnly and 1 or Config.hitboxFillTransparency
                end
            end
        end

        local function fn_HitboxHandler_2c22()
            for _, player in ipairs(Players.GetPlayers(Players)) do
                if player ~= LocalPlayer and player.Character then fn_HitboxHelper_cca4(player, player.Character) end
            end
        end

        local function fn_HitboxHandler_ebe1()
            for player, _ in pairs(State.hitboxEspObjects) do fn_HitboxHandler_6f00(player) end
        end

        local fn_GetHelper_90ff, IsPlayerDoingAction
        do
            local function fn_ServerHelper_9016()
                task.spawn(function()
                    local var_success_abb9, mechanics = pcall(function()
                        return game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 10):WaitForChild("Mechanics", (10.0))
                    end)
                    if not var_success_abb9 or not mechanics then return end

                    local var_connection_fe95 = mechanics.FindFirstChild(mechanics,"Slow")
                    if var_connection_fe95 and var_connection_fe95.IsA(var_connection_fe95,"BindableEvent") then
                        var_connection_fe95.Event.Connect(var_connection_fe95.Event,function(_, dur, extra)
                            local var_remoteEvent_e831 = (tonumber(dur) or 0) + (tonumber(extra) or 0)
                            if var_remoteEvent_e831 > (0.0) then State.var_rootPart_b267 = tick() + var_remoteEvent_e831 + 0.1 end
                        end)
                    end

                    local var_remoteEvent_f5f2 = mechanics.FindFirstChild(mechanics,"Slowserver")
                    if var_remoteEvent_f5f2 and var_remoteEvent_f5f2.IsA(var_remoteEvent_f5f2,"RemoteEvent") then
                        var_remoteEvent_f5f2.OnClientEvent.Connect(var_remoteEvent_f5f2.OnClientEvent,function(_, dur)
                            local var_remoteEvent_e831 = tonumber(dur) or 0
                            if var_remoteEvent_e831 > 0 then State.var_rootPart_b267 = tick() + var_remoteEvent_e831 + 0.1 end
                        end)
                    end
                end)
            end

            function fn_GetHelper_90ff()
                return tick() < State.var_rootPart_b267
            end

            function IsPlayerDoingAction()
                local char = LocalPlayer.Character
                if not char then return false end
                local var_rootPart_186c = char.FindFirstChild(char,"HumanoidRootPart")
                if var_rootPart_186c and CollectionService.HasTag(CollectionService,var_rootPart_186c, "doing action") then return true end
                return false
            end

            fn_ServerHelper_9016()
        end

        do
            local function fn_GetHelper_6fd0(player)
                if not player then return 0 end
                local var_success_abb9, val = pcall(function() return player.GetAttribute(player,"HookCount") end)
                if var_success_abb9 and typeof(val) == "number" then return val end

                local var_value_d1f9 = player.FindFirstChild(player,"HookCount")
                if var_value_d1f9 and var_value_d1f9.IsA(var_value_d1f9,"ValueBase") then return tonumber(var_value_d1f9.Value) or 0 end
                local char = player.Character
                if char then
                    local var_playerGui_7d48, cval = pcall(function() return char.GetAttribute(char,"HookCount") end)
                    if var_playerGui_7d48 and typeof(cval) == "number" then return cval end
                    local var_child_cd39 = char.FindFirstChild(char,"HookCount")
                    if var_child_cd39 and var_child_cd39.IsA(var_child_cd39,"ValueBase") then return tonumber(var_child_cd39.Value) or 0 end
                end
                return 0
            end

            local function fn_GetHelper_6249(enabled)
                local var_child_9379 = LocalPlayer.FindFirstChild(LocalPlayer,"PlayerGui")
                if not var_child_9379 then return end
                for _, gui in ipairs(var_child_9379.GetChildren(var_child_9379)) do
                    if gui.IsA(gui,"ScreenGui") and gui.Name.match(gui.Name,"%-mob$") then
                        local var_child_cd9f = gui.FindFirstChild(gui,"Frame")
                        if var_child_cd9f then
                            for var_remoteEvent_5dde = 1, 5 do
                                local var_originalValue_4702 = var_child_cd9f.FindFirstChild(var_child_cd9f,"Survivor" .. var_remoteEvent_5dde)
                                local var_color_cc0e = var_originalValue_4702 and var_originalValue_4702.FindFirstChild(var_originalValue_4702,"ImageLabel")
                                local var_unknownValue_0064_e6c8 = var_originalValue_4702 and var_originalValue_4702.FindFirstChild(var_originalValue_4702,"TextLabel")
                                if var_color_cc0e and var_unknownValue_0064_e6c8 then
                                    local var_label_41e8 = "Bolong_CustomHookCounter"
                                    local var_backgroundTransparency_1d6e = var_color_cc0e.FindFirstChild(var_color_cc0e,var_label_41e8)
                                    local var_label_3158 = var_color_cc0e.FindFirstChild(var_color_cc0e,"Counter")

                                    local function fn_GetHandler_2430(cacheKey)
                                        if var_label_3158 then pcall(function() var_label_3158.Visible = false end) end
                                        if var_backgroundTransparency_1d6e then var_backgroundTransparency_1d6e.Visible = false end
                                        if cacheKey then State.var_player_1075[cacheKey] = nil end
                                    end

                                    if not enabled then
                                        fn_GetHandler_2430(nil)
                                        continue
                                    end


                                    local var_player_f626 = var_unknownValue_0064_e6c8.Text and var_unknownValue_0064_e6c8.Text.match(var_unknownValue_0064_e6c8.Text,"^%s*(.-)%s*$") or ""
                                    local fn_CutsceneHelper_76a2 = var_player_f626.lower(var_player_f626)
                                    local var_player_f917 = (var_player_f626 == "" or fn_CutsceneHelper_76a2 == "waiting" or fn_CutsceneHelper_76a2.find(fn_CutsceneHelper_76a2,"waiting") or fn_CutsceneHelper_76a2 == "empty" or var_player_f626.match(var_player_f626,"^Survivor%d+$"))

                                    local var_originalValue_f0a4 = true
                                    pcall(function()
                                        if var_originalValue_4702.Visible == false then var_originalValue_f0a4 = false end
                                        if var_color_cc0e.Image == "" or var_color_cc0e.Image == "rbxasset://textures/ui/GuiImagePlaceholder.png" then

                                        end
                                    end)
                                    if not var_originalValue_f0a4 then
                                        fn_GetHandler_2430(nil)
                                        continue
                                    end

                                    local player = nil
                                    if not var_player_f917 then
                                        for _, var_player_2e5f in ipairs(Players.GetPlayers(Players)) do
                                            if var_player_2e5f.Name == var_player_f626 or var_player_2e5f.DisplayName == var_player_f626 then
                                                player = var_player_2e5f
                                                break
                                            end
                                        end
                                    end
                                    if not player then
                                        fn_GetHandler_2430(nil)
                                        continue
                                    end

                                    local var_label_9e07 = fn_GetHelper_6fd0(player)
                                    State.var_player_1075[player.Name] = var_label_9e07


                                    if var_label_9e07 <= 0 then
                                        if var_label_3158 then pcall(function() var_label_3158.Visible = false end) end
                                        if not var_backgroundTransparency_1d6e then
                                            var_backgroundTransparency_1d6e = Instance.new("TextLabel")
                                            var_backgroundTransparency_1d6e.Name = var_label_41e8
                                            var_backgroundTransparency_1d6e.Size = UDim2.new(1, 0, 0.35, 0)
                                            var_backgroundTransparency_1d6e.Position = UDim2.new(0, (0.0), 0.65, 0)
                                            var_backgroundTransparency_1d6e.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                                            var_backgroundTransparency_1d6e.BackgroundTransparency = 0.5
                                            var_backgroundTransparency_1d6e.TextColor3 = Color3.fromRGB(255, 255, 255)
                                            var_backgroundTransparency_1d6e.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                                            var_backgroundTransparency_1d6e.TextStrokeTransparency = 0
                                            var_backgroundTransparency_1d6e.TextScaled = true
                                            var_backgroundTransparency_1d6e.Font = Enum.Font.SourceSansBold
                                            var_backgroundTransparency_1d6e.BorderSizePixel = 0
                                            var_backgroundTransparency_1d6e.Parent = var_color_cc0e
                                        end
                                        var_backgroundTransparency_1d6e.Visible = true
                                        var_backgroundTransparency_1d6e.Text = "Hooks: 0"
                                        var_backgroundTransparency_1d6e.TextColor3 = Color3.fromRGB(255, 255, 255)
                                        continue
                                    end


                                    if var_label_3158 then pcall(function() var_label_3158.Visible = true end) end
                                    if not var_backgroundTransparency_1d6e then
                                        var_backgroundTransparency_1d6e = Instance.new("TextLabel")
                                        var_backgroundTransparency_1d6e.Name = var_label_41e8
                                        var_backgroundTransparency_1d6e.Size = UDim2.new(1, 0, 0.35, 0)
                                        var_backgroundTransparency_1d6e.Position = UDim2.new(0, (0.0), 0.65, 0)
                                        var_backgroundTransparency_1d6e.BackgroundColor3 = Color3.fromRGB(0, (0.0), 0)
                                        var_backgroundTransparency_1d6e.BackgroundTransparency = 0.5
                                        var_backgroundTransparency_1d6e.TextColor3 = Color3.fromRGB(255, 255, 255)
                                        var_backgroundTransparency_1d6e.TextStrokeColor3 = Color3.fromRGB((0.0), 0, 0)
                                        var_backgroundTransparency_1d6e.TextStrokeTransparency = 0
                                        var_backgroundTransparency_1d6e.TextScaled = true
                                        var_backgroundTransparency_1d6e.Font = Enum.Font.SourceSansBold
                                        var_backgroundTransparency_1d6e.BorderSizePixel = 0
                                        var_backgroundTransparency_1d6e.Parent = var_color_cc0e
                                    end
                                    var_backgroundTransparency_1d6e.Visible = true
                                    if var_label_9e07 >= 3 then
                                        var_backgroundTransparency_1d6e.Text = "DEAD"
                                        var_backgroundTransparency_1d6e.TextColor3 = Color3.fromRGB(255, (75.0), 75)
                                    elseif var_label_9e07 == 2 then
                                        var_backgroundTransparency_1d6e.Text = "Hooks: 2"
                                        var_backgroundTransparency_1d6e.TextColor3 = Color3.fromRGB(255, 140, 0)
                                    else
                                        var_backgroundTransparency_1d6e.Text = "Hooks: 1"
                                        var_backgroundTransparency_1d6e.TextColor3 = Color3.fromRGB((210.0), (130.0), 255)
                                    end
                                end
                            end
                        end
                    end
                end
            end

            local function fn_GetHelper_886c(player)
                if not player or State.hookCounterAttrConns[player] then return end
                pcall(function()
                    local var_connection_90bd = player:GetAttributeChangedSignal("HookCount"):Connect(function()
                        State.var_player_a579 = true
                    end)
                    State.hookCounterAttrConns[player] = var_connection_90bd
                end)

                pcall(function()
                    local var_value_d1f9 = player.FindFirstChild(player,"HookCount")
                    if var_value_d1f9 and var_value_d1f9.IsA(var_value_d1f9,"ValueBase") then
                        local var_connection_e145 = var_value_d1f9.Changed.Connect(var_value_d1f9.Changed,function() State.var_player_a579 = true end)

                        State.hookCounterAttrConns[player.Name .. "_val"] = var_connection_e145
                    end
                end)
                if player.Character then
                    pcall(function()
                        local var_connection_ea4a = player.Character:GetAttributeChangedSignal("HookCount"):Connect(function()
                            State.var_player_a579 = true
                        end)
                        State.hookCounterAttrConns[player.Name .. "_char"] = var_connection_ea4a
                    end)
                end

                pcall(function()
                    player.CharacterAdded.Connect(player.CharacterAdded,function(char)
                        if not Config.cfg_antiFlashlightBlind_774e then return end
                        task.wait(0.5)
                        pcall(function()
                            local var_connection_ea4a = char:GetAttributeChangedSignal("HookCount"):Connect(function()
                                State.var_player_a579 = true
                            end)
                            State.hookCounterAttrConns[player.Name .. "_char"] = var_connection_ea4a
                        end)
                        State.var_player_a579 = true
                    end)
                end)
            end

            local function fn_GetHandler_2300()
                for var_child_5b0e, var_connection_90bd in pairs(State.hookCounterAttrConns) do
                    pcall(function() var_connection_90bd.Disconnect(var_connection_90bd) end)
                    State.hookCounterAttrConns[var_child_5b0e] = nil
                end
                if State.var_player_d43b then
        if false then local var_connection_89ea=488 end
                    pcall(function() State.var_player_d43b.Disconnect(State.var_player_d43b) end)
                    State.var_player_d43b = nil
                end
                if State.var_player_ae6d then
                    pcall(function() State.var_player_ae6d.Disconnect(State.var_player_ae6d) end)
                    State.var_player_ae6d = nil
                end
                if State.var_player_4319 then
                    pcall(function() State.var_player_4319.Disconnect(State.var_player_4319) end)
                    State.var_player_4319 = nil
                end
            end

            local function fn_GetHelper_fcc7()
                if State.var_player_d43b then return end
                State.var_player_a579 = true

                for _, var_player_2e5f in ipairs(Players.GetPlayers(Players)) do
                    fn_GetHelper_886c(var_player_2e5f)
                end
                State.var_player_ae6d = Players.PlayerAdded.Connect(Players.PlayerAdded,function(var_player_2e5f)
                    task.wait(0.5)
                    fn_GetHelper_886c(var_player_2e5f)
                    State.var_player_a579 = true
                end)
                State.var_player_4319 = Players.PlayerRemoving.Connect(Players.PlayerRemoving,function(var_player_2e5f)
                    State.var_player_1075[var_player_2e5f.Name] = nil
                    local var_connection_d9f3 = State.hookCounterAttrConns[var_player_2e5f]
                    if var_connection_d9f3 then pcall(function() var_connection_d9f3.Disconnect(var_connection_d9f3) end)
                    State.hookCounterAttrConns[var_player_2e5f]=nil end
                    local var_connection_e145 = State.hookCounterAttrConns[var_player_2e5f.Name .. "_val"]
                    if var_connection_e145 then pcall(function() var_connection_e145.Disconnect(var_connection_e145) end)
                    State.hookCounterAttrConns[var_player_2e5f.Name .. "_val"]=nil end
                    local var_playerGui_3886 = State.hookCounterAttrConns[var_player_2e5f.Name .. "_char"]
                    if var_playerGui_3886 then pcall(function() var_playerGui_3886.Disconnect(var_playerGui_3886) end)
                    State.hookCounterAttrConns[var_player_2e5f.Name .. "_char"]=nil end
                    State.var_player_a579 = true
                end)

                local var_descendant_5584 = LocalPlayer.FindFirstChild(LocalPlayer,"PlayerGui")
                if var_descendant_5584 then
                    State.var_player_d43b = var_descendant_5584.ChildAdded.Connect(var_descendant_5584.ChildAdded,function(var_instance_4e7f)
                        if var_instance_4e7f.IsA(var_instance_4e7f,"ScreenGui") and var_instance_4e7f.Name.match(var_instance_4e7f.Name,"%-mob$") then
                            State.var_player_a579 = true
                        end

                        if var_instance_4e7f.Name == "Frame" and var_instance_4e7f.Parent and var_instance_4e7f.Parent.Name.match(var_instance_4e7f.Parent.Name,"%-mob$") then
                            State.var_player_a579 = true
                        end
                    end)

                    local var_descendant_d8c0 = var_descendant_5584.DescendantAdded.Connect(var_descendant_5584.DescendantAdded,function(var_descendant_fe40)
                        if var_descendant_fe40.Name == "Survivor1" or var_descendant_fe40.Name == "ImageLabel" then
                            local var_descendant_728a = var_descendant_fe40.FindFirstAncestorOfClass(var_descendant_fe40,"ScreenGui")
                            if var_descendant_728a and var_descendant_728a.Name.match(var_descendant_728a.Name,"%-mob$") then
                                State.var_player_a579 = true
                            end
                        end
                    end)

                    State.hookCounterAttrConns._guiDesc = var_descendant_d8c0
                end
                fn_GetHelper_6249(true)
            end

            local function fn_ServerHandler_4ad1()
                fn_GetHandler_2300()
                State.var_player_1075 = {}
                State.var_player_a579 = true
                fn_GetHelper_6249(false)

                local var_child_9379 = LocalPlayer.FindFirstChild(LocalPlayer,"PlayerGui")
                if var_child_9379 then
                    for _, gui in ipairs(var_child_9379.GetChildren(var_child_9379)) do
                        if gui.IsA(gui,"ScreenGui") and gui.Name.match(gui.Name,"%-mob$") then
                            local var_child_cd9f = gui.FindFirstChild(gui,"Frame")
                            if var_child_cd9f then
                                for var_remoteEvent_5dde = (1.0), (5.0) do
                                    local var_originalValue_4702 = var_child_cd9f.FindFirstChild(var_child_cd9f,"Survivor" .. var_remoteEvent_5dde)
                                    local var_color_cc0e = var_originalValue_4702 and var_originalValue_4702.FindFirstChild(var_originalValue_4702,"ImageLabel")
                                    local var_backgroundTransparency_1d6e = var_color_cc0e and var_color_cc0e.FindFirstChild(var_color_cc0e,"Bolong_CustomHookCounter")
                                    if var_backgroundTransparency_1d6e then pcall(function() var_backgroundTransparency_1d6e.Destroy(var_backgroundTransparency_1d6e) end) end
                                end
                            end
                        end
                    end
                end
            end

            RegisterTask("HookCounter", 0.5, function()
                if not Config.cfg_antiFlashlightBlind_774e then return end
                if not State.var_player_a579 then

                    local var_player_f83c = false
                    for _, var_player_2e5f in ipairs(Players.GetPlayers(Players)) do
                        local cur = fn_GetHelper_6fd0(var_player_2e5f)
                        if State.var_player_1075[var_player_2e5f.Name] ~= cur then var_player_f83c = true break end
                    end
                    if not var_player_f83c then return end
                    State.var_player_a579 = true
                end
                State.var_player_a579 = false
                fn_GetHelper_6249(true)
            end)


            _G.Bolong_SetShowHookCounter = function(enabled)
                Config.cfg_antiFlashlightBlind_774e = enabled and true or false
                if Config.cfg_antiFlashlightBlind_774e then
                    fn_GetHelper_fcc7()
                else
                    fn_ServerHandler_4ad1()
                end
            end
            getgenv().Bolong_SetShowHookCounter = _G.Bolong_SetShowHookCounter

            State._HookCounter_Enable = fn_GetHelper_fcc7
            State._HookCounter_Disable = fn_ServerHandler_4ad1
            State._HookCounter_Update = fn_GetHelper_6249
        end

        local fn_ServerHelper_5706, _ApplySpeed, _StartAntiFallSlow, _StopAntiFallSlow, _StartNoSlowdown, _StopNoSlowdown, SetupMovementForChar
        do


            function fn_ServerHelper_5706()
                if State.SpeedBoost then
                    return ESP_LAYER_ORDER * ((1.0) + math.clamp(tonumber(State.state_showGenBoostButton_f0c8) or 0.3, (0.0), 2))
                end
                return ESP_LAYER_ORDER
            end

            function _ApplySpeed(var_humanoid_3937, var_connection_6c2b)
                if not var_humanoid_3937 or not var_humanoid_3937.Parent then return end
                if math.abs(var_humanoid_3937.WalkSpeed - var_connection_6c2b) > 0.05 then
                    pcall(function() var_humanoid_3937.WalkSpeed = var_connection_6c2b end)
                end
            end

            local function fn_ServerHelper_38b3()
                task.spawn(function()
                    local var_success_abb9, remote = pcall(function()
                        return game:GetService("ReplicatedStorage"):WaitForChild("Remotes", (10.0)):WaitForChild("Mechanics", (10.0)):WaitForChild("Fall", (10.0))
                    end)
                    if not var_success_abb9 or not remote then return end
                    local var_descendant_9c68
                    var_descendant_9c68 = hookmetamethod(game, "__namecall", function(self, ...)
                        local var_connection_513e = getnamecallmethod()
                        if State.state_autoGenerator_e4d4 and var_connection_513e == "FireServer" and rawequal(self, remote) then return end
                        return var_descendant_9c68(self, ...)
                    end)
                end)
            end

            function _StartAntiFallSlow(var_humanoid_3937)
                if State.movConns.antiFall then State.movConns.antiFall.Disconnect(State.movConns.antiFall) end
                fn_ServerHelper_38b3()
                if not var_humanoid_3937 then return end
                pcall(function() var_humanoid_3937.SetStateEnabled(var_humanoid_3937,Enum.HumanoidStateType.FallingDown, false) end)
                State.movConns.antiFall = var_humanoid_3937.StateChanged.Connect(var_humanoid_3937.StateChanged,function(_, var_section_2cdc)
                    if not State.state_autoGenerator_e4d4 then return end
                    if var_section_2cdc == Enum.HumanoidStateType.Landed or var_section_2cdc == Enum.HumanoidStateType.GettingUp or var_section_2cdc == Enum.HumanoidStateType.FallingDown then
                        pcall(function() var_humanoid_3937.ChangeState(var_humanoid_3937,Enum.HumanoidStateType.Running) end)
                        _ApplySpeed(var_humanoid_3937, fn_ServerHelper_5706())
                    end
                end)
            end

            function _StopAntiFallSlow(var_humanoid_3937)
                if State.movConns.antiFall then State.movConns.antiFall.Disconnect(State.movConns.antiFall)
                State.movConns.antiFall = nil end
                if var_humanoid_3937 and var_humanoid_3937.Parent then pcall(function() var_humanoid_3937.SetStateEnabled(var_humanoid_3937,Enum.HumanoidStateType.FallingDown, true) end) end
            end

            function _StartNoSlowdown(var_humanoid_3937)
                if State.movConns.noSlow then State.movConns.noSlow.Disconnect(State.movConns.noSlow)
                State.movConns.noSlow = nil end
                if not var_humanoid_3937 then return end
                if GetPlayerRole(LocalPlayer) == "killer" then return end
                State.movConns.noSlow = var_humanoid_3937:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
                    if not State.state_antiFallSlow_dab5 then return end
                    if GetPlayerRole(LocalPlayer) == "killer" then return end

                    local char = LocalPlayer.Character

                    if State.safeModeSpeed and char and (char.GetAttribute(char,"IsHooked") or char.GetAttribute(char,"IsCarried") or var_humanoid_3937.Health <= (50.0)) then
                        return
                    end

                    if State.state_speedBoost_2538 and (fn_GetHelper_90ff() or IsPlayerDoingAction()) then
                        return
                    end

                    local var_connection_6c2b = fn_ServerHelper_5706()
                    if var_humanoid_3937.WalkSpeed < var_connection_6c2b - 0.05 then pcall(function() var_humanoid_3937.WalkSpeed = var_connection_6c2b end) end
                end)
            end

            function _StopNoSlowdown()
                if State.movConns.noSlow then State.movConns.noSlow.Disconnect(State.movConns.noSlow)
                State.movConns.noSlow = nil end
            end

            function SetupMovementForChar(char)
                if not char then return end
                local var_humanoid_3937 = char.WaitForChild(char,"Humanoid", 5)
                if not var_humanoid_3937 then return end
                if State.state_autoGenerator_e4d4 then _StartAntiFallSlow(var_humanoid_3937) end
                if State.state_antiFallSlow_dab5 and GetPlayerRole(LocalPlayer) ~= "killer" then _StartNoSlowdown(var_humanoid_3937) end
                if State.SpeedBoost then
                    local var_connection_6c2b = fn_ServerHelper_5706()
                    task.wait(0.15)
        do local var_error_6982=359 end
                    if not (State.safeModeSpeed and (fn_GetHelper_90ff() or IsPlayerDoingAction())) then
                        _ApplySpeed(var_humanoid_3937, var_connection_6c2b)
                    end
                end
            end

            LocalPlayer:GetPropertyChangedSignal("Team"):Connect(function()
                UpdatePlayerRole(LocalPlayer)
                if GetPlayerRole(LocalPlayer) == "killer" and State.movConns.noSlow then
                    State.movConns.noSlow.Disconnect(State.movConns.noSlow)
                    State.movConns.noSlow = nil
                end
                if GetPlayerRole(LocalPlayer) ~= "killer" then
                    TriggerMayersAttack()
                end
            end)
        end

        local fn_MoonwalkHelper_b566
        do
            function fn_MoonwalkHelper_b566()
                if State.state_safeModeNoSlowdown_14dc then
                    if State.state_safeModeNoSlowdown_14dc.Parent then return end
                    State.state_safeModeNoSlowdown_14dc = nil
                end

                local PlayerGui = LocalPlayer.WaitForChild(LocalPlayer,"PlayerGui")
                local var_backgroundTransparency_1bcc = Instance.new("ScreenGui")
                var_backgroundTransparency_1bcc.Name = "BolongHubMoonwalk"
                var_backgroundTransparency_1bcc.ResetOnSpawn = false
                var_backgroundTransparency_1bcc.Enabled = false
                var_backgroundTransparency_1bcc.Parent = PlayerGui

                local var_connection_42f6 = Instance.new("Frame")
                var_connection_42f6.Name = "MoonwalkBtns"
                var_connection_42f6.AnchorPoint = Vector2.new(1,(1.0))
                var_connection_42f6.Position = UDim2.new(1,-18,1,(-170.0))
                var_connection_42f6.Size = UDim2.fromOffset(46,96)
                var_connection_42f6.BackgroundTransparency = (1.0)
                var_connection_42f6.Parent = var_backgroundTransparency_1bcc

                local function fn_MoonwalkHandler_d3f0(rotation, var_backgroundTransparency_34eb)
                    local var_backgroundTransparency_5429 = Instance.new("ImageButton")
                    var_backgroundTransparency_5429.BackgroundTransparency = (1.0)
                    var_backgroundTransparency_5429.BorderSizePixel = 0
                    var_backgroundTransparency_5429.AutoButtonColor = false
                    var_backgroundTransparency_5429.AnchorPoint = Vector2.new(0.5,0)
                    var_backgroundTransparency_5429.Position = UDim2.new(0.5,0,0,var_backgroundTransparency_34eb)
                    var_backgroundTransparency_5429.Size = UDim2.fromOffset((42.0),(42.0))
                    var_backgroundTransparency_5429.Image = "rbxassetid://125598796341580"
                    var_backgroundTransparency_5429.ScaleType = Enum.ScaleType.Slice
                    var_backgroundTransparency_5429.ImageColor3 = Color3.fromRGB(170,170,170)
                    var_backgroundTransparency_5429.ImageTransparency = 0.25
                    var_backgroundTransparency_5429.Rotation = rotation
                    var_backgroundTransparency_5429.Parent = var_connection_42f6
                    return var_backgroundTransparency_5429
                end

                local var_connection_c720 = fn_MoonwalkHandler_d3f0((-90.0),0)
                local var_connection_262b = fn_MoonwalkHandler_d3f0(90,(50.0))


                local function fn_MoonwalkHandler_b5f2(var_connection_a646, var_connection_fd87)
                    var_connection_a646.InputBegan.Connect(var_connection_a646.InputBegan,function(input)
                        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
                            State.state_safeModeNoSlowdown_1609 = var_connection_fd87
                            var_connection_a646.ImageColor3 = Color3.fromRGB(255, 255, (255.0))
                            var_connection_a646.ImageTransparency = (0.0)
                        end
                    end)
                    var_connection_a646.InputEnded.Connect(var_connection_a646.InputEnded,function(input)
                        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
                            State.state_safeModeNoSlowdown_1609 = 0
                            var_connection_a646.ImageColor3 = Color3.fromRGB(170,170,170)
                            var_connection_a646.ImageTransparency = 0.25
                        end
                    end)
                end

                fn_MoonwalkHandler_b5f2(var_connection_c720, 1)
                fn_MoonwalkHandler_b5f2(var_connection_262b, -1)

                State.state_safeModeNoSlowdown_14dc = var_backgroundTransparency_1bcc
            end

            RegisterTask("MoonwalkGuiGuard", 0.5, function()
                if not Config.cfg_enableMoonwalkMobileGUI_29e3 then return end
                if not State.state_safeModeNoSlowdown_14dc or not State.state_safeModeNoSlowdown_14dc.Parent then
                    fn_MoonwalkHelper_b566()
                    if State.state_safeModeNoSlowdown_14dc then State.state_safeModeNoSlowdown_14dc.Enabled = true end
                elseif not State.state_safeModeNoSlowdown_14dc.Enabled then
                    State.state_safeModeNoSlowdown_14dc.Enabled = true
                end
            end)




            local function fn_MoonwalkHelper_c9f9(var_rootPart_186c)
                if var_rootPart_186c.FindFirstChild(var_rootPart_186c,"BolongMoonwalkAlign") then return var_rootPart_186c.FindFirstChild(var_rootPart_186c,"BolongMoonwalkAlign") end

                local var_humanoid_c490 = Instance.new("Attachment")
                var_humanoid_c490.Name = "BolongMoonwalkAtt"
                var_humanoid_c490.Parent = var_rootPart_186c

                local var_name_f3b2 = Instance.new("AlignOrientation")
                var_name_f3b2.Name = "BolongMoonwalkAlign"
                var_name_f3b2.Mode = Enum.OrientationAlignmentMode.OneAttachment
                var_name_f3b2.Attachment0 = var_humanoid_c490
                var_name_f3b2.MaxTorque = 6000000
                var_name_f3b2.Responsiveness = 65
                var_name_f3b2.Parent = var_rootPart_186c

                return var_name_f3b2
            end

            local function fn_MoonwalkHandler_6681(var_rootPart_186c)
                local var_name_f3b2 = var_rootPart_186c.FindFirstChild(var_rootPart_186c,"BolongMoonwalkAlign")
                local var_humanoid_c490 = var_rootPart_186c.FindFirstChild(var_rootPart_186c,"BolongMoonwalkAtt")
                if var_name_f3b2 then var_name_f3b2.Destroy(var_name_f3b2) end
                if var_humanoid_c490 then var_humanoid_c490.Destroy(var_humanoid_c490) end
            end

            RegisterTask("MoonwalkLock", (0.0), function(var_rootPart_6336)
                if not Config.cfg_enableMoonwalkMobileGUI_29e3 then return end

                local char = LocalPlayer.Character
                local var_humanoid_3937 = char and char.FindFirstChildOfClass(char,"Humanoid")
                local var_rootPart_186c = char and char.FindFirstChild(char,"HumanoidRootPart")
                local var_rootPart_2947 = WorkspaceService.CurrentCamera

                if not var_humanoid_3937 or not var_rootPart_186c or not var_rootPart_2947 then return end


                local var_vector_a429 = (0.0)
                if State.state_moonwalkMode_6f50 then var_vector_a429 = 1 end
                if State.state_enableMoonwalkMobileGUI_4fa3 then var_vector_a429 = (-1.0) end
                if State.state_safeModeNoSlowdown_1609 ~= 0 then var_vector_a429 = State.state_safeModeNoSlowdown_1609 end


                if var_vector_a429 == (0.0) then
                    if not var_humanoid_3937.AutoRotate then var_humanoid_3937.AutoRotate = true end
                    fn_MoonwalkHandler_6681(var_rootPart_186c)
                    State.var_vector_4df7 = 0
                    return
                end


                var_humanoid_3937.AutoRotate = false
                local var_name_f3b2 = fn_MoonwalkHelper_c9f9(var_rootPart_186c)


                local var_humanoid_5d8e = var_rootPart_2947.CFrame.LookVector
                local var_vector_b2b1 = Vector3.new(var_humanoid_5d8e.X, 0, var_humanoid_5d8e.Z)

                if var_vector_b2b1.Magnitude > 0.001 then
                    var_vector_b2b1 = var_vector_b2b1.Unit
                    local var_vector_f62e = (var_vector_a429 == 1) and var_vector_b2b1 or -var_vector_b2b1





                    if (Config.cfg_autoCrouch_7b00 or "Classic") == "Classic" then
                        var_name_f3b2.Responsiveness = 15
                        State.var_vector_4df7 = (0.0)

                        local var_humanoid_70e6 = CFrame.lookAt(Vector3.new(0, 0, 0), var_vector_f62e)


                        var_name_f3b2.CFrame = var_humanoid_70e6
                    else
                        var_name_f3b2.Responsiveness = 65
                        local var_vector_8c87 = math.atan2(var_vector_f62e.X, var_vector_f62e.Z)

                        local var_distance_af51 = 0
                        if var_humanoid_3937.MoveDirection.Magnitude > 0.01 then
                            local var_distance_7ba6 = Config.cfg_crouchRadiusStud_b8d0 or 6
                            local var_distance_3f71 = Config.cfg_autoCrouch_bdbb or 0.55
                            local var_distance_ba0c = 0.06
                            local interval = 1.2 / var_distance_7ba6
                            if tick() - State.var_unknownValue_0066_259d >= interval then
                                State.var_unknownValue_0066_259d = tick()
                                State.var_unknownValue_0011_6829 = -State.var_unknownValue_0011_6829
                            end
                            local var_unknownValue_0054_bc3b = State.var_unknownValue_0011_6829 * var_distance_3f71
                            local var_connection_fc78 = math.clamp(var_rootPart_6336 * 14, 0, 1)
                            State.var_vector_4df7 = State.var_vector_4df7 + (var_unknownValue_0054_bc3b - State.var_vector_4df7) * var_connection_fc78
                            local var_unknownValue_0061_7e4a = (math.random() - 0.5) * var_distance_ba0c
                            var_distance_af51 = State.var_vector_4df7 + var_unknownValue_0061_7e4a
                        else
                            State.var_vector_4df7 = 0
                            var_distance_af51 = 0
                        end

                        local var_character_435c = var_vector_8c87 + var_distance_af51
                        local var_humanoid_70e6 = CFrame.Angles(0, var_character_435c, 0)
                        var_name_f3b2.CFrame = var_humanoid_70e6
                    end
                end
            end)
        end

        local function fn_GeneratorHandler_9e93()
            State.var_humanoid_4458 = true
            State.var_humanoid_ffa8 = nil

            local char = LocalPlayer.Character
            local var_humanoid_3937 = char and char.FindFirstChildOfClass(char,"Humanoid")
            if var_humanoid_3937 then
                pcall(function() var_humanoid_3937.SetStateEnabled(var_humanoid_3937,Enum.HumanoidStateType.Dead, false) end)
                pcall(function() var_humanoid_3937.SetStateEnabled(var_humanoid_3937,Enum.HumanoidStateType.Ragdoll, false) end)
                pcall(function() var_humanoid_3937.SetStateEnabled(var_humanoid_3937,Enum.HumanoidStateType.FallingDown, false) end)
            end
        end

        local function fn_GeneratorHandler_9092()
            State.var_humanoid_4458 = false
            State.var_humanoid_ffa8 = nil

            local char = LocalPlayer.Character
            local var_humanoid_3937 = char and char.FindFirstChildOfClass(char,"Humanoid")
            if var_humanoid_3937 then
                pcall(function() var_humanoid_3937.SetStateEnabled(var_humanoid_3937,Enum.HumanoidStateType.Dead, true) end)
                pcall(function() var_humanoid_3937.SetStateEnabled(var_humanoid_3937,Enum.HumanoidStateType.Ragdoll, true) end)
                pcall(function() var_humanoid_3937.SetStateEnabled(var_humanoid_3937,Enum.HumanoidStateType.FallingDown, true) end)
            end
        end

        RegisterTask("GodMode", 0.2, function()
            if not State.var_humanoid_4458 then return end
            local char = LocalPlayer.Character
            if not char then return end
            local var_humanoid_3937 = char.FindFirstChildOfClass(char,"Humanoid")
            if not var_humanoid_3937 then return end
            local var_humanoid_aa8c = var_humanoid_3937.MaxHealth
            local var_humanoid_d0bf = var_humanoid_3937.Health
            if State.var_humanoid_ffa8 ~= nil and var_humanoid_d0bf < State.var_humanoid_ffa8 and var_humanoid_d0bf > 0 then
                pcall(function() var_humanoid_3937.Health = var_humanoid_aa8c end)
            end
            State.var_humanoid_ffa8 = var_humanoid_3937.Health
            pcall(function()
                local var_vector_b1de = var_humanoid_3937.GetState(var_humanoid_3937)
                if var_vector_b1de == Enum.HumanoidStateType.Dead then
                    var_humanoid_3937.Health = var_humanoid_aa8c
                    var_humanoid_3937.ChangeState(var_humanoid_3937,Enum.HumanoidStateType.Running)
                    State.var_humanoid_ffa8 = var_humanoid_aa8c
                elseif var_vector_b1de == Enum.HumanoidStateType.Ragdoll or var_vector_b1de == Enum.HumanoidStateType.FallingDown then
                    var_humanoid_3937.ChangeState(var_humanoid_3937,Enum.HumanoidStateType.GettingUp)
                end
            end)
        end)

        local fn_GeneratorHandler_2719
        do
                local var_humanoid_247f = { active = false, target = nil, generator = nil }
            local var_kingScourgeRemote_828a = ReplicatedStorage.Remotes.KillerPerks.kingscourge.WaitForChild(ReplicatedStorage.Remotes.KillerPerks.kingscourge,"KingScourgeStart")
            local var_playerGui_236e = ReplicatedStorage.Remotes.KillerPerks.kingscourge.WaitForChild(ReplicatedStorage.Remotes.KillerPerks.kingscourge,"KingScourgeEnd")

            var_kingScourgeRemote_828a.OnClientEvent.Connect(var_kingScourgeRemote_828a.OnClientEvent,function(var_child_946d, var_child_702a, hitCount)
                var_humanoid_247f.active = true
                var_humanoid_247f.target = var_child_702a
                var_humanoid_247f.generator = var_child_946d
            end)
            var_playerGui_236e.OnClientEvent.Connect(var_playerGui_236e.OnClientEvent,function()
                var_humanoid_247f.active = false
                var_humanoid_247f.target = nil
                var_humanoid_247f.generator = nil
            end)

            local function fn_GeneratorHandler_e113()
                for _, name in ipairs({"SkillCheckPromptGui", "SkillCheckPromptGui-con"}) do
                    local gui = PlayerGui.FindFirstChild(PlayerGui,name, true)
                    if gui then
                        local var_playerGui_71ae = gui.FindFirstChild(gui,"Check", true)
                        if var_playerGui_71ae and var_playerGui_71ae.Visible then
                            return var_playerGui_71ae.FindFirstChild(var_playerGui_71ae,"Line", true), var_playerGui_71ae.FindFirstChild(var_playerGui_71ae,"Goal", true)
                        end
        do local var_playerGui_c930=58%53 end
                    end
                end
            end

            local var_button_710e = nil
            local function fn_GeneratorHelper_2c28()
                if var_button_710e and var_button_710e.Parent then return var_button_710e end
                local var_playerGui_9867 = PlayerGui.FindFirstChild(PlayerGui,"Survivor-mob", true)
                if not var_playerGui_9867 then return nil end
                local var_descendant_180a = var_playerGui_9867.FindFirstChild(var_playerGui_9867,"Controls", true)
                if not var_descendant_180a then return nil end
                local var_button_fcd4 = var_descendant_180a.FindFirstChild(var_descendant_180a,"action")
                if var_button_fcd4 and var_button_fcd4.IsA(var_button_fcd4,"GuiButton") then var_button_710e = var_button_fcd4
                return var_button_fcd4 end
                var_button_fcd4 = var_descendant_180a.FindFirstChild(var_descendant_180a,"Gui-mob")
                if var_button_fcd4 and var_button_fcd4.IsA(var_button_fcd4,"GuiButton") then var_button_710e = var_button_fcd4
                return var_button_fcd4 end
                return nil
            end

            function fn_GeneratorHandler_2719()
                local var_button_9264 = fn_GeneratorHelper_2c28()
                if var_button_9264 and type(firesignal) == "function" then
                    firesignal(var_button_9264.MouseButton1Down)
                    task.delay(0.05, function()
                        if var_button_9264 and var_button_9264.Parent then
                            firesignal(var_button_9264.MouseButton1Up)
                            firesignal(var_button_9264.MouseButton1Click)
                        end
                    end)
                    return
                end
                local var_connection_a646 = PlayerGui.FindFirstChild(PlayerGui,"check", true)
                if var_connection_a646 and var_connection_a646.IsA(var_connection_a646,"GuiObject") and var_connection_a646.Visible then
                    local var_player_2e5f = var_connection_a646.AbsolutePosition
                    local var_uiCorner_3581 = var_connection_a646.AbsoluteSize
                    local var_success_3125 = GuiService.GetGuiInset(GuiService)
                    local var_success_8409 = var_player_2e5f.X + (var_uiCorner_3581.X / (2.0)) + var_success_3125.X
                    local var_backgroundTransparency_34eb = var_player_2e5f.Y + (var_uiCorner_3581.Y / 2) + var_success_3125.Y
                    pcall(function()
                        VirtualInputManager.SendMouseButtonEvent(VirtualInputManager,var_success_8409, var_backgroundTransparency_34eb, 0, true, game, 1)
                        task.wait(0.01)
                        VirtualInputManager.SendMouseButtonEvent(VirtualInputManager,var_success_8409, var_backgroundTransparency_34eb, 0, false, game, (1.0))
                    end)
                else
                    VirtualInputManager.SendKeyEvent(VirtualInputManager,true, Enum.KeyCode.Space, false, game)
                    task.wait()
                    VirtualInputManager.SendKeyEvent(VirtualInputManager,false, Enum.KeyCode.Space, false, game)
                end
            end

            RegisterTask("Generator", 0, function()
                if not Config.cfg_antiLoopWindow_9682 then return end
                local var_uiCorner_d268, goal = fn_GeneratorHandler_e113()
                if not (var_uiCorner_d268 and goal) then
                    State.var_originalValue_4383 = false
                    State.lastGoalRot = nil
                    State.prevLr = nil
                    return
                end

                local var_unknownValue_0040_bdc6 = goal.Rotation
                local var_unknownValue_0003_91dd = var_uiCorner_d268.Rotation
                local var_now_2834 = tick()


                local var_unknownValue_0058_5c2e = var_humanoid_247f.active and 0.05 or 0.1
                if var_now_2834 - State.var_originalValue_506f < var_unknownValue_0058_5c2e then
                    State.prevLr = var_unknownValue_0003_91dd
                    return
                end

                if Config.cfg_autoDropAllPallets_f46e == "Instant" then

                    if not State.var_originalValue_4383 or var_unknownValue_0040_bdc6 ~= State.lastGoalRot then
                        var_uiCorner_d268.Rotation = var_unknownValue_0040_bdc6 + 109
                        State.lastGoalRot = var_unknownValue_0040_bdc6
                        State.var_originalValue_4383 = true
                        State.var_originalValue_506f = var_now_2834
                        State.var_originalValue_20f2 = var_now_2834
                        fn_GeneratorHandler_2719()
                    end

                else

                    local var_cframeOffset_64d3 = (var_unknownValue_0003_91dd - var_unknownValue_0040_bdc6) % 360


                    local var_unknownValue_0012_71a1 = (-1.0)
                    if State.prevLr and State.lastGoalRot == var_unknownValue_0040_bdc6 then
                        var_unknownValue_0012_71a1 = (State.prevLr - var_unknownValue_0040_bdc6) % 360
                    end
                    State.lastGoalRot = var_unknownValue_0040_bdc6

                    local var_unknownValue_0049_2186, zoneEnd
                    if Config.cfg_autoDropAllPallets_f46e == "Perfect" then

                        var_unknownValue_0049_2186 = (102.0)
                        zoneEnd = 116
                    elseif Config.cfg_autoDropAllPallets_f46e == "Normal" then

                        var_unknownValue_0049_2186 = 116
                        zoneEnd = (159.0)
                    elseif Config.cfg_autoDropAllPallets_f46e == "Random" then
                        if not State.var_originalValue_9705 then
                            var_unknownValue_0049_2186 = 102
                            zoneEnd = 116
                        else
                            var_unknownValue_0049_2186 = (116.0)
                            zoneEnd = 159
                        end
                    else
                        return
                    end


                    local var_unknownValue_0047_b3cd = var_cframeOffset_64d3 >= var_unknownValue_0049_2186 and var_cframeOffset_64d3 <= zoneEnd



                    local var_unknownValue_0056_cceb = var_unknownValue_0012_71a1 >= 0 and var_unknownValue_0012_71a1 < var_unknownValue_0049_2186 and var_cframeOffset_64d3 > zoneEnd

                    if var_unknownValue_0047_b3cd or var_unknownValue_0056_cceb then
                        if var_unknownValue_0056_cceb then

                            var_uiCorner_d268.Rotation = var_unknownValue_0040_bdc6 + (var_unknownValue_0049_2186 + zoneEnd) / 2
                        end

                        State.var_originalValue_506f = var_now_2834
                        State.var_originalValue_20f2 = var_now_2834
                        fn_GeneratorHandler_2719()


                        if Config.cfg_autoDropAllPallets_f46e == "Random" then
                            State.var_originalValue_9705 = not State.var_originalValue_9705
                        end
                    end
                end

                State.prevLr = var_unknownValue_0003_91dd
            end)

            RegisterTask("GenBtnRefresh", 2.0, function()
                if not Config.cfg_antiLoopWindow_9682 then return end
                if not var_button_710e or not var_button_710e.Parent then fn_GeneratorHelper_2c28() end
            end)
        end

        function IsGeneratorPoint(var_instance_5397)
            if not var_instance_5397 then return false end
            local var_originalValue_9b47 = var_instance_5397.GetAttribute(var_instance_5397,"OriginalName")
            if var_originalValue_9b47 and string.find(tostring(var_originalValue_9b47):lower(), "generatorpoint") then return true end
            if string.find(var_instance_5397.Name, "^GeneratorPoint%d+$") then return true end
            return false
        end

        function CollectGeneratorPoints(var_child_946d)
            local var_child_4944 = {}
            if not var_child_946d then return var_child_4944 end
            local var_child_cf05 = {}
            local function fn_GeneratorHelper_dc2a(var_instance_5397)
                if var_child_cf05[var_instance_5397] then return end
                if IsGeneratorPoint(var_instance_5397) then
                    var_child_cf05[var_instance_5397] = true
                    table.insert(var_child_4944, var_instance_5397)
                end
            end
            local function fn_GeneratorHandler_24a3(var_child_a03d)
                for _, var_instance_4e7f in ipairs(var_child_a03d.GetChildren(var_child_a03d)) do
                    fn_GeneratorHelper_dc2a(var_instance_4e7f)
                    fn_GeneratorHandler_24a3(var_instance_4e7f)
                end
            end
            fn_GeneratorHandler_24a3(var_child_946d)
            table.sort(var_child_4944, function(var_rootPart_4e4c, var_rootPart_b34c)
                local var_humanoid_a796 = var_rootPart_4e4c.GetAttribute(var_rootPart_4e4c,"OriginalName") or var_rootPart_4e4c.Name
                local var_originalValue_5d28 = var_rootPart_b34c.GetAttribute(var_rootPart_b34c,"OriginalName") or var_rootPart_b34c.Name
                return tostring(var_humanoid_a796) < tostring(var_originalValue_5d28)
            end)
            return var_child_4944
        end

        function FindGenForPoint(var_child_702a)
            if not var_child_702a then return nil end
            local var_child_3f4a = var_child_702a
            for _ = 1, 6 do
                local var_child_a03d = var_child_3f4a.Parent
                if not var_child_a03d then break end
                if var_child_a03d.IsA(var_child_a03d,"Model") or var_child_a03d.IsA(var_child_a03d,"Folder") then
                    local name = var_child_a03d.Name.lower(var_child_a03d.Name)
                    if string.find(name, "generator") or string.find(name, "gens") then
                        return var_child_a03d
                    end
                    for _, var_instance_4e7f in ipairs(var_child_a03d.GetChildren(var_child_a03d)) do
                        if IsGeneratorPoint(var_instance_4e7f) then return var_child_a03d end
                    end
                end
                var_child_3f4a = var_child_a03d
            end
            for _, var_child_946d in ipairs(State.state_espHook_4896.Generators) do
                if var_child_946d and var_child_946d.Parent and var_child_702a.IsDescendantOf(var_child_702a,var_child_946d) then return var_child_946d end
            end
            return nil
        end

        function GetAllGenerators()
            local var_child_d048 = {}
            local var_child_cf05 = {}
            local function fn_GeneratorHandler_270e(var_child_946d)
                if var_child_946d and var_child_946d.Parent and not var_child_cf05[var_child_946d] then
                    var_child_cf05[var_child_946d] = true
                    table.insert(var_child_d048, var_child_946d)
                end
            end
            for _, var_child_946d in ipairs(State.state_espHook_4896.Generators) do fn_GeneratorHandler_270e(var_child_946d) end
            local var_descendant_b2cb = workspace.FindFirstChild(workspace,"Map")
            if var_descendant_b2cb then
                for _, var_child_fde8 in ipairs({"Generators", "Generator", "Gens"}) do
                    local var_child_f07f = var_descendant_b2cb.FindFirstChild(var_descendant_b2cb,var_child_fde8)
                    if var_child_f07f then
                        for _, var_child_946d in ipairs(var_child_f07f.GetChildren(var_child_f07f)) do fn_GeneratorHandler_270e(var_child_946d) end
                    end
                end
            end
            return var_child_d048
        end

        function GetPointPosition(var_child_702a)
            if var_child_702a.IsA(var_child_702a,"BasePart") then return var_child_702a.Position end
            local part = var_child_702a.FindFirstChildWhichIsA(var_child_702a,"BasePart")
            if part then return part.Position end
            return nil
        end

        -- [SURVIVOR] Otomasi peningkatan generator
        function PerformGenBoost()
            task.spawn(function()
                local var_success_abb9, err = pcall(function()
                    local char = LocalPlayer.Character
                    if not char then
                        Notify("GenBoost", "Character not found!", 2)
                        return
                    end
                    local var_rootPart_2226 = char.FindFirstChild(char,"HumanoidRootPart")
                    if not var_rootPart_2226 then
                        Notify("GenBoost", "Character HumanoidRootPart not found!", 2)
                        return
                    end

                    local var_rootPart_abd9 = char.FindFirstChild(char,"CheckInterractable")
                    local var_rootPart_ed2c = var_rootPart_abd9 and var_rootPart_abd9.GetAttribute(var_rootPart_abd9,"isRepairing") or false
                    if not var_rootPart_ed2c then
                        Notify("GenBoost", "Repair a generator first!", (2.0))
                        return
                    end

                    local var_child_d048 = GetAllGenerators()
                    local var_position_526b = nil
                    local var_player_dd74 = math.huge
                    for _, var_child_946d in ipairs(var_child_d048) do
                        for _, var_child_702a in ipairs(CollectGeneratorPoints(var_child_946d)) do
                            local pos = GetPointPosition(var_child_702a)
                            local dist = pos and (pos - var_rootPart_2226.Position).Magnitude or math.huge
                            if dist < var_player_dd74 then
                                var_player_dd74 = dist
                                var_position_526b = var_child_702a
                            end
                        end
                    end

                    local var_child_946d = var_position_526b and FindGenForPoint(var_position_526b)
                    if not var_child_946d then
                        local var_position_3999 = nil
                        local var_position_c34e = math.huge
                        for _, var_remoteEvent_1e8c in ipairs(var_child_d048) do
                            for _, var_child_702a in ipairs(CollectGeneratorPoints(var_remoteEvent_1e8c)) do
                                local pos = GetPointPosition(var_child_702a)
                                local dist = pos and (pos - var_rootPart_2226.Position).Magnitude or math.huge
                                if dist < var_position_c34e then
                                    var_position_c34e = dist
                                    var_position_3999 = var_child_702a
                                end
                            end
                        end
                        if var_position_3999 then
                            var_position_526b = var_position_3999
                            var_child_946d = FindGenForPoint(var_position_3999)
                        end
                    end

                    if not var_child_946d then
                        Notify("GenBoost", "Could not find current generator!", (2.0))
                        return
                    end

                    local var_child_4944 = CollectGeneratorPoints(var_child_946d)
                    if #var_child_4944 == 0 then
                        Notify("GenBoost", "No generator points resolved!", 2)
                        return
                    end

                    local var_remote_71b5 = ReplicatedStorage.FindFirstChild(ReplicatedStorage,"Remotes")
                        and ReplicatedStorage.Remotes.FindFirstChild(ReplicatedStorage.Remotes,"Generator")
                        and ReplicatedStorage.Remotes.Generator.FindFirstChild(ReplicatedStorage.Remotes.Generator,"RepairEvent")
                    if not var_remote_71b5 then var_remote_71b5 = ReplicatedStorage.FindFirstChild(ReplicatedStorage,"RepairEvent", true) end
                    if not var_remote_71b5 then
                        Notify("GenBoost", "RepairEvent remote not found!", 2)
                        return
                    end

                    local var_remote_4372 = var_position_526b
                    local var_child_ae3b = false
                    for _, var_player_2e5f in ipairs(var_child_4944) do
                        if var_player_2e5f == var_remote_4372 then var_child_ae3b = true break end
                    end
                    if not var_remote_4372 or not var_child_ae3b then var_remote_4372 = var_child_4944[1] end

                    for _, var_player_2e5f in ipairs(var_child_4944) do
                        if var_player_2e5f ~= var_remote_4372 then
                            var_remote_71b5.FireServer(var_remote_71b5,var_player_2e5f, true)
                            task.wait(0.4)
                            var_remote_71b5.FireServer(var_remote_71b5,var_remote_4372, true)
                            task.wait(0.15)
                            var_remote_71b5.FireServer(var_remote_71b5,var_remote_4372, false)
                            task.wait(0.15)
                        end
                    end
                    for _, var_player_2e5f in ipairs(var_child_4944) do
                        if var_player_2e5f ~= var_remote_4372 then
                            var_remote_71b5.FireServer(var_remote_71b5,var_player_2e5f, true)
                            task.wait(0.3)
                        end
                    end
                    var_remote_71b5.FireServer(var_remote_71b5,var_remote_4372, false)
                    task.wait(0.2)
                    local var_remote_426d = GetPointPosition(var_remote_4372)
                    if var_remote_426d and var_rootPart_2226 then
                        pcall(function() var_rootPart_2226.Anchored = false end)
                        pcall(function() var_rootPart_2226.CFrame = CFrame.new(var_remote_426d + Vector3.new(0, 1.5, (0.0))) end)
                    end
                    task.wait(0.3)
                    pcall(fn_GeneratorHandler_2719)

                    Notify("GenBoost", "Successfully applied generator Boost!", 2)
                end)
                if not var_success_abb9 then
                    Notify("GenBoost", "Critical Error: " .. tostring(err), 2)
                end
            end)
        end

        function DestroyGenBoostButton()
            if State.var_playerGui_4d80 then
                pcall(function() State.var_playerGui_4d80.Disconnect(State.var_playerGui_4d80) end)
                State.var_playerGui_4d80 = nil
            end
            if State.var_playerGui_4d72 then
                pcall(function() State.var_playerGui_4d72.Destroy(State.var_playerGui_4d72) end)
                State.var_playerGui_4d72 = nil
            end
        end

        function BuildGenBoostGui(var_button_a126)
            if not var_button_a126 or State.var_playerGui_4d72 then return end
            local gui = Instance.new("ScreenGui")
            gui.Name = "BolongHubGenBoost"
            gui.ResetOnSpawn = false
            gui.Parent = LocalPlayer.WaitForChild(LocalPlayer,"PlayerGui")

            local var_connection_a646 = Instance.new("ImageButton")
            var_connection_a646.Name = "GenBoostBtn"
            var_connection_a646.BackgroundTransparency = 1
            var_connection_a646.BorderSizePixel = 0
            var_connection_a646.AutoButtonColor = false
            var_connection_a646.Size = UDim2.fromOffset(76, 76)
            var_connection_a646.Image = "rbxassetid://129980991442403"
            var_connection_a646.ImageTransparency = 0.5
            var_connection_a646.Draggable = false
            var_connection_a646.AnchorPoint = Vector2.new((1.0), 0.5)
            var_connection_a646.Position = UDim2.new(
                var_button_a126.Position.X.Scale,
                var_button_a126.Position.X.Offset + 100,
                var_button_a126.Position.Y.Scale,
                var_button_a126.Position.Y.Offset
            )
            var_connection_a646.Parent = gui

            var_connection_a646.MouseButton1Click.Connect(var_connection_a646.MouseButton1Click,PerformGenBoost)
            var_connection_a646.MouseButton1Click.Connect(var_connection_a646.MouseButton1Click,function()
                var_connection_a646.ImageColor3 = Color3.fromRGB(255, 128, 0)
                task.delay(0.3, function()
                    var_connection_a646.ImageColor3 = Color3.fromRGB((255.0), 255, 255)
                end)
            end)

            State.var_playerGui_4d72 = gui
        end

        function CreateGenBoostButton()
            if State.var_playerGui_4d72 then return end

            local var_playerGui_9c23 = LocalPlayer.FindFirstChild(LocalPlayer,"PlayerGui")
            if var_playerGui_9c23 then
                local var_playerGui_4796 = var_playerGui_9c23.FindFirstChild(var_playerGui_9c23,"Survivor-mob")
                if var_playerGui_4796 then
                    local var_playerGui_e83b = var_playerGui_4796.FindFirstChild(var_playerGui_4796,"Controls")
                    local var_button_a126 = var_playerGui_e83b and var_playerGui_e83b.FindFirstChild(var_playerGui_e83b,"crouch")
                    if var_button_a126 and var_button_a126.IsA(var_button_a126,"GuiButton") then
                        BuildGenBoostGui(var_button_a126)
                        return
                    end
                end
            end

            if State.var_playerGui_4d80 then return end
            var_playerGui_9c23 = var_playerGui_9c23 or LocalPlayer.WaitForChild(LocalPlayer,"PlayerGui")
            State.var_playerGui_4d80 = var_playerGui_9c23.ChildAdded.Connect(var_playerGui_9c23.ChildAdded,function(var_instance_4e7f)
                if var_instance_4e7f and var_instance_4e7f.Name == "Survivor-mob" then
                    if State.var_playerGui_4d80 then
                        State.var_playerGui_4d80.Disconnect(State.var_playerGui_4d80)
                        State.var_playerGui_4d80 = nil
                    end
                    task.spawn(function()
                        local var_playerGui_e83b = var_instance_4e7f.WaitForChild(var_instance_4e7f,"Controls", 5)
                        local var_button_a126 = var_playerGui_e83b and var_playerGui_e83b.WaitForChild(var_playerGui_e83b,"crouch", 5)
                        if var_button_a126 and var_button_a126.IsA(var_button_a126,"GuiButton") and Config.cfg_enableKillerPerksInfo_53d3 then
                            BuildGenBoostGui(var_button_a126)
                        end
                    end)
                end
            end)
        end

        RegisterTask("KillerWarn", 0.1, function()
            if not Config.cfg_fullbright_2910 then
                local var_rootPart_f536 = LocalPlayer.Character
                local var_player_503c = var_rootPart_f536 and var_rootPart_f536.FindFirstChild(var_rootPart_f536,"HumanoidRootPart")
                if var_player_503c then
                    local var_rootPart_bf8b = var_player_503c.FindFirstChild(var_player_503c,"KillerWarn")
                    if var_rootPart_bf8b then var_rootPart_bf8b.Destroy(var_rootPart_bf8b) end
                end
                return
            end
            local var_rootPart_f536 = LocalPlayer.Character
            local var_player_503c = var_rootPart_f536 and var_rootPart_f536.FindFirstChild(var_rootPart_f536,"HumanoidRootPart")
            if not var_player_503c then return end
            local var_rootPart_9806 = math.huge
            for player, var_rootPart_a28d in pairs(State.espObjects) do
                if player and player.Parent then
                    local var_player_939c = GetPlayerRole(player)
                    if var_player_939c == "killer" then
                        local char = player.Character
                        local var_rootPart_186c = char and char.FindFirstChild(char,"HumanoidRootPart")
                        if var_rootPart_186c then
                            local dist = (var_rootPart_186c.Position - var_player_503c.Position).Magnitude
                            if dist < var_rootPart_9806 then var_rootPart_9806 = dist end
                        end
                    end
                end
            end
            local var_rootPart_bf8b = var_player_503c.FindFirstChild(var_player_503c,"KillerWarn")
            if var_rootPart_9806 <= Config.warnDist1 then
                local var_animationTrack_9ac3, col
                if var_rootPart_9806 <= Config.warnDist3 then var_animationTrack_9ac3 = "!!!"
                col = Color3.fromRGB(255, 0, 0)
                elseif var_rootPart_9806 <= Config.warnDist2 then var_animationTrack_9ac3 = "!!"
                col = Color3.fromRGB(255, 80, 0)
                else var_animationTrack_9ac3 = "!"
                col = Color3.fromRGB((255.0), 160, 0) end
                if not var_rootPart_bf8b then
                    var_rootPart_bf8b = CreateBillboardTag(var_animationTrack_9ac3, col, UDim2.new(0, 40, 0, (40.0)), (22.0))
                    var_rootPart_bf8b.Name = "KillerWarn"
                    var_rootPart_bf8b.Parent = var_player_503c
                else
                    var_rootPart_bf8b.Label.Text = var_animationTrack_9ac3
                    var_rootPart_bf8b.Label.TextColor3 = col
                end
            elseif var_rootPart_bf8b then
                var_rootPart_bf8b.Destroy(var_rootPart_bf8b)
            end
        end)

        local fn_StunTimerHandler_8693, StopStunTimer
        do
            local var_animationId_a887 = { StunAnimation=true, WallHitStun=true, WallHitStun2=true, WipeMachete=true, Parried=true }

            local var_animationId_8f26 = {
                stunnedvm = "rbxassetid://108650759135855",
                parriedvm = "rbxassetid://87457855797515",
                wallhitvm = "rbxassetid://109632692854327",
                wipevm = "rbxassetid://71906161598748",
            }
            local var_color_a7f6 = Color3.fromRGB(255, 220, 60)
            State.stunTimerPulse = 0




            local function fn_StunTimerHelper_9512()
                if State.stunTimerLens.stunnedvm then return true end
                local var_humanoid_e59f = nil
                pcall(function()
                    local char = LocalPlayer.Character
                    local var_humanoid_3937 = char and char.FindFirstChildOfClass(char,"Humanoid")
                    if var_humanoid_3937 then var_humanoid_e59f = var_humanoid_3937.FindFirstChildOfClass(var_humanoid_3937,"Animator") end
                end)
                if not var_humanoid_e59f then return false end
                for detectedKiller, var_animationId_d567 in pairs(var_animationId_8f26) do
                    if not State.stunTimerLens[detectedKiller] then
                        pcall(function()
                            local var_animationId_3e25 = Instance.new("Animation")
                            var_animationId_3e25.AnimationId = var_animationId_d567
                            local var_animationId_5781 = var_humanoid_e59f.LoadAnimation(var_humanoid_e59f,var_animationId_3e25)
                            if var_animationId_5781 and var_animationId_5781.Length and var_animationId_5781.Length > 0 then
                                State.stunTimerLens[detectedKiller] = var_animationId_5781.Length
                            end
                            pcall(function() var_animationId_3e25.Destroy(var_animationId_3e25) end)
                        end)
                    end
                end
                return State.stunTimerLens.stunnedvm ~= nil
            end

            local function fn_StunTimerHelper_ba6e()
                task.spawn(function()
                    for _ = 1, (5.0) do
                        if not State.var_player_4cf2 then return end
                        local var_success_abb9 = false
                        pcall(function() var_success_abb9 = fn_StunTimerHelper_9512() end)
                        if var_success_abb9 then return end
                        task.wait((2.0))
                    end
                end)
            end


            local function fn_StunTimerHelper_957b(dur)
                if not dur or dur <= (0.0) then return end
                local var_player_1c21 = tick() + dur
                for _, var_player_2e5f in ipairs(Players.GetPlayers(Players)) do
                    if var_player_2e5f ~= LocalPlayer and var_player_2e5f.Parent and GetPlayerRole(var_player_2e5f) == "killer" then
                        local cur = State.stunTimerForced[var_player_2e5f]
                        if not cur or cur < var_player_1c21 then
                            State.stunTimerForced[var_player_2e5f] = var_player_1c21
                        end
                    end
                end
            end

            local function fn_StunTimerHandler_6926(player)
                local var_backgroundTransparency_2a69 = State.stunTimerBoards[player]
                if var_backgroundTransparency_2a69 then pcall(function() var_backgroundTransparency_2a69.Destroy(var_backgroundTransparency_2a69) end) end
                State.stunTimerBoards[player] = nil
                State.stunTimerForced[player] = nil
                State.stunTimerAnim[player] = nil
            end

            local function fn_StunTimerHandler_4eca()
                local var_unknownValue_0057_ee53 = {}
                for player, _ in pairs(State.stunTimerBoards) do var_unknownValue_0057_ee53[#var_unknownValue_0057_ee53 + 1] = player end
                for var_remoteEvent_5dde = 1, #var_unknownValue_0057_ee53 do fn_StunTimerHandler_6926(var_unknownValue_0057_ee53[var_remoteEvent_5dde]) end
                for player, _ in pairs(State.stunTimerForced) do State.stunTimerForced[player] = nil end
                State.stunTimerPulse = 0
            end

            local function fn_PalletHelper_b06c(player, char)
                local var_humanoid_a796 = State.stunTimerAnim[player]
                if var_humanoid_a796 and var_humanoid_a796.Parent then return var_humanoid_a796 end
                var_humanoid_a796 = nil
                pcall(function()
                    local var_humanoid_3937 = char.FindFirstChildOfClass(char,"Humanoid")
                    if var_humanoid_3937 then var_humanoid_a796 = var_humanoid_3937.FindFirstChildOfClass(var_humanoid_3937,"Animator") end
                end)
                State.stunTimerAnim[player] = var_humanoid_a796
                return var_humanoid_a796
            end

            local function fn_PalletHelper_7812(player, char)
                local var_humanoid_e59f = fn_PalletHelper_b06c(player, char)
                if not var_humanoid_e59f then return (0.0) end
                local var_success_abb9, tracks = pcall(function() return var_humanoid_e59f.GetPlayingAnimationTracks(var_humanoid_e59f) end)
                if not var_success_abb9 or type(tracks) ~= "table" then return 0 end
                local var_player_d377 = 0
                for var_remoteEvent_5dde = 1, #tracks do
                    local var_animationId_5781 = tracks[var_remoteEvent_5dde]
                    local nm = nil
                    local var_animationTrack_77c4 = 1
                    local var_animationTrack_2f42, var_animationTrack_c797, pos = false, (0.0), 0
                    pcall(function()
                        nm = var_animationId_5781.Name
                        local var_rootPart_4e4c = var_animationId_5781.Animation
                        if var_rootPart_4e4c then
                            if not var_animationId_a887[nm] and var_rootPart_4e4c.Name and var_animationId_a887[var_rootPart_4e4c.Name] then
                                nm = var_rootPart_4e4c.Name
                            end

                            if not var_animationId_a887[nm] and var_rootPart_4e4c.AnimationId then
                                local id = tostring(var_rootPart_4e4c.AnimationId)
                                for _, var_animationId_d567 in pairs(var_animationId_8f26) do
                                    if id == var_animationId_d567 or id.find(id,var_animationId_d567.match(var_animationId_d567,"%d+"), 1, true) then
                                        nm = "__vmid__"
                                        break
                                    end
                                end
                            end
                        end
                        var_animationTrack_2f42 = var_animationId_5781.IsPlaying
                        var_animationTrack_c797 = var_animationId_5781.Length or 0
                        pos = var_animationId_5781.TimePosition or 0
                        var_animationTrack_77c4 = var_animationId_5781.Speed or (1.0)
                    end)
                    if nm and (var_animationId_a887[nm] or nm == "__vmid__") and var_animationTrack_2f42 then
                        if var_animationTrack_77c4 == 0 then var_animationTrack_77c4 = 1 end
                        local var_unknownValue_0050_3412 = (var_animationTrack_c797 - pos) / math.abs(var_animationTrack_77c4)
                        if var_unknownValue_0050_3412 > var_player_d377 then var_player_d377 = var_unknownValue_0050_3412 end
                    end
                end


                return var_player_d377
            end

            local function fn_PalletHandler_bfc8(player, var_rootPart_6233)
                local var_backgroundTransparency_2a69 = State.stunTimerBoards[player]
                if var_backgroundTransparency_2a69 and var_backgroundTransparency_2a69.Parent and var_backgroundTransparency_2a69.Adornee and var_backgroundTransparency_2a69.Adornee.Parent then
                    if var_backgroundTransparency_2a69.Adornee ~= var_rootPart_6233 then
                        pcall(function() var_backgroundTransparency_2a69.Adornee = var_rootPart_6233 end)
                    end
                    return var_backgroundTransparency_2a69
                end
                if var_backgroundTransparency_2a69 then pcall(function() var_backgroundTransparency_2a69.Destroy(var_backgroundTransparency_2a69) end) end
                var_backgroundTransparency_2a69 = CreateBillboardTag("Stun 0.0s", var_color_a7f6, UDim2.new(0, 110, 0, (30.0)), 18)
                var_backgroundTransparency_2a69.Name = "StunTimer"
                pcall(function() var_backgroundTransparency_2a69.MaxDistance = State.state_potatoGraphics_4818 end)
                pcall(function()
                    var_backgroundTransparency_2a69.Adornee = var_rootPart_6233
                    var_backgroundTransparency_2a69.Parent = var_rootPart_6233
                    var_backgroundTransparency_2a69.SetAttribute(var_backgroundTransparency_2a69,"__t", "")
                end)
                State.stunTimerBoards[player] = var_backgroundTransparency_2a69
                return var_backgroundTransparency_2a69
            end

            local function fn_PalletHelper_1475()
                if State.var_success_d31c then return end
                State.var_success_d31c = true
                pcall(function()
                    local var_replicatedStorage_2561 = ReplicatedStorage.FindFirstChild(ReplicatedStorage,"Remotes")
                    if not var_replicatedStorage_2561 then return end
                    local var_connection_5b02 = var_replicatedStorage_2561.FindFirstChild(var_replicatedStorage_2561,"Pallet")
                    local var_remoteEvent_c12e = var_connection_5b02 and var_connection_5b02.FindFirstChild(var_connection_5b02,"Jason")
                    local var_remoteEvent_183a = var_remoteEvent_c12e and var_remoteEvent_c12e.FindFirstChild(var_remoteEvent_c12e,"Stun")
                    if var_remoteEvent_183a and var_remoteEvent_183a.IsA(var_remoteEvent_183a,"RemoteEvent") then
                        table.insert(State.stunTimerConns, var_remoteEvent_183a.OnClientEvent.Connect(var_remoteEvent_183a.OnClientEvent,function()
                            if State.var_player_4cf2 then
                                State.stunTimerPulse = tick()

                                if not State.stunTimerLens.stunnedvm then fn_StunTimerHelper_ba6e() end
                                fn_StunTimerHelper_957b(State.stunTimerLens.stunnedvm or 2.5)
                            end
                        end))
                    end
                    local var_remoteEvent_700f = var_remoteEvent_c12e and var_remoteEvent_c12e.FindFirstChild(var_remoteEvent_c12e,"Stunover")
                    if var_remoteEvent_700f and var_remoteEvent_700f.IsA(var_remoteEvent_700f,"RemoteEvent") then
                        table.insert(State.stunTimerConns, var_remoteEvent_700f.OnClientEvent.Connect(var_remoteEvent_700f.OnClientEvent,function()
                            if State.var_player_4cf2 then
                                for player, _ in pairs(State.stunTimerForced) do State.stunTimerForced[player] = nil end
                                fn_StunTimerHandler_4eca()
                            end
                        end))
                    end
                    local var_remoteEvent_d577 = var_replicatedStorage_2561.FindFirstChild(var_replicatedStorage_2561,"Attacks")
                    local var_player_ec4a = var_remoteEvent_d577 and var_remoteEvent_d577.FindFirstChild(var_remoteEvent_d577,"AfterAttack")
                    if var_player_ec4a and var_player_ec4a.IsA(var_player_ec4a,"RemoteEvent") then
                        table.insert(State.stunTimerConns, var_player_ec4a.OnClientEvent.Connect(var_player_ec4a.OnClientEvent,function(atkType)
                            if not State.var_player_4cf2 then return end
                            if atkType == "Parried" then
                                for _, var_player_2e5f in ipairs(Players.GetPlayers(Players)) do
                                    if var_player_2e5f ~= LocalPlayer and var_player_2e5f.Parent and GetPlayerRole(var_player_2e5f) == "killer" then
                                        State.stunTimerForced[var_player_2e5f] = tick() + 4
                                    end
                                end
                            elseif atkType == "WallHitStun" or atkType == "WallHitStun2" then
                                State.stunTimerPulse = tick()
                                if not State.stunTimerLens.wallhitvm then fn_StunTimerHelper_ba6e() end
                                fn_StunTimerHelper_957b(State.stunTimerLens.wallhitvm or 2.5)
                            elseif atkType == "WipeMachete" then
                                State.stunTimerPulse = tick()
                                if not State.stunTimerLens.wipevm then fn_StunTimerHelper_ba6e() end
                                fn_StunTimerHelper_957b(State.stunTimerLens.wipevm or 2.5)
                            end
                        end))
                    end
                    local var_endScreen_99a9 = var_replicatedStorage_2561.FindFirstChild(var_replicatedStorage_2561,"Killers")
                    local var_remoteEvent_842d = var_endScreen_99a9 and var_endScreen_99a9.FindFirstChild(var_endScreen_99a9,"Hidden")
                    local var_connection_6ef3 = var_remoteEvent_842d and var_remoteEvent_842d.FindFirstChild(var_remoteEvent_842d,"endlag")
                    if var_connection_6ef3 and var_connection_6ef3.IsA(var_connection_6ef3,"BindableEvent") then
                        table.insert(State.stunTimerConns, var_connection_6ef3.Event.Connect(var_connection_6ef3.Event,function()
                            if State.var_player_4cf2 then
                                State.stunTimerPulse = tick()
                                if not State.stunTimerLens.wipevm then fn_StunTimerHelper_ba6e() end
                                fn_StunTimerHelper_957b(State.stunTimerLens.wipevm or 2.5)
                            end
                        end))
                    end



                    local var_remoteEvent_51bd = var_replicatedStorage_2561.FindFirstChild(var_replicatedStorage_2561,"Game")
                    local var_remoteEvent_3925 = var_remoteEvent_51bd and var_remoteEvent_51bd.FindFirstChild(var_remoteEvent_51bd,"PlayerActionEvent")
                    if var_remoteEvent_3925 and var_remoteEvent_3925.IsA(var_remoteEvent_3925,"RemoteEvent") then
                        table.insert(State.stunTimerConns, var_remoteEvent_3925.OnClientEvent.Connect(var_remoteEvent_3925.OnClientEvent,function(message)
                            if State.var_player_4cf2 and message == "Stunned the Killer" then
                                State.stunTimerPulse = tick()
                                if not State.stunTimerLens.stunnedvm then fn_StunTimerHelper_ba6e() end
                                fn_StunTimerHelper_957b(State.stunTimerLens.stunnedvm or 2.5)
                            end
                        end))
                    end
                end)
            end

            function fn_StunTimerHandler_8693()
                State.var_player_4cf2 = true
                fn_PalletHelper_1475()
                fn_StunTimerHelper_ba6e()
            end

            function StopStunTimer()
                State.var_player_4cf2 = false
                fn_StunTimerHandler_4eca()
            end

            RegisterTask("StunTimer", 0.1, function()
                if not State.var_player_4cf2 then
                    if next(State.stunTimerBoards) ~= nil then fn_StunTimerHandler_4eca() end
                    return
                end
                local var_rootPart_f536 = LocalPlayer.Character
                local var_player_503c = var_rootPart_f536 and var_rootPart_f536.FindFirstChild(var_rootPart_f536,"HumanoidRootPart")
                local var_player_ccd1 = nil
                if var_player_503c then
                    var_player_ccd1 = var_player_503c.Position
                else
                    local var_rootPart_2947 = workspace.CurrentCamera
                    if var_rootPart_2947 then var_player_ccd1 = var_rootPart_2947.CFrame.Position end
                end
                if not var_player_ccd1 then return end
                local var_now_2834 = tick()
                local var_player_7bdc = State.state_potatoGraphics_4818
                for _, player in ipairs(Players.GetPlayers(Players)) do
                    if player ~= LocalPlayer and player.Parent and GetPlayerRole(player) == "killer" then
                        local char = player.Character
                        local var_rootPart_6233 = char and (char.FindFirstChild(char,"Head") or char.FindFirstChild(char,"HumanoidRootPart"))
                        if char and char.Parent and var_rootPart_6233 and var_rootPart_6233.Parent then
                            local dist = (var_rootPart_6233.Position - var_player_ccd1).Magnitude
                            if dist <= var_player_7bdc then
                                local var_position_a433 = 0
                                local var_position_c4c7 = State.stunTimerForced[player]
                                if var_position_c4c7 and var_position_c4c7 > var_now_2834 then var_position_a433 = var_position_c4c7 - var_now_2834 end
                                local var_unknownValue_0016_9387 = fn_PalletHelper_7812(player, char)
                                if var_unknownValue_0016_9387 > var_position_a433 then var_position_a433 = var_unknownValue_0016_9387 end
                                if var_position_a433 > 0.05 then
                                    local var_backgroundTransparency_2a69 = fn_PalletHandler_bfc8(player, var_rootPart_6233)
                                    if var_backgroundTransparency_2a69 then
                                        if not var_backgroundTransparency_2a69.Enabled then var_backgroundTransparency_2a69.Enabled = true end
                                        local var_animationTrack_9ac3 = string.format("Stun %.1fs", var_position_a433)
                                        local var_unknownValue_0006_53a4 = var_backgroundTransparency_2a69.GetAttribute(var_backgroundTransparency_2a69,"__t")
                                        if var_unknownValue_0006_53a4 ~= var_animationTrack_9ac3 then
                                            var_backgroundTransparency_2a69.SetAttribute(var_backgroundTransparency_2a69,"__t", var_animationTrack_9ac3)
                                            local var_backgroundTransparency_dd44 = var_backgroundTransparency_2a69.FindFirstChild(var_backgroundTransparency_2a69,"Label")
                                            if var_backgroundTransparency_dd44 then var_backgroundTransparency_dd44.Text = var_animationTrack_9ac3 end
                                        end
                                    end
                                else
                                    if var_now_2834 - (State.stunTimerPulse or 0) > 0.35 then
                                        fn_StunTimerHandler_6926(player)
                                    end
                                end
                            else
                                local var_backgroundTransparency_2a69 = State.stunTimerBoards[player]
                                if var_backgroundTransparency_2a69 and var_backgroundTransparency_2a69.Enabled then var_backgroundTransparency_2a69.Enabled = false end
                            end
                        else
                            fn_StunTimerHandler_6926(player)
                        end
                    end
                end
                local var_originalValue_f3bc = nil
                for player, _ in pairs(State.stunTimerBoards) do
                    if not player.Parent then
                        var_originalValue_f3bc = var_originalValue_f3bc or {}
                        var_originalValue_f3bc[#var_originalValue_f3bc + 1] = player
                    end
                end
                if var_originalValue_f3bc then
                    for var_remoteEvent_5dde = 1, #var_originalValue_f3bc do fn_StunTimerHandler_6926(var_originalValue_f3bc[var_remoteEvent_5dde]) end
                end
            end)
        end

        RegisterTask("ESPValidator", 1, function()
            if not ESPFolder or not ESPFolder.Parent then
                ForceRefreshAllESP()
                return
            end
            for player, _ in pairs(State.espObjects) do
                ValidateAndReattachESP(player)
            end
            for player, _ in pairs(State.outlineObjects) do
                if not State.espObjects[player] then
                    ValidateAndReattachESP(player)
                end
            end
        end)

        RegisterTask("EspDistCull", 0.25, function()
            if State.espObjects then var_billboard_763c() end
        end)

        RegisterTask("ItemESP", 0.2, function()
            if not Config.cfg_scpESPDistance_66fd then
                for _, var_rootPart_a28d in pairs(State.espObjects) do
                    if var_rootPart_a28d and var_rootPart_a28d.itemImage and var_rootPart_a28d.itemImage.Visible then
                        var_rootPart_a28d.itemImage.Visible = false
                    end
                end
                return
            end

            local var_rootPart_f536 = LocalPlayer.Character
            local var_rootPart_f542 = var_rootPart_f536 and var_rootPart_f536.FindFirstChild(var_rootPart_f536,"HumanoidRootPart")

            for player, var_rootPart_a28d in pairs(State.espObjects) do
                if var_rootPart_a28d and var_rootPart_a28d.billboard and var_rootPart_a28d.billboard.Parent and var_rootPart_a28d.itemBillboard then


                    if GetPlayerRole(player) == "killer" then
                        if var_rootPart_a28d.itemImage.Visible then var_rootPart_a28d.itemImage.Visible = false end
                        continue
                    end

                    local char = player.Character
                    local var_originalValue_4ef4 = nil

                    if char then
                        local var_name_ce17 = char.GetAttribute(char,"EquippedItem") or char.GetAttribute(char,"Equippedltem")
                        if type(var_name_ce17) == "string" then var_originalValue_4ef4 = var_name_ce17
                        elseif typeof(var_name_ce17) == "Instance" then var_originalValue_4ef4 = var_name_ce17.Name end
                    end

                    if not var_originalValue_4ef4 then
                        local var_name_85cf = player.GetAttribute(player,"EquippedItem") or player.GetAttribute(player,"Equippedltem")
                        if type(var_name_85cf) == "string" then var_originalValue_4ef4 = var_name_85cf
                        elseif typeof(var_name_85cf) == "Instance" then var_originalValue_4ef4 = var_name_85cf.Name end
                    end

                    local var_rootPart_dc09 = GetItemAssetId(var_originalValue_4ef4)

                    if var_rootPart_dc09 then
                        if var_rootPart_a28d.itemImage.Image ~= var_rootPart_dc09 then
                            var_rootPart_a28d.itemImage.Image = var_rootPart_dc09
                        end


                        if var_rootPart_f542 and char then
                            local var_rootPart_1a52 = char.FindFirstChild(char,"HumanoidRootPart")
                            if var_rootPart_1a52 then
                                local dist = (var_rootPart_f542.Position - var_rootPart_1a52.Position).Magnitude




                                local size = 1.5 + ((dist / 200) * 2)


                                size = math.clamp(size, 1.5, 3.5)

                                var_rootPart_a28d.itemBillboard.Size = UDim2.new(size, (0.0), size, (0.0))
                            end
                        end


                        var_rootPart_a28d.itemImage.Visible = true
                    else
                        if var_rootPart_a28d.itemImage.Visible then
                            var_rootPart_a28d.itemImage.Visible = false
                        end
                    end
                elseif var_rootPart_a28d and var_rootPart_a28d.itemImage then
                    if var_rootPart_a28d.itemImage.Visible then var_rootPart_a28d.itemImage.Visible = false end
                end
            end
        end)

        local fn_ZombieESPHandler_ff04, GetScpModelRoot, RefreshZombieCache, RefreshScpEsp
        local var_descendant_5977, zombieCacheTime
        do
            local function fn_ZombieESPHelper_c884(name)
                if type(name) ~= "string" or name == "" then return false end
                local var_cachedValue_f951 = name.lower(name)
                if var_cachedValue_f951.find(var_cachedValue_f951,"zombie") then return true end
                if var_cachedValue_f951 == "scp" then return true end
                for var_remoteEvent_5dde = 1, (9.0) do
                    if var_cachedValue_f951 == ("scp" .. var_remoteEvent_5dde) or var_cachedValue_f951.find(var_cachedValue_f951,"^scp%-" .. var_remoteEvent_5dde) then return true end
                end
                return false
            end

            function fn_ZombieESPHandler_ff04(var_child_415e)
                local var_highlight_df32 = State.scpEspObjects[var_child_415e]
                if var_highlight_df32 then
                    if var_highlight_df32.highlight and var_highlight_df32.highlight.Parent then var_highlight_df32.highlight.Destroy(var_highlight_df32.highlight) end
                    if var_highlight_df32.billboard and var_highlight_df32.billboard.Parent then var_highlight_df32.billboard.Destroy(var_highlight_df32.billboard) end
                    State.scpEspObjects[var_child_415e] = nil
                end
            end

            local function fn_ZombieESPHandler_ee01(var_child_415e)
                local var_connection_e4b3 = Instance.new("Highlight")
                var_connection_e4b3.Name = "__BolongScpHl__"
                var_connection_e4b3.Adornee = var_child_415e
                var_connection_e4b3.FillColor = Config.cfg_showName_673f
                var_connection_e4b3.OutlineColor = Config.cfg_showName_673f
                var_connection_e4b3.FillTransparency = 1
                var_connection_e4b3.OutlineTransparency = (0.0)
                var_connection_e4b3.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                var_connection_e4b3.Enabled = true
                var_connection_e4b3.Parent = EnsureESPFolder()

                local billboard = Instance.new("BillboardGui")
                billboard.Name = "__BolongScpBb__"
                billboard.AlwaysOnTop = true
                billboard.Size = UDim2.new(0, 140, (0.0), 18)
                billboard.StudsOffset = Vector3.new(0, 4, 0)
                billboard.MaxDistance = Config.cfg_showOutline_7bb8
                billboard.Parent = EnsureESPFolder()

                local var_backgroundTransparency_dd44 = Instance.new("TextLabel")
                var_backgroundTransparency_dd44.Size = UDim2.new(1, 0, 1, 0)
                var_backgroundTransparency_dd44.BackgroundTransparency = 1
                var_backgroundTransparency_dd44.TextColor3 = Color3.fromRGB(255, 255, 255)
                var_backgroundTransparency_dd44.TextStrokeTransparency = (0.0)
                var_backgroundTransparency_dd44.TextStrokeColor3 = Color3.new(0, (0.0), 0)
                var_backgroundTransparency_dd44.TextSize = 12
                var_backgroundTransparency_dd44.Font = Enum.Font.GothamBold
                var_backgroundTransparency_dd44.Text = Config.cfg_showName_75a4 and "zombie" or ""
                var_backgroundTransparency_dd44.Parent = billboard

                State.scpEspObjects[var_child_415e] = { highlight = var_connection_e4b3, billboard = billboard, label = var_backgroundTransparency_dd44 }
            end

            function GetScpModelRoot(var_child_415e)
                local var_rootPart_186c = var_child_415e.PrimaryPart
                if not var_rootPart_186c then
                    local var_child_ae3b = var_child_415e.FindFirstChild(var_child_415e,"HumanoidRootPart")
                    if var_child_ae3b and var_child_ae3b.IsA(var_child_ae3b,"BasePart") then var_rootPart_186c = var_child_ae3b end
                end
                if not var_rootPart_186c then
                    for _, var_instance_4e7f in ipairs(var_child_415e.GetChildren(var_child_415e)) do
                        if var_instance_4e7f.IsA(var_instance_4e7f,"BasePart") then var_rootPart_186c = var_instance_4e7f break end
                    end
                end
                return var_rootPart_186c
            end

            var_descendant_5977 = {}
            zombieCacheTime = 0

            local function fn_ZombieESPHelper_4c82()
                if State._zombieCacheReady then return end
                State._zombieCacheReady = true
                local var_player_c0cd = {}
                local function fn_ZombieESPHelper_77a2(var_child_415e)
                    if not var_child_415e.IsA(var_child_415e,"Model") then return end
                    if LocalPlayer.Character and var_child_415e == LocalPlayer.Character then return end
                    for _, var_player_7c9d in ipairs(Players.GetPlayers(Players)) do
                        if var_player_7c9d.Character and var_child_415e == var_player_7c9d.Character then return end
                    end
                    if not fn_ZombieESPHelper_c884(var_child_415e.Name) then return end
                    if var_player_c0cd[var_child_415e] then return end
                    var_player_c0cd[var_child_415e] = true
                    table.insert(var_descendant_5977, var_child_415e)
                    if Config.cfg_showName_ff90 and not State.scpEspObjects[var_child_415e] then
                        fn_ZombieESPHandler_ee01(var_child_415e)
                    end
                end
                local function fn_ZombieESPHelper_c330(var_child_415e)
                    if not var_player_c0cd[var_child_415e] then return end
                    var_player_c0cd[var_child_415e] = nil
                    for var_remoteEvent_5dde, var_descendant_b578 in ipairs(var_descendant_5977) do
                        if var_descendant_b578 == var_child_415e then
                            table.remove(var_descendant_5977, var_remoteEvent_5dde)
                            break
                        end
                    end
                    fn_ZombieESPHandler_ff04(var_child_415e)
                end
                WorkspaceService.DescendantAdded.Connect(WorkspaceService.DescendantAdded,fn_ZombieESPHelper_77a2)
                WorkspaceService.DescendantRemoving.Connect(WorkspaceService.DescendantRemoving,fn_ZombieESPHelper_c330)
                local var_player_fb84 = {}
                for _, var_player_7c9d in ipairs(Players.GetPlayers(Players)) do
                    if var_player_7c9d.Character then var_player_fb84[var_player_7c9d.Character] = true end
                end
                for _, var_child_415e in ipairs(workspace.GetDescendants(workspace)) do
                    if var_child_415e.IsA(var_child_415e,"Model") and not var_player_fb84[var_child_415e] and fn_ZombieESPHelper_c884(var_child_415e.Name) then
                        var_player_c0cd[var_child_415e] = true
                        table.insert(var_descendant_5977, var_child_415e)
                    end
                end
                zombieCacheTime = tick()
            end
            function RefreshZombieCache()
                fn_ZombieESPHelper_4c82()
                zombieCacheTime = tick()
            end
            fn_ZombieESPHelper_4c82()

            function RefreshScpEsp()
                if not State.scpEspObjects then return end
                local var_rootPart_95b4 = GetCamPosition()
                local var_connection_546b = {}
                for var_child_415e, var_highlight_df32 in pairs(State.scpEspObjects) do
                    if not var_child_415e or not var_child_415e.Parent then
                        var_connection_546b[#var_connection_546b + 1] = var_child_415e
                    else
                        local var_head_f7e2 = true
                        if var_rootPart_95b4 then
                            local var_rootPart_186c = GetScpModelRoot(var_child_415e)
                            if var_rootPart_186c then
                                var_head_f7e2 = (var_rootPart_186c.Position - var_rootPart_95b4).Magnitude <= Config.cfg_showOutline_7bb8
                            end
                        end
                        if var_highlight_df32.highlight and var_highlight_df32.highlight.Parent then
                            if var_highlight_df32.highlight.FillColor ~= Config.cfg_showName_673f then
                                var_highlight_df32.highlight.FillColor = Config.cfg_showName_673f
                                var_highlight_df32.highlight.OutlineColor = Config.cfg_showName_673f
                            end
                            if var_highlight_df32.highlight.Enabled ~= var_head_f7e2 then var_highlight_df32.highlight.Enabled = var_head_f7e2 end
                        end
                        if var_highlight_df32.billboard then
                            var_highlight_df32.billboard.MaxDistance = Config.cfg_showOutline_7bb8
                            if var_highlight_df32.billboard.Enabled ~= var_head_f7e2 then var_highlight_df32.billboard.Enabled = var_head_f7e2 end
                            if var_highlight_df32.label then
                                local var_unknownValue_0032_e09c = Config.cfg_showName_75a4 and "zombie" or ""
                                if var_highlight_df32.label.Text ~= var_unknownValue_0032_e09c then var_highlight_df32.label.Text = var_unknownValue_0032_e09c end
                            end
                        end
                    end
                end
                for var_remoteEvent_5dde = 1, #var_connection_546b do fn_ZombieESPHandler_ff04(var_connection_546b[var_remoteEvent_5dde]) end
        if (2378%2==0) then local var_unknownValue_0002_26b9=528 else local var_unknownValue_0002_26b9=70 end
            end

            RegisterTask("ScpESP", 0.5, function()
                if not Config.cfg_showName_ff90 then
                    for var_child_415e, _ in pairs(State.scpEspObjects) do fn_ZombieESPHandler_ff04(var_child_415e) end
                    return
                end


                local var_connection_546b = {}
                for var_child_415e, _ in pairs(State.scpEspObjects) do
                    if not var_child_415e or not var_child_415e.Parent then var_connection_546b[#var_connection_546b + 1] = var_child_415e end
                end
                for var_remoteEvent_5dde = 1, #var_connection_546b do fn_ZombieESPHandler_ff04(var_connection_546b[var_remoteEvent_5dde]) end


                for var_remoteEvent_5dde = (1.0), #var_descendant_5977 do
                    local var_child_415e = var_descendant_5977[var_remoteEvent_5dde]
                    if var_child_415e and var_child_415e.Parent and not State.scpEspObjects[var_child_415e] then
                        fn_ZombieESPHandler_ee01(var_child_415e)
                    end
                end

                RefreshScpEsp()
            end)
        end

        local fn_GetHandler_953c
        do

            local function fn_GetHelper_4948()
                if not State.SpeedBoost then return end
                local char = LocalPlayer.Character
                if not char then return end
                local var_humanoid_3937 = char.FindFirstChildOfClass(char,"Humanoid")
                if not var_humanoid_3937 then return end


                if State.safeModeSpeed and (char.GetAttribute(char,"IsHooked") or char.GetAttribute(char,"IsCarried") or var_humanoid_3937.Health <= (50.0)) then
                    return
                end

                if State.safeModeSpeed and (fn_GetHelper_90ff() or IsPlayerDoingAction()) then
                    return
                end


                if State.state_genboostKeybind_a660 and char.GetAttribute(char,"Crouching") then
                    return
                end

                local var_connection_6c2b = fn_ServerHelper_5706()
                if var_connection_6c2b <= 0 then return end
                local var_success_b2e9 = math.clamp(tonumber(State.state_showGenBoostButton_f0c8) or 0.3, (0.0), 2)
                local var_success_9220 = ESP_LAYER_ORDER * var_success_b2e9
                State._jitterFlip = not State._jitterFlip
                local target = State._jitterFlip and (var_connection_6c2b + var_success_9220) or var_connection_6c2b
                if math.abs(var_humanoid_3937.WalkSpeed - target) > 0.1 then
                    pcall(function() var_humanoid_3937.WalkSpeed = target end)
                end
            end


            RegisterTask("SpeedBoost", 0, function()
                fn_GetHelper_4948()
            end)

            function fn_GetHandler_953c(var_rootPart_db85)
                State.SpeedBoost = var_rootPart_db85 and true or false
                local char = LocalPlayer.Character
                local var_humanoid_3937 = char and char.FindFirstChildOfClass(char,"Humanoid")
                if not var_rootPart_db85 then

                    if var_humanoid_3937 then _ApplySpeed(var_humanoid_3937, ESP_LAYER_ORDER) end
                    return
                end

                if var_humanoid_3937 then fn_GetHelper_4948() end
            end


            State.SB_Retarget = function()
                fn_GetHelper_4948()
            end
            State.SB_RefreshAll = function()
                fn_GetHelper_4948()
            end
        end

        do
            local function fn_GetHelper_eb4f(var_connection_a646, pos)
                if not var_connection_a646 or not var_connection_a646.Parent then return false end
                local var_unknownValue_0027_9e29 = var_connection_a646.AbsolutePosition
                local var_unknownValue_0013_70ab = var_connection_a646.AbsoluteSize
                local cx = var_unknownValue_0027_9e29.X + var_unknownValue_0013_70ab.X / 2
                local var_gui_65c5 = var_unknownValue_0027_9e29.Y + var_unknownValue_0013_70ab.Y / (2.0)
                local var_remoteEvent_19f1 = math.min(var_unknownValue_0013_70ab.X, var_unknownValue_0013_70ab.Y) / (2.0) * 0.8
                local dx = pos.X - cx
                local dy = pos.Y - var_gui_65c5
                return (dx*dx + dy*dy) <= (var_remoteEvent_19f1*var_remoteEvent_19f1)
            end

            local function fn_GetHelper_6042(var_connection_a646)
                if not var_connection_a646.IsA(var_connection_a646,"ImageButton") then return end
                if var_connection_a646.Name ~= "Gui-mob" then return end
                if State._hookedMobButtons[var_connection_a646] then return end
                State._hookedMobButtons[var_connection_a646] = true
                UserInputService.InputBegan.Connect(UserInputService.InputBegan,function(input)
                    if input.UserInputType ~= Enum.UserInputType.Touch then return end
                    if not fn_GetHelper_eb4f(var_connection_a646, input.Position) then return end
                    State.var_head_dacf = true
                    local var_connection_90bd
                    var_connection_90bd = UserInputService.InputEnded.Connect(UserInputService.InputEnded,function(ended)
                        if ended == input then
                            State.var_head_dacf = false
                            var_connection_90bd.Disconnect(var_connection_90bd)
                        end
                    end)
                end)
            end



            local var_descendant_b178 = {
                ["Slasher-mob"] = true,
                ["Masked-mob"]  = true,
                ["Hidden-mob"]  = true,
                ["Killer-mob"]  = true,

            }

            local function fn_GetHelper_dc3a(var_connection_a646)
                if not (var_connection_a646 and var_connection_a646.IsA(var_connection_a646,"GuiButton")) then return false end
                if var_connection_a646.Name ~= "attack" then return false end
                local var_connection_9f5c, hasControl = false, false
                local var_player_2e5f = var_connection_a646.Parent
                while var_player_2e5f do

                    if var_descendant_b178[var_player_2e5f.Name] then var_connection_9f5c = true end
                    if var_player_2e5f.Name == "Controls" or var_player_2e5f.Name == "Control" then hasControl = true end
                    var_player_2e5f = var_player_2e5f.Parent
                end
                return var_connection_9f5c and hasControl
            end

            local function fn_GetHelper_cabd(var_connection_a646)
                if State._hookedSlasherButtons[var_connection_a646] then return end
                State._hookedSlasherButtons[var_connection_a646] = true
                var_connection_a646.InputBegan.Connect(var_connection_a646.InputBegan,function(input)
                    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
                        State.var_head_dacf = true
                    end
                end)
                var_connection_a646.InputEnded.Connect(var_connection_a646.InputEnded,function(input)
                    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
                        State.var_head_dacf = false
                    end
                end)
            end

            local function fn_GetHelper_ad07(var_child_a03d)
                local function fn_GetHelper_c1a6(var_child_b411)
                    if not var_child_b411 then return end
                    local var_gui_43ed = var_child_b411.FindFirstChild(var_child_b411,"Gui-mob", true)
                    if var_gui_43ed and var_gui_43ed.IsA(var_gui_43ed,"ImageButton") then fn_GetHelper_6042(var_gui_43ed) end
                    local var_descendant_2feb = var_child_b411.FindFirstChild(var_child_b411,"Control") or var_child_b411.FindFirstChild(var_child_b411,"Controls")
                    if var_descendant_2feb then
                        local function fn_RemoveHandler_79bf(var_child_a03d)
                            for _, var_instance_4e7f in ipairs(var_child_a03d.GetChildren(var_child_a03d)) do
                                if fn_GetHelper_dc3a(var_instance_4e7f) then fn_GetHelper_cabd(var_instance_4e7f) end
                                fn_RemoveHandler_79bf(var_instance_4e7f)
                            end
                        end
                        fn_RemoveHandler_79bf(var_descendant_2feb)
                    end
                end
                for var_descendant_c44b, _ in pairs(var_descendant_b178) do
                    fn_GetHelper_c1a6(var_child_a03d.FindFirstChild(var_child_a03d,var_descendant_c44b))
                end
                var_child_a03d.DescendantAdded.Connect(var_child_a03d.DescendantAdded,function(var_descendant_fe40)
                    if var_descendant_fe40.IsA(var_descendant_fe40,"ImageButton") and var_descendant_fe40.Name == "Gui-mob" then fn_GetHelper_6042(var_descendant_fe40) end
                    if fn_GetHelper_dc3a(var_descendant_fe40) then fn_GetHelper_cabd(var_descendant_fe40) end
                end)
            end

            task.spawn(function()
                local var_descendant_5584 = LocalPlayer.WaitForChild(LocalPlayer,"PlayerGui")
                fn_GetHelper_ad07(var_descendant_5584)
            end)

            UserInputService.InputBegan.Connect(UserInputService.InputBegan,function(input, gameProcessed)
                local isKiller = GetPlayerRole(LocalPlayer) == "killer"

                if isKiller then
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then State.var_head_dacf = true end
                else
                    if not gameProcessed and input.UserInputType == Enum.UserInputType.MouseButton2 then State.var_head_dacf = true end
                end
                if not gameProcessed and input.UserInputType == Enum.UserInputType.Gamepad1 and input.KeyCode == Enum.KeyCode.ButtonL2 then State.var_head_dacf = true end
            end)

            UserInputService.InputEnded.Connect(UserInputService.InputEnded,function(input)

                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then
                    State.var_head_dacf = false
                end
                if input.UserInputType == Enum.UserInputType.Gamepad1 and input.KeyCode == Enum.KeyCode.ButtonL2 then State.var_head_dacf = false end
            end)

            RegisterTask("HoldLock", 0.2, function()
                if not Config.aimLockEnabled then return end
                if State.var_head_dacf then return end
                local char = LocalPlayer.Character
                if char and char.GetAttribute(char,"Aiming") == true then
                    State.var_head_dacf = true
                end
            end)
        end

        local fn_GetHandler_3f25, StopCameralock
        do
        do local var_head_618f=4001%20 end
            local function fn_ZombieESPHelper_2c79(char)
                if not char then return nil end

                if Config.aimLockPart == "Head" then
                    local var_rootPart_6233 = char.FindFirstChild(char,"Head")
                    if var_rootPart_6233 then return var_rootPart_6233.Position end
                end
                local var_rootPart_f070 = char.FindFirstChild(char,"UpperTorso")
                if var_rootPart_f070 then return var_rootPart_f070.Position end
                local var_rootPart_2deb = char.FindFirstChild(char,"Torso")
                if var_rootPart_2deb then return var_rootPart_2deb.Position end
                local var_rootPart_186c = char.FindFirstChild(char,"HumanoidRootPart")
                if var_rootPart_186c then
                    return var_rootPart_186c.Position + (Config.aimLockPart == "Head" and Vector3.new((0.0), 2.5, 0) or Vector3.new(0, 1.2, 0))
                end
                return nil
            end


            local function fn_ZombieESPHelper_f1ad(player, char, var_humanoid_3937)
                if not char or not var_humanoid_3937 or var_humanoid_3937.Health <= 0 then return false end


                if var_humanoid_3937.Health < (50.0) then return false end


                if char.GetAttribute(char,"IsHooked") then return false end
                if char.GetAttribute(char,"IsCarried") then return false end
                if player.GetAttribute(player,"IsHooked") then return false end
                if player.GetAttribute(player,"IsCarried") then return false end


                local var_rootPart_42db = var_humanoid_3937.GetState(var_humanoid_3937)
                if var_rootPart_42db == Enum.HumanoidStateType.PlatformStanding then return false end
                if var_rootPart_42db == Enum.HumanoidStateType.Physics and var_humanoid_3937.PlatformStand then return false end


                local var_rootPart_186c = char.FindFirstChild(char,"HumanoidRootPart")
                if var_rootPart_186c and var_rootPart_186c.Anchored then return false end

                return true
            end

            local function fn_ZombieESPHelper_9ed0(currentTarget)
                local var_player_22b6 = LocalPlayer.Character
                local var_player_503c = var_player_22b6 and var_player_22b6.FindFirstChild(var_player_22b6,"HumanoidRootPart")
                if not var_player_503c then return nil end
                local var_player_ccd1 = var_player_503c.Position
                local var_player_c513 = 0.1
                local var_player_184e = nil
                local var_player_dd74 = Config.aimLockMaxDistance

                if Config.aimLockTargetType == "Zombie" then
                    if currentTarget and typeof(currentTarget) == "Instance" and not currentTarget.IsA(currentTarget,"Player") then
                        local var_rootPart_186c = GetScpModelRoot(currentTarget)
                        if var_rootPart_186c and var_rootPart_186c.IsA(var_rootPart_186c,"BasePart") and currentTarget.Parent then
                            local dist = (var_rootPart_186c.Position - var_player_ccd1).Magnitude
                            if dist <= Config.aimLockMaxDistance then
                                var_player_184e = currentTarget
                                var_player_dd74 = dist - var_player_c513
                            end
                        end
                    end
                    if tick() - zombieCacheTime > 0.5 then RefreshZombieCache() end
                    for var_remoteEvent_5dde = 1, #var_descendant_5977 do
                        local var_child_415e = var_descendant_5977[var_remoteEvent_5dde]
                        if var_child_415e and var_child_415e.Parent then
                            local var_rootPart_186c = GetScpModelRoot(var_child_415e)
                            if var_rootPart_186c and var_rootPart_186c.IsA(var_rootPart_186c,"BasePart") then
                                local dist = (var_rootPart_186c.Position - var_player_ccd1).Magnitude
                                if dist < var_player_dd74 then var_player_dd74 = dist
                                var_player_184e = var_child_415e end
                            end
                        end
                    end
                    return var_player_184e
                end



                if currentTarget and currentTarget.Character then
                    local var_humanoid_203b = currentTarget.Character
                    local var_humanoid_f967 = var_humanoid_203b.FindFirstChildOfClass(var_humanoid_203b,"Humanoid")
                    local var_humanoid_390c = fn_ZombieESPHelper_2c79(var_humanoid_203b)
                    local var_humanoid_a0da = true
                    if Config.aimLockTargetType == "Killer" and GetPlayerRole(currentTarget) ~= "killer" then
                        var_humanoid_a0da = false
                    elseif Config.aimLockTargetType == "Survivor" and GetPlayerRole(currentTarget) ~= "survivor" then
                        var_humanoid_a0da = false
                    end

                    if var_humanoid_a0da and fn_ZombieESPHelper_f1ad(currentTarget, var_humanoid_203b, var_humanoid_f967) and var_humanoid_390c then
                        local var_player_3d71 = (var_humanoid_390c - var_player_ccd1).Magnitude
                        if var_player_3d71 <= Config.aimLockMaxDistance then
                            var_player_184e = currentTarget
                            var_player_dd74 = var_player_3d71 - var_player_c513
                        end
                    end
                end


                for _, player in ipairs(Players.GetPlayers(Players)) do
                    if player == LocalPlayer then continue end
                    local char = player.Character
                    if not char then continue end
                    local var_humanoid_3937 = char.FindFirstChildOfClass(char,"Humanoid")

                    if not fn_ZombieESPHelper_f1ad(player, char, var_humanoid_3937) then continue end

                    local var_humanoid_b188 = fn_ZombieESPHelper_2c79(char)
                    if not var_humanoid_b188 then continue end
                    local var_player_939c = GetPlayerRole(player)
                    if Config.aimLockTargetType == "Killer" and var_player_939c ~= "killer" then continue end
                    if Config.aimLockTargetType == "Survivor" and var_player_939c ~= "survivor" then continue end
                    local dist = (var_humanoid_b188 - var_player_ccd1).Magnitude
                    if dist < var_player_dd74 then var_player_dd74 = dist
                    var_player_184e = player end
                end
                return var_player_184e
            end

            function fn_GetHandler_3f25()
                if State.var_connection_cb5a then State.var_connection_cb5a.Disconnect(State.var_connection_cb5a) end
                State.var_rootPart_e75d = nil
                State.var_rootPart_3ecf = (0.0)
                State.var_rootPart_43ac = nil
                State.var_connection_cb5a = RunService.RenderStepped.Connect(RunService.RenderStepped,function(var_rootPart_6336)
                    if not Config.aimLockEnabled then return end
                    if Config.aimLockMode == "Hold to Lock" and not State.var_head_dacf then
                        State.var_rootPart_e75d = nil
                        State.var_rootPart_43ac = nil
                        return
                    end
                    local var_player_22b6 = LocalPlayer.Character
                    if not var_player_22b6 then return end
                    local var_player_503c = var_player_22b6.FindFirstChild(var_player_22b6,"HumanoidRootPart")
                    if not var_player_503c then return end
                    State.var_rootPart_3ecf = State.var_rootPart_3ecf + var_rootPart_6336
                    if State.var_rootPart_3ecf >= 0.15 then
                        State.var_rootPart_3ecf = 0
                        State.var_rootPart_e75d = fn_ZombieESPHelper_9ed0(State.var_rootPart_e75d)
                    end
                    local target = State.var_rootPart_e75d
                    if not target then State.var_rootPart_43ac = nil
                    return end

                    local var_humanoid_b188
                    if typeof(target) == "Instance" and not target.IsA(target,"Player") then
                        local var_basePart_736f = GetScpModelRoot(target)
                        if not var_basePart_736f or not var_basePart_736f.IsA(var_basePart_736f,"BasePart") or not target.Parent then
                            State.var_rootPart_e75d = nil
                            State.var_rootPart_43ac = nil
                            return
                        end
                        var_humanoid_b188 = var_basePart_736f.Position
                    else
                        local var_humanoid_ab1d = target.Character
                        if not var_humanoid_ab1d then State.var_rootPart_e75d = nil
                        State.var_rootPart_43ac = nil
                        return end
                        local var_humanoid_97f9 = var_humanoid_ab1d.FindFirstChildOfClass(var_humanoid_ab1d,"Humanoid")


                        if not fn_ZombieESPHelper_f1ad(target, var_humanoid_ab1d, var_humanoid_97f9) then
                            State.var_rootPart_e75d = nil
                            State.var_rootPart_43ac = nil
                            return
                        end

                        var_humanoid_b188 = fn_ZombieESPHelper_2c79(var_humanoid_ab1d)
                    end
                    if not var_humanoid_b188 then State.var_rootPart_e75d = nil
                    State.var_rootPart_43ac = nil
                    return end
                    local var_humanoid_23a6 = workspace.CurrentCamera
                    if not var_humanoid_23a6 then return end
                    local var_position_637e = var_humanoid_23a6.CFrame
                    local var_humanoid_c81c = var_position_637e.Position
                    local var_humanoid_1389 = var_position_637e.LookVector
                    local var_humanoid_1258 = Config.aimLockCameraSmoothness
                    local var_vector_2e5d = var_humanoid_b188 - var_humanoid_c81c
                    local var_position_b4c5 = var_vector_2e5d.Magnitude
                    local var_position_9441 = (var_humanoid_b188 - var_player_503c.Position).Magnitude
                    local var_position_e6aa = 4.0
                    local var_position_fe5d
                    if var_position_b4c5 >= var_position_e6aa and var_position_9441 >= 1.5 then
                        var_position_fe5d = var_vector_2e5d.Unit
                        State.var_rootPart_43ac = var_position_fe5d
                    elseif State.var_rootPart_43ac then
                        var_position_fe5d = State.var_rootPart_43ac
                    else
                        var_position_fe5d = var_humanoid_1389
                    end
                    local var_humanoid_b7f7 = var_humanoid_1389.Lerp(var_humanoid_1389,var_position_fe5d, var_humanoid_1258)
                    if var_humanoid_b7f7.Magnitude < 0.001 then return end
                    var_humanoid_23a6.CFrame = CFrame.new(var_humanoid_c81c, var_humanoid_c81c + var_humanoid_b7f7)
                    local var_humanoid_3937 = var_player_22b6.FindFirstChildOfClass(var_player_22b6,"Humanoid")
                    if var_humanoid_3937 and not var_humanoid_3937.AutoRotate then
                        local var_humanoid_5d8e = var_humanoid_23a6.CFrame.LookVector
                        local var_player_ccd1 = var_player_503c.Position
                        local var_vector_391b = Vector3.new(var_humanoid_5d8e.X, 0, var_humanoid_5d8e.Z)
                        if var_vector_391b.Magnitude > 0.001 then
                            local var_vector_b66f = math.atan2(var_player_503c.CFrame.LookVector.X, var_player_503c.CFrame.LookVector.Z)
                            local var_distance_8e18 = math.atan2(var_vector_391b.X, var_vector_391b.Z)
                            local var_cframeOffset_64d3 = var_distance_8e18 - var_vector_b66f
                            var_cframeOffset_64d3 = ((var_cframeOffset_64d3 + math.pi) % ((2.0) * math.pi)) - math.pi
                            local var_vector_aa30 = var_vector_b66f + var_cframeOffset_64d3 * 0.15
                            local var_vector_a2fd = math.sin(var_vector_aa30)
                            local var_connection_254e = math.cos(var_vector_aa30)
                            local var_connection_9b4e = var_player_ccd1 + Vector3.new(var_vector_a2fd, 0, var_connection_254e) * (900.0)
                            var_player_503c.CFrame = CFrame.new(var_player_ccd1, Vector3.new(var_connection_9b4e.X, var_player_ccd1.Y, var_connection_9b4e.Z))
                        end
                    end
                end)
            end

            function StopCameralock()
                if State.var_connection_cb5a then State.var_connection_cb5a.Disconnect(State.var_connection_cb5a)
                State.var_connection_cb5a = nil end
                State.var_rootPart_e75d = nil
                State.var_rootPart_43ac = nil
            end
        end

        local function fn_CameraZoomHandler_47e1(value)
            if State.var_originalValue_1103 == nil then State.var_originalValue_1103 = LocalPlayer.CameraMaxZoomDistance end
            LocalPlayer.CameraMaxZoomDistance = value
        end

        local function fn_CameraZoomHelper_fda4()
            if State.var_originalValue_1103 ~= nil then LocalPlayer.CameraMaxZoomDistance = State.var_originalValue_1103 end
            State.var_originalValue_1103 = nil
        end

        local function fn_CameraZoomHelper_66f1(char)
            if not char then return nil end
            local var_success_abb9, var_connection_8a01 = pcall(function() return char.FindFirstChild(char,"SmoothCamera") end)
            if var_success_abb9 and var_connection_8a01 then return var_connection_8a01 end
            return nil
        end

        local function fn_CameraZoomHelper_8538(value)
            local var_connection_8a01 = fn_CameraZoomHelper_66f1(LocalPlayer.Character)
            if not var_connection_8a01 then return false end
            if State.origCamStiffness == nil then
                local cur = 8
                pcall(function() cur = var_connection_8a01.GetAttribute(var_connection_8a01,"CameraStiffness") or 8 end)
                State.origCamStiffness = cur
            end
            pcall(function() var_connection_8a01.SetAttribute(var_connection_8a01,"CameraStiffness", value) end)
            return true
        end

        local function fn_CameraZoomHandler_732a()
            if State.origCamStiffness ~= nil then
                local var_connection_8a01 = fn_CameraZoomHelper_66f1(LocalPlayer.Character)
                if var_connection_8a01 then pcall(function() var_connection_8a01.SetAttribute(var_connection_8a01,"CameraStiffness", State.origCamStiffness) end) end
            end
            State.origCamStiffness = nil
        end

        do


            LocalPlayer.CharacterAdded.Connect(LocalPlayer.CharacterAdded,function(char)
                task.spawn(function()
                    task.wait(1)
                    if Config.cfg_showPerformanceWindow_3f44 and LocalPlayer.Character == char then
                        fn_CameraZoomHelper_8538(Config.cfg_showSpectatorCounter_d192)
                    end
                end)
            end)

            RegisterTask("CamStiffness", 0.5, function()
                if not Config.cfg_showPerformanceWindow_3f44 then return end
                local var_connection_8a01 = fn_CameraZoomHelper_66f1(LocalPlayer.Character)
                if not var_connection_8a01 then return end
                local var_success_9b60, cur = pcall(function() return var_connection_8a01.GetAttribute(var_connection_8a01,"CameraStiffness") end)
                if var_success_9b60 and cur ~= Config.cfg_showSpectatorCounter_d192 then
                    pcall(function() var_connection_8a01.SetAttribute(var_connection_8a01,"CameraStiffness", Config.cfg_showSpectatorCounter_d192) end)
                end
            end)
        end

        local function fn_CameraZoomHelper_18c6(value)
            local var_rootPart_2947 = workspace.CurrentCamera
            if not var_rootPart_2947 then return end
            if State.var_distance_b26a == nil then State.var_distance_b26a = var_rootPart_2947.FieldOfView end
            var_rootPart_2947.FieldOfView = value
        end

        local function fn_CameraZoomHandler_5aab()
            local var_rootPart_2947 = workspace.CurrentCamera
            if var_rootPart_2947 and State.var_distance_b26a then var_rootPart_2947.FieldOfView = State.var_distance_b26a end
            State.var_distance_b26a = nil
        end

        do
            LocalPlayer:GetPropertyChangedSignal("CameraMaxZoomDistance"):Connect(function()
                if Config.cfg_enableKillerWarn_fa0d and LocalPlayer.CameraMaxZoomDistance ~= Config.cameraZoomValue then
                    LocalPlayer.CameraMaxZoomDistance = Config.cameraZoomValue
                end
            end)

            local function fn_GetHelper_7248()
                local var_rootPart_2947 = workspace.CurrentCamera
                if not var_rootPart_2947 then return end
                var_rootPart_2947:GetPropertyChangedSignal("FieldOfView"):Connect(function()
                    if Config.cfg_showName_9982 and var_rootPart_2947.FieldOfView ~= Config.cfg_showName_8138 then
                        var_rootPart_2947.FieldOfView = Config.cfg_showName_8138
                    end
                end)
            end
            fn_GetHelper_7248()
        end

        local var_position_78f1 = { m = 1, n = 1 }
        local function fn_GetHandler_4e74()
            pcall(function() RunService.UnbindFromRenderStep(RunService,"BOLONG_Aspect") end)
            var_position_78f1.m, var_position_78f1.n = 1, 1
        end
        do local var_success_58c9=3209%61 end

        local function fn_PredictionHandler_91ee()
            fn_GetHandler_4e74()
            var_position_78f1.m, var_position_78f1.n = 1, 1
            pcall(function()
                RunService.UnbindFromRenderStep(RunService,"BOLONG_Aspect")
                RunService.BindToRenderStep(RunService,"BOLONG_Aspect", Enum.RenderPriority.Camera.Value + 2, function(var_rootPart_6336)
                    if not Config.cfg_maxCameraZoom_a6e2 then return end
                    local var_rootPart_2947 = workspace.CurrentCamera
                    if not var_rootPart_2947 then return end
                    local var_viewportSize_4944 = var_rootPart_2947.ViewportSize
                    if var_viewportSize_4944.Y < 1 then return end
                    local var_viewportSize_8308 = var_viewportSize_4944.X / var_viewportSize_4944.Y
                    local var_viewportSize_3f18 = tonumber(Config.cfg_stiffness_28c2) or 1.777777777778
                    local m, n = 1, 1
                    if math.abs(var_viewportSize_3f18 - var_viewportSize_8308) > 0.03 then
                        if var_viewportSize_3f18 < var_viewportSize_8308 then
                            m = 1
                            n = math.clamp(var_viewportSize_3f18 / var_viewportSize_8308, 0.1, 1)
                        else
                            m = math.clamp(var_viewportSize_8308 / var_viewportSize_3f18, 0.1, 1)
                            n = (1.0)
                        end
                    end

                    local var_unknownValue_0060_6927 = math.clamp(var_rootPart_6336 or 0.0167, 0.0005, 0.1)
                    local var_child_5b0e = math.clamp((1.0) - math.exp((-12.0) * var_unknownValue_0060_6927), 0.001, 1)
                    var_position_78f1.m = var_position_78f1.m + (m - var_position_78f1.m) * var_child_5b0e
                    var_position_78f1.n = var_position_78f1.n + (n - var_position_78f1.n) * var_child_5b0e
                    if math.abs(var_position_78f1.m - 1) < 0.002 and math.abs(var_position_78f1.n - (1.0)) < 0.002 then
                        var_position_78f1.m, var_position_78f1.n = (1.0), 1
                        return
                    end
                    local var_connection_d9f3 = var_rootPart_2947.CFrame
                    local var_player_2e5f = var_connection_d9f3.Position
                    if var_player_2e5f.X ~= var_player_2e5f.X or var_player_2e5f.Y ~= var_player_2e5f.Y or var_player_2e5f.Z ~= var_player_2e5f.Z then return end
                    if var_connection_d9f3.RightVector.Magnitude < 0.01 or var_connection_d9f3.UpVector.Magnitude < 0.01 then return end
                    local var_success_ca3f = CFrame.fromMatrix(var_player_2e5f, var_connection_d9f3.RightVector.Unit, var_connection_d9f3.UpVector.Unit)
                    var_rootPart_2947.CFrame = var_success_ca3f * CFrame.new(0, 0, 0, var_position_78f1.m, 0, (0.0), 0, var_position_78f1.n, 0, (0.0), 0, 1)
                end)
            end)
        end

        local function fn_PredictionHandler_333b()

            if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
                return
            end


            State.var_connection_a95a = UserInputService.MouseIconEnabled
            State.var_connection_640a   = UserInputService.MouseBehavior


            UserInputService.MouseIconEnabled = true
            UserInputService.MouseBehavior     = Enum.MouseBehavior.Default


            if State.var_connection_e47c then State.var_connection_e47c.Disconnect(State.var_connection_e47c) end
            if State.var_connection_1cb6 then State.var_connection_1cb6.Disconnect(State.var_connection_1cb6) end


            State.var_connection_e47c = UserInputService:GetPropertyChangedSignal("MouseIconEnabled"):Connect(function()
                if Config.cfg_stretchedRes_63a4 and not UserInputService.MouseIconEnabled then
                    UserInputService.MouseIconEnabled = true
                end
            end)

            State.var_connection_1cb6 = UserInputService:GetPropertyChangedSignal("MouseBehavior"):Connect(function()
                if Config.cfg_stretchedRes_63a4 and UserInputService.MouseBehavior == Enum.MouseBehavior.LockCenter then
                    UserInputService.MouseBehavior = Enum.MouseBehavior.Default
                end
            end)
        end

        local function fn_PredictionHandler_dee4()

            if State.var_connection_e47c then
                State.var_connection_e47c.Disconnect(State.var_connection_e47c)
                State.var_connection_e47c = nil
            end
            if State.var_connection_1cb6 then
                State.var_connection_1cb6.Disconnect(State.var_connection_1cb6)
                State.var_connection_1cb6 = nil
            end

            if State.var_connection_a95a ~= nil then
                UserInputService.MouseIconEnabled = State.var_connection_a95a
                State.var_connection_a95a = nil
            end
            if State.var_connection_640a ~= nil then
                UserInputService.MouseBehavior = State.var_connection_640a
                State.var_connection_640a = nil
            end
        end

        local fn_PredictionHandler_5b46, StopPerfMonitor, StartPrediction, StopPrediction
        do
            local function fn_ServerHandler_32b0()
                local var_uiCorner_5af2 = Instance.new("ScreenGui")
                var_uiCorner_5af2.Name = "BolongPerfMon"
                var_uiCorner_5af2.ResetOnSpawn = false
                var_uiCorner_5af2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                var_uiCorner_5af2.IgnoreGuiInset = false
                var_uiCorner_5af2.Parent = PlayerGui
                local var_child_cd9f = Instance.new("Frame")
                var_child_cd9f.Name = "PerfFrame"
                var_child_cd9f.Size = UDim2.fromOffset(160, 28)
                var_child_cd9f.AnchorPoint = Vector2.new(1, 0)
                var_child_cd9f.Position = UDim2.new(1, -10, 0, (10.0))
                var_child_cd9f.BackgroundColor3 = Color3.fromRGB(10, 10, (14.0))
                var_child_cd9f.BorderSizePixel = 0
                var_child_cd9f.Active = true
                var_child_cd9f.Parent = var_uiCorner_5af2
                local var_uiCorner_2ff8 = Instance.new("UICorner")
                var_uiCorner_2ff8.CornerRadius = UDim.new(0, 8)
                var_uiCorner_2ff8.Parent = var_child_cd9f
                local var_uiCorner_5a7b = Instance.new("UIStroke")
                var_uiCorner_5a7b.Color = Color3.fromRGB(60, 60, 75)
                var_uiCorner_5a7b.Thickness = 1
                var_uiCorner_5a7b.Parent = var_child_cd9f
                local infoLabel = Instance.new("TextLabel")
                infoLabel.Name = "InfoLabel"
                infoLabel.Size = UDim2.new(1, 0, 1, (0.0))
                infoLabel.BackgroundTransparency = 1
                infoLabel.Text = "FPS - | PING -"
                infoLabel.TextColor3 = Color3.fromRGB(200, (200.0), 210)
                infoLabel.TextSize = (12.0)
                infoLabel.Font = Enum.Font.GothamBold
                infoLabel.TextXAlignment = Enum.TextXAlignment.Center
                infoLabel.TextYAlignment = Enum.TextYAlignment.Center
                infoLabel.RichText = true
                infoLabel.Parent = var_child_cd9f
                local var_connection_1eea, var_connection_94c7, var_viewportSize_a48c
                var_child_cd9f.InputBegan.Connect(var_child_cd9f.InputBegan,function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        var_connection_1eea = true
                        var_connection_94c7 = input.Position
                        var_viewportSize_a48c = var_child_cd9f.Position
                    end
                end)
                var_child_cd9f.InputEnded.Connect(var_child_cd9f.InputEnded,function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        var_connection_1eea = false
                    end
                end)
                UserInputService.InputChanged.Connect(UserInputService.InputChanged,function(input)
                    if var_connection_1eea and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                        local var_vector_d809 = input.Position - var_connection_94c7
                        var_child_cd9f.Position = UDim2.new(1, var_viewportSize_a48c.X.Offset + var_vector_d809.X, 0, var_viewportSize_a48c.Y.Offset + var_vector_d809.Y)
                    end
                end)
                return var_uiCorner_5af2, infoLabel
            end

            RegisterTask("PerfMonitor", 0.5, function()
                if not State.var_originalValue_ddfb then return end
                local var_unknownValue_0065_6b05 = math.floor(State.var_unknownValue_0001_6fb8 / math.max(State.var_unknownValue_0053_6355, 0.001))
                local ping = math.floor(Stats.Network.ServerStatsItem["Data Ping"].GetValue(Stats.Network.ServerStatsItem["Data Ping"]))
                local var_unknownValue_0024_4872 = var_unknownValue_0065_6b05 >= 50 and "rgb(80,220,100)" or var_unknownValue_0065_6b05 >= (30.0) and "rgb(255,200,60)" or "rgb(255,70,70)"
                local var_unknownValue_0031_16cb = ping <= 80 and "rgb(80,220,100)" or ping <= 150 and "rgb(255,200,60)" or "rgb(255,70,70)"
                if State.var_name_d998 and State.var_name_d998.Parent then
                    local label = State.var_name_d998:FindFirstChild("PerfFrame"):FindFirstChild("InfoLabel")
                    if label then
                        label.Text = string.format("<font color=\"%s\">FPS %d</font> <font color=\"rgb(60,60,75)\">|</font> <font color=\"%s\">PING %d</font>", var_unknownValue_0024_4872, var_unknownValue_0065_6b05, var_unknownValue_0031_16cb, ping)
                    end
                end
                State.var_unknownValue_0053_6355 = (0.0)
                State.var_unknownValue_0001_6fb8 = 0
            end)

            RegisterTask("PerfCounter", 0, function(var_rootPart_6336)
                if State.var_originalValue_ddfb then
                    State.var_unknownValue_0001_6fb8 = State.var_unknownValue_0001_6fb8 + 1
                    State.var_unknownValue_0053_6355 = State.var_unknownValue_0053_6355 + var_rootPart_6336
                end
            end)

            function fn_PredictionHandler_5b46()
                if State.var_name_d998 then State.var_name_d998.Destroy(State.var_name_d998) end
                local var_uiCorner_5af2, infoLabel = fn_ServerHandler_32b0()
                State.var_name_d998 = var_uiCorner_5af2
                State.var_originalValue_ddfb = true
                State.var_unknownValue_0053_6355 = 0
                State.var_unknownValue_0001_6fb8 = 0
            end

            function StopPerfMonitor()
                State.var_originalValue_ddfb = false
        do local var_name_f993=602%83 end
                if State.var_name_d998 then State.var_name_d998.Destroy(State.var_name_d998)
                State.var_name_d998 = nil end
            end




            local function fn_PredictionHelper_cf2a(var_instance_5397, name)
                if not var_instance_5397 then return nil end
                local var_attributeValue_a33a = var_instance_5397.GetAttribute(var_instance_5397,name)
                if var_attributeValue_a33a ~= nil then return var_attributeValue_a33a end
                local var_instance_4e7f = var_instance_5397.FindFirstChild(var_instance_5397,name)
                if var_instance_4e7f then
                    local var_success_df6d, val = pcall(function() return var_instance_4e7f.Value end)
                    if var_success_df6d then return val end
                end
                return nil
            end

            local function fn_PredictionHandler_8b39()
                local var_uiCorner_5af2 = Instance.new("ScreenGui")
                var_uiCorner_5af2.Name = "BolongPrediction"
                var_uiCorner_5af2.ResetOnSpawn = false
                var_uiCorner_5af2.IgnoreGuiInset = true
                var_uiCorner_5af2.DisplayOrder = 9999999
                var_uiCorner_5af2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

                local var_playerGui_9812 = nil
                pcall(function() var_playerGui_9812 = gethui() end)
                if not var_playerGui_9812 then
        do local var_playerGui_eda7=4646%26 end
                    pcall(function() var_playerGui_9812 = game.GetService(game,"CoreGui") end)
                end
                if not var_playerGui_9812 then
                    var_playerGui_9812 = PlayerGui
                end
                var_uiCorner_5af2.Parent = var_playerGui_9812

                local infoLabel = Instance.new("TextLabel")
                infoLabel.Name = "InfoLabel"
                infoLabel.AnchorPoint = Vector2.new(0.5, 0)


                if State.var_backgroundTransparency_3fa4 then
                    infoLabel.Position = State.var_backgroundTransparency_3fa4
                else
                    infoLabel.Position = UDim2.new(0.5, (0.0), 0, (50.0))
                end

                infoLabel.BackgroundTransparency = 1
                infoLabel.AutomaticSize = Enum.AutomaticSize.XY
                infoLabel.Text = "Map: - | Killer: -"
                infoLabel.TextColor3 = Color3.fromRGB(252, 235, 229)
                infoLabel.TextSize = 14
                infoLabel.Font = Enum.Font.GothamBold
                infoLabel.TextXAlignment = Enum.TextXAlignment.Center
                infoLabel.TextYAlignment = Enum.TextYAlignment.Center
                infoLabel.RichText = true
                infoLabel.Active = true
                infoLabel.Parent = var_uiCorner_5af2

                local var_uiCorner_5a7b = Instance.new("UIStroke")
                var_uiCorner_5a7b.Name = "Outline"
                var_uiCorner_5a7b.Color = Color3.new(0, 0, (0.0))
                var_uiCorner_5a7b.Thickness = 1
                var_uiCorner_5a7b.Transparency = 0.2
                var_uiCorner_5a7b.Parent = infoLabel

                local var_connection_1eea = false
                local var_connection_94c7 = Vector2.new()
                local var_viewportSize_a48c = UDim2.new()

                infoLabel.InputBegan.Connect(infoLabel.InputBegan,function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        var_connection_1eea = true
                        var_connection_94c7 = input.Position
                        var_viewportSize_a48c = infoLabel.Position
                    end
                end)

                infoLabel.InputEnded.Connect(infoLabel.InputEnded,function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        var_connection_1eea = false
                    end
                end)

                UserInputService.InputChanged.Connect(UserInputService.InputChanged,function(input)
                    if var_connection_1eea and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                        local var_vector_d809 = input.Position - var_connection_94c7
                        local var_position_8595 = UDim2.new(
                            var_viewportSize_a48c.X.Scale, var_viewportSize_a48c.X.Offset + var_vector_d809.X,
                            var_viewportSize_a48c.Y.Scale, var_viewportSize_a48c.Y.Offset + var_vector_d809.Y
                        )
                        infoLabel.Position = var_position_8595
                        State.var_backgroundTransparency_3fa4 = var_position_8595
                    end
                end)

                return var_uiCorner_5af2, infoLabel
            end

            local function fn_PredictionHelper_db8b()
                if State.var_remoteEvent_cd2c then return end
                task.spawn(function()
                    local var_success_abb9, remote = pcall(function()
                        return ReplicatedStorage:WaitForChild("Remotes", 10)
                            :WaitForChild("Messages", 10)
                            :WaitForChild("Mapinfo", (10.0))
                    end)
                    if var_success_abb9 and remote and remote.IsA(remote,"RemoteEvent") then
                        State.var_remoteEvent_cd2c = remote.OnClientEvent.Connect(remote.OnClientEvent,function(mapName, mapId)
                            if type(mapName) == "string" and mapName ~= "" then
                                State.var_buffer_511f = mapName
                            end
                        end)
                    end
                end)
            end

            RegisterTask("PredictionMonitor", 1, function()
                if not State.var_connection_cb0c then return end


                if not State.var_player_e1db or not State.var_player_e1db.Parent then
                    if State.var_player_e1db then State.var_player_e1db.Destroy(State.var_player_e1db) end
                    local var_uiCorner_5af2, infoLabel = fn_PredictionHandler_8b39()
                    State.var_player_e1db = var_uiCorner_5af2
                    State.var_player_6e04 = infoLabel
                end

                local infoLabel = State.var_player_e1db.FindFirstChild(State.var_player_e1db,"InfoLabel")
                if not infoLabel then return end


                local var_player_60da = Players.GetPlayers(Players)

                table.sort(var_player_60da, function(var_rootPart_4e4c, var_rootPart_b34c)
                    local var_player_ba70 = fn_PredictionHelper_cf2a(var_rootPart_4e4c, "AllowKiller")
                    local var_player_54e8 = fn_PredictionHelper_cf2a(var_rootPart_b34c, "AllowKiller")

                    local var_unknownValue_0030_389c = (var_player_ba70 == false)
                    local var_unknownValue_0067_a7a4 = (var_player_54e8 == false)

                    if var_unknownValue_0030_389c ~= var_unknownValue_0067_a7a4 then
                        return not var_unknownValue_0030_389c
                    end

                    if not var_unknownValue_0030_389c and not var_unknownValue_0067_a7a4 then
                        return (fn_PredictionHelper_cf2a(var_rootPart_4e4c, "KillerChance") or 0) > (fn_PredictionHelper_cf2a(var_rootPart_b34c, "KillerChance") or 0)
                    end

                    return (fn_PredictionHelper_cf2a(var_rootPart_4e4c, "KillerChance") or 0) < (fn_PredictionHelper_cf2a(var_rootPart_b34c, "KillerChance") or 0)
                end)

                local var_selectedKiller_dc68 = var_player_60da[1]
                local var_selectedKiller_4bc3 = "<font color=\"rgb(100,110,130)\">-</font>"

                if var_selectedKiller_dc68 then
                    local name = var_selectedKiller_dc68.Name
                    local var_selectedKiller_394d = fn_PredictionHelper_cf2a(var_selectedKiller_dc68, "SelectedKiller")
                    local var_selectedKiller_a71d    = fn_PredictionHelper_cf2a(var_selectedKiller_dc68, "AllowKiller")

                    if var_selectedKiller_dc68 == LocalPlayer then
                        name = "YOU"
                    end

                    local var_buffer_1666
                    if var_selectedKiller_a71d == false then
                        var_buffer_1666 = "rgb(255,0,30)"
                    else
                        var_buffer_1666 = "rgb(252,235,229)"
                    end

                    if var_selectedKiller_394d and type(var_selectedKiller_394d) == "string" and var_selectedKiller_394d ~= "" then
                        var_selectedKiller_4bc3 = string.format(
                            "<font color=\"%s\">%s</font> <font color=\"rgb(255,0,30)\">(%s)</font>",
                            var_buffer_1666, name, var_selectedKiller_394d
                        )
                    else
                        var_selectedKiller_4bc3 = string.format(
                            "<font color=\"%s\">%s</font>",
                            var_buffer_1666, name
                        )
                    end
                end


                local var_buffer_bd55 = State.var_buffer_511f or "-"
                infoLabel.Text = string.format(
                    (function() if var_section_a5d6 and buffer then local _bf=buffer.create(169) local _by={60,102,111,110,116,32,99,111,108,111,114,61,34,114,103,98,40,50,53,53,44,50,49,48,44,54,48,41,34,62,77,97,112,58,60,47,102,111,110,116,62,32,60,102,111,110,116,32,99,111,108,111,114,61,34,114,103,98,40,50,53,50,44,50,51,53,44,50,50,57,41,34,62,37,115,60,47,102,111,110,116,62,32,32,60,102,111,110,116,32,99,111,108,111,114,61,34,114,103,98,40,56,48,44,56,48,44,56,53,41,34,62,124,60,47,102,111,110,116,62,32,32,60,102,111,110,116,32,99,111,108,111,114,61,34,114,103,98,40,50,53,53,44,50,49,48,44,54,48,41,34,62,75,105,108,108,101,114,58,60,47,102,111,110,116,62,32,37,115} for _i=1,#_by do buffer.writeu8(_bf,_i-1,_by[_i]) end local _s={} for _i=1,#_by do _s[_i]=string.char(buffer.readu8(_bf,_i-1)) end return table.concat(_s) else local _by={60,102,111,110,116,32,99,111,108,111,114,61,34,114,103,98,40,50,53,53,44,50,49,48,44,54,48,41,34,62,77,97,112,58,60,47,102,111,110,116,62,32,60,102,111,110,116,32,99,111,108,111,114,61,34,114,103,98,40,50,53,50,44,50,51,53,44,50,50,57,41,34,62,37,115,60,47,102,111,110,116,62,32,32,60,102,111,110,116,32,99,111,108,111,114,61,34,114,103,98,40,56,48,44,56,48,44,56,53,41,34,62,124,60,47,102,111,110,116,62,32,32,60,102,111,110,116,32,99,111,108,111,114,61,34,114,103,98,40,50,53,53,44,50,49,48,44,54,48,41,34,62,75,105,108,108,101,114,58,60,47,102,111,110,116,62,32,37,115} local _s={} for _i=1,#_by do _s[_i]=string.char(_by[_i]) end return table.concat(_s) end end)(),
                    var_buffer_bd55, var_selectedKiller_4bc3
                )
            end)

            function StartPrediction()
                if State.var_player_e1db then State.var_player_e1db.Destroy(State.var_player_e1db) end
                State.var_buffer_511f = nil
                fn_PredictionHelper_db8b()

                local var_uiCorner_5af2, infoLabel = fn_PredictionHandler_8b39()
                State.var_player_e1db = var_uiCorner_5af2
                State.var_player_6e04 = infoLabel
                State.var_connection_cb0c = true
            end

            function StopPrediction()
                State.var_connection_cb0c = false
        do local var_connection_e4c9=6649%17 end
        if false then local var_connection_5a33=583 end
                if State.var_remoteEvent_cd2c then
                    pcall(function() State.var_remoteEvent_cd2c.Disconnect(State.var_remoteEvent_cd2c) end)
                    State.var_remoteEvent_cd2c = nil
                end
                if State.var_player_e1db then
                    State.var_player_e1db.Destroy(State.var_player_e1db)
                    State.var_player_e1db = nil
                end
            end
        end

        local fn_CrosshairHelper_810c, StopSpectatorCount
        do
            local var_basePart_11b4 = 0.001
            local var_player_4840 = (2.0)
            local var_head_9d49 = {
                "Head",
                "Torso", "UpperTorso", "LowerTorso",
                "Left Arm", "Right Arm", "Left Leg", "Right Leg",
                "LeftUpperArm", "LeftLowerArm", "LeftHand",
                "RightUpperArm", "RightLowerArm", "RightHand",
                "LeftUpperLeg", "RightUpperLeg", "LeftFoot", "RightFoot",
            }

            local var_player_4654 = State.specConns
            local var_userId_37c8 = State.specDetected
            local var_player_2e22 = State.specStreamTimes

            local function fn_GetHandler_a095(detectedKiller)
                local var_connection_d9f3 = var_player_4654[detectedKiller]
                if var_connection_d9f3 then
                    pcall(function() var_connection_d9f3.Disconnect(var_connection_d9f3) end)
                    var_player_4654[detectedKiller] = nil
                end
            end

            local function fn_GetHandler_4f6f(var_basePart_9b20)
                for detectedKiller in next, var_player_4654 do
                    if detectedKiller.sub(detectedKiller,1, #var_basePart_9b20) == var_basePart_9b20 then
                        local var_connection_d9f3 = var_player_4654[detectedKiller]
                        pcall(function() var_connection_d9f3.Disconnect(var_connection_d9f3) end)
                        var_player_4654[detectedKiller] = nil
                    end
                end
            end

            local function fn_GetHandler_3aba(char)
                for _, name in ipairs(var_head_9d49) do
                    local part = char.FindFirstChild(char,name)
                    if part and part.IsA(part,"BasePart") then
                        local t = part.Transparency
                        local var_basePart_18b7 = part.LocalTransparencyModifier
                        if t > var_basePart_11b4 or var_basePart_18b7 > var_basePart_11b4 then
                            return part, t, var_basePart_18b7
                        end
                    end
                end
            end

            local function fn_GetHandler_7f45()
                local var_endScreen_3842 = 0
                for var_userId_889e, var_vector_6d30 in next, var_userId_37c8 do
                    if var_vector_6d30.Player and var_vector_6d30.Player.Parent == Players then
                        var_endScreen_3842 = var_endScreen_3842 + (1.0)
                    else
                        var_userId_37c8[var_userId_889e] = nil
                    end
                end
                return var_endScreen_3842
            end

            local function fn_GetHelper_8a94()
                if not State.var_player_5f10 or not State.var_player_5f10.Parent then return end
                local var_endScreen_3842 = fn_GetHandler_7f45()
                local label = State.var_player_5f10.FindFirstChild(State.var_player_5f10,"SpecFrame") and State.var_player_5f10.SpecFrame.FindFirstChild(State.var_player_5f10.SpecFrame,"InfoLabel")
                if label then
                    local var_userId_b6b5 = var_endScreen_3842 > 0 and "rgb(80,220,100)" or "rgb(150,150,165)"
                    label.Text = string.format("<font color=\"%s\">SPECTATORS %d</font>", var_userId_b6b5, var_endScreen_3842)
                end
            end

            local function fn_GetHelper_bd6a(player)
                if not State.var_player_edbf or not player or player == LocalPlayer then return end

                local var_userId_889e = player.UserId
                local char = player.Character

                if not char then
                    if var_userId_37c8[var_userId_889e] then
                        var_userId_37c8[var_userId_889e] = nil
                        fn_GetHelper_8a94()
                    end
                    return
                end

                local part, t, var_basePart_18b7 = fn_GetHandler_3aba(char)

                if part then
                    if not var_userId_37c8[var_userId_889e] then
                        var_userId_37c8[var_userId_889e] = { Player = player, Part = part, T = t, var_name_5f26 = var_basePart_18b7 }
                        fn_GetHelper_8a94()
                    else
                        local var_distance_8193 = var_userId_37c8[var_userId_889e]
                        var_distance_8193.Part, var_distance_8193.T, var_distance_8193.var_name_5f26 = part, t, var_basePart_18b7
                    end
                elseif var_userId_37c8[var_userId_889e] then
                    var_userId_37c8[var_userId_889e] = nil
                    fn_GetHelper_8a94()
                end
            end

            local function fn_ResetHandler_aef3(player, part, name)
                local var_basePart_9b20 = "char_" .. player.UserId .. "_" .. name
                var_player_4654[var_basePart_9b20 .. "_T"] = part:GetPropertyChangedSignal("Transparency")
                    :Connect(function() fn_GetHelper_bd6a(player) end)
                var_player_4654[var_basePart_9b20 .. "_LT"] = part:GetPropertyChangedSignal("LocalTransparencyModifier")
                    :Connect(function() fn_GetHelper_bd6a(player) end)
            end

            local function fn_ResetHelper_3189(player, char)
                if player == LocalPlayer or not char then return end

                local var_basePart_9b20 = "char_" .. player.UserId .. "_"
                fn_GetHandler_4f6f(var_basePart_9b20)

                for _, name in ipairs(var_head_9d49) do
                    local part = char.FindFirstChild(char,name)
                    if part and part.IsA(part,"BasePart") then
                        fn_ResetHandler_aef3(player, part, name)
                    end
                end

                var_player_4654[var_basePart_9b20 .. "added"] = char.ChildAdded.Connect(char.ChildAdded,function(var_instance_5397)
                    if not var_instance_5397.IsA(var_instance_5397,"BasePart") then return end
                    for _, name in ipairs(var_head_9d49) do
                        if var_instance_5397.Name == name then
                            fn_ResetHandler_aef3(player, var_instance_5397, name)
                            task.defer(function() fn_GetHelper_bd6a(player) end)
                            break
                        end
                    end
                end)

                task.defer(function() fn_GetHelper_bd6a(player) end)
            end

            local function fn_ResetHelper_4609(player)
                if player == LocalPlayer then return end

                local var_userId_889e = player.UserId
                fn_GetHandler_a095("player_" .. var_userId_889e)

                var_player_4654["player_" .. var_userId_889e] = player.CharacterAdded.Connect(player.CharacterAdded,function(char)
                    var_userId_37c8[var_userId_889e] = nil
                    fn_GetHelper_8a94()
                    task.wait(0.15)
                    if State.var_player_edbf then fn_ResetHelper_3189(player, char) end
                end)

                if player.Character then
                    fn_ResetHelper_3189(player, player.Character)
                end
            end

            local function fn_ResetHelper_9248(player)
                if not player then return end
                local var_userId_889e = player.UserId
                fn_GetHandler_a095("player_" .. var_userId_889e)
                fn_GetHandler_4f6f("char_" .. var_userId_889e .. "_")
                var_userId_37c8[var_userId_889e] = nil
                var_player_2e22[var_userId_889e] = nil
                fn_GetHelper_8a94()
            end

            local function fn_ResetHelper_1cbe(player)
                if not State.var_player_edbf or not player or player == LocalPlayer then return end
                local char = player.Character
                local var_rootPart_186c = char and (
                    char.FindFirstChild(char,"HumanoidRootPart") or
                    char.FindFirstChild(char,"Torso")
                )
                if not var_rootPart_186c or not var_rootPart_186c.IsA(var_rootPart_186c,"BasePart") then return end

                local var_userId_889e = player.UserId
                local var_now_2834 = os.clock()
                if var_player_2e22[var_userId_889e] and var_now_2834 - var_player_2e22[var_userId_889e] < var_player_4840 then return end

                var_player_2e22[var_userId_889e] = var_now_2834
                task.spawn(function()
                    pcall(function()
                        LocalPlayer.RequestStreamAroundAsync(LocalPlayer,var_rootPart_186c.Position, var_player_4840)
                    end)
                end)
            end

            local var_player_add7 = 0

            RegisterTask("SpectatorCount", 0.25, function(var_rootPart_6336)
                if not State.var_player_edbf then return end
                local var_player_441f = Players.GetPlayers(Players)
                for _, var_player_2e5f in ipairs(var_player_441f) do
                    if var_player_2e5f ~= LocalPlayer then fn_GetHelper_bd6a(var_player_2e5f) end
                end
                var_player_add7 = var_player_add7 + var_rootPart_6336
                if var_player_add7 >= var_player_4840 then
                    var_player_add7 = (0.0)
                    for _, var_player_2e5f in ipairs(var_player_441f) do
                        if var_player_2e5f ~= LocalPlayer then fn_ResetHelper_1cbe(var_player_2e5f) end
                    end
                end
                fn_GetHelper_8a94()
            end)

            local function fn_ResetHandler_f2a1()
                local var_uiCorner_5af2 = Instance.new("ScreenGui")
                var_uiCorner_5af2.Name = "BolongSpecCount"
                var_uiCorner_5af2.ResetOnSpawn = false
                var_uiCorner_5af2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                var_uiCorner_5af2.IgnoreGuiInset = false
                var_uiCorner_5af2.Parent = PlayerGui
                local var_child_cd9f = Instance.new("Frame")
                var_child_cd9f.Name = "SpecFrame"
                var_child_cd9f.Size = UDim2.fromOffset(170, 28)
                var_child_cd9f.AnchorPoint = Vector2.new(0, 1)
                var_child_cd9f.Position = UDim2.new(0, 10, 1, (-10.0))
                var_child_cd9f.BackgroundColor3 = Color3.fromRGB(10, (10.0), 14)
                var_child_cd9f.BorderSizePixel = 0
                var_child_cd9f.Active = true
                var_child_cd9f.Parent = var_uiCorner_5af2
                local var_uiCorner_2ff8 = Instance.new("UICorner")
                var_uiCorner_2ff8.CornerRadius = UDim.new((0.0), 8)
                var_uiCorner_2ff8.Parent = var_child_cd9f
                local var_uiCorner_5a7b = Instance.new("UIStroke")
                var_uiCorner_5a7b.Color = Color3.fromRGB(60, 60, 75)
                var_uiCorner_5a7b.Thickness = 1
                var_uiCorner_5a7b.Parent = var_child_cd9f
                local infoLabel = Instance.new("TextLabel")
                infoLabel.Name = "InfoLabel"
                infoLabel.Size = UDim2.new(1, (0.0), (1.0), 0)
                infoLabel.BackgroundTransparency = 1
                infoLabel.Text = "SPECTATORS 0"
                infoLabel.TextColor3 = Color3.fromRGB(200, (200.0), 210)
                infoLabel.TextSize = 12
                infoLabel.Font = Enum.Font.GothamBold
                infoLabel.TextXAlignment = Enum.TextXAlignment.Center
                infoLabel.TextYAlignment = Enum.TextYAlignment.Center
                infoLabel.RichText = true
                infoLabel.Parent = var_child_cd9f
                local var_connection_e59e = Instance.new("ImageLabel")
                var_connection_e59e.Name = "EyeIcon"
                var_connection_e59e.Size = UDim2.fromOffset(16, 16)
                var_connection_e59e.BackgroundTransparency = 1
                var_connection_e59e.Image = "rbxassetid://104977598392154"
                var_connection_e59e.ImageColor3 = Color3.fromRGB(200, 200, 210)
                var_connection_e59e.Position = UDim2.new(0, 6, 0.5, -8)
                var_connection_e59e.ScaleType = Enum.ScaleType.Fit
                var_connection_e59e.Parent = var_child_cd9f
                local var_connection_1eea, var_connection_94c7, var_viewportSize_a48c
                var_child_cd9f.InputBegan.Connect(var_child_cd9f.InputBegan,function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        var_connection_1eea = true
                        var_connection_94c7 = input.Position
                        var_viewportSize_a48c = var_child_cd9f.Position
                    end
                end)
                var_child_cd9f.InputEnded.Connect(var_child_cd9f.InputEnded,function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        var_connection_1eea = false
                    end
                end)
                UserInputService.InputChanged.Connect(UserInputService.InputChanged,function(input)
                    if var_connection_1eea and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                        local var_vector_d809 = input.Position - var_connection_94c7
                        var_child_cd9f.Position = UDim2.new(var_viewportSize_a48c.X.Scale, var_viewportSize_a48c.X.Offset + var_vector_d809.X, var_viewportSize_a48c.Y.Scale, var_viewportSize_a48c.Y.Offset + var_vector_d809.Y)
                    end
                end)
                return var_uiCorner_5af2
            end

            function fn_CrosshairHelper_810c()
                if State.var_player_edbf then return end
                State.var_player_edbf = true
                var_player_add7 = 0
                table.clear(var_userId_37c8)
                table.clear(var_player_2e22)
                if State.var_player_5f10 then State.var_player_5f10.Destroy(State.var_player_5f10) end
                State.var_player_5f10 = fn_ResetHandler_f2a1()
                for _, var_player_2e5f in ipairs(Players.GetPlayers(Players)) do
                    if var_player_2e5f ~= LocalPlayer then fn_ResetHelper_4609(var_player_2e5f) end
                end
                var_player_4654.onJoin = Players.PlayerAdded.Connect(Players.PlayerAdded,function(var_player_2e5f)
                    if State.var_player_edbf then fn_ResetHelper_4609(var_player_2e5f) end
                end)
                var_player_4654.onLeave = Players.PlayerRemoving.Connect(Players.PlayerRemoving,fn_ResetHelper_9248)
                fn_GetHelper_8a94()
            end

            function StopSpectatorCount()
                State.var_player_edbf = false
                for detectedKiller in next, var_player_4654 do
                    local var_connection_d9f3 = var_player_4654[detectedKiller]
                    pcall(function() var_connection_d9f3.Disconnect(var_connection_d9f3) end)
                    var_player_4654[detectedKiller] = nil
                end
                table.clear(var_userId_37c8)
                table.clear(var_player_2e22)
                if State.var_player_5f10 then
        do local var_unknownValue_0034_f72f=343%43 end
                    State.var_player_5f10.Destroy(State.var_player_5f10)
                    State.var_player_5f10 = nil
                end
            end
        end

        CROSSHAIR_STYLES = {
           "Dot", "Circle", "Circle + Dot", "Plus", "Cross (X)", "T-Shape", "Square"
        }

        local var_frame_e783
        do
            local var_backgroundTransparency_b728   = (80.0)
            local var_uiCorner_27de = var_backgroundTransparency_b728 / 2


            local var_frame_ef50 = {}


            local function fn_SetHandler_e477(centerX, centerY, width, length, rotation, color, var_uiCorner_f5ce, name)
                local var_backgroundTransparency_fed2 = Instance.new("Frame")
                var_backgroundTransparency_fed2.Name               = name or "CH_Part"
                var_backgroundTransparency_fed2.BackgroundColor3   = color
                var_backgroundTransparency_fed2.BackgroundTransparency = var_uiCorner_f5ce
                var_backgroundTransparency_fed2.BorderSizePixel    = 0
                var_backgroundTransparency_fed2.Size               = UDim2.fromOffset(math.max((1.0), math.round(width)), math.max(1, math.round(length)))
                var_backgroundTransparency_fed2.AnchorPoint        = Vector2.new(0.5, 0.5)
                var_backgroundTransparency_fed2.Position           = UDim2.fromOffset(math.round(centerX), math.round(centerY))
                if rotation ~= (0.0) then var_backgroundTransparency_fed2.Rotation = rotation end
                return var_backgroundTransparency_fed2
            end


            local function fn_SetHelper_1b6e(size)
                return 0.3 + (math.clamp(size, 1, 100) / 100) * 2.2
            end

            var_frame_ef50.Plus = function(size, color, var_uiCorner_f5ce)
                local var_child_33e9 = {}
                local var_uiCorner_3581 = fn_SetHelper_1b6e(size)

                local var_uiStroke_1b45 = math.max(2, math.round(2 * var_uiCorner_3581))
                local var_animationTrack_c797 = math.max((8.0), math.round(25 * var_uiCorner_3581))
                local var_connection_d9f3 = var_uiCorner_27de


                table.insert(var_child_33e9, fn_SetHandler_e477(var_connection_d9f3, var_connection_d9f3, var_uiStroke_1b45, var_animationTrack_c797, (0.0), color, var_uiCorner_f5ce))
                table.insert(var_child_33e9, fn_SetHandler_e477(var_connection_d9f3, var_connection_d9f3, var_animationTrack_c797, var_uiStroke_1b45, 0, color, var_uiCorner_f5ce))
                return var_child_33e9, {}, {}
            end

            var_frame_ef50["Cross (X)"] = function(size, color, var_uiCorner_f5ce)
                local var_child_33e9 = {}
                local var_uiCorner_3581 = fn_SetHelper_1b6e(size)
                local var_uiStroke_1b45 = math.max(2, math.round(2 * var_uiCorner_3581))
                local var_animationTrack_c797 = math.max(8, math.round(25 * var_uiCorner_3581))
                local var_connection_d9f3 = var_uiCorner_27de


                table.insert(var_child_33e9, fn_SetHandler_e477(var_connection_d9f3, var_connection_d9f3, var_uiStroke_1b45, var_animationTrack_c797, 45, color, var_uiCorner_f5ce))
                table.insert(var_child_33e9, fn_SetHandler_e477(var_connection_d9f3, var_connection_d9f3, var_uiStroke_1b45, var_animationTrack_c797, -45, color, var_uiCorner_f5ce))
                return var_child_33e9, {}, {}
            end

            var_frame_ef50.Dot = function(size, color, var_uiCorner_f5ce)
                local var_child_33e9 = {}
                local var_uiCorner_3581 = fn_SetHelper_1b6e(size)
                local var_uiCorner_12e8 = math.max(3, math.round((8.0) * var_uiCorner_3581))
                local var_connection_d9f3 = var_uiCorner_27de

                local dot = fn_SetHandler_e477(var_connection_d9f3, var_connection_d9f3, var_uiCorner_12e8, var_uiCorner_12e8, 0, color, var_uiCorner_f5ce, "CH_Dot")
                local var_uiCorner_2ff8 = Instance.new("UICorner")
                var_uiCorner_2ff8.CornerRadius = UDim.new(1, 0)
                var_uiCorner_2ff8.Parent = dot
                table.insert(var_child_33e9, dot)
                return var_child_33e9, {}, {}
            end

            var_frame_ef50.Circle = function(size, color, var_uiCorner_f5ce)
                local var_child_33e9, strokes = {}, {}
                local var_uiCorner_3581 = fn_SetHelper_1b6e(size)
                local var_rootPart_985f = math.max(4, math.round(12 * var_uiCorner_3581))
                local var_uiStroke_1b45 = math.max((2.0), math.round(2 * var_uiCorner_3581))
                local var_connection_d9f3 = var_uiCorner_27de

                local var_uiCorner_5f9a = Instance.new("Frame")
                var_uiCorner_5f9a.Name = "CH_Ring"
                var_uiCorner_5f9a.BackgroundTransparency = (1.0)
                var_uiCorner_5f9a.Size = UDim2.fromOffset(var_rootPart_985f * 2, var_rootPart_985f * 2)
                var_uiCorner_5f9a.AnchorPoint = Vector2.new(0.5, 0.5)
                var_uiCorner_5f9a.Position = UDim2.fromOffset(var_connection_d9f3, var_connection_d9f3)

                local var_uiCorner_2ff8 = Instance.new("UICorner")
                var_uiCorner_2ff8.CornerRadius = UDim.new((1.0), (0.0))
                var_uiCorner_2ff8.Parent = var_uiCorner_5f9a

                local var_uiCorner_5a7b = Instance.new("UIStroke")
                var_uiCorner_5a7b.Name = "CH_Stroke"
                var_uiCorner_5a7b.Color = color
                var_uiCorner_5a7b.Thickness = var_uiStroke_1b45
                var_uiCorner_5a7b.Transparency = var_uiCorner_f5ce
                var_uiCorner_5a7b.Parent = var_uiCorner_5f9a

                table.insert(var_child_33e9, var_uiCorner_5f9a)
                table.insert(strokes, var_uiCorner_5a7b)
                return var_child_33e9, strokes, {}
            end

            var_frame_ef50["Circle + Dot"] = function(size, color, var_uiCorner_f5ce)
                local var_child_33e9, strokes, dots = {}, {}, {}
                local var_uiCorner_3581 = fn_SetHelper_1b6e(size)
                local var_rootPart_985f = math.max(4, math.round(12 * var_uiCorner_3581))
                local var_uiStroke_1b45 = math.max(2, math.round((2.0) * var_uiCorner_3581))
                local var_uiCorner_12e8 = math.max(2, math.round((4.0) * var_uiCorner_3581))
                local var_connection_d9f3 = var_uiCorner_27de
        do local var_backgroundTransparency_8431=500%78 end


                local var_uiCorner_5f9a = Instance.new("Frame")
                var_uiCorner_5f9a.Name = "CH_Ring"
                var_uiCorner_5f9a.BackgroundTransparency = 1
                var_uiCorner_5f9a.Size = UDim2.fromOffset(var_rootPart_985f * 2, var_rootPart_985f * 2)
                var_uiCorner_5f9a.AnchorPoint = Vector2.new(0.5, 0.5)
                var_uiCorner_5f9a.Position = UDim2.fromOffset(var_connection_d9f3, var_connection_d9f3)

                local var_uiCorner_2ff8 = Instance.new("UICorner")
                var_uiCorner_2ff8.CornerRadius = UDim.new(1, 0)
                var_uiCorner_2ff8.Parent = var_uiCorner_5f9a

                local var_uiCorner_5a7b = Instance.new("UIStroke")
                var_uiCorner_5a7b.Name = "CH_Stroke"
                var_uiCorner_5a7b.Color = color
                var_uiCorner_5a7b.Thickness = var_uiStroke_1b45
                var_uiCorner_5a7b.Transparency = var_uiCorner_f5ce
                var_uiCorner_5a7b.Parent = var_uiCorner_5f9a

                table.insert(var_child_33e9, var_uiCorner_5f9a)
                table.insert(strokes, var_uiCorner_5a7b)


                local dot = fn_SetHandler_e477(var_connection_d9f3, var_connection_d9f3, var_uiCorner_12e8, var_uiCorner_12e8, 0, color, var_uiCorner_f5ce, "CH_Dot")
                local var_uiCorner_6ef5 = Instance.new("UICorner")
                var_uiCorner_6ef5.CornerRadius = UDim.new(1, 0)
                var_uiCorner_6ef5.Parent = dot
                table.insert(var_child_33e9, dot)
                table.insert(dots, dot)

                return var_child_33e9, strokes, dots
            end

            var_frame_ef50["T-Shape"] = function(size, color, var_uiCorner_f5ce)
                local var_child_33e9 = {}
                local var_uiCorner_3581 = fn_SetHelper_1b6e(size)
                local var_uiStroke_1b45 = math.max((2.0), math.round(2 * var_uiCorner_3581))
                local var_animationTrack_c797 = math.max(8, math.round(25 * var_uiCorner_3581))
                local var_connection_d9f3 = var_uiCorner_27de
                local var_rootPart_b8b3 = math.round(var_animationTrack_c797 * 0.25)


                table.insert(var_child_33e9, fn_SetHandler_e477(var_connection_d9f3, var_connection_d9f3 - var_rootPart_b8b3, var_animationTrack_c797, var_uiStroke_1b45, 0, color, var_uiCorner_f5ce))

                table.insert(var_child_33e9, fn_SetHandler_e477(var_connection_d9f3, var_connection_d9f3 - var_rootPart_b8b3 + var_animationTrack_c797/2, var_uiStroke_1b45, var_animationTrack_c797, 0, color, var_uiCorner_f5ce))
                return var_child_33e9, {}, {}
            end

            var_frame_ef50.Square = function(size, color, var_uiCorner_f5ce)
                local var_child_33e9 = {}
                local var_uiCorner_3581 = fn_SetHelper_1b6e(size)
                local var_uiStroke_1b45 = math.max(2, math.round(2 * var_uiCorner_3581))
                local var_unknownValue_0055_9a24 = math.max(8, math.round(22 * var_uiCorner_3581))
                local var_unknownValue_0009_2bd7 = math.max((3.0), math.round(var_unknownValue_0055_9a24 * 0.4))
                local var_connection_d9f3 = var_uiCorner_27de
                local var_unknownValue_0022_3980 = var_unknownValue_0055_9a24 / 2



                table.insert(var_child_33e9, fn_SetHandler_e477(var_connection_d9f3 - var_unknownValue_0022_3980 + var_unknownValue_0009_2bd7/2, var_connection_d9f3 - var_unknownValue_0022_3980, var_unknownValue_0009_2bd7, var_uiStroke_1b45, 0, color, var_uiCorner_f5ce))
                table.insert(var_child_33e9, fn_SetHandler_e477(var_connection_d9f3 - var_unknownValue_0022_3980, var_connection_d9f3 - var_unknownValue_0022_3980 + var_unknownValue_0009_2bd7/2, var_uiStroke_1b45, var_unknownValue_0009_2bd7, 0, color, var_uiCorner_f5ce))

                table.insert(var_child_33e9, fn_SetHandler_e477(var_connection_d9f3 + var_unknownValue_0022_3980 - var_unknownValue_0009_2bd7/2, var_connection_d9f3 - var_unknownValue_0022_3980, var_unknownValue_0009_2bd7, var_uiStroke_1b45, 0, color, var_uiCorner_f5ce))
                table.insert(var_child_33e9, fn_SetHandler_e477(var_connection_d9f3 + var_unknownValue_0022_3980, var_connection_d9f3 - var_unknownValue_0022_3980 + var_unknownValue_0009_2bd7/2, var_uiStroke_1b45, var_unknownValue_0009_2bd7, 0, color, var_uiCorner_f5ce))

                table.insert(var_child_33e9, fn_SetHandler_e477(var_connection_d9f3 - var_unknownValue_0022_3980 + var_unknownValue_0009_2bd7/2, var_connection_d9f3 + var_unknownValue_0022_3980, var_unknownValue_0009_2bd7, var_uiStroke_1b45, 0, color, var_uiCorner_f5ce))
                table.insert(var_child_33e9, fn_SetHandler_e477(var_connection_d9f3 - var_unknownValue_0022_3980, var_connection_d9f3 + var_unknownValue_0022_3980 - var_unknownValue_0009_2bd7/2, var_uiStroke_1b45, var_unknownValue_0009_2bd7, 0, color, var_uiCorner_f5ce))

                table.insert(var_child_33e9, fn_SetHandler_e477(var_connection_d9f3 + var_unknownValue_0022_3980 - var_unknownValue_0009_2bd7/2, var_connection_d9f3 + var_unknownValue_0022_3980, var_unknownValue_0009_2bd7, var_uiStroke_1b45, 0, color, var_uiCorner_f5ce))
                table.insert(var_child_33e9, fn_SetHandler_e477(var_connection_d9f3 + var_unknownValue_0022_3980, var_connection_d9f3 + var_unknownValue_0022_3980 - var_unknownValue_0009_2bd7/2, var_uiStroke_1b45, var_unknownValue_0009_2bd7, 0, color, var_uiCorner_f5ce))

                return var_child_33e9, {}, {}
            end


            local fn_CrosshairHandler_c75e = {}
            fn_CrosshairHandler_c75e.__index = fn_CrosshairHandler_c75e

            function fn_CrosshairHandler_c75e.new()
                local self = setmetatable({}, fn_CrosshairHandler_c75e)
                self.config = {
                    enabled      = false,
                    style        = "Plus",
                    size         = 1,
                    opacity      = 1.0,
                    offsetX      = 0,
                    offsetY      = 0,
                    color        = Color3.fromRGB(255, 255, 255),
                    smooth       = true,
                    smoothSpeed  = 0.25,
                }
                self.gui            = nil
                self.container      = nil
                self.parent         = nil
                self.parts          = { frames = {}, strokes = {}, dots = {} }
                self.connections    = {}
                self.renderConn     = nil
                self.currentOffset  = Vector2.new(0, 0)
                self.targetOffset   = Vector2.new((0.0), 0)
                self._frameCount    = 0
                return self
            end

            local function fn_CrosshairHelper_463e()
                local var_child_a03d
                pcall(function() if gethui then var_child_a03d = gethui() end end)
                if var_child_a03d and var_child_a03d.Parent then return var_child_a03d end
                pcall(function() var_child_a03d = game.GetService(game,"CoreGui") end)
                if var_child_a03d and var_child_a03d.Parent then return var_child_a03d end
                return PlayerGui
            end

            function fn_CrosshairHandler_c75e:_createGui()
                if self.gui and self.gui.Parent then return end

                local var_uiCorner_5af2 = Instance.new("ScreenGui")
                var_uiCorner_5af2.Name             = "BolongCrosshair"
                var_uiCorner_5af2.ResetOnSpawn     = false
                var_uiCorner_5af2.ZIndexBehavior   = Enum.ZIndexBehavior.Sibling
                var_uiCorner_5af2.IgnoreGuiInset   = true
                var_uiCorner_5af2.DisplayOrder     = 999999

                local var_child_a03d = fn_CrosshairHelper_463e()
                var_uiCorner_5af2.Parent = var_child_a03d
                self.parent = var_child_a03d

                local var_child_2af6 = Instance.new("Frame")
                var_child_2af6.Name             = "Container"
                var_child_2af6.Size             = UDim2.fromOffset(var_backgroundTransparency_b728, var_backgroundTransparency_b728)
                var_child_2af6.AnchorPoint      = Vector2.new(0.5, 0.5)
                var_child_2af6.BackgroundTransparency = 1
                var_child_2af6.BorderSizePixel  = 0
                var_child_2af6.Parent = var_uiCorner_5af2

                self.gui       = var_uiCorner_5af2
                self.container = var_child_2af6

                self._rebuild(self)

                self.targetOffset  = Vector2.new(self.config.offsetX, self.config.offsetY)
                self.currentOffset = self.targetOffset
                self._updatePosition(self)
            end

            function fn_CrosshairHandler_c75e:_rebuild()
                if not self.container then return end

                for _, var_backgroundTransparency_fed2 in ipairs(self.parts.frames) do
                    pcall(function() var_backgroundTransparency_fed2.Destroy(var_backgroundTransparency_fed2) end)
                end
                self.parts = { frames = {}, strokes = {}, dots = {} }

                local var_success_fefb = var_frame_ef50[self.config.style]
                if not var_success_fefb then return end

                local var_uiCorner_f5ce = (1.0) - self.config.opacity
                local frames, strokes, dots = var_success_fefb(self.config.size, self.config.color, var_uiCorner_f5ce)

                for _, var_backgroundTransparency_fed2 in ipairs(frames) do
                    var_backgroundTransparency_fed2.Parent = self.container
                    table.insert(self.parts.frames, var_backgroundTransparency_fed2)
                end
                for _, var_uiCorner_3581 in ipairs(strokes) do
                    table.insert(self.parts.strokes, var_uiCorner_3581)
                end
                self.parts.dots = dots or {}
            end

            function fn_CrosshairHandler_c75e:_updateColors()
                local color = self.config.color
                local var_uiCorner_f5ce = 1 - self.config.opacity

                local var_backgroundTransparency_c4b3 = {}
                for _, var_distance_8193 in ipairs(self.parts.dots) do var_backgroundTransparency_c4b3[var_distance_8193] = true end

                for _, var_backgroundTransparency_fed2 in ipairs(self.parts.frames) do
                    if var_backgroundTransparency_fed2 and var_backgroundTransparency_fed2.Parent then
                        var_backgroundTransparency_fed2.BackgroundColor3 = var_backgroundTransparency_c4b3[var_backgroundTransparency_fed2] and Color3.fromRGB(255, 255, 255) or color

                        if not var_backgroundTransparency_fed2.FindFirstChildWhichIsA(var_backgroundTransparency_fed2,"UIStroke") then
                            var_backgroundTransparency_fed2.BackgroundTransparency = var_uiCorner_f5ce
                        end
                    end
                end
                for _, var_uiCorner_3581 in ipairs(self.parts.strokes) do
                    if var_uiCorner_3581 and var_uiCorner_3581.Parent then
                        var_uiCorner_3581.Color        = color
                        var_uiCorner_3581.Transparency = var_uiCorner_f5ce
                    end
                end
            end

            function fn_CrosshairHandler_c75e:_updatePosition()
                if not self.container then return end
                local var_rootPart_2947 = workspace.CurrentCamera
                if not var_rootPart_2947 then return end
        do local var_viewportSize_b3d3=4878%28 end
                local var_viewportSize_cfe6 = var_rootPart_2947.ViewportSize
                self.container.Position = UDim2.fromOffset(
                    var_viewportSize_cfe6.X * 0.5 + self.currentOffset.X,
                    var_viewportSize_cfe6.Y * 0.5 + self.currentOffset.Y
                )
            end

            function fn_CrosshairHandler_c75e:_hookCamera()
                if self.connections.camViewport then
                    self.connections.camViewport.Disconnect(self.connections.camViewport)
                    self.connections.camViewport = nil
                end
                local var_rootPart_2947 = workspace.CurrentCamera
                if var_rootPart_2947 then
                    self.connections.camViewport =
                        var_rootPart_2947:GetPropertyChangedSignal("ViewportSize"):Connect(function()
                            self._updatePosition(self)
                        end)
                end
            end

            function fn_CrosshairHandler_c75e:_setupConnections()
                self._hookCamera(self)

                if not self.connections.camChange then
                    self.connections.camChange =
                        workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
                            self._hookCamera(self)
                            self._updatePosition(self)
                        end)
                end

                if not self.connections.childRemoved then
                    self.connections.childRemoved =
                        self.parent.ChildRemoved.Connect(self.parent.ChildRemoved,function(var_instance_4e7f)
                            if var_instance_4e7f == self.gui and self.config.enabled then
                                self.gui       = nil
                                self.container = nil
                                self.parts     = { frames = {}, strokes = {}, dots = {} }
                                task.wait(0.05)
                                if self.config.enabled then
                                    self._createGui(self)
                                end
                            end
                        end)
                end

                if not self.connections.touchChanged then
                    self.connections.touchChanged =
                        UserInputService:GetPropertyChangedSignal("TouchEnabled"):Connect(function()
                            self._updatePosition(self)
                        end)
                end
            end

            function fn_CrosshairHandler_c75e:_startRender()
                if self.renderConn then return end
                self.renderConn = RunService.RenderStepped.Connect(RunService.RenderStepped,function(var_rootPart_6336)
                    if not self.config.enabled then return end

                    if not self.gui or not self.gui.Parent then
                        self._createGui(self)
                        return
                    end

                    if not self.gui.Enabled then
                        self.gui.Enabled = true
                    end

                    self._frameCount = self._frameCount + 1
                    if self._frameCount % (30.0) == 0 then
                        local var_distance_f3b2 = false
                        for _, var_backgroundTransparency_fed2 in ipairs(self.parts.frames) do
                            if var_backgroundTransparency_fed2 and var_backgroundTransparency_fed2.Parent then var_distance_f3b2 = true
                            break end
                        end
                        if not var_distance_f3b2 and #self.parts.frames > 0 then
                            self._rebuild(self)
                        end
                    end

                    if self.config.smooth then
                        local var_cframeOffset_64d3 = self.targetOffset - self.currentOffset
                        if var_cframeOffset_64d3.Magnitude > 0.01 then
                            local var_connection_fc78 =
                                (1.0) - math.pow((1.0) - self.config.smoothSpeed, var_rootPart_6336 * 60)
                            self.currentOffset =
                                self.currentOffset.Lerp(self.currentOffset,self.targetOffset, var_connection_fc78)
                            self._updatePosition(self)
                        end
                    end
                end)
            end

            function fn_CrosshairHandler_c75e:_stopRender()
                if self.renderConn then
                    self.renderConn.Disconnect(self.renderConn)
                    self.renderConn = nil
                end
            end

            function fn_CrosshairHandler_c75e:SetEnabled(enabled)
                self.config.enabled = enabled
                if enabled then
                    if not self.gui or not self.gui.Parent then
                        self._createGui(self)
                        self._setupConnections(self)
                    end
                    self.gui.Enabled = true
                    self.targetOffset  = Vector2.new(self.config.offsetX, self.config.offsetY)
                    self.currentOffset = self.targetOffset
                    self._updatePosition(self)
                    self._startRender(self)
                else
                    self._stopRender(self)
                    if self.gui then
                        self.gui.Enabled = false
                    end
                end
            end

            function fn_CrosshairHandler_c75e:SetStyle(style)
                self.config.style = style
                if self.config.enabled and self.gui then
                    self._rebuild(self)
                end
            end

            function fn_CrosshairHandler_c75e:SetSize(size)
                self.config.size = size
                if self.config.enabled and self.gui then
                    self._rebuild(self)
                end
            end

            function fn_CrosshairHandler_c75e:SetOpacity(opacity)
                self.config.opacity = opacity
                if self.config.enabled and self.gui then
                    self._updateColors(self)
                end
            end

            function fn_CrosshairHandler_c75e:SetColor(color)
                self.config.color = color
                if self.config.enabled and self.gui then
                    self._updateColors(self)
                end
            end

            function fn_CrosshairHandler_c75e:SetOffsetX(var_success_8409)
                self.config.offsetX = var_success_8409
                self.targetOffset = Vector2.new(var_success_8409, self.config.offsetY)
                if not self.config.smooth and self.config.enabled then
                    self.currentOffset = self.targetOffset
                    self._updatePosition(self)
                end
            end

            function fn_CrosshairHandler_c75e:SetOffsetY(var_backgroundTransparency_34eb)
                self.config.offsetY = var_backgroundTransparency_34eb
                self.targetOffset = Vector2.new(self.config.offsetX, var_backgroundTransparency_34eb)
                if not self.config.smooth and self.config.enabled then
                    self.currentOffset = self.targetOffset
                    self._updatePosition(self)
                end
            end

            function fn_CrosshairHandler_c75e:Destroy()
                self.config.enabled = false
                self._stopRender(self)
                for _, var_connection_90bd in pairs(self.connections) do
                    pcall(function() var_connection_90bd.Disconnect(var_connection_90bd) end)
                end
                self.connections = {}
                if self.gui then
                    pcall(function() self.gui.Destroy(self.gui) end)
                end
                self.gui       = nil
                self.container = nil
                self.parts     = { frames = {}, strokes = {}, dots = {} }
            end

            var_frame_e783 = fn_CrosshairHandler_c75e.new()
        end

        local fn_GetHandler_6d1d, StopProtectName, _ApplyCopiedAvatarToUI, _HookAllAvatarSlots, _EnsureAvatarUiWatchers
        do
            local function fn_GetHelper_3802(player)
                if not State.var_player_2b0c[player] then
                    State.var_player_2b0c[player] = SUPPORTED_UI_IDS[(1.0)]
                end
                return State.var_player_2b0c[player]
            end

            local function fn_GetHelper_866d(char, var_child_f685)
                if not char then return end
                local var_rootPart_6233 = char.FindFirstChild(char,"Head")
                if not var_rootPart_6233 then return end
                for _, gui in ipairs(var_rootPart_6233.GetChildren(var_rootPart_6233)) do
                    if gui.IsA(gui,"BillboardGui") then
                        local var_backgroundTransparency_dd44 = gui.FindFirstChildWhichIsA(gui,"TextLabel", true)
                        if var_backgroundTransparency_dd44 then var_backgroundTransparency_dd44.Text = var_child_f685 end
                    end
                end
                local var_humanoid_3937 = char.FindFirstChildOfClass(char,"Humanoid")
                if var_humanoid_3937 then pcall(function() var_humanoid_3937.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None end) end
            end

            local function fn_GetHelper_78d9(char, var_child_6fed)
                if not char then return end
                local var_rootPart_6233 = char.FindFirstChild(char,"Head")
                if var_rootPart_6233 then
                    for _, gui in ipairs(var_rootPart_6233.GetChildren(var_rootPart_6233)) do
                        if gui.IsA(gui,"BillboardGui") then
                            local var_backgroundTransparency_dd44 = gui.FindFirstChildWhichIsA(gui,"TextLabel", true)
                            if var_backgroundTransparency_dd44 then var_backgroundTransparency_dd44.Text = var_child_6fed end
                        end
                    end
                end
                local var_humanoid_3937 = char.FindFirstChildOfClass(char,"Humanoid")
                if var_humanoid_3937 then pcall(function() var_humanoid_3937.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.Limit end) end
            end

            local function fn_GetHelper_6012(var_child_99ee)
                local var_humanoid_f870 = PlayerGui.FindFirstChild(PlayerGui,"Survivor-mob")
                if not var_humanoid_f870 then return nil end
                local var_child_cd9f = var_humanoid_f870.FindFirstChild(var_humanoid_f870,"Frame")
                if not var_child_cd9f then return nil end
                for var_remoteEvent_5dde = 1, 5 do
                    local var_player_c33f = var_child_cd9f.FindFirstChild(var_child_cd9f,"Survivor" .. var_remoteEvent_5dde)
                    if var_player_c33f and var_player_c33f.GetAttribute(var_player_c33f,"UserId") == var_child_99ee then
                        return var_player_c33f.FindFirstChild(var_player_c33f,"TextLabel")
                    end
                end
                return nil
            end

            local function fn_GetHandler_d9d7(player)
                local var_userId_c761 = (player == LocalPlayer)
        if false then local var_name_e685=312 end
                local var_child_f685 = fn_GetHelper_3802(player)
                if not var_userId_c761 then
                    if State.espObjects[player] then State.espObjects[player].nameLabel.Text = var_child_f685 end
                    if player.Character then fn_GetHelper_866d(player.Character, var_child_f685) end
                end
                local var_backgroundTransparency_dd44 = fn_GetHelper_6012(player.UserId)
                if var_backgroundTransparency_dd44 then var_backgroundTransparency_dd44.Text = var_child_f685 end
                if not var_userId_c761 and not State.pnameNameConns[player] then
                    State.pnameNameConns[player] = player.CharacterAdded.Connect(player.CharacterAdded,function(char)
                        if not State.var_player_609f then return end
                        local fn = fn_GetHelper_3802(player)
                        task.wait(0.5)
                        fn_GetHelper_866d(char, fn)
                        if State.espObjects[player] then State.espObjects[player].nameLabel.Text = fn end
                        local var_userId_4909 = fn_GetHelper_6012(player.UserId)
                        if var_userId_4909 then var_userId_4909.Text = fn end
                    end)
                end
            end

            local function fn_GetHandler_f8ab(player)
                local var_userId_c761 = (player == LocalPlayer)
                local var_child_6fed = player.Name
                if not var_userId_c761 then
                    if State.espObjects[player] then State.espObjects[player].nameLabel.Text = var_child_6fed end
                    if player.Character then fn_GetHelper_78d9(player.Character, var_child_6fed) end
                    if State.pnameNameConns[player] then
                        State.pnameNameConns[player].Disconnect(State.pnameNameConns[player])
                        State.pnameNameConns[player] = nil
                    end
                end
                local var_backgroundTransparency_dd44 = fn_GetHelper_6012(player.UserId)
                if var_backgroundTransparency_dd44 then var_backgroundTransparency_dd44.Text = var_child_6fed end
            end

            local function fn_GetHandler_5323(var_player_c33f, var_backgroundTransparency_dd44)
                local detectedKiller = var_player_c33f.Name
                if State.pnameSlotConns[detectedKiller] then
                    State.pnameSlotConns[detectedKiller].Disconnect(State.pnameSlotConns[detectedKiller])
                    State.pnameSlotConns[detectedKiller] = nil
                end
                local var_userId_889e = var_player_c33f.GetAttribute(var_player_c33f,"UserId")
                if not var_userId_889e then return end
                local var_player_d25e
                for _, var_player_2e5f in ipairs(Players.GetPlayers(Players)) do
                    if var_player_2e5f.UserId == var_userId_889e then var_player_d25e = var_player_2e5f
                    break end
                end
                if not var_player_d25e then return end
                local fn = fn_GetHelper_3802(var_player_d25e)
                State.pnameSlotConns[detectedKiller] = var_backgroundTransparency_dd44:GetPropertyChangedSignal("Text"):Connect(function()
                    if not State.var_player_609f then return end
                    local var_player_51c3 = var_player_c33f.GetAttribute(var_player_c33f,"UserId")
                    if not var_player_51c3 then return end
                    local var_player_57ff
                    for _, var_player_2e5f in ipairs(Players.GetPlayers(Players)) do
                        if var_player_2e5f.UserId == var_player_51c3 then var_player_57ff = var_player_2e5f
                        break end
                    end
                    if not var_player_57ff then return end
                    local var_userId_5698 = fn_GetHelper_3802(var_player_57ff)
                    if var_backgroundTransparency_dd44.Text ~= var_userId_5698 then var_backgroundTransparency_dd44.Text = var_userId_5698 end
                end)
            end

            local function fn_GetHandler_709a()
                for detectedKiller, var_connection_90bd in pairs(State.pnameSlotConns) do
        if false then local var_playerGui_3d47=882 end
        do local var_playerGui_5951=292 end
                    var_connection_90bd.Disconnect(var_connection_90bd)
                    State.pnameSlotConns[detectedKiller] = nil
                end
                local var_humanoid_f870 = PlayerGui.FindFirstChild(PlayerGui,"Survivor-mob")
                if not var_humanoid_f870 then return end
                local var_child_cd9f = var_humanoid_f870.FindFirstChild(var_humanoid_f870,"Frame")
                if not var_child_cd9f then return end
                for var_remoteEvent_5dde = 1, 5 do
                    local var_player_c33f = var_child_cd9f.FindFirstChild(var_child_cd9f,"Survivor" .. var_remoteEvent_5dde)
                    if var_player_c33f then
                        local var_backgroundTransparency_dd44 = var_player_c33f.FindFirstChild(var_player_c33f,"TextLabel")
                        if var_backgroundTransparency_dd44 then fn_GetHandler_5323(var_player_c33f, var_backgroundTransparency_dd44) end
                    end
                end
            end





            local function fn_GetHelper_6c1b(text)
                if type(text) ~= "string" or text == "" then return nil end
                local var_player_547d = {}
                for _, var_player_2e5f in ipairs(Players.GetPlayers(Players)) do
                    for _, nm in ipairs({ var_player_2e5f.Name, var_player_2e5f.DisplayName }) do
                        if type(nm) == "string" and #nm >= 3 then
                            var_player_547d[#var_player_547d + 1] = { nm = nm, fake = fn_GetHelper_3802(var_player_2e5f) }
                        end
                    end
                end
                table.sort(var_player_547d, function(var_rootPart_4e4c, var_rootPart_b34c) return #var_rootPart_4e4c.nm > #var_rootPart_b34c.nm end)
                for _, var_connection_d9f3 in ipairs(var_player_547d) do
                    if string.find(text, var_connection_d9f3.nm, 1, true) then
                        local var_unknownValue_0059_65e7 = var_connection_d9f3.nm.gsub(var_connection_d9f3.nm,"(%W)", "%%%1")
                        return (text.gsub(text,var_unknownValue_0059_65e7, var_connection_d9f3.fake, (1.0)))
                    end
                end
                return nil
            end

            local function fn_GetHelper_4e63(var_instance_5397)
                local var_success_3d32 = var_instance_5397.Parent
                for _ = 1, 6 do
                    if not var_success_3d32 then break end
                    if var_success_3d32.Name == "Survivor-mob" then return true end
                    var_success_3d32 = var_success_3d32.Parent
                end
                return false
            end

            local function fn_GetHelper_faca(var_instance_5397)
                if not State.var_player_609f then return end
                local var_success_abb9, isText = pcall(function()
                    return var_instance_5397.IsA(var_instance_5397,"TextLabel") or var_instance_5397.IsA(var_instance_5397,"TextButton") or var_instance_5397.IsA(var_instance_5397,"TextBox")
                end)
                if not var_success_abb9 or not isText then return end
                if fn_GetHelper_4e63(var_instance_5397) then return end
                local var_success_a322, cur = pcall(function() return var_instance_5397.Text end)
                if not var_success_a322 or type(cur) ~= "string" then return end
                local var_userId_729b = fn_GetHelper_6c1b(cur)
                if not var_userId_729b or var_userId_729b == cur then return end
                State.pnameGenConns = State.pnameGenConns or {}
                State.pnameGenOrig = State.pnameGenOrig or {}
                State.pnameGenCount = State.pnameGenCount or 0
                if State.pnameGenOrig[var_instance_5397] == nil and State.pnameGenCount < 200 then
                    State.pnameGenOrig[var_instance_5397] = cur
                    State.pnameGenCount = State.pnameGenCount + (1.0)
                end
                pcall(function() var_instance_5397.Text = var_userId_729b end)
                if not State.pnameGenConns[var_instance_5397] then
                    State.pnameGenConns[var_instance_5397] = var_instance_5397:GetPropertyChangedSignal("Text"):Connect(function()
                        if not State.var_player_609f then return end
                        local var_player_7c22 = State.pnameGenOrig[var_instance_5397]
                        if not var_player_7c22 then return end
                        local var_player_d45b = fn_GetHelper_6c1b(var_player_7c22)
                        if var_player_d45b then
                            local var_success_b20d, curNow = pcall(function() return var_instance_5397.Text end)
                            if var_success_b20d and curNow ~= var_player_d45b then
                                pcall(function() var_instance_5397.Text = var_player_d45b end)
                            end
                        end
                    end)
                end
            end

            function fn_GetHandler_6d1d()
                State.var_player_609f = true
                for _, player in ipairs(Players.GetPlayers(Players)) do fn_GetHandler_d9d7(player) end
                fn_GetHandler_709a()
                pcall(function()
                    local var_descendant_5584 = LocalPlayer.FindFirstChildOfClass(LocalPlayer,"PlayerGui")
                    if var_descendant_5584 then
                        for _, var_descendant_fe40 in ipairs(var_descendant_5584.GetDescendants(var_descendant_5584)) do fn_GetHelper_faca(var_descendant_fe40) end
                    end
                end)
                if not State.var_descendant_cffb then
                    State.var_descendant_cffb = PlayerGui.ChildAdded.Connect(PlayerGui.ChildAdded,function(var_instance_4e7f)
                        if var_instance_4e7f.Name == "Survivor-mob" then
                            task.wait(0.2)
                            if State.var_player_609f then
                                fn_GetHandler_709a()
                                for _, player in ipairs(Players.GetPlayers(Players)) do fn_GetHandler_d9d7(player) end
                            end
                        end
                    end)
                end
                if not State.var_player_5d54 then
                    State.var_player_5d54 = Players.PlayerAdded.Connect(Players.PlayerAdded,function(player)
                        if State.var_player_609f then
                            task.wait((1.0))
                            fn_GetHandler_d9d7(player)
                            fn_GetHandler_709a()
                        end
                    end)
                end
                if not State.pnameGenConn then
                    State.pnameGenConn = PlayerGui.DescendantAdded.Connect(PlayerGui.DescendantAdded,function(var_instance_5397)
                        task.defer(function()
                            if State.var_player_609f then fn_GetHelper_faca(var_instance_5397) end
                        end)
                    end)
                end
            end

            function StopProtectName()
                State.var_player_609f = false
                for detectedKiller, var_connection_90bd in pairs(State.pnameSlotConns) do
                    var_connection_90bd.Disconnect(var_connection_90bd)
                    State.pnameSlotConns[detectedKiller] = nil
                end
                if State.var_descendant_cffb then
                    State.var_descendant_cffb.Disconnect(State.var_descendant_cffb)
                    State.var_descendant_cffb = nil
                end
                if State.pnameGenConn then
                    pcall(function() State.pnameGenConn.Disconnect(State.pnameGenConn) end)
                    State.pnameGenConn = nil
                end
                for var_backgroundTransparency_dd44, var_connection_90bd in pairs(State.pnameGenConns or {}) do
                    pcall(function() var_connection_90bd.Disconnect(var_connection_90bd) end)
                end
                State.pnameGenConns = {}
                for var_backgroundTransparency_dd44, var_player_7c22 in pairs(State.pnameGenOrig or {}) do
                    pcall(function()
                        if var_backgroundTransparency_dd44 and var_backgroundTransparency_dd44.Parent then var_backgroundTransparency_dd44.Text = var_player_7c22 end
                    end)
                end
                State.pnameGenOrig = {}
                State.pnameGenCount = 0
                for _, player in ipairs(Players.GetPlayers(Players)) do fn_GetHandler_f8ab(player) end
                State.var_player_2b0c = {}
                if State.var_player_5d54 then
                    State.var_player_5d54.Disconnect(State.var_player_5d54)
                    State.var_player_5d54 = nil
                end
            end





            local function fn_AvatarHelper_d2a4(var_child_99ee)
                if State.var_playerGui_4fab == var_child_99ee and State.var_head_ef35 then
                    return State.var_head_ef35
                end
                local var_head_530e = nil
                for _ = 1, 3 do
                    local var_success_abb9, var_rootPart_dc09, ready = pcall(function()
                        return Players.GetUserThumbnailAsync(Players,var_child_99ee, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size421056)
                    end)
                    if var_success_abb9 and var_rootPart_dc09 and var_rootPart_dc09 ~= "" then
                        var_head_530e = var_rootPart_dc09
                        if ready then break end
                    end
                    task.wait(1)
                end
                if var_head_530e then
                    State.var_head_ef35 = var_head_530e
                    State.var_playerGui_4fab = var_child_99ee
                end
                return var_head_530e
            end

            local function fn_AvatarHelper_1bcd()
                local var_humanoid_f870 = PlayerGui.FindFirstChild(PlayerGui,"Survivor-mob")
                if not var_humanoid_f870 then return nil, nil end
                local var_child_cd9f = var_humanoid_f870.FindFirstChild(var_humanoid_f870,"Frame")
                if not var_child_cd9f then return nil, nil end
                for var_remoteEvent_5dde = 1, (5.0) do
                    local var_player_c33f = var_child_cd9f.FindFirstChild(var_child_cd9f,"Survivor" .. var_remoteEvent_5dde)
                    if var_player_c33f and var_player_c33f.GetAttribute(var_player_c33f,"UserId") == LocalPlayer.UserId then
                        local var_rootPart_dc09 = var_player_c33f.FindFirstChild(var_player_c33f,"ImageLabel")
                        if var_rootPart_dc09 then return var_player_c33f, var_rootPart_dc09 end
                    end
                end
                return nil, nil
            end

            function _ApplyCopiedAvatarToUI()
                if not State.var_userId_b305 or not State.var_userId_f2d0 then return end
                local _, var_rootPart_dc09 = fn_AvatarHelper_1bcd()
                if not var_rootPart_dc09 then return end
                local var_head_530e = fn_AvatarHelper_d2a4(State.var_userId_f2d0)
                if var_head_530e and var_rootPart_dc09.Parent and var_rootPart_dc09.Image ~= var_head_530e then
                    pcall(function() var_rootPart_dc09.Image = var_head_530e end)
                end
            end

            local function fn_AvatarHandler_7505(var_player_c33f, var_rootPart_dc09)
                local detectedKiller = var_player_c33f.Name
                local var_rootPart_b4f9 = State.avatarUiSlotConns[detectedKiller]
                if var_rootPart_b4f9 then
                    if type(var_rootPart_b4f9) == "table" then
                        for _, var_connection_d9f3 in ipairs(var_rootPart_b4f9) do pcall(function() var_connection_d9f3.Disconnect(var_connection_d9f3) end) end
                    else
                        pcall(function() var_rootPart_b4f9.Disconnect(var_rootPart_b4f9) end)
                    end
                    State.avatarUiSlotConns[detectedKiller] = nil
                end
                local var_remoteEvent_9f04 = {}
                var_remoteEvent_9f04[#var_remoteEvent_9f04 + 1] = var_rootPart_dc09:GetPropertyChangedSignal("Image"):Connect(function()
                    if not State.var_userId_b305 or not State.var_userId_f2d0 then return end
                    if var_player_c33f.GetAttribute(var_player_c33f,"UserId") ~= LocalPlayer.UserId then return end
                    local var_userId_729b = State.var_head_ef35
                    if var_userId_729b and var_rootPart_dc09.Parent and var_rootPart_dc09.Image ~= var_userId_729b then
                        pcall(function() var_rootPart_dc09.Image = var_userId_729b end)
                    end
                end)
                var_remoteEvent_9f04[#var_remoteEvent_9f04 + 1] = var_player_c33f:GetAttributeChangedSignal("UserId"):Connect(function()
                    if not State.var_userId_b305 or not State.var_userId_f2d0 then return end
                    task.wait(0.3)
                    if var_player_c33f.GetAttribute(var_player_c33f,"UserId") == LocalPlayer.UserId then
                        _ApplyCopiedAvatarToUI()
                    end
                end)
                State.avatarUiSlotConns[detectedKiller] = var_remoteEvent_9f04
            end

            function _HookAllAvatarSlots()
                for detectedKiller, var_remoteEvent_9f04 in pairs(State.avatarUiSlotConns) do
                    if type(var_remoteEvent_9f04) == "table" then
                        for _, var_connection_d9f3 in ipairs(var_remoteEvent_9f04) do pcall(function() var_connection_d9f3.Disconnect(var_connection_d9f3) end) end
                    else
                        pcall(function() var_remoteEvent_9f04.Disconnect(var_remoteEvent_9f04) end)
                    end
                    State.avatarUiSlotConns[detectedKiller] = nil
                end
                local var_humanoid_f870 = PlayerGui.FindFirstChild(PlayerGui,"Survivor-mob")
                if not var_humanoid_f870 then return end
                local var_child_cd9f = var_humanoid_f870.FindFirstChild(var_humanoid_f870,"Frame")
                if not var_child_cd9f then return end
                for var_remoteEvent_5dde = 1, 5 do
                    local var_player_c33f = var_child_cd9f.FindFirstChild(var_child_cd9f,"Survivor" .. var_remoteEvent_5dde)
                    if var_player_c33f then
                        local var_rootPart_dc09 = var_player_c33f.FindFirstChild(var_player_c33f,"ImageLabel")
                        if var_rootPart_dc09 then fn_AvatarHandler_7505(var_player_c33f, var_rootPart_dc09) end
                    end
                end
            end

            function _EnsureAvatarUiWatchers()
                if not State.var_playerGui_4092 then
                    State.var_playerGui_4092 = PlayerGui.ChildAdded.Connect(PlayerGui.ChildAdded,function(var_instance_4e7f)
                        if var_instance_4e7f.Name == "Survivor-mob" then
                            task.wait(0.2)
                            if State.var_userId_b305 and State.var_userId_f2d0 then
                                _HookAllAvatarSlots()
                                _ApplyCopiedAvatarToUI()
                            end
                        end
                    end)
                end
                if not State.var_connection_c519 then
                    State.var_connection_c519 = LocalPlayer.CharacterAdded.Connect(LocalPlayer.CharacterAdded,function()
                        if not State.var_userId_f2d0 then return end
                        task.wait(1)
                        if State.var_userId_f2d0 then
                            State.var_userId_b305 = true
                            fn_CreateHelper_9092(tostring(State.var_userId_f2d0))
                        end
                    end)
                end
            end
        end

        local function fn_CutsceneHandler_ddf3(darknessMode)
            darknessMode = darknessMode or false
            local var_rootPart_2947 = WorkspaceService.CurrentCamera
            local var_descendant_7268 = State.skipEndScreenConns


            local var_endScreen_2870 = false
            local var_remoteEvent_63f5 = false
            local var_remoteEvent_76e8 = false


            pcall(function()
                local var_remoteEvent_d696 = ReplicatedStorage.FindFirstChild(ReplicatedStorage,"Remotes")
                if not var_remoteEvent_d696 then return end

                local function fn_CutsceneHandler_1146(remote)
                    if remote and remote.IsA(remote,"RemoteEvent") then
                        for _, var_connection_90bd in ipairs(getconnections(remote.OnClientEvent)) do
                            var_connection_90bd.Disable(var_connection_90bd)
                            var_connection_90bd.Disconnect(var_connection_90bd)
                        end
                    end
                end

                local var_endScreen_4740 = var_remoteEvent_d696.FindFirstChild(var_remoteEvent_d696,"Game")
                if var_endScreen_4740 then
                    for _, name in ipairs({"cutscene", "cutsceneEnd", "cutsceneEnd2", "endscreencutscene", "cutsceneEndwithownchar", "shake"}) do
                        fn_CutsceneHandler_1146(var_endScreen_4740.FindFirstChild(var_endScreen_4740,name))
                    end
                end

                local var_endScreen_99a9 = var_remoteEvent_d696.FindFirstChild(var_remoteEvent_d696,"Killers")
                if var_endScreen_99a9 then fn_CutsceneHandler_1146(var_endScreen_99a9.FindFirstChild(var_endScreen_99a9,"Startmori")) end


                if darknessMode then
                    fn_CutsceneHandler_1146(var_remoteEvent_d696.FindFirstChild(var_remoteEvent_d696,"Darkness2"))
                end
            end)


            local function fn_GetHelper_76cc()
                if not var_rootPart_2947 then return end
                if var_rootPart_2947.CameraType == Enum.CameraType.Scriptable then
                    var_endScreen_2870 = true
                    var_rootPart_2947.CameraType = Enum.CameraType.Custom
                    var_endScreen_2870 = false
                end
            end

            if var_rootPart_2947 then
                fn_GetHelper_76cc()
                table.insert(var_descendant_7268, var_rootPart_2947:GetPropertyChangedSignal("CameraType"):Connect(function()
                    if not var_endScreen_2870 then fn_GetHelper_76cc() end
                end))

                table.insert(var_descendant_7268, var_rootPart_2947:GetPropertyChangedSignal("FieldOfView"):Connect(function()
                    if var_remoteEvent_63f5 or Config.cfg_showName_9982 then return end
                    if var_rootPart_2947.FieldOfView ~= 70 then
                        var_remoteEvent_63f5 = true
                        var_rootPart_2947.FieldOfView = (70.0)
                        var_remoteEvent_63f5 = false
                    end
                end))
            end

            table.insert(var_descendant_7268, WorkspaceService:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
                var_rootPart_2947 = WorkspaceService.CurrentCamera
                if var_rootPart_2947 then fn_GetHelper_76cc() end
            end))


            table.insert(var_descendant_7268, LocalPlayer:GetAttributeChangedSignal("isspectating"):Connect(function()
                if var_remoteEvent_76e8 then return end
                if LocalPlayer.GetAttribute(LocalPlayer,"isspectating") then
                    var_remoteEvent_76e8 = true
                    LocalPlayer.SetAttribute(LocalPlayer,"isspectating", false)
                    var_remoteEvent_76e8 = false
                end
            end))

            table.insert(var_descendant_7268, LocalPlayer:GetAttributeChangedSignal("killerend"):Connect(function()
                if var_remoteEvent_76e8 then return end
                if LocalPlayer.GetAttribute(LocalPlayer,"killerend") then
                    var_remoteEvent_76e8 = true
                    LocalPlayer.SetAttribute(LocalPlayer,"killerend", false)
                    var_remoteEvent_76e8 = false
                end
            end))


            local function fn_CutsceneHandler_6a79()
                local var_descendant_b2cb = WorkspaceService.FindFirstChild(WorkspaceService,"Map")
                if var_descendant_b2cb then
                    local var_endScreen_a455 = var_descendant_b2cb.FindFirstChild(var_descendant_b2cb,"endscreen")
                    if var_endScreen_a455 then
                        pcall(function() var_endScreen_a455.Parent = nil end)
                    end
                end

                local var_descendant_4d58 = WorkspaceService.FindFirstChild(WorkspaceService,"BackgroundSounds")
                if var_descendant_4d58 then
                    pcall(function() var_descendant_4d58.Destroy(var_descendant_4d58) end)
                end
            end

            fn_CutsceneHandler_6a79()

            table.insert(var_descendant_7268, WorkspaceService.DescendantAdded.Connect(WorkspaceService.DescendantAdded,function(var_descendant_fe40)
                if var_descendant_fe40.Name == "endscreen" and var_descendant_fe40.Parent and var_descendant_fe40.Parent.Name == "Map" then
                    task.wait(0.01)
                    pcall(function() var_descendant_fe40.Parent = nil end)
                elseif var_descendant_fe40.Name == "BackgroundSounds" then
                    pcall(function() var_descendant_fe40.Destroy(var_descendant_fe40) end)
                end
            end))


            local function fn_CutsceneHelper_ac12(gui)
                if not gui or not gui.Parent then return end
                pcall(function()

                    if darknessMode and gui.Name == "Darkness" and gui.IsA(gui,"ScreenGui") then
                        gui.Enabled = false
                    end

                    local function fn_CutsceneHandler_7c73(var_descendant_fe40)
                        if var_descendant_fe40.IsA(var_descendant_fe40,"VideoFrame") then
                            var_descendant_fe40.Destroy(var_descendant_fe40)
                        elseif var_descendant_fe40.IsA(var_descendant_fe40,"Frame") and (var_descendant_fe40.Name == "Frame2" or var_descendant_fe40.Name == "blackout") then
                            var_descendant_fe40.BackgroundTransparency = 1
                            if darknessMode then
                                var_descendant_fe40.Visible = false

                                var_descendant_fe40:GetPropertyChangedSignal("BackgroundTransparency"):Connect(function()
                                    if var_descendant_fe40.BackgroundTransparency < 1 then var_descendant_fe40.BackgroundTransparency = 1 end
                                end)
                                var_descendant_fe40:GetPropertyChangedSignal("Visible"):Connect(function()
                                    if var_descendant_fe40.Visible then var_descendant_fe40.Visible = false end
                                end)
                            end
                        elseif var_descendant_fe40.IsA(var_descendant_fe40,"ParticleEmitter") or var_descendant_fe40.IsA(var_descendant_fe40,"Beam") or var_descendant_fe40.IsA(var_descendant_fe40,"Trail") then
                            var_descendant_fe40.Enabled = false
                        end
                        for _, var_instance_4e7f in ipairs(var_descendant_fe40.GetChildren(var_descendant_fe40)) do fn_CutsceneHandler_7c73(var_instance_4e7f) end
                    end
                    fn_CutsceneHandler_7c73(gui)
                end)
            end

            for _, var_instance_4e7f in ipairs(PlayerGui.GetChildren(PlayerGui)) do
                local n = var_instance_4e7f.Name
                if n == "Darkness" or n == "EndScreen" or n == "Cutscene" or n == "Results" then
                    fn_CutsceneHelper_ac12(var_instance_4e7f)
                end
            end

            table.insert(var_descendant_7268, PlayerGui.ChildAdded.Connect(PlayerGui.ChildAdded,function(var_instance_4e7f)
                local n = var_instance_4e7f.Name
                if n == "Darkness" or n == "EndScreen" or n == "Cutscene" or n == "Results" then
                    task.wait(0.05)
                    fn_CutsceneHelper_ac12(var_instance_4e7f)
                end
            end))
        end

        local function fn_CreateHandler_cba1()
            for _, var_connection_4096 in ipairs(State.skipEndScreenConns) do
                pcall(function() var_connection_4096.Disconnect(var_connection_4096) end)
            end
            table.clear(State.skipEndScreenConns)
        end

        local fn_ParryHelper_6254
        do
            ----------------------------------------------------------------------
            -- AUTO PARRY V4
            -- Reference engine derived from the working ZINKA parry mechanism.
            -- Key behavior:
            --   1) Detection radius is ONLY an arming/detection envelope.
            --   2) Parry timing follows animation hit point (33%) - RTT*2.
            --   3) The final decision is re-checked at execution time.
            --   4) Final hit range is independent from Parry Radius.
            --   5) Killer-facing + clear path are used as geometric confirmation.
            --   6) Direct Parry controller + parry RemoteEvent are both supported,
            --      matching the reference's successful execution path.
            --   7) Auto-facing is intentionally NOT applied in this baseline build;
            --      first reproduce the reference behavior before adding rotation.
            ----------------------------------------------------------------------

            local AUTO_PARRY_HIT_AT = 0.33
            local AUTO_PARRY_HIT_RANGE = 6.0
            local AUTO_PARRY_DETECT_PADDING = 3.0
            local AUTO_PARRY_KILLER_DOT = 0.72
            local AUTO_PARRY_PING_MULTIPLIER = 2.0
            local AUTO_PARRY_MIN_DELAY = 0.05
            local AUTO_PARRY_PING_MAX = 1.0
            local AUTO_PARRY_EXECUTION_LOCK = 0.10
            local AUTO_PARRY_PREDICT_WINDOW = 0.08
            local AUTO_PARRY_RESULT_LOCK = 0.45

            local attackById = {
                ["113255068724446"] = true, ["74968262036854"] = true,
                ["135002183282873"] = true, ["121216847022485"] = true,
                ["117042998468241"] = true, ["133963973694098"] = true,
                ["110355011987939"] = true, ["139369275981139"] = true,
                ["118907603246885"] = true, ["78432063483146"] = true,
                ["122812055447896"] = true, ["78935059863801"] = true,
                ["129784271201071"] = true, ["132817836308238"] = true,
                ["105374834496520"] = true, ["111920872708571"] = true,
                ["115244153053858"] = true, ["130593238885843"] = true,
                ["138720291317243"] = true,
            }

            local nonAttackById = {
                ["110360975271091"] = true, ["111229698330816"] = true,
                ["125750702"] = true, ["180436334"] = true,
                ["182393478"] = true, ["178130996"] = true,
                ["135181748009911"] = true, ["102055678391920"] = true,
                ["135403091566760"] = true, ["133881825716964"] = true,
                ["78165980406995"] = true, ["104689417033027"] = true,
                ["110850539331763"] = true, ["130012819736632"] = true,
            }

            local attackNameHints = {
                "attack", "lunge", "swing", "slash", "strike", "stab", "hit", "m1", "m2",
                "spear", "throw", "flask", "leap", "charge", "cleave", "chop", "slam",
                "sweep", "bash", "smash", "reap", "swipe", "pound",
            }

            local ignoreNameHints = {
                "grab", "carry", "hook", "pickup", "idle", "walk", "run", "vault", "break",
                "kick", "pursuit", "corrupt", "inject", "activate", "stalk", "emote", "taunt", "reload",
            }

            local controllerCache = nil
            local controllerCacheAt = 0
            local parryRemote = nil
            local parryRemoteResolved = false
            local lastParryAt = -math.huge
            local lastParryResultAt = -math.huge
            local pendingByCharacter = {}
            local TriggerSmoothFace

            local function GetParryRemote()
                if parryRemoteResolved then
                    return parryRemote
                end
                parryRemoteResolved = true
                pcall(function()
                    local remotes = ReplicatedStorage:FindFirstChild("Remotes")
                    local items = remotes and remotes:FindFirstChild("Items")
                    local dagger = items and items:FindFirstChild("Parrying Dagger")
                    local remote = dagger and dagger:FindFirstChild("parry")
                    if remote and remote:IsA("RemoteEvent") then
                        parryRemote = remote
                    end
                end)
                return parryRemote
            end

            local function FindParryController(forceRefresh)
                if not forceRefresh and controllerCache and (os.clock() - controllerCacheAt) < 2 then
                    return controllerCache
                end
                controllerCache = nil
                controllerCacheAt = os.clock()

                if typeof(getgc) ~= "function" then
                    return nil
                end

                local ok, objects = pcall(getgc, true)
                if not ok or type(objects) ~= "table" then
                    return nil
                end

                for _, obj in ipairs(objects) do
                    if type(obj) == "table" then
                        local playerValue = rawget(obj, "player")
                        local parryEvent = rawget(obj, "parryEvent")
                        local resolving = rawget(obj, "isParryResolving")
                        local parryMethod = rawget(obj, "Parry") or obj.Parry
                        if playerValue == LocalPlayer and parryEvent ~= nil and resolving ~= nil and type(parryMethod) == "function" then
                            controllerCache = obj
                            return obj
                        end
                    end
                end
                return nil
            end

            local function GetNetworkSeconds()
                local value = 0.065
                pcall(function()
                    value = tonumber(LocalPlayer:GetNetworkPing()) or value
                end)
                return math.clamp(value, 0.0, AUTO_PARRY_PING_MAX)
            end

            local function CanExecuteParry()
                if not State.autoParryEnabled then
                    return false
                end

                local now = tick()
                if now - lastParryAt < AUTO_PARRY_EXECUTION_LOCK then
                    return false
                end
                if now - lastParryResultAt < AUTO_PARRY_RESULT_LOCK then
                    return false
                end

                local controller = FindParryController(false)
                if controller then
                    if rawget(controller, "isParryOnCooldown") == true then
                        return false
                    end
                    if rawget(controller, "isParryResolving") == true then
                        return false
                    end
                end

                local playerCharacter = LocalPlayer.Character
                if not playerCharacter then
                    return false
                end
                if LocalPlayer:GetAttribute("EquippedItem") ~= "Parrying Dagger" then
                    return false
                end
                if LocalPlayer:GetAttribute("IsDead") then
                    return false
                end
                if playerCharacter:GetAttribute("IsCarried") or playerCharacter:GetAttribute("IsHooked") then
                    return false
                end
                if CollectionService:HasTag(playerCharacter, "Silenced") then
                    return false
                end

                return true
            end

            local function FireParry()
                if not CanExecuteParry() then
                    return false
                end

                local now = tick()
                lastParryAt = now

                local fired = false
                local controller = FindParryController(false)
                if controller then
                    pcall(function()
                        controller:Parry()
                        fired = true
                    end)
                end

                local remote = GetParryRemote()
                if remote then
                    pcall(function()
                        remote:FireServer()
                        fired = true
                    end)
                end

                if not fired then
                    -- UI/input fallback, matching the reference script's fallback path.
                    pcall(function()
                        local survivorGui = PlayerGui:FindFirstChild("Survivor-mob")
                        local controls = survivorGui and survivorGui:FindFirstChild("Controls")
                        local mobileButton = controls and controls:FindFirstChild("Gui-mob")
                        if mobileButton and mobileButton:IsA("ImageButton") and typeof(firesignal) == "function" then
                            firesignal(mobileButton.MouseButton1Down)
                            task.defer(function()
                                if mobileButton.Parent then
                                    firesignal(mobileButton.MouseButton1Up)
                                end
                            end)
                            fired = true
                        end
                    end)
                end

                if fired then
                    return true
                end

                lastParryAt = -math.huge
                return false
            end

            task.spawn(function()
                pcall(function()
                    local remotes = ReplicatedStorage:WaitForChild("Remotes", 5)
                    local items = remotes and remotes:WaitForChild("Items", 5)
                    local dagger = items and items:WaitForChild("Parrying Dagger", 5)
                    local resultRemote = dagger and dagger:WaitForChild("parryResult", 5)
                    if resultRemote and resultRemote:IsA("RemoteEvent") then
                        resultRemote.OnClientEvent:Connect(function(success)
                            lastParryResultAt = tick()
                            if State.autoParryDebug then
                                Notify("Auto Parry", success and "PARRY HIT" or "PARRY MISS", 1)
                            end
                        end)
                    end
                end)
            end)

            local function IsAttackTrack(track)
                if not track or not track.Animation then
                    return false
                end

                local animation = track.Animation
                local id = tostring(animation.AnimationId or ""):match("%d+")
                if id then
                    if nonAttackById[id] then
                        return false
                    end
                    if attackById[id] then
                        return true
                    end
                end

                local name = tostring(animation.Name or ""):lower():gsub("%s+", "")
                if name == "lungehold" or name:find("lungehold", 1, true) then
                    return true
                end

                for _, ignored in ipairs(ignoreNameHints) do
                    if name:find(ignored, 1, true) then
                        return false
                    end
                end
                for _, hint in ipairs(attackNameHints) do
                    if name:find(hint, 1, true) then
                        return true
                    end
                end

                return false
            end

            local function GetDistanceToKiller(killerCharacter)
                local playerCharacter = LocalPlayer.Character
                local playerRoot = playerCharacter and playerCharacter:FindFirstChild("HumanoidRootPart")
                local killerRoot = killerCharacter and killerCharacter:FindFirstChild("HumanoidRootPart")
                if not playerRoot or not killerRoot then
                    return math.huge, nil, nil
                end
                return (killerRoot.Position - playerRoot.Position).Magnitude, playerRoot, killerRoot
            end

            local function KillerFacesPlayer(killerRoot, playerRoot)
                if not killerRoot or not playerRoot then
                    return false, -1
                end
                local delta = playerRoot.Position - killerRoot.Position
                local horizontal = Vector3.new(delta.X, 0, delta.Z)
                if horizontal.Magnitude <= 0.05 then
                    return true, 1
                end
                horizontal = horizontal.Unit
                local forward = Vector3.new(killerRoot.CFrame.LookVector.X, 0, killerRoot.CFrame.LookVector.Z)
                if forward.Magnitude <= 0.05 then
                    return false, -1
                end
                forward = forward.Unit
                return forward:Dot(horizontal) > AUTO_PARRY_KILLER_DOT, forward:Dot(horizontal)
            end

            local function HasClearPath(killerCharacter, playerRoot, killerRoot)
                if not killerCharacter or not playerRoot or not killerRoot then
                    return false
                end

                local params = RaycastParams.new()
                params.FilterType = Enum.RaycastFilterType.Exclude
                params.FilterDescendantsInstances = {killerCharacter, LocalPlayer.Character}
                params.IgnoreWater = true

                local startPos = killerRoot.Position
                local delta = playerRoot.Position - startPos
                local length = delta.Magnitude
                if length <= 0.05 then
                    return true
                end

                local hit = workspace:Raycast(startPos, delta, params)
                if hit and hit.Instance and hit.Instance:IsA("BasePart") and hit.Instance.CanCollide ~= false then
                    return false
                end

                return true
            end

            local function IsActuallyInHitRange(killerCharacter, allowPrediction)
                local distance, playerRoot, killerRoot = GetDistanceToKiller(killerCharacter)
                if not playerRoot or not killerRoot then
                    return false, distance, 0
                end

                if distance <= AUTO_PARRY_HIT_RANGE then
                    return true, distance, 0
                end

                if not allowPrediction or distance > AUTO_PARRY_HIT_RANGE + 3 then
                    return false, distance, 0
                end

                local killerVelocity = Vector3.new(killerRoot.AssemblyLinearVelocity.X, 0, killerRoot.AssemblyLinearVelocity.Z)
                local playerVelocity = Vector3.new(playerRoot.AssemblyLinearVelocity.X, 0, playerRoot.AssemblyLinearVelocity.Z)
                local toPlayer = Vector3.new(
                    playerRoot.Position.X - killerRoot.Position.X,
                    0,
                    playerRoot.Position.Z - killerRoot.Position.Z
                )

                if toPlayer.Magnitude <= 0.05 then
                    return true, distance, 0
                end

                local closing = math.max(0, (killerVelocity - playerVelocity):Dot(toPlayer.Unit))
                local predictedDistance = distance - closing * AUTO_PARRY_PREDICT_WINDOW

                local facing, dot = KillerFacesPlayer(killerRoot, playerRoot)
                if predictedDistance <= AUTO_PARRY_HIT_RANGE and facing and HasClearPath(killerCharacter, playerRoot, killerRoot) then
                    return true, predictedDistance, dot
                end

                return false, distance, dot
            end

            local function ScheduleAttack(killerCharacter, track)
                if not State.autoParryEnabled then
                    return
                end
                if not killerCharacter or not killerCharacter.Parent or not track then
                    return
                end
                if pendingByCharacter[killerCharacter] then
                    return
                end

                local distance = GetDistanceToKiller(killerCharacter)
                if distance > State.parryRadius + AUTO_PARRY_DETECT_PADDING then
                    return
                end

                local animationName = tostring(track.Animation and track.Animation.Name or ""):lower():gsub("%s+", "")
                local isLunge = animationName:find("lungehold", 1, true) ~= nil

                local delayTime = AUTO_PARRY_MIN_DELAY
                if not isLunge then
                    local length = tonumber(track.Length) or 0
                    local position = tonumber(track.TimePosition) or 0
                    local remaining = length * AUTO_PARRY_HIT_AT - position
                    if length > 0.05 then
                        remaining = math.max(0, remaining)
                        local pingLead = GetNetworkSeconds() * AUTO_PARRY_PING_MULTIPLIER
                        delayTime = math.max(AUTO_PARRY_MIN_DELAY, remaining - pingLead)
                    end
                end

                pendingByCharacter[killerCharacter] = true
                task.delay(delayTime, function()
                    pendingByCharacter[killerCharacter] = nil

                    if not State.autoParryEnabled then
                        return
                    end
                    if not killerCharacter or not killerCharacter.Parent then
                        return
                    end

                    -- Critical: State.parryRadius is NOT the final trigger.
                    -- We only fire when the killer is actually in/entering hit range.
                    local inRange = IsActuallyInHitRange(killerCharacter, true)
                    if not inRange then
                        return
                    end

                    TriggerSmoothFace(killerCharacter)
                    FireParry()
                end)
            end

            local connectedKillerHumanoids = {}

            ----------------------------------------------------------------------
            -- SMOOTH FACE
            -- Event-driven only: it activates when an actual killer attack reaches
            -- the same hit-reaction gate used by Auto Parry. It does NOT track or
            -- face nearby killers continuously.
            -- 360-degree reaction is provided by attack-event detection; there is
            -- no angle restriction on the face reaction itself.
            -- The target position is snapshotted once per reaction to prevent
            -- continuous orbiting/spinning around a moving killer.
            ----------------------------------------------------------------------
            local smoothFacePreviousAutoRotate = true
            local smoothFaceWasApplied = false
            local smoothFaceTargetPosition = nil
            local smoothFaceActiveUntil = 0
            local SMOOTH_FACE_DURATION = 0.20

            local function IsLocalCharacterBlockedForSmoothFace()
                local character = LocalPlayer.Character
                local humanoid = character and character:FindFirstChildOfClass("Humanoid")
                if not character or not humanoid or humanoid.Health <= 0 then
                    return true
                end
                if LocalPlayer:GetAttribute("IsDead") then
                    return true
                end

                local blockedAttributes = {
                    "Knocked", "isDowned", "isKnocked", "downed", "knockdown", "isKnockdown",
                    "IsCarried", "IsHooked",
                }
                local root = character:FindFirstChild("HumanoidRootPart")
                local checkObjects = {character, root, humanoid}
                for _, object in ipairs(checkObjects) do
                    if object then
                        for _, attributeName in ipairs(blockedAttributes) do
                            if object:GetAttribute(attributeName) then
                                return true
                            end
                        end
                    end
                end
                if humanoid.PlatformStand then
                    return true
                end
                return false
            end

            local function StopSmoothFace()
                smoothFaceActiveUntil = 0
                smoothFaceTargetPosition = nil
                if smoothFaceWasApplied then
                    pcall(function()
                        local character = LocalPlayer.Character
                        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
                        if humanoid then
                            humanoid.AutoRotate = smoothFacePreviousAutoRotate
                        end
                    end)
                    smoothFaceWasApplied = false
                end
            end

            TriggerSmoothFace = function(killerCharacter)
                if not State.autoParryEnabled or not State.autoParryAutoFace then
                    return
                end
                if IsLocalCharacterBlockedForSmoothFace() then
                    StopSmoothFace()
                    return
                end

                local character = LocalPlayer.Character
                local root = character and character:FindFirstChild("HumanoidRootPart")
                local killerRoot = killerCharacter and killerCharacter:FindFirstChild("HumanoidRootPart")
                if not root or not killerRoot then
                    return
                end

                local delta = killerRoot.Position - root.Position
                local flat = Vector3.new(delta.X, 0, delta.Z)
                if flat.Magnitude <= 0.05 then
                    return
                end

                -- Small one-shot lead, captured at reaction time. This is not a
                -- continuously updated target, so it cannot produce orbiting.
                local lead = math.clamp(tonumber(State.autoParryFaceLead) or 0.08, 0, 0.12)
                local velocity = killerRoot.AssemblyLinearVelocity
                smoothFaceTargetPosition = killerRoot.Position + Vector3.new(
                    velocity.X * lead,
                    0,
                    velocity.Z * lead
                )
                smoothFaceActiveUntil = tick() + SMOOTH_FACE_DURATION
            end

            local function UpdateSmoothFace(dt)
                if not State.autoParryEnabled or not State.autoParryAutoFace then
                    StopSmoothFace()
                    return
                end
                if IsLocalCharacterBlockedForSmoothFace() then
                    StopSmoothFace()
                    return
                end
                if tick() >= smoothFaceActiveUntil or not smoothFaceTargetPosition then
                    StopSmoothFace()
                    return
                end

                local character = LocalPlayer.Character
                local humanoid = character and character:FindFirstChildOfClass("Humanoid")
                local root = character and character:FindFirstChild("HumanoidRootPart")
                if not humanoid or not root then
                    StopSmoothFace()
                    return
                end

                local flatDirection = Vector3.new(
                    smoothFaceTargetPosition.X - root.Position.X,
                    0,
                    smoothFaceTargetPosition.Z - root.Position.Z
                )
                if flatDirection.Magnitude <= 0.05 then
                    StopSmoothFace()
                    return
                end

                if not smoothFaceWasApplied then
                    smoothFacePreviousAutoRotate = humanoid.AutoRotate
                    smoothFaceWasApplied = true
                end
                pcall(function() humanoid.AutoRotate = false end)

                local smoothness = math.clamp(tonumber(State.autoParryFaceSmoothness) or 14, 2, 30)
                local alpha = 1 - math.exp(-smoothness * math.max(tonumber(dt) or 0, 0))
                local desired = CFrame.lookAt(root.Position, root.Position + flatDirection.Unit)
                pcall(function()
                    root.CFrame = root.CFrame:Lerp(desired, math.clamp(alpha, 0, 1))
                end)
            end

            local function RegisterKiller(player, character)
                if not player or player == LocalPlayer or not character then
                    return
                end
                if player.Team and player.Team.Name:lower():find("killer", 1, true) == nil then
                    return
                end

                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if not humanoid or connectedKillerHumanoids[humanoid] then
                    return
                end

                local animator = humanoid:FindFirstChildOfClass("Animator")
                local function onAnimation(track)
                    if not State.autoParryEnabled then
                        return
                    end
                    if not IsAttackTrack(track) then
                        return
                    end

                    _G.BOLONG_KILLER_SWING = tick()

                    -- SmoothFace reacts only to an attack that is actually inside
                    -- the real hit range. <= HIT_RANGE is intentionally angle-free,
                    -- giving the requested 360-degree side/back response.
                    local actuallyInRange = IsActuallyInHitRange(character, false)
                    if actuallyInRange then
                        TriggerSmoothFace(character)
                    end

                    ScheduleAttack(character, track)
                end

                connectedKillerHumanoids[humanoid] = {
                    humanoid = humanoid,
                    anim = animator,
                    humanoidConn = humanoid.AnimationPlayed:Connect(onAnimation),
                    animConn = animator and animator.AnimationPlayed:Connect(onAnimation) or nil,
                }

                humanoid.AncestryChanged:Connect(function()
                    if not humanoid.Parent then
                        local entry = connectedKillerHumanoids[humanoid]
                        if entry then
                            pcall(function() entry.humanoidConn:Disconnect() end)
                            pcall(function() if entry.animConn then entry.animConn:Disconnect() end end)
                        end
                        connectedKillerHumanoids[humanoid] = nil
                    end
                end)
            end

            local function RefreshKillerConnections()
                for _, player in ipairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer then
                        RegisterKiller(player, player.Character)
                    end
                end
            end

            RefreshKillerConnections()
            Players.PlayerAdded:Connect(function(player)
                player.CharacterAdded:Connect(function(character)
                    task.wait(0.5)
                    RegisterKiller(player, character)
                end)
            end)
            Players.PlayerRemoving:Connect(function()
                task.defer(RefreshKillerConnections)
            end)

            task.spawn(function()
                while true do
                    if State.autoParryEnabled then
                        RefreshKillerConnections()
                    end
                    task.wait(0.5)
                end
            end)

            RunService.RenderStepped:Connect(UpdateSmoothFace)

            RunService.RenderStepped:Connect(function()
                if not State.autoParryEnabled then
                    StopSmoothFace()
                    return
                end
                for humanoid, entry in pairs(connectedKillerHumanoids) do
                    if not humanoid or not humanoid.Parent then
                        if entry then
                            pcall(function() entry.humanoidConn:Disconnect() end)
                            pcall(function() if entry.animConn then entry.animConn:Disconnect() end end)
                        end
                        connectedKillerHumanoids[humanoid] = nil
                    end
                end
            end)

            ----------------------------------------------------------------------
            -- PARRY RADIUS ESP
            -- Mechanism copied from main (9).lua: 56 segments, exact segment
            -- geometry, Y-offset, Heartbeat update and killer-state color change.
            -- Adaptation: BolongHub's existing State.parryRadius and toggle are
            -- retained; no other feature is touched.
            ----------------------------------------------------------------------
            local parryRadiusRingModel = Instance.new("Model")
            parryRadiusRingModel.Name = "ZINKA_ParryRing"
            local parryRadiusRingParts = {}
            local parryRadiusRingRadius = nil
            local parryRadiusRingInRange = nil

            local function cleanupParryRadiusRing(radius)
                for _, part in ipairs(parryRadiusRingParts) do
                    if part and part.Parent then
                        part:Destroy()
                    end
                end
                parryRadiusRingParts = {}

                radius = tonumber(radius) or 14
                local segmentCount = 56
                local segmentLength = (2 * math.pi * radius / segmentCount) * 1.15

                for i = 1, segmentCount do
                    local angle = (i / segmentCount) * math.pi * 2
                    local position = Vector3.new(
                        math.cos(angle) * radius,
                        0,
                        math.sin(angle) * radius
                    )
                    local tangent = Vector3.new(
                        -math.sin(angle),
                        0,
                        math.cos(angle)
                    )

                    local part = Instance.new("Part")
                    part.Anchored = true
                    part.CanCollide = false
                    part.CanQuery = false
                    part.CanTouch = false
                    part.Material = Enum.Material.Neon
                    part.Color = Color3.fromRGB(70, 130, 165)
                    part.Transparency = 0.5
                    part.Size = Vector3.new(0.28, 0.28, segmentLength)
                    part.CFrame = CFrame.lookAt(position, position + tangent)
                    part.Parent = parryRadiusRingModel
                    parryRadiusRingParts[i] = part
                end

                parryRadiusRingModel.WorldPivot = CFrame.new(0, 0, 0)
                parryRadiusRingRadius = radius
            end

            cleanupParryRadiusRing(tonumber(State.parryRadius) or 14)

            local function GetActiveKillerForRadiusESP()
                local getter = rawget(_G, "__ZINKA_KILLERCHAR")
                if type(getter) == "function" then
                    local ok, character = pcall(getter)
                    if ok and character and character.Parent then
                        return character
                    end
                end

                -- BolongHub has no guaranteed __ZINKA_KILLERCHAR provider, so use
                -- the closest registered killer only as a compatibility fallback.
                local playerCharacter = LocalPlayer.Character
                local playerRoot = playerCharacter and playerCharacter:FindFirstChild("HumanoidRootPart")
                if not playerRoot then
                    return nil
                end

                local nearestCharacter = nil
                local nearestDistance = math.huge
                for killerCharacter, entry in pairs(State.killerCharacters) do
                    local killerRoot = killerCharacter and killerCharacter:FindFirstChild("HumanoidRootPart")
                    local killerHumanoid = killerCharacter and killerCharacter:FindFirstChildOfClass("Humanoid")
                    if killerRoot and killerHumanoid and killerHumanoid.Health > 0 then
                        local distance = (killerRoot.Position - playerRoot.Position).Magnitude
                        if distance < nearestDistance then
                            nearestDistance = distance
                            nearestCharacter = killerCharacter
                        end
                    end
                end
                return nearestCharacter
            end

            local parryRadiusEspConnection
            function fn_ParryHelper_6254(enabled)
                if parryRadiusEspConnection then
                    parryRadiusEspConnection:Disconnect()
                    parryRadiusEspConnection = nil
                end

                if not enabled then
                    parryRadiusRingModel.Parent = nil
                    parryRadiusRingInRange = nil
                    return
                end

                local initialRadius = tonumber(State.parryRadius) or 14
                if initialRadius ~= parryRadiusRingRadius then
                    cleanupParryRadiusRing(initialRadius)
                end

                parryRadiusEspConnection = RunService.Heartbeat:Connect(function()
                    local targetCharacter_p = tonumber(State.parryRadius) or 14
                    if targetCharacter_p ~= parryRadiusRingRadius then
                        cleanupParryRadiusRing(targetCharacter_p)
                        parryRadiusRingInRange = nil
                    end

                    local childInstance_ba = LocalPlayer.Character
                    local childInstance_bb = childInstance_ba and childInstance_ba:FindFirstChild("HumanoidRootPart")
                    if (not childInstance_bb)
                        or (LocalPlayer.Team and LocalPlayer.Team.Name == "Killer")
                        or not State.parryRadiusEspEnabled then
                        if parryRadiusRingModel.Parent then
                            parryRadiusRingModel.Parent = nil
                        end
                        parryRadiusRingInRange = nil
                        return
                    end

                    if not parryRadiusRingModel.Parent then
                        parryRadiusRingModel.Parent = workspace
                    end

                    parryRadiusRingModel:PivotTo(CFrame.new(
                        childInstance_bb.Position.X,
                        childInstance_bb.Position.Y - 2.8,
                        childInstance_bb.Position.Z
                    ))

                    local killerCharacter = GetActiveKillerForRadiusESP()
                    local killerRoot = killerCharacter and killerCharacter:FindFirstChild("HumanoidRootPart")
                    local textColor_aq = killerRoot
                        and (killerRoot.Position - childInstance_bb.Position).Magnitude <= targetCharacter_p
                        or false

                    if textColor_aq == parryRadiusRingInRange then
                        return
                    end
                    parryRadiusRingInRange = textColor_aq

                    local textColor_ar = textColor_aq
                        and Color3.fromRGB(180, 55, 70)
                        or Color3.fromRGB(70, 130, 165)
                    for _, textColor_cv in ipairs(parryRadiusRingParts) do
                        if textColor_cv and textColor_cv.Parent then
                            textColor_cv.Color = textColor_ar
                        end
                    end
                end)
            end
        end

        local function fn_ServerHandler_b0c3()
            for _, var_child_897f in ipairs(State.state_espHook_4896.Gates) do
                ApplyGhostGateToObj(var_child_897f, State.state_flowstateCooldownS_9e95)
            end
        end

        local function fn_ServerHelper_97a6()
            local char = LocalPlayer.Character
            local var_rootPart_186c = char and char.FindFirstChild(char,"HumanoidRootPart")
            if not var_rootPart_186c then Notify("Teleport", "Karakter tidak ditemukan!", 2)
            return end
            local var_rootPart_3a1a = workspace.FindFirstChild(workspace,"Fininshline", true)
            if not var_rootPart_3a1a then Notify("Teleport", "Fininshline tidak ditemukan di map!", 2)
            return end
            local var_vector_6f23 = var_rootPart_3a1a.Position
            local var_vector_b062 = RaycastParams.new()
            var_vector_b062.FilterType = Enum.RaycastFilterType.Exclude
            var_vector_b062.FilterDescendantsInstances = {char, var_rootPart_3a1a.Parent}
            local var_vector_b94b = nil
            local var_vector_dac8 = var_vector_6f23 + Vector3.new(0, (10.0), 0)
            local var_vector_33df = workspace.Raycast(workspace,var_vector_dac8, Vector3.new(0, -30, (0.0)), var_vector_b062)
            if var_vector_33df then
                local var_vector_dd30 = workspace.Raycast(workspace,var_vector_33df.Position + Vector3.new(0, 5, 0), Vector3.new(0, 5, (0.0)), var_vector_b062)
                if not var_vector_dd30 then var_vector_b94b = var_vector_33df.Position + Vector3.new(0, 3, (0.0)) end
            end
            if var_vector_b94b then
                pcall(function() var_rootPart_186c.CFrame = CFrame.new(var_vector_b94b) end)
            else
                pcall(function() var_rootPart_186c.CFrame = var_rootPart_3a1a.CFrame end)
            end
        end

        local fn_ServerHandler_d7d9
        do
            local var_animationId_2f5b = "80411309607666"
            local function fn_ServerHelper_3128(var_animationId_e8d4)
                if not var_animationId_e8d4 then return "" end
                return tostring(var_animationId_e8d4):match("%d+") or ""
            end
            local function fn_ServerHelper_71af()
                local var_playerGui_9c23 = LocalPlayer.FindFirstChild(LocalPlayer,"PlayerGui")
                if not var_playerGui_9c23 then return nil end
                local var_playerGui_4796 = var_playerGui_9c23.FindFirstChild(var_playerGui_9c23,"Survivor-mob")
                if not var_playerGui_4796 then return nil end
                local var_playerGui_e83b = var_playerGui_4796.FindFirstChild(var_playerGui_4796,"Controls")
                if not var_playerGui_e83b then return nil end
                local var_connection_a646 = var_playerGui_e83b.FindFirstChild(var_playerGui_e83b,"crouch")
                if var_connection_a646 and var_connection_a646.IsA(var_connection_a646,"GuiButton") then return var_connection_a646 end
                return nil
            end
            function fn_ServerHandler_d7d9(var_rootPart_42db)
                if State.var_success_f48f ~= var_rootPart_42db then
                    State.var_success_f48f = var_rootPart_42db
                    local char = LocalPlayer.Character
                    if char then
                        char.SetAttribute(char,"Crouchingserver", var_rootPart_42db)
                        char.SetAttribute(char,"Crouching", var_rootPart_42db)
                    end
                    pcall(function()
                        ReplicatedStorage.Remotes.Mechanics.ChangeAttribute.FireServer(ReplicatedStorage.Remotes.Mechanics.ChangeAttribute,"Crouchingserver", var_rootPart_42db)
                        ReplicatedStorage.Remotes.Mechanics.ChangeAttribute.FireServer(ReplicatedStorage.Remotes.Mechanics.ChangeAttribute,"Crouching", var_rootPart_42db)
                    end)
                    local var_remote_8b54 = not UserInputService.TouchEnabled and UserInputService.KeyboardEnabled
                    if var_remote_8b54 then
                        VirtualInputManager.SendKeyEvent(VirtualInputManager,var_rootPart_42db, Enum.KeyCode.C, false, game)
                        VirtualInputManager.SendKeyEvent(VirtualInputManager,var_rootPart_42db, Enum.KeyCode.LeftControl, false, game)
                    else
                        local var_connection_a646 = fn_ServerHelper_71af()
                        if var_connection_a646 and type(firesignal) == "function" then
                            if var_rootPart_42db then
                                firesignal(var_connection_a646.MouseButton1Down)
        do local var_button_42e3=113%96 end
                                if var_connection_a646.MouseButton1Click then firesignal(var_connection_a646.MouseButton1Click) end
                            else
                                firesignal(var_connection_a646.MouseButton1Up)
                                if var_connection_a646.MouseButton1Click then firesignal(var_connection_a646.MouseButton1Click) end
                            end
                        end
                    end
                end
            end
            local function fn_CreateHelper_cba8(char)
                if not char then return end
                local var_humanoid_3937 = char.FindFirstChildOfClass(char,"Humanoid")
                if not var_humanoid_3937 then return end
                if State.autoCrouchAnimConns[var_humanoid_3937] then return end
                State.autoCrouchAnimConns[var_humanoid_3937] = var_humanoid_3937.AnimationPlayed.Connect(var_humanoid_3937.AnimationPlayed,function(track)
                    if not Config.cfg_boostMultiplier_5533 then return end
                    local var_animationId_3e25 = track.Animation
                    if var_animationId_3e25 then
                        local var_animationId_7bea = fn_ServerHelper_3128(var_animationId_3e25.AnimationId)
                        if var_animationId_7bea == var_animationId_2f5b then
                            State.autoCrouchActiveSlashers[char] = true
                            track.Stopped.Connect(track.Stopped,function()
                                task.wait(0.2)
                                State.autoCrouchActiveSlashers[char] = nil
                            end)
                        end
                    end
                end)
                 var_humanoid_3937.Died.Connect(var_humanoid_3937.Died,function()
                  State.autoCrouchActiveSlashers[char] = nil


                   if State.autoCrouchAnimConns[var_humanoid_3937] then
                     State.autoCrouchAnimConns[var_humanoid_3937].Disconnect(State.autoCrouchAnimConns[var_humanoid_3937])
                     State.autoCrouchAnimConns[var_humanoid_3937] = nil
                   end
                end)
            end
            RegisterTask("AutoCrouch", 0, function()
                if not Config.cfg_boostMultiplier_5533 then return end
                local var_rootPart_f536 = LocalPlayer.Character
                if not var_rootPart_f536 then return end
                local var_rootPart_f542 = var_rootPart_f536.FindFirstChild(var_rootPart_f536,"HumanoidRootPart")
                if not var_rootPart_f542 then return end
                local var_player_20e0 = false
                for var_rootPart_7b16, _ in pairs(State.autoCrouchActiveSlashers) do
                    if var_rootPart_7b16 and var_rootPart_7b16.Parent then
                        local var_rootPart_8dbd = var_rootPart_7b16.FindFirstChild(var_rootPart_7b16,"HumanoidRootPart")
                        local var_rootPart_6e8a = var_rootPart_7b16.FindFirstChildOfClass(var_rootPart_7b16,"Humanoid")
                        if var_rootPart_8dbd and var_rootPart_6e8a and var_rootPart_6e8a.Health > (0.0) then
                            local dist = (var_rootPart_8dbd.Position - var_rootPart_f542.Position).Magnitude
                            if dist <= Config.cfg_countSpeedPerks_b7f3 then
                                var_player_20e0 = true
                                break
                            end
                        end
                    else
                        State.autoCrouchActiveSlashers[var_rootPart_7b16] = nil
                    end
                end
                fn_ServerHandler_d7d9(var_player_20e0)
            end)
            for _, player in ipairs(Players.GetPlayers(Players)) do
                if player ~= LocalPlayer and player.Character then fn_CreateHelper_cba8(player.Character) end
                if player ~= LocalPlayer then
                    player.CharacterAdded.Connect(player.CharacterAdded,function(newChar)
                        task.wait(1)
                        fn_CreateHelper_cba8(newChar)
                    end)
                end
            end
            Players.PlayerAdded.Connect(Players.PlayerAdded,function(player)
                player.CharacterAdded.Connect(player.CharacterAdded,function(newChar)
                    task.wait((1.0))
                    if Config.cfg_boostMultiplier_5533 then fn_CreateHelper_cba8(newChar) end
                end)
            end)
        end

        local function fn_CreateHelper_9092(input)
            if not input or input.gsub(input,"%s+", "") == "" then return end
            input = input.gsub(input,"%s+", "")

            task.spawn(function()

                local var_child_99ee = tonumber(input)
                if not var_child_99ee then
                    local var_humanoid_cc32 = pcall(function() var_child_99ee = Players.GetUserIdFromNameAsync(Players,input) end)
                    if not var_humanoid_cc32 or not var_child_99ee then return end
                end

                local char = LocalPlayer.Character
                local var_child_4158 = char and char.FindFirstChildOfClass(char,"Humanoid")
                if not char or not var_child_4158 then return end


                local var_descendant_fe40 = Players.GetHumanoidDescriptionFromUserId(Players,var_child_99ee)
                if not var_descendant_fe40 then return end

                local var_child_ef1b = Players.CreateHumanoidModelFromDescription(Players,var_descendant_fe40, var_child_4158.RigType)
                if not var_child_ef1b then return end


                for _, var_instance_5397 in ipairs(char.GetChildren(char)) do
                    if var_instance_5397.IsA(var_instance_5397,"Accessory") or var_instance_5397.IsA(var_instance_5397,"Shirt") or var_instance_5397.IsA(var_instance_5397,"Pants") or var_instance_5397.IsA(var_instance_5397,"ShirtGraphic") or var_instance_5397.IsA(var_instance_5397,"BodyColors") or var_instance_5397.IsA(var_instance_5397,"CharacterMesh") then
                        var_instance_5397.Destroy(var_instance_5397)
                    end
                end
                for _, var_child_b378 in ipairs(char.GetChildren(char)) do
                    if var_child_b378.IsA(var_child_b378,"BasePart") then
                        for _, var_instance_4e7f in ipairs(var_child_b378.GetChildren(var_child_b378)) do
                            if var_instance_4e7f.IsA(var_instance_4e7f,"SpecialMesh") or var_instance_4e7f.IsA(var_instance_4e7f,"Decal") or var_instance_4e7f.IsA(var_instance_4e7f,"Texture") or var_instance_4e7f.IsA(var_instance_4e7f,"SurfaceAppearance") then
                                var_instance_4e7f.Destroy(var_instance_4e7f)
                            end
                        end
                    end
                end


                local var_head_e382 = var_child_ef1b.FindFirstChildOfClass(var_child_ef1b,"BodyColors")
                if var_head_e382 then
                    var_head_e382:Clone().Parent = char
                    local var_child_162c = {
                        ["Head"] = var_head_e382.HeadColor3, ["Torso"] = var_head_e382.TorsoColor3,
                        ["Left Arm"] = var_head_e382.LeftArmColor3, ["Right Arm"] = var_head_e382.RightArmColor3,
                        ["Left Leg"] = var_head_e382.LeftLegColor3, ["Right Leg"] = var_head_e382.RightLegColor3,
                        ["UpperTorso"] = var_head_e382.TorsoColor3, ["LowerTorso"] = var_head_e382.TorsoColor3,
                        ["LeftHand"] = var_head_e382.LeftArmColor3, ["RightHand"] = var_head_e382.RightArmColor3,
                        ["LeftLowerArm"] = var_head_e382.LeftArmColor3, ["RightLowerArm"] = var_head_e382.RightArmColor3,
                        ["LeftUpperArm"] = var_head_e382.LeftArmColor3, ["RightUpperArm"] = var_head_e382.RightArmColor3,
                        ["LeftFoot"] = var_head_e382.LeftLegColor3, ["RightFoot"] = var_head_e382.RightLegColor3,
                        ["LeftLowerLeg"] = var_head_e382.LeftLegColor3, ["RightLowerLeg"] = var_head_e382.RightLegColor3,
                        ["LeftUpperLeg"] = var_head_e382.LeftLegColor3, ["RightUpperLeg"] = var_head_e382.RightLegColor3,
                    }
                    for var_child_cb09, color in pairs(var_child_162c) do
                        local part = char.FindFirstChild(char,var_child_cb09)
                        if part then pcall(function() part.Color = color end) end
                    end
                end

                for _, var_instance_5397 in ipairs(var_child_ef1b.GetChildren(var_child_ef1b)) do
                    if var_instance_5397.IsA(var_instance_5397,"Shirt") or var_instance_5397.IsA(var_instance_5397,"Pants") or var_instance_5397.IsA(var_instance_5397,"ShirtGraphic") or var_instance_5397.IsA(var_instance_5397,"CharacterMesh") then
                        var_instance_5397:Clone().Parent = char
                    end
                end


                for _, var_child_945f in ipairs(var_child_ef1b.GetChildren(var_child_ef1b)) do
                    if var_child_945f.IsA(var_child_945f,"BasePart") then
                        local var_child_b378 = char.FindFirstChild(char,var_child_945f.Name)
                        if var_child_b378 and var_child_b378.IsA(var_child_b378,"BasePart") then
                            if var_child_945f.IsA(var_child_945f,"MeshPart") and var_child_b378.IsA(var_child_b378,"MeshPart") then
                                pcall(function()
                                    var_child_b378.MeshId = var_child_945f.MeshId
                                    var_child_b378.TextureID = var_child_945f.TextureID
                                    var_child_b378.Color = var_child_945f.Color
                                    var_child_b378.Transparency = var_child_945f.Transparency
                                end)
                            end
                            for _, var_instance_4e7f in ipairs(var_child_945f.GetChildren(var_child_945f)) do
                                if var_instance_4e7f.IsA(var_instance_4e7f,"SpecialMesh") or var_instance_4e7f.IsA(var_instance_4e7f,"Decal") or var_instance_4e7f.IsA(var_instance_4e7f,"Texture") or var_instance_4e7f.IsA(var_instance_4e7f,"SurfaceAppearance") then
                                    var_instance_4e7f:Clone().Parent = var_child_b378
                                end
                            end
                        end
                    end
                end


                local function fn_AvatarHelper_8668(acc)
                    local var_child_1309 = acc.Clone(acc)
                    var_child_1309.Parent = char
                    local var_child_b621 = var_child_1309.FindFirstChild(var_child_1309,"Handle")
                    if not var_child_b621 then return end

                    var_child_b621.Anchored = false
                    var_child_b621.CanCollide = false
                    pcall(function() var_child_b621.Massless = true end)


                    for _, var_instance_4e7f in ipairs(var_child_b621.GetChildren(var_child_b621)) do
                        if var_instance_4e7f.IsA(var_instance_4e7f,"Weld") or var_instance_4e7f.IsA(var_instance_4e7f,"WeldConstraint") or var_instance_4e7f.IsA(var_instance_4e7f,"Motor6D") then
                            var_instance_4e7f.Destroy(var_instance_4e7f)
                        end
                    end


                    pcall(function() var_child_4158.AddAccessory(var_child_4158,var_child_1309) end)


                    local var_child_af5e = false
                    for _, var_instance_4e7f in ipairs(var_child_b621.GetChildren(var_child_b621)) do
                        if (var_instance_4e7f.IsA(var_instance_4e7f,"Weld") or var_instance_4e7f.IsA(var_instance_4e7f,"WeldConstraint")) and var_instance_4e7f.Part1 and var_instance_4e7f.Part1.IsDescendantOf(var_instance_4e7f.Part1,char) then
                            var_child_af5e = true
                            break
                        end
                    end


                    if not var_child_af5e then
                        local var_rootPart_93bb = var_child_b621.FindFirstChildOfClass(var_child_b621,"Attachment")
                        local var_child_5bfe = nil
                        local var_rootPart_4795 = nil

                        if var_rootPart_93bb then
                            local var_child_ae3b = char.FindFirstChild(char,var_rootPart_93bb.Name, true)
                            if var_child_ae3b and var_child_ae3b.IsA(var_child_ae3b,"Attachment") then
                                var_child_5bfe = var_child_ae3b.Parent
                                var_rootPart_4795 = var_child_ae3b
                            end
                        end

                        if not var_child_5bfe then var_child_5bfe = char.FindFirstChild(char,"Head") or char.FindFirstChild(char,"HumanoidRootPart") end

                        if var_child_5bfe then
                            if var_rootPart_4795 and var_rootPart_93bb then
                                var_child_b621.CFrame = var_child_5bfe.CFrame * var_rootPart_4795.CFrame * var_rootPart_93bb.CFrame.Inverse(var_rootPart_93bb.CFrame)
                            else
                                var_child_b621.CFrame = var_child_5bfe.CFrame
                            end
                            local var_child_6bd2 = Instance.new("WeldConstraint")
                            var_child_6bd2.Name = "BolongWeld"
                            var_child_6bd2.Part0 = var_child_b621
                            var_child_6bd2.Part1 = var_child_5bfe
                            var_child_6bd2.Parent = var_child_b621
                        end
                    end
                end


                for _, var_instance_5397 in ipairs(var_child_ef1b.GetChildren(var_child_ef1b)) do
                    if var_instance_5397.IsA(var_instance_5397,"Accessory") then
                        pcall(function() fn_AvatarHelper_8668(var_instance_5397) end)
                    end
                end


                var_child_ef1b.Destroy(var_child_ef1b)


                if var_child_99ee then
                    if State.var_userId_f2d0 ~= var_child_99ee then
                        State.var_userId_f2d0 = var_child_99ee
                        State.var_head_ef35 = nil
                        State.var_playerGui_4fab = nil
                    end
                    State.var_userId_b305 = true
                    _EnsureAvatarUiWatchers()
                    _HookAllAvatarSlots()
                    _ApplyCopiedAvatarToUI()
                end
            end)
        end

        local fn_RemoveHandler_b854, restoreLighting, removeVisualEffects, restoreVisualEffects
        do
            local var_child_6c55 = {
                Ambient = Lighting.Ambient,
                OutdoorAmbient = Lighting.OutdoorAmbient,
                ColorShift_Bottom = Lighting.ColorShift_Bottom,
                ColorShift_Top = Lighting.ColorShift_Top,
                Brightness = Lighting.Brightness,
                ClockTime = Lighting.ClockTime,
                GlobalShadows = Lighting.GlobalShadows,
                FogStart = Lighting.FogStart,
                FogEnd = Lighting.FogEnd,
                FogColor = Lighting.FogColor,
                ExposureCompensation = Lighting.ExposureCompensation,
                EnvironmentDiffuseScale = Lighting.EnvironmentDiffuseScale,
                EnvironmentSpecularScale = Lighting.EnvironmentSpecularScale,
            }
            local var_child_5bbb = {}

            function fn_RemoveHandler_b854()
                Lighting.Ambient = Color3.fromRGB(178, 178, 178)
                Lighting.OutdoorAmbient = Color3.fromRGB(178, 178, (178.0))
                Lighting.ColorShift_Bottom = Color3.new(0, 0, 0)
                Lighting.ColorShift_Top = Color3.new(0, (0.0), (0.0))
                Lighting.Brightness = 3
                Lighting.ClockTime = 12
                Lighting.GlobalShadows = false
                Lighting.FogStart = 9e9
                Lighting.FogEnd = 9e9
                Lighting.ExposureCompensation = 0
                Lighting.EnvironmentDiffuseScale = (0.0)
                Lighting.EnvironmentSpecularScale = 0
            end

            function restoreLighting()
                for var_child_5b0e, var_value_d1f9 in pairs(var_child_6c55) do pcall(function() Lighting[var_child_5b0e] = var_value_d1f9 end) end
            end

            function removeVisualEffects()
                var_child_5bbb = {}
                for _, var_child_13fe in ipairs(Lighting.GetChildren(Lighting)) do
                    if var_child_13fe.IsA(var_child_13fe,"PostEffect") or var_child_13fe.IsA(var_child_13fe,"Clouds") or var_child_13fe.IsA(var_child_13fe,"Atmosphere") or var_child_13fe.IsA(var_child_13fe,"Sky") then
                        var_child_5bbb[var_child_13fe] = { Enabled = var_child_13fe.Enabled, Parent = var_child_13fe.Parent }
                        pcall(function()
                            if var_child_13fe.IsA(var_child_13fe,"Sky") then var_child_13fe.Parent = nil else var_child_13fe.Enabled = false end
                        end)
                    end
                end
            end

            function restoreVisualEffects()
                for var_rootPart_cb24, var_vector_6d30 in pairs(var_child_5bbb) do
                    if var_rootPart_cb24 then
                        pcall(function()
                            if var_rootPart_cb24.IsA(var_rootPart_cb24,"Sky") then var_rootPart_cb24.Parent = var_vector_6d30.Parent else var_rootPart_cb24.Enabled = var_vector_6d30.Enabled end
                        end)
                    end
                end
                var_child_5bbb = {}
            end

            RegisterTask("LightingEnforcer", 0.5, function()
                if State.state_hookColor_83ac then fn_RemoveHandler_b854() end
                if State.state_gateColor_965a then
                    for _, var_child_13fe in ipairs(Lighting.GetChildren(Lighting)) do
                        if var_child_13fe.IsA(var_child_13fe,"PostEffect") or var_child_13fe.IsA(var_child_13fe,"Clouds") or var_child_13fe.IsA(var_child_13fe,"Atmosphere") or var_child_13fe.IsA(var_child_13fe,"Sky") then
                            pcall(function()
                                if var_child_13fe.IsA(var_child_13fe,"Sky") then
                                    if var_child_13fe.Parent then var_child_13fe.Parent = nil end
                                else
                                    if var_child_13fe.Enabled then var_child_13fe.Enabled = false end
                                end
                            end)
                        end
                    end
                end
            end)

            Lighting.ChildAdded.Connect(Lighting.ChildAdded,function(var_instance_4e7f)
                if State.state_gateColor_965a then
                    if var_instance_4e7f.IsA(var_instance_4e7f,"PostEffect") or var_instance_4e7f.IsA(var_instance_4e7f,"Clouds") or var_instance_4e7f.IsA(var_instance_4e7f,"Atmosphere") or var_instance_4e7f.IsA(var_instance_4e7f,"Sky") then
                        task.spawn(function()
                            pcall(function()
                                if var_instance_4e7f.IsA(var_instance_4e7f,"Sky") then var_instance_4e7f.Parent = nil else var_instance_4e7f.Enabled = false end
                            end)
                        end)
                    end
                end
            end)
        end

        do
            local function fn_ServerHandler_f115()
                local var_uiCorner_5af2 = Instance.new("ScreenGui")
                var_uiCorner_5af2.Name = "BolongFOV"
                var_uiCorner_5af2.ResetOnSpawn = false
                var_uiCorner_5af2.DisplayOrder = (999999.0)
        do local var_playerGui_24f2=42 end
                pcall(function() var_uiCorner_5af2.Parent = (gethui and gethui() or game.GetService(game,"CoreGui")) end)
                if not var_uiCorner_5af2.Parent then var_uiCorner_5af2.Parent = PlayerGui end
                State.var_basePart_5701 = Instance.new("Frame")
                State.var_basePart_5701.Size = UDim2.new(0, Config.silentAimFovRadius * 2, 0, Config.silentAimFovRadius * 2)
                State.var_basePart_5701.Position = UDim2.new(0.5, 0, 0.5, (0.0))
                State.var_basePart_5701.AnchorPoint = Vector2.new(0.5, 0.5)
                State.var_basePart_5701.BackgroundColor3 = Color3.fromRGB((255.0), 255, 255)
                State.var_basePart_5701.BackgroundTransparency = 1
                State.var_basePart_5701.Visible = false
                State.var_basePart_5701.Parent = var_uiCorner_5af2
                local var_uiCorner_2ff8 = Instance.new("UICorner")
                var_uiCorner_2ff8.CornerRadius = UDim.new(1, 0)
                var_uiCorner_2ff8.Parent = State.var_basePart_5701
                local var_uiCorner_5a7b = Instance.new("UIStroke")
                var_uiCorner_5a7b.Color = NOTIFY_COLOR
                var_uiCorner_5a7b.Thickness = 2
                var_uiCorner_5a7b.Transparency = 0.2
                var_uiCorner_5a7b.Parent = State.var_basePart_5701
            end
            fn_ServerHandler_f115()

            local function fn_ServerHelper_7a1e(char)
                if not char then return nil end
                local var_rootPart_f070 = char.FindFirstChild(char,"UpperTorso")
                if var_rootPart_f070 and var_rootPart_f070.IsA(var_rootPart_f070,"BasePart") then return var_rootPart_f070.Position end
                local var_rootPart_2deb = char.FindFirstChild(char,"Torso")
                if var_rootPart_2deb and var_rootPart_2deb.IsA(var_rootPart_2deb,"BasePart") then return var_rootPart_2deb.Position end
                local var_rootPart_186c = char.FindFirstChild(char,"HumanoidRootPart")
                if var_rootPart_186c then return var_rootPart_186c.Position end
                return nil
            end

            local function fn_ServerHelper_d203()
                local char = LocalPlayer.Character
                if not char then return nil end
                local var_success_abb9, gun = pcall(function()
                    return char:FindFirstChild("Twist of Fate"):FindFirstChild("Right Arm"):FindFirstChild("gun"):FindFirstChild("gun")
                end)
                if var_success_abb9 and gun and gun.IsA(gun,"BasePart") then return gun.Position end
                local var_basePart_d114 = char.FindFirstChild(char,"Right Arm") or char.FindFirstChild(char,"RightHand")
                if var_basePart_d114 then return var_basePart_d114.Position end
                return nil
            end

            local var_remote_67d0 = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Items"):WaitForChild("Twist of Fate"):WaitForChild("Fire")

            local var_remote_e8c6
            pcall(function()
                var_remote_e8c6 = hookmetamethod(game, "__namecall", function(self, ...)
                    local var_connection_513e = getnamecallmethod()
                    if var_connection_513e == "FireServer" and rawequal(self, var_remote_67d0) then
                        local var_remote_afc9 = table.pack(...)
                        if State.silentAimEnabled and typeof(State.var_buffer_e700) == "Vector3" then
                            if var_remote_afc9.n >= 3 and typeof(var_remote_afc9[3]) == "Vector3" then
                                var_remote_afc9[3] = State.var_buffer_e700
                                if State.silentAimLaserEspEnabled then State.var_buffer_2078 = true end
                                local var_buffer_e08b = State.var_rootPart_7d39
                                if var_buffer_e08b then
                                    print(string.format((function() if var_section_a5d6 and buffer then local _bf=buffer.create(92) local _by={91,84,111,70,93,32,102,105,114,101,32,100,105,115,116,61,37,46,48,102,32,116,111,102,61,37,46,50,102,32,108,101,97,100,61,37,46,49,102,32,118,101,108,61,37,46,49,102,32,112,114,101,100,61,37,100,32,100,97,109,112,61,37,100,32,122,105,103,61,37,100,32,100,111,116,61,37,46,50,102,32,112,105,110,103,61,37,46,48,102,109,115} for _i=1,#_by do buffer.writeu8(_bf,_i-1,_by[_i]) end local _s={} for _i=1,#_by do _s[_i]=string.char(buffer.readu8(_bf,_i-1)) end return table.concat(_s) else local _by={91,84,111,70,93,32,102,105,114,101,32,100,105,115,116,61,37,46,48,102,32,116,111,102,61,37,46,50,102,32,108,101,97,100,61,37,46,49,102,32,118,101,108,61,37,46,49,102,32,112,114,101,100,61,37,100,32,100,97,109,112,61,37,100,32,122,105,103,61,37,100,32,100,111,116,61,37,46,50,102,32,112,105,110,103,61,37,46,48,102,109,115} local _s={} for _i=1,#_by do _s[_i]=string.char(_by[_i]) end return table.concat(_s) end end)(), var_buffer_e08b.dist or 0, var_buffer_e08b.tof or 0, var_buffer_e08b.lead or 0, var_buffer_e08b.vel or 0, var_buffer_e08b.pred or 0, var_buffer_e08b.damp or (0.0), var_buffer_e08b.zig or 0, var_buffer_e08b.dot or (0.0), (var_buffer_e08b.ping or (0.0)) * 1000))
                                end
                            elseif var_remote_afc9.n >= (2.0) and typeof(var_remote_afc9[2]) == "Vector3" then
                                var_remote_afc9[(2.0)] = State.var_buffer_e700
                                if State.silentAimLaserEspEnabled then State.var_buffer_2078 = true end
                                local var_buffer_e08b = State.var_rootPart_7d39
                                if var_buffer_e08b then
                                    print(string.format("[ToF] fire dist=%.0f tof=%.2f lead=%.1f vel=%.1f pred=%d damp=%d zig=%d dot=%.2f ping=%.0fms", var_buffer_e08b.dist or 0, var_buffer_e08b.tof or 0, var_buffer_e08b.lead or (0.0), var_buffer_e08b.vel or 0, var_buffer_e08b.pred or 0, var_buffer_e08b.damp or 0, var_buffer_e08b.zig or 0, var_buffer_e08b.dot or 0, (var_buffer_e08b.ping or 0) * 1000))
                                end
                            end
                        end
                        return var_remote_e8c6(self, table.unpack(var_remote_afc9, 1, var_remote_afc9.n))
                    end
                    return var_remote_e8c6(self, ...)
                end)
            end)

            RegisterTask("UpdateSilentAimTarget", 0.02, function()
                if State.var_basePart_5701 then
                    State.var_basePart_5701.Visible = State.silentAimFovCircleEnabled
                    local var_sizeOrPosition_8ebb = Config.silentAimFovRadius * 2
                    if State.var_basePart_5701.Size.X.Offset ~= var_sizeOrPosition_8ebb then
                        State.var_basePart_5701.Size = UDim2.new(0, var_sizeOrPosition_8ebb, 0, var_sizeOrPosition_8ebb)
                    end
                end
                if not State.silentAimEnabled then
                    State.var_vector_2d26 = nil
                    State.var_buffer_e700 = nil
                    State.var_vector_2cd6 = nil
                    State.var_humanoid_89e9 = nil
                    State.var_rootPart_7d5a = {}
                    State.var_rootPart_7d39 = nil
                    return
                end
                local var_player_22b6 = LocalPlayer.Character
                if not var_player_22b6 then return end
                local var_player_503c = var_player_22b6.FindFirstChild(var_player_22b6,"HumanoidRootPart")
                if not var_player_503c then return end
                local var_rootPart_fbb0 = workspace.CurrentCamera
                if not var_rootPart_fbb0 then return end
                local var_player_e5b5 = nil
                local var_player_dd74 = math.huge
                local var_player_7dbe = nil
                local var_player_ab63 = Config.silentAimTargetType or "Killer"

                if var_player_ab63 == "Zombie" then

                    if tick() - zombieCacheTime > 0.5 then RefreshZombieCache() end
                    for var_remoteEvent_5dde = 1, #var_descendant_5977 do
                        local var_child_415e = var_descendant_5977[var_remoteEvent_5dde]
                        if var_child_415e and var_child_415e.Parent then
                            local var_rootPart_186c = GetScpModelRoot(var_child_415e)
                            if var_rootPart_186c then
                                local pos = var_rootPart_186c.Position
                                local dist = (pos - var_player_503c.Position).Magnitude
                                if dist < var_player_dd74 then var_player_dd74 = dist
                                var_player_e5b5 = pos
                                var_player_7dbe = var_child_415e end
                            end
                        end
                    end
                else
                    for _, player in ipairs(Players.GetPlayers(Players)) do
                        if player ~= LocalPlayer then
                            if var_player_ab63 == "Killer" and GetPlayerRole(player) ~= "killer" then continue end
                            if var_player_ab63 == "Survivor" and GetPlayerRole(player) ~= "survivor" then continue end
                            local var_humanoid_4850 = player.Character
                            if var_humanoid_4850 then
                                local var_humanoid_63ff = var_humanoid_4850.FindFirstChildOfClass(var_humanoid_4850,"Humanoid")
                                local var_humanoid_4ca1 = fn_ServerHelper_7a1e(var_humanoid_4850)
                                if var_humanoid_63ff and var_humanoid_63ff.Health > 0 and typeof(var_humanoid_4ca1) == "Vector3" then
                                    local dist = (var_humanoid_4ca1 - var_player_503c.Position).Magnitude
                                    if dist < var_player_dd74 then var_player_dd74 = dist
                                    var_player_e5b5 = var_humanoid_4ca1
                                    var_player_7dbe = var_humanoid_4850 end
                                end
                            end
                        end
                    end
                end

                local var_now_2834 = tick()
                local var_vector_67fb = State.var_vector_abac
                if typeof(var_vector_67fb) ~= "Vector3" then var_vector_67fb = Vector3.new(0, 0, 0) end
                local var_vector_69ce = 0
                local var_vector_dc70 = false
                if typeof(var_player_e5b5) == "Vector3" then
                    if State.var_humanoid_89e9 ~= var_player_7dbe then
                        State.var_humanoid_89e9 = var_player_7dbe
                        State.var_rootPart_7d5a = {}
                        var_vector_67fb = Vector3.new(0, (0.0), 0)
                    end
                    local hist = State.var_rootPart_7d5a
                    table.insert(hist, { pos = var_player_e5b5, t = var_now_2834 })
                    while #hist > 1 and hist[1].t < var_now_2834 - 0.4 do table.remove(hist, (1.0)) end
                    if #hist >= 2 then
                        local var_rootPart_4e4c = hist[#hist - (1.0)]
                        local var_rootPart_b34c = hist[#hist]
                        local var_rootPart_6336 = var_rootPart_b34c.t - var_rootPart_4e4c.t
                        if var_rootPart_6336 > 0.001 then
                            local var_rootPart_bbe4 = (var_rootPart_b34c.pos - var_rootPart_4e4c.pos) / var_rootPart_6336
                            local var_rootPart_cb24 = Vector3.new(var_rootPart_bbe4.X, (0.0), var_rootPart_bbe4.Z)
                            local var_rootPart_186c = var_player_7dbe and var_player_7dbe.FindFirstChild(var_player_7dbe,"HumanoidRootPart")
                            if var_rootPart_186c and var_rootPart_186c.IsA(var_rootPart_186c,"BasePart") then
                                local var_success_abb9, av = pcall(function() return var_rootPart_186c.AssemblyLinearVelocity end)
                                if var_success_abb9 and typeof(av) == "Vector3" then
                                    local var_velocity_577f = Vector3.new(av.X, 0, av.Z)
                                    if var_velocity_577f.Magnitude > 0.5 and var_velocity_577f.Magnitude < (100.0) then
                                        var_rootPart_cb24 = var_rootPart_cb24.Lerp(var_rootPart_cb24,var_velocity_577f, 0.5)
                                    end
                                end
                            end
                            if var_rootPart_cb24.Magnitude > 65 then var_rootPart_cb24 = var_rootPart_cb24.Unit * 65 end
                            if Config.silentAimAdaptiveDamping and var_vector_67fb.Magnitude > (2.0) and var_rootPart_cb24.Magnitude > (2.0) then
                                var_vector_69ce = var_vector_67fb.Dot(var_vector_67fb,var_rootPart_cb24) / (var_vector_67fb.Magnitude * var_rootPart_cb24.Magnitude)
                                if var_vector_69ce < 0 then
                                    var_rootPart_cb24 = var_rootPart_cb24 * 0.7
                                    var_vector_dc70 = true
                                end
                            end
                            var_vector_67fb = var_vector_67fb.Lerp(var_vector_67fb,var_rootPart_cb24, 0.45)
                        end
                    end
                    local var_vector_559c = Vector3.new(var_vector_67fb.X, 0, var_vector_67fb.Z)
                    if var_vector_559c.Magnitude > 65 then var_vector_559c = var_vector_559c.Unit * 65 end
                    var_vector_67fb = var_vector_559c
                else
                    State.var_humanoid_89e9 = nil
                    State.var_rootPart_7d5a = {}
                    var_vector_67fb = Vector3.new(0, 0, 0)
                end
                State.var_vector_e9ab = var_vector_67fb
                State.var_vector_abac = var_vector_67fb

                if typeof(var_player_e5b5) == "Vector3" then
                    local var_viewportSize_ade6 = var_player_e5b5
                    if typeof(var_viewportSize_ade6) == "Vector3" then
                        local var_rootPart_b754 = true
                        local var_viewportSize_ced1, onScreen = var_rootPart_fbb0.WorldToViewportPoint(var_rootPart_fbb0,var_viewportSize_ade6)
                        if onScreen then
                            local var_rootPart_1bb5 = Vector2.new(var_rootPart_fbb0.ViewportSize.X / (2.0), var_rootPart_fbb0.ViewportSize.Y / 2)
                            local var_viewportSize_4830 = (Vector2.new(var_viewportSize_ced1.X, var_viewportSize_ced1.Y) - var_rootPart_1bb5).Magnitude
                            if var_viewportSize_4830 > Config.silentAimFovRadius then var_rootPart_b754 = false end
                        else
                            var_rootPart_b754 = false
                        end
                        if var_rootPart_b754 then
                            local var_vector_ef22 = fn_ServerHelper_d203()
                            if typeof(var_vector_ef22) ~= "Vector3" then var_vector_ef22 = var_rootPart_fbb0.CFrame.Position end
                            local var_vector_8cf6 = var_viewportSize_ade6 - Vector3.new(0, 1.2, 0)
                            local var_vector_2e5d = var_vector_8cf6 - var_vector_ef22
                            local var_predictedPosition_3ad5 = var_vector_2e5d.Magnitude
                            if var_predictedPosition_3ad5 > 0.1 then
                                local var_vector_e5a4 = var_vector_8cf6
                                local var_vector_df50 = var_predictedPosition_3ad5 / 200 + 0.1
                                local var_vector_3f21 = 0
                                local var_vector_de9b = (0.0)
                                if typeof(State.var_vector_abac) == "Vector3" then
                                    var_vector_de9b = Vector3.new(State.var_vector_abac.X, (0.0), State.var_vector_abac.Z).Magnitude
                                end
                                if Config.silentAimAutoPrediction then
                                    local var_distance_3055 = State.var_vector_abac
                                    local var_distance_2e26 = 0.1
                                    local tof = var_predictedPosition_3ad5 / (200.0) + var_distance_2e26
                                    var_vector_e5a4 = var_vector_8cf6 + var_distance_3055 * tof
                                    local var_distance_4476 = var_vector_e5a4 - var_vector_ef22
                                    if var_distance_4476.Magnitude > 0.1 then
                                        tof = var_distance_4476.Magnitude / (200.0) + var_distance_2e26
                                        var_vector_e5a4 = var_vector_8cf6 + var_distance_3055 * tof
                                    end
                                    var_vector_df50 = tof
                                    var_vector_3f21 = (var_vector_e5a4 - var_vector_8cf6).Magnitude
                                    State.var_vector_2cd6 = var_vector_e5a4
                                else
                                    State.var_vector_2cd6 = nil
                                end
                                local var_vector_dadc = var_vector_e5a4 - var_vector_ef22
                                local var_vector_298b = var_vector_dadc.Magnitude
                                if var_vector_298b > 0.1 then
                                    State.var_vector_2d26 = var_viewportSize_ade6
                                    State.var_buffer_e700 = Vector3.new(var_vector_dadc.X / var_vector_298b, var_vector_dadc.Y / var_vector_298b, var_vector_dadc.Z / var_vector_298b)
                                    State.var_vector_43f4 = var_vector_ef22
                                    State.var_vector_bf76 = var_vector_e5a4
                                    local var_success_4446 = 0
                                    pcall(function()
                                        if typeof(Spear_PingSec) == "function" then var_success_4446 = Spear_PingSec() or 0 end
                                    end)
                                    State.var_rootPart_7d39 = {
                                        dist = var_predictedPosition_3ad5, tof = var_vector_df50, lead = var_vector_3f21, vel = var_vector_de9b,
                                        pred = Config.silentAimAutoPrediction and (1.0) or 0,
                                        damp = Config.silentAimAdaptiveDamping and 1 or (0.0),
                                        zig = var_vector_dc70 and (1.0) or (0.0), dot = var_vector_69ce or (0.0),
                                        ping = var_success_4446, t = tick(),
                                    }
                                else
                                    State.var_vector_2d26 = nil
                                    State.var_buffer_e700 = nil
                                    State.var_rootPart_7d39 = nil
                                end
                            else
                                State.var_vector_2d26 = nil
                                State.var_buffer_e700 = nil
                                State.var_rootPart_7d39 = nil
                            end
                        else
                            State.var_vector_2d26 = nil
                            State.var_buffer_e700 = nil
                            State.var_rootPart_7d39 = nil
                        end
                    else
                        State.var_vector_2d26 = nil
                        State.var_buffer_e700 = nil
                        State.var_rootPart_7d39 = nil
                    end
                else
                    State.var_vector_2d26 = nil
                    State.var_buffer_e700 = nil
                    State.var_rootPart_7d39 = nil
                end
            end)

            RegisterTask("DrawLaserESP", 0, function()
                if not State.var_buffer_2078 then return end
                State.var_buffer_2078 = false
                local var_vector_b8f1 = State.var_vector_43f4
                local var_vector_fbe6 = State.var_vector_bf76
                if typeof(var_vector_b8f1) ~= "Vector3" or typeof(var_vector_fbe6) ~= "Vector3" then return end
                local var_rootPart_507f = (var_vector_b8f1 - var_vector_fbe6).Magnitude
                if var_rootPart_507f < 0.1 then return end
                local var_descendant_e1e1 = Instance.new("Part")
                var_descendant_e1e1.Name = "SilentLaser"
                var_descendant_e1e1.Anchored = true
                var_descendant_e1e1.CanCollide = false
                var_descendant_e1e1.Material = Enum.Material.Neon
                var_descendant_e1e1.Color = Color3.fromRGB(255, 0, (0.0))
                var_descendant_e1e1.Transparency = 0.3
                var_descendant_e1e1.Size = Vector3.new(0.15, 0.15, var_rootPart_507f)
                var_descendant_e1e1.CFrame = CFrame.new(var_vector_b8f1, var_vector_fbe6) * CFrame.new(0, (0.0), -var_rootPart_507f / 2)
                var_descendant_e1e1.Parent = workspace
                task.delay(0.4, function() if var_descendant_e1e1 then var_descendant_e1e1.Destroy(var_descendant_e1e1) end end)
            end)

        end

        do
            local var_descendant_b45e = 30

            local function fn_FlashlightHelper_8c3c(char)
                if not char then return false end
                if char.FindFirstChild(char,"Flashlight") then return true end
                for _, var_instance_4e7f in ipairs(char.GetDescendants(char)) do
                    if var_instance_4e7f.Name == "Flashlight" and (var_instance_4e7f.IsA(var_instance_4e7f,"Model") or var_instance_4e7f.IsA(var_instance_4e7f,"Tool") or var_instance_4e7f.IsA(var_instance_4e7f,"Accessory")) then
                        return true
                    end
                end
                return false
            end

            local function fn_FlashlightHelper_fb7d(character)
                if not character then return false end
                local var_child_4158 = character.FindFirstChildOfClass(character,"Humanoid")
                if not var_child_4158 or var_child_4158.Health <= 50 then return false end
                local var_humanoid_7afb = character.GetAttribute(character,"IsHooked") or character.GetAttribute(character,"isHooked")
                if var_humanoid_7afb == true then return false end
                return true
            end

            local function fn_FlashlightHelper_36fe(char)
                if not char then return nil end
                local var_rootPart_6233 = char.FindFirstChild(char,"Head")
                if var_rootPart_6233 and var_rootPart_6233.IsA(var_rootPart_6233,"BasePart") then return var_rootPart_6233 end
                return char.FindFirstChild(char,"UpperTorso")
                    or char.FindFirstChild(char,"Torso")
                    or char.FindFirstChild(char,"HumanoidRootPart")
            end

            local function fn_FlashlightHelper_7d08()
                local var_rootPart_f536 = LocalPlayer.Character
                local var_rootPart_f542 = var_rootPart_f536 and var_rootPart_f536.FindFirstChild(var_rootPart_f536,"HumanoidRootPart")
                if not var_rootPart_f542 then return nil end
                local var_player_482f, var_player_dd74 = nil, math.huge
                for _, player in ipairs(Players.GetPlayers(Players)) do
                    if player ~= LocalPlayer and player.Character and fn_FlashlightHelper_fb7d(player.Character) then
                        if GetPlayerRole(player) == "killer" then
                            local part = fn_FlashlightHelper_36fe(player.Character)
                            if part and part.IsA(part,"BasePart") then
                                local dist = (var_rootPart_f542.Position - part.Position).Magnitude
                                if dist <= var_descendant_b45e and dist < var_player_dd74 then
                                    var_player_dd74 = dist
                                    var_player_482f = part
                                end
                            end
                        end
                    end
                end
                return var_player_482f
            end

            local var_remoteEvent_bc21 = nil
            pcall(function()
                local var_remoteEvent_d696 = ReplicatedStorage.FindFirstChild(ReplicatedStorage,"Remotes")
                local items = var_remoteEvent_d696 and var_remoteEvent_d696.FindFirstChild(var_remoteEvent_d696,"Items")
                local var_remoteEvent_f9ec = items and items.FindFirstChild(items,"Flashlight")
                local var_remoteEvent_b677 = var_remoteEvent_f9ec and var_remoteEvent_f9ec.FindFirstChild(var_remoteEvent_f9ec,"Activate")
                if var_remoteEvent_b677 and var_remoteEvent_b677.IsA(var_remoteEvent_b677,"RemoteEvent") then
                    var_remoteEvent_bc21 = var_remoteEvent_b677
                end
            end)

            local var_remoteEvent_c803
            pcall(function()
                var_remoteEvent_c803 = hookmetamethod(game, "__namecall", function(self, ...)
                    local var_connection_513e = getnamecallmethod()
                    if var_connection_513e == "FireServer" and var_remoteEvent_bc21 and rawequal(self, var_remoteEvent_bc21) then
                        local var_remote_afc9 = table.pack(...)
                        pcall(function() State.flashlightAimlockLocked = (var_remote_afc9[(2.0)] == true) end)
                    end
                    return var_remoteEvent_c803(self, ...)
                end)
            end)

            RegisterTask("FlashAimLock", 0.02, function()
                if not State.flashlightAimlockEnabled then return end
                local var_position_c4ef = fn_FlashlightHelper_8c3c(LocalPlayer.Character)
                local var_position_60b7 = GetPlayerRole(LocalPlayer) ~= "killer"
                if not (var_position_c4ef and var_position_60b7 and State.flashlightAimlockLocked) then return end
                local var_rootPart_2947 = workspace.CurrentCamera
                if not var_rootPart_2947 then return end
                local var_descendant_9d5f = fn_FlashlightHelper_7d08()
                if not var_descendant_9d5f then return end
                local var_rootPart_e5eb = var_descendant_9d5f.Position
                local smooth = math.clamp(tonumber(State.flashlightAimlockSmoothness) or 0.35, 0.05, 1)
                pcall(function()
                    var_rootPart_2947.CFrame = var_rootPart_2947.CFrame.Lerp(var_rootPart_2947.CFrame,CFrame.new(var_rootPart_2947.CFrame.Position, var_rootPart_e5eb), smooth)
                end)
                pcall(function()
                    local char = LocalPlayer.Character
                    local var_rootPart_2226 = char and char.FindFirstChild(char,"HumanoidRootPart")
                    if var_rootPart_2226 then
                        var_rootPart_2226.CFrame = CFrame.new(var_rootPart_2226.Position, Vector3.new(var_rootPart_e5eb.X, var_rootPart_2226.Position.Y, var_rootPart_e5eb.Z))
                    end
                end)
            end)
        end

        local fn_GetHandler_71fb
        do
            local var_vector_284a = Vector3.new(0, (-6000.0), (0.0))
            local var_highlight_7d4e = 0.5
            local var_remote_94b3 = 5

            local var_descendant_53c0 = {}

            local function fn_InvisibleHandler_d54d()
                local var_success_abb9, var_player_b518 = pcall(function()
                    local var_replicatedStorage_2561 = game:GetService("ReplicatedStorage")
                    local var_remoteEvent_d696 = var_replicatedStorage_2561.FindFirstChild(var_replicatedStorage_2561,"Remotes")
                    if not var_remoteEvent_d696 then return nil end
                    local var_remoteEvent_1e8c = var_remoteEvent_d696.FindFirstChild(var_remoteEvent_d696,"Game")
                    if not var_remoteEvent_1e8c then return nil end
                    local e = var_remoteEvent_1e8c.FindFirstChild(var_remoteEvent_1e8c,"UpdateCharacterLook")
                    if e and e.IsA(e,"RemoteEvent") then return e end
                    return nil
                end)
                if var_success_abb9 then return var_player_b518 end
                return nil
            end

            local function fn_InvisibleHandler_91d4(...)
                local var_unknownValue_0041_2f35 = {}
                local n = select("#", ...)
                for var_remoteEvent_5dde = 1, n do
                    local var_value_d1f9 = select(var_remoteEvent_5dde, ...)
                    if typeof(var_value_d1f9) == "CFrame" then
                        var_value_d1f9 = var_value_d1f9 + var_vector_284a
                    end
                    var_unknownValue_0041_2f35[var_remoteEvent_5dde] = var_value_d1f9
                end
                return table.unpack(var_unknownValue_0041_2f35, (1.0), n)
            end

            local function fn_InvisibleHelper_848e()
                if not State.var_connection_e78f then return false end
                local var_child_534a = State.var_connection_9ebe
                if type(var_child_534a) ~= "table" or #var_child_534a ~= 5 then return false end
                local var_player_b518 = fn_InvisibleHandler_d54d()
                if not var_player_b518 then return false end
                local var_remote_9881 = table.pack(pcall(fn_InvisibleHandler_91d4, table.unpack(var_child_534a)))
                if not var_remote_9881[(1.0)] then return false end
                local var_child_ed24 = var_player_b518.FireServer
                if typeof(var_child_ed24) ~= "function" then return false end
                local var_remote_70b0 = pcall(var_child_ed24, var_player_b518, table.unpack(var_remote_9881, 2, var_remote_9881.n))
                if var_remote_70b0 then
                    State.var_remote_e566 = 0
                    State.var_success_c371 = State.var_success_c371 + 1
                else
                    State.var_remote_e566 = State.var_remote_e566 + 1
                end
                return var_remote_70b0
            end

            local function fn_InvisibleHelper_79a1()
                if State.var_connection_e78f then return false end
                local var_child_534a = State.var_connection_9ebe
                if type(var_child_534a) ~= "table" or #var_child_534a ~= 5 then return false end
                local var_player_b518 = fn_InvisibleHandler_d54d()
                if not var_player_b518 then return false end
                local var_child_ed24 = var_player_b518.FireServer
                if typeof(var_child_ed24) ~= "function" then return false end
                return pcall(var_child_ed24, var_player_b518, table.unpack(var_child_534a))
            end

            local function fn_InvisibleHelper_dd7c(character)
                if character == nil then return end
                for _, var_instance_4e7f in ipairs(character.GetChildren(character)) do
                    if var_instance_4e7f.Name == "Bolong_Invis" and var_instance_4e7f.IsA(var_instance_4e7f,"Highlight") then
                        pcall(function() var_instance_4e7f.Destroy(var_instance_4e7f) end)
                    end
                end
            end

            local function fn_InvisibleHelper_a85f(character)
                if State.invisTagConn then
                    pcall(function() State.invisTagConn.Disconnect(State.invisTagConn) end)
                    State.invisTagConn = nil
                end
                if character == nil then return end
                local var_rootPart_6233 = character.FindFirstChild(character,"Head") or character.FindFirstChild(character,"HumanoidRootPart")
                if var_rootPart_6233 then
                    local var_rootPart_b4f9 = var_rootPart_6233.FindFirstChild(var_rootPart_6233,"Bolong_InvisTag")
                    if var_rootPart_b4f9 then pcall(function() var_rootPart_b4f9.Destroy(var_rootPart_b4f9) end) end
                end
            end

            local function fn_InvisibleHelper_400a(character, var_rootPart_db85)
                if character == nil then return end
                fn_InvisibleHelper_a85f(character)
                if not var_rootPart_db85 then return end
                local var_rootPart_6233 = character.FindFirstChild(character,"Head") or character.FindFirstChild(character,"HumanoidRootPart")
                if not var_rootPart_6233 then return end
                local var_success_abb9, var_backgroundTransparency_2a69 = pcall(function()
                    local var_rootPart_d630 = "[ Invisible ]"
                    local var_font_7941 = (12.0)
                    local var_font_cb6c = Enum.Font.GothamBold
                    local var_font_8bfd = (110.0)
                    pcall(function()
                        local var_font_2e93 = game.GetService(game,"TextService")
                        var_font_8bfd = var_font_2e93:GetTextSize(var_rootPart_d630, var_font_7941, var_font_cb6c, Vector2.new(1000, (26.0))).X
                    end)
                    local var_backgroundTransparency_d913, gap, glowR, margin = (14.0), 4, 1.5, (5.0)
                    local var_backgroundTransparency_9438 = 14
                    local var_billboard_58a0 = math.ceil(margin * 2 + var_backgroundTransparency_d913 + gap + var_font_8bfd)
                    local var_billboard_28f8 = var_backgroundTransparency_d913 + margin * 2
                    local gui = Instance.new("BillboardGui")
                    gui.Name = "Bolong_InvisTag"
                    gui.AlwaysOnTop = true
                    gui.Size = UDim2.new(0, var_billboard_58a0, 0, var_billboard_28f8)
                    gui.StudsOffset = Vector3.new(0, 1.5, 0)
                    gui.Adornee = var_rootPart_6233
                    local var_backgroundTransparency_8a53, iconY = margin, margin
                    local var_backgroundTransparency_ca8a = margin + var_backgroundTransparency_d913 + gap
                    local var_backgroundTransparency_baff = margin + math.floor((var_backgroundTransparency_d913 - var_backgroundTransparency_9438) / 2)
                    local function fn_GetHelper_4b4e(var_value_d1f9, var_child_5b0e) return math.floor(var_value_d1f9 * var_child_5b0e + 0.5) end
                    local var_connection_e59e = Instance.new("ImageLabel")
                    var_connection_e59e.Name = "Icon"
                    var_connection_e59e.Position = UDim2.fromOffset(var_backgroundTransparency_8a53, iconY)
                    var_connection_e59e.Size = UDim2.new(0, var_backgroundTransparency_d913, 0, var_backgroundTransparency_d913)
                    var_connection_e59e.BackgroundTransparency = 1
                    var_connection_e59e.Image = "rbxassetid://84034353458936"
                    var_connection_e59e.ZIndex = 2
                    var_connection_e59e.Parent = gui
                    local var_backgroundTransparency_5c6a = {}
                    local var_position_c700 = { { 2, 0.6 }, { 4, 0.85 } }
                    for var_remoteEvent_5dde, var_cframeOffset_eabb in ipairs(var_position_c700) do
                        local pad, transp = var_cframeOffset_eabb[1], var_cframeOffset_eabb[2]
                        local var_highlight_980e = Instance.new("ImageLabel")
                        var_highlight_980e.Name = "Halo" .. var_remoteEvent_5dde
                        var_highlight_980e.Position = UDim2.fromOffset(var_backgroundTransparency_8a53 - pad, iconY - pad)
                        var_highlight_980e.Size = UDim2.new(0, var_backgroundTransparency_d913 + pad * 2, (0.0), var_backgroundTransparency_d913 + pad * (2.0))
                        var_highlight_980e.BackgroundTransparency = 1
                        var_highlight_980e.Image = "rbxassetid://84034353458936"
                        var_highlight_980e.ImageColor3 = Color3.new((0.0), 0, 0)
                        var_highlight_980e.ImageTransparency = transp
                        var_highlight_980e.ZIndex = 1
                        var_highlight_980e.Parent = gui
                        var_backgroundTransparency_5c6a[#var_backgroundTransparency_5c6a + 1] = { o = var_highlight_980e, pad = pad }
                    end
                    local var_label_b558 = {}
                    local var_label_e685 = {
                        { glowR, 0 }, { -glowR, (0.0) }, { 0, glowR }, { (0.0), -glowR },
                        { glowR * 0.7, glowR * 0.7 }, { glowR * 0.7, -glowR * 0.7 },
                        { -glowR * 0.7, glowR * 0.7 }, { -glowR * 0.7, -glowR * 0.7 },
                    }
                    for var_remoteEvent_5dde, var_backgroundTransparency_6d05 in ipairs(var_label_e685) do
                        local var_remoteEvent_1e8c = Instance.new("TextLabel")
                        var_remoteEvent_1e8c.Name = "Glow" .. var_remoteEvent_5dde
                        var_remoteEvent_1e8c.Position = UDim2.fromOffset(var_backgroundTransparency_ca8a + var_backgroundTransparency_6d05[1], var_backgroundTransparency_baff + var_backgroundTransparency_6d05[2])
                        var_remoteEvent_1e8c.Size = UDim2.new(0, var_font_8bfd, 0, var_backgroundTransparency_9438)
                        var_remoteEvent_1e8c.BackgroundTransparency = (1.0)
                        var_remoteEvent_1e8c.Text = var_rootPart_d630
                        var_remoteEvent_1e8c.TextColor3 = Color3.new(0, 0, 0)
                        var_remoteEvent_1e8c.TextTransparency = 0.8
                        var_remoteEvent_1e8c.TextSize = var_font_7941
                        var_remoteEvent_1e8c.Font = var_font_cb6c
                        var_remoteEvent_1e8c.ZIndex = 1
                        var_remoteEvent_1e8c.Parent = gui
                        var_label_b558[#var_label_b558 + 1] = { o = var_remoteEvent_1e8c, dx = var_backgroundTransparency_6d05[(1.0)], dy = var_backgroundTransparency_6d05[2] }
                    end
                    local var_backgroundTransparency_dd44 = Instance.new("TextLabel")
                    var_backgroundTransparency_dd44.Name = "Label"
                    var_backgroundTransparency_dd44.Position = UDim2.fromOffset(var_backgroundTransparency_ca8a, var_backgroundTransparency_baff)
                    var_backgroundTransparency_dd44.Size = UDim2.new(0, var_font_8bfd, 0, var_backgroundTransparency_9438)
                    var_backgroundTransparency_dd44.BackgroundTransparency = 1
                    var_backgroundTransparency_dd44.Text = var_rootPart_d630
                    var_backgroundTransparency_dd44.TextColor3 = Color3.fromRGB(255, 255, 255)
                    var_backgroundTransparency_dd44.TextTransparency = (0.0)
                    var_backgroundTransparency_dd44.TextSize = var_font_7941
                    var_backgroundTransparency_dd44.Font = var_font_cb6c
                    var_backgroundTransparency_dd44.ZIndex = 2
                    var_backgroundTransparency_dd44.Parent = gui
                    gui.Parent = var_rootPart_6233
                    local var_cframeOffset_6b63, minK, maxK = 25, 0.45, 1.35
                    if State.invisTagConn then
                        pcall(function() State.invisTagConn.Disconnect(State.invisTagConn) end)
                        State.invisTagConn = nil
                    end
                    State.invisTagConn = game:GetService("RunService").RenderStepped:Connect(function()
                        if not gui.Parent then return end
                        local var_rootPart_2947 = workspace.CurrentCamera
                        if not var_rootPart_2947 then return end
                        local var_cframeOffset_eabb = var_rootPart_6233.Parent and var_rootPart_6233.Position or nil
                        if not var_cframeOffset_eabb then return end
                        local dist = (var_rootPart_2947.CFrame.Position - var_cframeOffset_eabb).Magnitude
                        if dist < 1 then dist = (1.0) end
                        local var_child_5b0e = var_cframeOffset_6b63 / dist
                        if var_child_5b0e < minK then var_child_5b0e = minK elseif var_child_5b0e > maxK then var_child_5b0e = maxK end
                        gui.Size = UDim2.fromOffset(fn_GetHelper_4b4e(var_billboard_58a0, var_child_5b0e), fn_GetHelper_4b4e(var_billboard_28f8, var_child_5b0e))
                        var_connection_e59e.Position = UDim2.fromOffset(fn_GetHelper_4b4e(var_backgroundTransparency_8a53, var_child_5b0e), fn_GetHelper_4b4e(iconY, var_child_5b0e))
                        var_connection_e59e.Size = UDim2.fromOffset(fn_GetHelper_4b4e(var_backgroundTransparency_d913, var_child_5b0e), fn_GetHelper_4b4e(var_backgroundTransparency_d913, var_child_5b0e))
                        for _, var_position_afe1 in ipairs(var_backgroundTransparency_5c6a) do
                            var_position_afe1.o.Position = UDim2.fromOffset(fn_GetHelper_4b4e(var_backgroundTransparency_8a53 - var_position_afe1.pad, var_child_5b0e), fn_GetHelper_4b4e(iconY - var_position_afe1.pad, var_child_5b0e))
                            var_position_afe1.o.Size = UDim2.fromOffset(fn_GetHelper_4b4e(var_backgroundTransparency_d913 + var_position_afe1.pad * (2.0), var_child_5b0e), fn_GetHelper_4b4e(var_backgroundTransparency_d913 + var_position_afe1.pad * (2.0), var_child_5b0e))
                        end
                        for _, var_position_d22d in ipairs(var_label_b558) do
                            var_position_d22d.o.Position = UDim2.fromOffset(fn_GetHelper_4b4e(var_backgroundTransparency_ca8a + var_position_d22d.dx, var_child_5b0e), fn_GetHelper_4b4e(var_backgroundTransparency_baff + var_position_d22d.dy, var_child_5b0e))
                            var_position_d22d.o.Size = UDim2.fromOffset(fn_GetHelper_4b4e(var_font_8bfd, var_child_5b0e), fn_GetHelper_4b4e(var_backgroundTransparency_9438, var_child_5b0e))
                            var_position_d22d.o.TextSize = fn_GetHelper_4b4e(var_font_7941, var_child_5b0e)
                        end
                        var_backgroundTransparency_dd44.Position = UDim2.fromOffset(fn_GetHelper_4b4e(var_backgroundTransparency_ca8a, var_child_5b0e), fn_GetHelper_4b4e(var_backgroundTransparency_baff, var_child_5b0e))
                        var_backgroundTransparency_dd44.Size = UDim2.fromOffset(fn_GetHelper_4b4e(var_font_8bfd, var_child_5b0e), fn_GetHelper_4b4e(var_backgroundTransparency_9438, var_child_5b0e))
                        var_backgroundTransparency_dd44.TextSize = fn_GetHelper_4b4e(var_font_7941, var_child_5b0e)
                    end)
                    return gui
                end)
                if not var_success_abb9 or not var_backgroundTransparency_2a69 then
                    fn_InvisibleHelper_a85f(character)
                end
            end

            local function fn_ServerHelper_1e7d(character, var_rootPart_db85)
                if character == nil then return end
                fn_InvisibleHelper_dd7c(character)
                if not var_rootPart_db85 then
                    fn_InvisibleHelper_a85f(character)
                    for _, part in ipairs(var_descendant_53c0) do
                        if part and part.Parent then
                            pcall(function() part.Transparency = 0 end)
                        end
                    end
                    var_descendant_53c0 = {}
                    return
                end
                var_descendant_53c0 = {}
                for _, var_descendant_fe40 in ipairs(character.GetDescendants(character)) do
                    if var_descendant_fe40.IsA(var_descendant_fe40,"BasePart") and var_descendant_fe40.Transparency == 0 then
                        var_descendant_53c0[#var_descendant_53c0 + (1.0)] = var_descendant_fe40
                    end
                end
                for _, part in ipairs(var_descendant_53c0) do
                    pcall(function() part.Transparency = var_highlight_7d4e end)
                end
                local var_success_abb9, var_rootPart_cb24 = pcall(function() return Instance.new("Highlight") end)
                if var_success_abb9 and var_rootPart_cb24 then
        if false then local var_highlight_c8e7=258 end
                    var_rootPart_cb24.Name = "Bolong_Invis"
                    var_rootPart_cb24.Adornee = character
                    var_rootPart_cb24.FillColor = Color3.fromRGB((184.0), 106, 4)
                    var_rootPart_cb24.OutlineColor = Color3.fromRGB((255.0), 255, 255)
                    var_rootPart_cb24.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    var_rootPart_cb24.FillTransparency = 1
                    var_rootPart_cb24.OutlineTransparency = 0
                    var_rootPart_cb24.Parent = character
                end
                fn_InvisibleHelper_400a(character, true)
            end

            local function fn_ServerHelper_c41c()
                if State.var_success_187c then return end
                local var_success_abb9 = pcall(function()
                    assert(typeof(hookmetamethod) == "function", "hookmetamethod missing")
                    assert(typeof(getnamecallmethod) == "function", "getnamecallmethod missing")
                    assert(typeof(checkcaller) == "function", "checkcaller missing")
                    local var_descendant_9c68
                    var_descendant_9c68 = hookmetamethod(game, "__namecall", function(self, ...)
                        if checkcaller() then
                            return var_descendant_9c68(self, ...)
                        end
                        if getnamecallmethod() ~= "FireServer" then
                            return var_descendant_9c68(self, ...)
                        end
                        local var_remote_54ab, nm = pcall(function() return self.Name end)
                        if not var_remote_54ab or typeof(nm) ~= "string" then
                            return var_descendant_9c68(self, ...)
                        end
                        if string.lower(nm) ~= "updatecharacterlook" then
                            return var_descendant_9c68(self, ...)
                        end
                        if not State.var_connection_e78f then
                            if select("#", ...) == 5 then
                                local var_rootPart_4e4c, var_rootPart_b34c, var_connection_d9f3, var_distance_8193, e = ...
                                if typeof(var_rootPart_4e4c) == "CFrame" and typeof(var_rootPart_b34c) == "CFrame" and typeof(var_connection_d9f3) == "CFrame" and typeof(var_distance_8193) == "CFrame" and typeof(e) == "CFrame" then
                                    State.var_connection_9ebe = { var_rootPart_4e4c, var_rootPart_b34c, var_connection_d9f3, var_distance_8193, e }
                                end
                            end
                            return var_descendant_9c68(self, ...)
                        end
                        local var_rootPart_5d8b = LocalPlayer.Character
                        local var_rootPart_48a1 = var_rootPart_5d8b and var_rootPart_5d8b.FindFirstChild(var_rootPart_5d8b,"HumanoidRootPart")
                        if var_rootPart_48a1 == nil then
                            return var_descendant_9c68(self, ...)
                        end
                        if select("#", ...) ~= (5.0) then
                            State.var_success_c819 = State.var_success_c819 + 1
                            return nil
                        end
                        local var_remote_9881 = table.pack(pcall(fn_InvisibleHandler_91d4, ...))
                        if not var_remote_9881[1] then
                            return var_descendant_9c68(self, ...)
                        end
                        if State.var_remote_e566 >= var_remote_94b3 then
                            return var_descendant_9c68(self, table.unpack(var_remote_9881, 2, var_remote_9881.n))
                        end
                        local var_child_ed24 = self.FireServer
                        local var_remote_70b0 = false
                        if typeof(var_child_ed24) == "function" then
                            var_remote_70b0 = pcall(var_child_ed24, self, table.unpack(var_remote_9881, 2, var_remote_9881.n))
                        end
                        if var_remote_70b0 then
                            State.var_remote_e566 = (0.0)
                            State.var_success_c371 = State.var_success_c371 + 1
                        else
                            State.var_remote_e566 = State.var_remote_e566 + 1
                        end
                        return nil
                    end)
                end)
                if var_success_abb9 then State.var_success_187c = true end
            end

            function fn_GetHandler_71fb(var_rootPart_db85)
                State.var_connection_e78f = var_rootPart_db85 and true or false
                local char = LocalPlayer.Character
                if char then fn_ServerHelper_1e7d(char, State.var_connection_e78f) end
                if State.var_connection_e78f then
                    fn_InvisibleHelper_848e()
                else
                    fn_InvisibleHelper_79a1()
                end
            end

            if not State.var_connection_eb22 then
                State.var_connection_eb22 = LocalPlayer.CharacterAdded.Connect(LocalPlayer.CharacterAdded,function(char)
                    State.var_connection_9ebe = nil
                    if State.var_connection_e78f then
                        task.spawn(function()
                            task.wait((1.0))
                            if State.var_connection_e78f then fn_ServerHelper_1e7d(char, true) end
                        end)
                    end
                end)
            end

            pcall(function()
                local char = LocalPlayer.Character
                if char then
                    fn_InvisibleHelper_dd7c(char)
                    fn_InvisibleHelper_a85f(char)
                end
            end)
            State.var_connection_e78f = false
            fn_ServerHelper_c41c()
        end

        local fn_ResetHelper_5a8a, StopHiddenM2Hook
        do
            local var_humanoid_15ae = 50
            local var_humanoid_5858 = 1.5

            local function fn_GetHelper_be50(character)
                if not character then return false end
                local var_child_4158 = character.FindFirstChildOfClass(character,"Humanoid")
                if not var_child_4158 or var_child_4158.Health <= 0 then return false end
                if character.GetAttribute(character,"Knocked") then return false end
                if character.GetAttribute(character,"IsHooked") then return false end
                if character.GetAttribute(character,"IsCarried") then return false end
                return true
            end
        do local var_rootPart_c08a=1261%55 end

            local function fn_GetHelper_cd18()
                local var_rootPart_f536 = LocalPlayer.Character
                local var_rootPart_f542 = var_rootPart_f536 and var_rootPart_f536.FindFirstChild(var_rootPart_f536,"HumanoidRootPart")
                if not var_rootPart_f542 then return nil end
                local var_player_482f, var_player_dd74 = nil, math.huge
                for _, player in ipairs(Players.GetPlayers(Players)) do
                    if player ~= LocalPlayer and player.Character and fn_GetHelper_be50(player.Character) then
                        if GetPlayerRole(player) ~= "killer" then
                            local part = player.Character.FindFirstChild(player.Character,"HumanoidRootPart")
                                or player.Character.FindFirstChild(player.Character,"Head")
                            if part and part.IsA(part,"BasePart") then
                                local dist = (var_rootPart_f542.Position - part.Position).Magnitude
                                if dist <= var_humanoid_15ae and dist < var_player_dd74 then
                                    var_player_dd74 = dist
                                    var_player_482f = part
                                end
                            end
                        end
                    end
                end
                return var_player_482f
            end

            local function fn_ResetHelper_9790()
                if not State.state_fireLeapHidden_d47b then return end
                local var_position_f4ae, isKiller = pcall(function() return GetPlayerRole(LocalPlayer) == "killer" end)
                if not var_position_f4ae or not isKiller then return end
                State.var_connection_cf5f = tick() + var_humanoid_5858
            end

            function fn_ResetHelper_5a8a()
                if State.var_remoteEvent_1d7c then return end
                pcall(function()
                    local var_remoteEvent_d696 = ReplicatedStorage.FindFirstChild(ReplicatedStorage,"Remotes")
                    local var_endScreen_99a9 = var_remoteEvent_d696 and var_remoteEvent_d696.FindFirstChild(var_remoteEvent_d696,"Killers")
                    local var_remoteEvent_842d = var_endScreen_99a9 and var_endScreen_99a9.FindFirstChild(var_endScreen_99a9,"Hidden")
                    local var_remoteEvent_64cb = var_remoteEvent_842d and var_remoteEvent_842d.FindFirstChild(var_remoteEvent_842d,"preparem2")
                    if var_remoteEvent_64cb and var_remoteEvent_64cb.IsA(var_remoteEvent_64cb,"BindableEvent") then
                        State.var_remoteEvent_1d7c = var_remoteEvent_64cb.Event.Connect(var_remoteEvent_64cb.Event,fn_ResetHelper_9790)
                    elseif var_remoteEvent_64cb and var_remoteEvent_64cb.IsA(var_remoteEvent_64cb,"RemoteEvent") then
                        State.var_remoteEvent_1d7c = var_remoteEvent_64cb.OnClientEvent.Connect(var_remoteEvent_64cb.OnClientEvent,fn_ResetHelper_9790)
                    else
                        Notify("AIMLOCK M2", "preparem2 tidak ditemukan", 2)
                    end
                end)
            end

            function StopHiddenM2Hook()
                if State.var_remoteEvent_1d7c then
                    pcall(function() State.var_remoteEvent_1d7c.Disconnect(State.var_remoteEvent_1d7c) end)
                    State.var_remoteEvent_1d7c = nil
                end
                State.var_connection_cf5f = 0
            end

            RegisterTask("HiddenM2Aimlock", 0.02, function()
                if not State.state_fireLeapHidden_d47b then return end
                if tick() > State.var_connection_cf5f then return end
                local var_position_f4ae, isKiller = pcall(function() return GetPlayerRole(LocalPlayer) == "killer" end)
                if not var_position_f4ae or not isKiller then return end
                local var_rootPart_2947 = workspace.CurrentCamera
                if not var_rootPart_2947 then return end
                local var_descendant_9d5f = fn_GetHelper_cd18()
                if not var_descendant_9d5f then return end
                local var_rootPart_e5eb = var_descendant_9d5f.Position
                local smooth = math.clamp(tonumber(State.state_fireLeapHidden_6108) or 1.0, 0.05, 1)
                pcall(function()
                    var_rootPart_2947.CFrame = var_rootPart_2947.CFrame.Lerp(var_rootPart_2947.CFrame,CFrame.new(var_rootPart_2947.CFrame.Position, var_rootPart_e5eb), smooth)
                end)
                pcall(function()
                    local char = LocalPlayer.Character
                    local var_rootPart_2226 = char and char.FindFirstChild(char,"HumanoidRootPart")
                    if var_rootPart_2226 then
                        var_rootPart_2226.CFrame = CFrame.new(var_rootPart_2226.Position, Vector3.new(var_rootPart_e5eb.X, var_rootPart_2226.Position.Y, var_rootPart_e5eb.Z))
                    end
                end)
            end)
        end

        do
            local var_basePart_6ff5 = { hist = {}, char = nil, var_playerGui_e1fe = Vector3.new(0, (0.0), 0) }
            local function fn_ResetHelper_1ef1(char)
                if not char then return nil end
                local var_rootPart_f070 = char.FindFirstChild(char,"UpperTorso")
                if var_rootPart_f070 and var_rootPart_f070.IsA(var_rootPart_f070,"BasePart") then return var_rootPart_f070.Position end
                local var_rootPart_2deb = char.FindFirstChild(char,"Torso")
                if var_rootPart_2deb and var_rootPart_2deb.IsA(var_rootPart_2deb,"BasePart") then return var_rootPart_2deb.Position end
                local var_rootPart_186c = char.FindFirstChild(char,"HumanoidRootPart")
                if var_rootPart_186c then return var_rootPart_186c.Position + Vector3.new(0, 0.5, 0) end
                return nil
            end
            local function fn_ResetHelper_d5a6(var_rootPart_fbb0, targetPosition, fovRadius)
                local var_viewportSize_ced1, onScreen = var_rootPart_fbb0.WorldToViewportPoint(var_rootPart_fbb0,targetPosition)
                if not onScreen then return false end
                local var_rootPart_1bb5 = Vector2.new(var_rootPart_fbb0.ViewportSize.X / 2, var_rootPart_fbb0.ViewportSize.Y / (2.0))
                local var_viewportSize_1638 = Vector2.new(var_viewportSize_ced1.X, var_viewportSize_ced1.Y)
                local var_viewportSize_4830 = (var_viewportSize_1638 - var_rootPart_1bb5).Magnitude
                return var_viewportSize_4830 <= fovRadius
            end
            local function fn_ResetHandler_7735()
                local var_uiCorner_5af2 = Instance.new("ScreenGui")
                var_uiCorner_5af2.Name = "BolongSpearFOV"
                var_uiCorner_5af2.ResetOnSpawn = false
                var_uiCorner_5af2.DisplayOrder = 999999
                pcall(function() var_uiCorner_5af2.Parent = (gethui and gethui() or game.GetService(game,"CoreGui")) end)
                if not var_uiCorner_5af2.Parent then var_uiCorner_5af2.Parent = PlayerGui end
                State.var_uiCorner_8eda = Instance.new("Frame")
                State.var_uiCorner_8eda.Size = UDim2.new((0.0), Config.spearFovRadius * (2.0), 0, Config.spearFovRadius * 2)
                State.var_uiCorner_8eda.Position = UDim2.new(0.5, 0, 0.5, 0)
                State.var_uiCorner_8eda.AnchorPoint = Vector2.new(0.5, 0.5)
                State.var_uiCorner_8eda.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                State.var_uiCorner_8eda.BackgroundTransparency = (1.0)
                State.var_uiCorner_8eda.Visible = false
                State.var_uiCorner_8eda.Parent = var_uiCorner_5af2
                local var_uiCorner_2ff8 = Instance.new("UICorner")
                var_uiCorner_2ff8.CornerRadius = UDim.new(1, 0)
                var_uiCorner_2ff8.Parent = State.var_uiCorner_8eda
                local var_uiCorner_5a7b = Instance.new("UIStroke")
                var_uiCorner_5a7b.Color = NOTIFY_COLOR
                var_uiCorner_5a7b.Thickness = 2
                var_uiCorner_5a7b.Transparency = 0.2
                var_uiCorner_5a7b.Parent = State.var_uiCorner_8eda
            end
            fn_ResetHandler_7735()

            local function fn_ResetHandler_dd28()
                local var_uiCorner_5af2 = Instance.new("ScreenGui")
                var_uiCorner_5af2.Name = "SpearIndicatorUI"
                var_uiCorner_5af2.ResetOnSpawn = false
                var_uiCorner_5af2.Enabled = false
                var_uiCorner_5af2.DisplayOrder = 999998
                var_uiCorner_5af2.IgnoreGuiInset = true
                pcall(function() var_uiCorner_5af2.Parent = (gethui and gethui() or game.GetService(game,"CoreGui")) end)
                if not var_uiCorner_5af2.Parent then var_uiCorner_5af2.Parent = PlayerGui end
                State.var_uiCorner_db85 = Instance.new("Frame")
                State.var_uiCorner_db85.Name = "MainFrame"
                State.var_uiCorner_db85.Size = UDim2.new(0, 180, 0, 42)
                State.var_uiCorner_db85.Position = UDim2.new(0.5, 0, 0.82, 0)
                State.var_uiCorner_db85.AnchorPoint = Vector2.new(0.5, 0.5)
                State.var_uiCorner_db85.BackgroundColor3 = Color3.fromRGB((20.0), 20, 25)
                State.var_uiCorner_db85.BackgroundTransparency = 0.1
                State.var_uiCorner_db85.BorderSizePixel = (0.0)
                State.var_uiCorner_db85.Parent = var_uiCorner_5af2
                local var_uiCorner_2ff8 = Instance.new("UICorner")
                var_uiCorner_2ff8.CornerRadius = UDim.new(0, 8)
                var_uiCorner_2ff8.Parent = State.var_uiCorner_db85
                local var_uiCorner_5a7b = Instance.new("UIStroke")
                var_uiCorner_5a7b.Color = Color3.fromRGB((45.0), 45, 55)
                var_uiCorner_5a7b.Thickness = 1
                var_uiCorner_5a7b.Transparency = 0.2
                var_uiCorner_5a7b.Parent = State.var_uiCorner_db85
                local var_frame_fbc1 = Instance.new("UIGradient")
                var_frame_fbc1.Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(35, (35.0), (40.0))),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(15, (15.0), 20))
                })
                var_frame_fbc1.Rotation = 90
                var_frame_fbc1.Parent = State.var_uiCorner_db85
                State.var_viewportSize_69bb = Instance.new("Frame")
        if (1554%2==0) then local var_frame_7583=840 else local var_frame_7583=775 end
                State.var_viewportSize_69bb.Name = "AccentBar"
                State.var_viewportSize_69bb.Size = UDim2.new(0, 3, (1.0), -12)
                State.var_viewportSize_69bb.Position = UDim2.new(0, (6.0), 0, 6)
                State.var_viewportSize_69bb.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
                State.var_viewportSize_69bb.BorderSizePixel = 0
                State.var_viewportSize_69bb.Parent = State.var_uiCorner_db85
                local var_uiCorner_7c6e = Instance.new("UICorner")
                var_uiCorner_7c6e.CornerRadius = UDim.new(1, (0.0))
                var_uiCorner_7c6e.Parent = State.var_viewportSize_69bb
                State.var_uiCorner_3eed = Instance.new("TextLabel")
                State.var_uiCorner_3eed.Name = "StatusText"
                State.var_uiCorner_3eed.Size = UDim2.new((1.0), (-18.0), 0, 18)
                State.var_uiCorner_3eed.Position = UDim2.new(0, 14, 0, (5.0))
                State.var_uiCorner_3eed.BackgroundTransparency = (1.0)
                State.var_uiCorner_3eed.Text = "NO TARGET"
                State.var_uiCorner_3eed.TextColor3 = Color3.fromRGB(255, 255, (255.0))
                State.var_uiCorner_3eed.TextSize = (13.0)
                State.var_uiCorner_3eed.Font = Enum.Font.GothamBold
                State.var_uiCorner_3eed.TextXAlignment = Enum.TextXAlignment.Left
                State.var_uiCorner_3eed.TextTruncate = Enum.TextTruncate.AtEnd
                State.var_uiCorner_3eed.Parent = State.var_uiCorner_db85
                State.var_backgroundTransparency_c521 = Instance.new("TextLabel")
                State.var_backgroundTransparency_c521.Name = "InfoText"
                State.var_backgroundTransparency_c521.Size = UDim2.new((1.0), -18, (0.0), 14)
                State.var_backgroundTransparency_c521.Position = UDim2.new((0.0), 14, 0, (23.0))
                State.var_backgroundTransparency_c521.BackgroundTransparency = 1
                State.var_backgroundTransparency_c521.Text = "Aim to Survivor"
                State.var_backgroundTransparency_c521.TextColor3 = Color3.fromRGB((160.0), 160, 170)
                State.var_backgroundTransparency_c521.TextSize = 10
                State.var_backgroundTransparency_c521.Font = Enum.Font.Gotham
                State.var_backgroundTransparency_c521.TextXAlignment = Enum.TextXAlignment.Left
                State.var_backgroundTransparency_c521.TextTruncate = Enum.TextTruncate.AtEnd
                State.var_backgroundTransparency_c521.Parent = State.var_uiCorner_db85
                State.var_rootPart_9387 = var_uiCorner_5af2
            end
            fn_ResetHandler_dd28()

            local function fn_ResetHandler_e245()
                State.var_uiCorner_3435 = Instance.new("ScreenGui")
                State.var_uiCorner_3435.Name = "SpearVeil_SnapLine"
                State.var_uiCorner_3435.IgnoreGuiInset = true
                State.var_uiCorner_3435.ResetOnSpawn = false
                State.var_uiCorner_3435.DisplayOrder = 999999
                pcall(function() State.var_uiCorner_3435.Parent = (gethui and gethui() or game.GetService(game,"CoreGui")) end)
                if not State.var_uiCorner_3435.Parent then State.var_uiCorner_3435.Parent = PlayerGui end
                State.var_backgroundTransparency_b0a6 = Instance.new("Frame")
                State.var_backgroundTransparency_b0a6.Name = "Line"
                State.var_backgroundTransparency_b0a6.AnchorPoint = Vector2.new(0.5, 0.5)
                State.var_backgroundTransparency_b0a6.BorderSizePixel = 0
                State.var_backgroundTransparency_b0a6.BackgroundColor3 = Color3.fromRGB((255.0), 220, 0)
                State.var_backgroundTransparency_b0a6.BackgroundTransparency = 0.35
                State.var_backgroundTransparency_b0a6.Visible = false
                State.var_backgroundTransparency_b0a6.Parent = State.var_uiCorner_3435
                State.var_uiCorner_ca7b = Instance.new("Frame")
                State.var_uiCorner_ca7b.Name = "Dot"
                State.var_uiCorner_ca7b.AnchorPoint = Vector2.new(0.5, 0.5)
                State.var_uiCorner_ca7b.BorderSizePixel = 0
                State.var_uiCorner_ca7b.BackgroundColor3 = Color3.fromRGB((255.0), 220, 0)
                State.var_uiCorner_ca7b.BackgroundTransparency = 0
                State.var_uiCorner_ca7b.Size = UDim2.fromOffset(4, 4)
                State.var_uiCorner_ca7b.Visible = false
                State.var_uiCorner_ca7b.Parent = State.var_uiCorner_3435
                local var_uiCorner_be7b = Instance.new("UICorner")
                var_uiCorner_be7b.CornerRadius = UDim.new(1, (0.0))
                var_uiCorner_be7b.Parent = State.var_uiCorner_ca7b
                State.var_uiCorner_8bbb = Instance.new("TextLabel")
                State.var_uiCorner_8bbb.Name = "InfoText"
                State.var_uiCorner_8bbb.AnchorPoint = Vector2.new(0.5, 1)
                State.var_uiCorner_8bbb.Size = UDim2.new((0.0), (200.0), (0.0), (16.0))
                State.var_uiCorner_8bbb.BackgroundTransparency = 1
                State.var_uiCorner_8bbb.Text = ""
                State.var_uiCorner_8bbb.TextColor3 = Color3.fromRGB((255.0), (255.0), (255.0))
                State.var_uiCorner_8bbb.TextSize = 12
                State.var_uiCorner_8bbb.Font = Enum.Font.GothamBold
                State.var_uiCorner_8bbb.TextStrokeTransparency = 0
                State.var_uiCorner_8bbb.TextStrokeColor3 = Color3.new(0, (0.0), 0)
                State.var_uiCorner_8bbb.TextXAlignment = Enum.TextXAlignment.Center
                State.var_uiCorner_8bbb.TextTruncate = Enum.TextTruncate.AtEnd
                State.var_uiCorner_8bbb.Visible = false
                State.var_uiCorner_8bbb.Parent = State.var_uiCorner_3435
            end
        do local var_unknownValue_0026_fc55=2541%73 end
        if false then local var_unknownValue_0018_f4c4=548 end
            fn_ResetHandler_e245()

            local function fn_internalFunction_46e4(var_vector_8bc5, var_error_6022, speed, var_vector_b7cd)
                local var_unknownValue_0036_1a36 = math.cos(var_error_6022)
                if var_unknownValue_0036_1a36 <= 0.015 then return nil, nil end
                local travelTime = var_vector_8bc5 / (speed * var_unknownValue_0036_1a36)
                if travelTime ~= travelTime or travelTime <= 0 then return nil, nil end
                local var_unknownValue_0005_76f1 = (1.0) / 60
                local var_unknownValue_0017_de8a = 0.5 * var_vector_b7cd * var_unknownValue_0005_76f1 * travelTime
                local var_unknownValue_0042_e35c = speed * math.sin(var_error_6022) * travelTime - (0.5 * var_vector_b7cd * travelTime * travelTime) - var_unknownValue_0017_de8a
                return var_unknownValue_0042_e35c, travelTime
            end
            local function fn_internalFunction_aa98(var_vector_8bc5, var_vector_da8e, var_error_6022, speed, var_vector_b7cd)
                local var_unknownValue_0028_de6d, travelTime = fn_internalFunction_46e4(var_vector_8bc5, var_error_6022, speed, var_vector_b7cd)
                if not var_unknownValue_0028_de6d or not travelTime then return nil end
                if travelTime < 0.025 or travelTime > 5 then return nil end
                local var_vector_39ee = math.abs(var_unknownValue_0028_de6d - var_vector_da8e)
                local var_vector_87eb = math.max(var_error_6022 - var_playerGui_106d, (0.0)) * 0.35
                local var_vector_65b3 = math.max(travelTime - 1.3, 0) * 0.25
                return var_vector_39ee + var_vector_87eb + var_vector_65b3, var_vector_39ee, travelTime
            end
            local function fn_internalFunction_445a(var_vector_1014, var_rootPart_e5eb, speed, var_vector_b7cd)
                if speed <= 0 then speed = 142.5 end
                if var_vector_b7cd <= 0 then var_vector_b7cd = 196.2 end
                local var_vector_d809 = var_rootPart_e5eb - var_vector_1014
                local var_rootPart_5810 = Vector3.new(var_vector_d809.X, 0, var_vector_d809.Z)
                local var_vector_8bc5 = var_rootPart_5810.Magnitude
                local var_vector_da8e = var_vector_d809.Y
                if var_vector_d809.Magnitude <= 0.001 then return nil end
                if var_vector_8bc5 <= 0.35 or var_vector_b7cd <= 0.001 then
                    return var_vector_d809.Unit, math.clamp(var_vector_d809.Magnitude / speed, 0.025, (5.0))
                end
                local var_vector_4451 = var_rootPart_5810.Unit
                local var_error_af43 = math.atan2(var_vector_da8e, var_vector_8bc5)
                local var_error_655c = math.max(-var_playerGui_8190, var_error_af43 - var_playerGui_2578)
                local var_error_a1ba = var_error_eb01
                local var_player_a388, bestScore, bestError, bestTime = nil, math.huge, math.huge, nil

                local var_error_c8fe = var_vector_8bc5 > 80
                local var_error_f5dc = var_error_c8fe and 44 or (30.0)
                local var_error_de37 = var_error_c8fe and 0.08 or var_color_d0dd
                for var_remoteEvent_5dde = 0, var_error_f5dc do
                    local var_error_6022 = var_error_655c + (var_error_a1ba - var_error_655c) * (var_remoteEvent_5dde / var_error_f5dc)
                    local var_error_4254, var_vector_39ee, travelTime = fn_internalFunction_aa98(var_vector_8bc5, var_vector_da8e, var_error_6022, speed, var_vector_b7cd)
                    if var_error_4254 and var_error_4254 < bestScore then
                        bestScore, bestError, var_player_a388, bestTime = var_error_4254, var_vector_39ee, var_error_6022, travelTime
                        if bestError < var_error_de37 then break end
                    end
                end
                if var_player_a388 then
                    local var_error_8ff4 = (var_error_a1ba - var_error_655c) / var_error_f5dc * 2.5
                    local var_error_5a1a = (bestError < var_error_de37) and 1 or (var_error_c8fe and 6 or 4)
                    for _ = 1, var_error_5a1a do
                        local var_error_8931, localBestScore, localBestError, localBestTime = var_player_a388, bestScore, bestError, bestTime
                        for var_error_358e = -3, 3 do
                            local var_error_6022 = math.clamp(var_player_a388 + var_error_8ff4 * (var_error_358e / (3.0)), var_error_655c, var_error_a1ba)
                            local var_error_4254, var_vector_39ee, travelTime = fn_internalFunction_aa98(var_vector_8bc5, var_vector_da8e, var_error_6022, speed, var_vector_b7cd)
                            if var_error_4254 and var_error_4254 < localBestScore then
                                localBestScore, localBestError, var_error_8931, localBestTime = var_error_4254, var_vector_39ee, var_error_6022, travelTime
                            end
                        end
                        var_player_a388, bestScore, bestError, bestTime = var_error_8931, localBestScore, localBestError, localBestTime
                        if bestError < var_error_de37 then break end
                        var_error_8ff4 = var_error_8ff4 * 0.38
                    end
                end
                if not var_player_a388 then
                    local var_vector_4986 = math.clamp(var_vector_8bc5 / speed, 0.025, 5)


                    local var_vector_b605 = math.min(0.5 * var_vector_b7cd * var_vector_4986 * var_vector_4986, 15)
                    local var_vector_e5a4 = var_rootPart_e5eb + Vector3.new(0, var_vector_b605, (0.0))
                    local var_vector_8e36 = var_vector_e5a4 - var_vector_1014
                    if var_vector_8e36.Magnitude <= 0.001 then return nil end
                    return var_vector_8e36.Unit, var_vector_4986
                end
                local var_connection_fd87 = var_vector_4451 * math.cos(var_player_a388) + Vector3.new((0.0), math.sin(var_player_a388), 0)
                if var_connection_fd87.Magnitude <= 0.001 then return nil end
                return var_connection_fd87.Unit, bestTime
            end
            local function fn_ServerHelper_823a(var_vector_8bc5, var_vector_da8e, speed, var_vector_b7cd)
                if speed <= 0 or var_vector_b7cd <= (0.0) then return false end
                local var_success_8409, var_backgroundTransparency_34eb, var_value_d1f9, var_remoteEvent_1e8c = var_vector_8bc5, var_vector_da8e, speed, var_vector_b7cd
                local var_unknownValue_0019_bcad = (var_remoteEvent_1e8c * var_success_8409 * var_success_8409) / (2 * var_value_d1f9 * var_value_d1f9)
                if var_unknownValue_0019_bcad <= 0 then return false end
                local var_rootPart_4e4c, var_rootPart_b34c, var_connection_d9f3 = var_unknownValue_0019_bcad, -var_success_8409, var_backgroundTransparency_34eb + var_unknownValue_0019_bcad
                return (var_rootPart_b34c*var_rootPart_b34c - 4*var_rootPart_4e4c*var_connection_d9f3) >= 0
            end
            local function fn_ServerHandler_8e25(var_vector_8bc5, var_vector_da8e, var_vector_b7cd)
                for t = 0.1, 3.0, 0.05 do
                    local var_uiCorner_3581 = 23
                    if t < 1 then var_uiCorner_3581 = math.max(23, t * 150)
                    elseif t < 2 then var_uiCorner_3581 = 142.5
                    else var_uiCorner_3581 = (165.0) end
        do local var_unknownValue_0051_5cf0=313 end
                    if fn_ServerHelper_823a(var_vector_8bc5, var_vector_da8e, var_uiCorner_3581, var_vector_b7cd) then return t end
                end
                return nil
            end

            do
                local var_connection_f05a = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Killers"):WaitForChild("Veil"):WaitForChild("Spearthrow")
                local var_connection_f573 = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Mechanics"):WaitForChild("visualize")
                var_connection_f573.OnClientEvent.Connect(var_connection_f573.OnClientEvent,function(ownerChar, spearDir, spearSpeed, gravityMult)
                    if ownerChar == LocalPlayer.Character then

                        if type(spearSpeed) == "number" and spearSpeed >= 15 and spearSpeed <= 800 then State.state_unhookYourself_bc03 = spearSpeed end
                        if type(gravityMult) == "number" and gravityMult > 0.2 and gravityMult <= 5 then State.state_unhookYourself_1454 = gravityMult end

                        local var_buffer_e08b = State.spearLastShot
                        if var_buffer_e08b and (tick() - (var_buffer_e08b.t or 0)) < 5 and (var_buffer_e08b.speed or (0.0)) > (1.0)
                            and type(spearSpeed) == "number" and spearSpeed >= (15.0) and spearSpeed <= (800.0) then
                            local var_name_bae5 = spearSpeed / var_buffer_e08b.speed
                            if var_name_bae5 > 0.2 and var_name_bae5 < 5 then
                                local var_name_90a9 = tonumber(State.var_predictionResult_36d0) or 1.0
                                State.var_predictionResult_36d0 = math.clamp(var_name_90a9 + (var_name_bae5 - 1) * 0.3, 0.5, 2.0)
                            end
                        end
                    end
                end)
                local var_remote_a657
                var_remote_a657 = hookmetamethod(game, "__namecall", function(...)
                    local var_connection_513e = getnamecallmethod()
                    if var_connection_513e == "FireServer" then
                        local var_remote_afc9 = table.pack(...)
                        local self = var_remote_afc9[1]
                        if typeof(self) == "Instance" and rawequal(self, var_connection_f05a) then
                            if State.silentSpearEnabled and typeof(State.var_predictedPosition_ff6d) == "Vector3" then
                                if var_remote_afc9.n >= 4 and typeof(var_remote_afc9[(2.0)]) == "Vector3" and typeof(var_remote_afc9[(4.0)]) == "Vector3" then
                                    var_remote_afc9[2] = State.var_predictedPosition_ff6d
                                    local var_buffer_e08b = State.spearLastShot
                                    if var_buffer_e08b then
                                        print(string.format("[Spear] fire dist=%.0f spd=%.0f(raw%.0f,cal%.2f) tof=%.2f lead=%.1f ping=%.0fms grav=%.2f stab=%.2f", var_buffer_e08b.dist or 0, var_buffer_e08b.speed or 0, var_buffer_e08b.raw or 0, tonumber(State.var_predictionResult_36d0) or (1.0), var_buffer_e08b.tof or 0, var_buffer_e08b.lead or (0.0), (var_buffer_e08b.ping or 0) * (1000.0), var_buffer_e08b.grav or 1, var_buffer_e08b.stab == nil and -1 or var_buffer_e08b.stab))
                                    end
                                    return var_remote_a657(table.unpack(var_remote_afc9, 1, var_remote_afc9.n))
                                end
                            end
                        end
                    end
                    return var_remote_a657(...)
                end)
                local var_remote_f875
                var_remote_f875 = hookmetamethod(game, "__index", function(t, var_child_5b0e)
                    if var_child_5b0e == "FireServer" and typeof(t) == "Instance" and rawequal(t, var_connection_f05a) then
                        return newcclosure(function(...)
                            local var_remote_afc9 = table.pack(...)
                            if State.silentSpearEnabled and typeof(State.var_predictedPosition_ff6d) == "Vector3" then
                                if var_remote_afc9.n >= 4 and typeof(var_remote_afc9[2]) == "Vector3" and typeof(var_remote_afc9[4]) == "Vector3" then
                                    var_remote_afc9[2] = State.var_predictedPosition_ff6d
                                    local var_buffer_e08b = State.spearLastShot
                                    if var_buffer_e08b then
                                        print(string.format("[Spear] fire dist=%.0f spd=%.0f(raw%.0f,cal%.2f) tof=%.2f lead=%.1f ping=%.0fms grav=%.2f stab=%.2f", var_buffer_e08b.dist or (0.0), var_buffer_e08b.speed or 0, var_buffer_e08b.raw or 0, tonumber(State.var_predictionResult_36d0) or (1.0), var_buffer_e08b.tof or 0, var_buffer_e08b.lead or (0.0), (var_buffer_e08b.ping or 0) * 1000, var_buffer_e08b.grav or 1, var_buffer_e08b.stab == nil and (-1.0) or var_buffer_e08b.stab))
                                    end
                                end
                            end
                            return var_remote_f875(t, var_child_5b0e)(table.unpack(var_remote_afc9, 1, var_remote_afc9.n))
                        end)
                    end
                    return var_remote_f875(t, var_child_5b0e)
                end)
            end

            do
                local var_connection_1880 = {}
                local function fn_GetHelper_a707(var_rootPart_cb24, name)
                    local var_child_3f4a = var_rootPart_cb24 and var_rootPart_cb24.Parent
                    while var_child_3f4a do
                        if var_child_3f4a.Name == name then return true end
                        var_child_3f4a = var_child_3f4a.Parent
                    end
        if (725%2==1) then local var_gui_7fb3=369 else local var_gui_7fb3=389 end
                    return false
                end
                local function fn_UpdateHelper_6129(var_rootPart_cb24)
                    if not (var_rootPart_cb24 and var_rootPart_cb24.IsA(var_rootPart_cb24,"GuiButton")) then return false end
                    if var_rootPart_cb24.Name ~= "attack" and var_rootPart_cb24.Name ~= "Gui-mob" then return false end
                    if not fn_GetHelper_a707(var_rootPart_cb24, "Slasher-mob") and not fn_GetHelper_a707(var_rootPart_cb24, "Survivor-mob") then return false end
                    if not fn_GetHelper_a707(var_rootPart_cb24, "Control") and not fn_GetHelper_a707(var_rootPart_cb24, "Controls") then return false end
                    return true
                end
                local function fn_UpdateHelper_b3e1(var_connection_a646)
                    if not fn_UpdateHelper_6129(var_connection_a646) then return end
                    if var_connection_1880[var_connection_a646] then return end
                    var_connection_1880[var_connection_a646] = true
                    var_connection_a646.InputBegan.Connect(var_connection_a646.InputBegan,function(input)
                        local t = input.UserInputType
                        if t ~= Enum.UserInputType.Touch and t ~= Enum.UserInputType.MouseButton1 then return end
                        local char = LocalPlayer.Character
                        if char and char.GetAttribute(char,"spearmode") then
                            State.var_connection_2a07 = true
                            State.var_connection_67ee = tick()
                        end
                    end)
                    var_connection_a646.InputEnded.Connect(var_connection_a646.InputEnded,function(input)
                        local t = input.UserInputType
                        if t ~= Enum.UserInputType.Touch and t ~= Enum.UserInputType.MouseButton1 then return end
                        State.var_connection_2a07 = false
                        State.var_connection_67ee = nil
                    end)
                end
                local function fn_UpdateHelper_6875()
                    local var_descendant_5584 = LocalPlayer.FindFirstChildOfClass(LocalPlayer,"PlayerGui") or PlayerGui
                    if not var_descendant_5584 then return end
                    pcall(function()
                        local function fn_UpdateHelper_1fe9(screenName)
                            local var_child_b411 = var_descendant_5584.FindFirstChild(var_descendant_5584,screenName, true)
                            if not var_child_b411 then return end
                            local var_descendant_2feb = var_child_b411.FindFirstChild(var_child_b411,"Control") or var_child_b411.FindFirstChild(var_child_b411,"Controls")
                            if var_descendant_2feb then
                                local function fn_RemoveHandler_79bf(var_child_a03d)
                                    for _, var_instance_4e7f in ipairs(var_child_a03d.GetChildren(var_child_a03d)) do
                                        fn_UpdateHelper_b3e1(var_instance_4e7f)
                                        fn_RemoveHandler_79bf(var_instance_4e7f)
                                    end
                                end
                                fn_RemoveHandler_79bf(var_descendant_2feb)
                            end
                            local var_descendant_6e19 = var_child_b411.FindFirstChild(var_child_b411,"Gui-mob", true)
                            if var_descendant_6e19 and var_descendant_6e19.IsA(var_descendant_6e19,"GuiButton") then fn_UpdateHelper_b3e1(var_descendant_6e19) end
                        end
                        fn_UpdateHelper_1fe9("Slasher-mob")
                        fn_UpdateHelper_1fe9("Survivor-mob")
                    end)
                    var_descendant_5584.DescendantAdded.Connect(var_descendant_5584.DescendantAdded,function(var_descendant_fe40) fn_UpdateHelper_b3e1(var_descendant_fe40) end)
                end
                UserInputService.InputBegan.Connect(UserInputService.InputBegan,function(input, var_descendant_ba91)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        local char = LocalPlayer.Character
                        if char and char.GetAttribute(char,"spearmode") then
                            State.var_connection_2a07 = true
                            State.var_connection_67ee = tick()
                        end
                    end
                end)
                UserInputService.InputEnded.Connect(UserInputService.InputEnded,function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        State.var_connection_2a07 = false
                        State.var_connection_67ee = nil
                    end
                end)
                fn_UpdateHelper_6875()
            end

            RegisterTask("Spear_UpdateSnapLine", (0.0), function(var_rootPart_6336)
                local var_name_647a = State.SPEAR_SNAPLINE
                if not var_name_647a.enabled then
                    if State.var_backgroundTransparency_b0a6 then State.var_backgroundTransparency_b0a6.Visible = false end
                    if State.var_uiCorner_ca7b then State.var_uiCorner_ca7b.Visible = false end
                    if State.var_uiCorner_8bbb then State.var_uiCorner_8bbb.Visible = false end
                    var_name_647a.var_humanoid_fb34 = false
                    var_name_647a.var_humanoid_bb46 = nil
                    var_name_647a.var_success_ae01 = ""
                    return
                end
                local var_rootPart_fbb0 = WorkspaceService.CurrentCamera
                if not var_rootPart_fbb0 then
                    if State.var_backgroundTransparency_b0a6 then State.var_backgroundTransparency_b0a6.Visible = false end
                    if State.var_uiCorner_ca7b then State.var_uiCorner_ca7b.Visible = false end
                    if State.var_uiCorner_8bbb then State.var_uiCorner_8bbb.Visible = false end
                    return
                end
                local var_player_22b6 = LocalPlayer.Character
                local var_rootPart_e4f1 = var_player_22b6 and var_player_22b6.GetAttribute(var_player_22b6,"spearmode")
                if not var_rootPart_e4f1 then
                    if State.var_backgroundTransparency_b0a6 then State.var_backgroundTransparency_b0a6.Visible = false end
                    if State.var_uiCorner_ca7b then State.var_uiCorner_ca7b.Visible = false end
                    if State.var_uiCorner_8bbb then State.var_uiCorner_8bbb.Visible = false end
                    return
                end
                local var_rootPart_a655 = var_rootPart_fbb0.ViewportSize
                local var_rootPart_1bb5 = Vector2.new(var_rootPart_a655.X / 2, var_rootPart_a655.Y / 2)
                local var_player_503c = var_player_22b6 and var_player_22b6.FindFirstChild(var_player_22b6,"HumanoidRootPart")
                local function fn_GetHandler_6b8e()
                    local var_player_150a = nil
                    local var_player_8bb0 = math.huge
                    local bestDist3D = math.huge
                    for _, player in ipairs(Players.GetPlayers(Players)) do
                        if player ~= LocalPlayer and GetPlayerRole(player) == "survivor" then
                            local var_player_568c = player.Character
                            if var_player_568c then
                                local var_rootPart_a3ac = var_player_568c.FindFirstChildOfClass(var_player_568c,"Humanoid")
                                local var_humanoid_cd77 = fn_ResetHelper_1ef1(var_player_568c)
                                if var_humanoid_cd77 and var_rootPart_a3ac and var_rootPart_a3ac.Health > 0 and var_rootPart_a3ac.Health > 50 and not var_player_568c.GetAttribute(var_player_568c,"IsHooked") then
                                    local var_vector_f0f8 = var_player_503c and (var_humanoid_cd77 - var_player_503c.Position).Magnitude or 0
                                    if var_vector_f0f8 <= Config.spearSnaplineMaxDistance then
                                        local var_viewportSize_ced1, onScreen = var_rootPart_fbb0.WorldToViewportPoint(var_rootPart_fbb0,var_humanoid_cd77)
                                        if onScreen then
                                            local var_viewportSize_4830 = (Vector2.new(var_viewportSize_ced1.X, var_viewportSize_ced1.Y) - var_rootPart_1bb5).Magnitude
                                            if var_viewportSize_4830 <= Config.spearFovRadius then
                                                if var_viewportSize_4830 < var_player_8bb0 then
                                                    var_player_8bb0 = var_viewportSize_4830
                                                    bestDist3D = var_vector_f0f8
                                                    var_player_150a = player
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                    return var_player_150a, var_player_8bb0, bestDist3D
                end
                if State.var_connection_2a07 and not var_name_647a.var_humanoid_fb34 then
                    local var_player_150a, _, bestDist3D = fn_GetHandler_6b8e()
                    if var_player_150a then
                        var_name_647a.var_humanoid_fb34 = true
                        var_name_647a.var_humanoid_bb46 = var_player_150a
                        var_name_647a.var_success_ae01 = var_player_150a.Name
                        var_name_647a.var_position_61e3 = bestDist3D
                    end
                end
                if not State.var_connection_2a07 then
                    var_name_647a.var_humanoid_fb34 = false
                    var_name_647a.var_humanoid_bb46 = nil
                    var_name_647a.var_success_ae01 = ""
                end
                local var_position_a45f = false
                local var_position_994a = nil
                local var_position_8517 = 0
                local var_humanoid_b99f = nil
                if var_name_647a.var_humanoid_fb34 and var_name_647a.var_humanoid_bb46 then
                    local var_player_568c = var_name_647a.var_humanoid_bb46.Character
                    if var_player_568c then
                        local var_rootPart_a3ac = var_player_568c.FindFirstChildOfClass(var_player_568c,"Humanoid")
                        local var_humanoid_cd77 = fn_ResetHelper_1ef1(var_player_568c)
                        if var_humanoid_cd77 and var_rootPart_a3ac and var_rootPart_a3ac.Health > (50.0) and not var_player_568c.GetAttribute(var_player_568c,"IsHooked") then
                            local var_viewportSize_ced1, onScreen = var_rootPart_fbb0.WorldToViewportPoint(var_rootPart_fbb0,var_humanoid_cd77)
                            if onScreen then
                                local var_viewportSize_4830 = (Vector2.new(var_viewportSize_ced1.X, var_viewportSize_ced1.Y) - var_rootPart_1bb5).Magnitude
                                if var_viewportSize_4830 <= Config.spearFovRadius * 1.15 then
                                    var_position_994a = Vector2.new(var_viewportSize_ced1.X, var_viewportSize_ced1.Y)
                                    var_position_8517 = var_player_503c and (var_humanoid_cd77 - var_player_503c.Position).Magnitude or 0
                                    var_humanoid_b99f = var_humanoid_cd77
                                    var_position_a45f = true
                                    var_name_647a.var_position_61e3 = var_position_8517
                                end
                            end
                        end
                    end
                    if not var_position_a45f then
                        var_name_647a.var_humanoid_fb34 = false
                        var_name_647a.var_humanoid_bb46 = nil
                        var_name_647a.var_success_ae01 = ""
                    end
                end
                local var_success_4c04 = nil
                local var_success_d43f = 0
                local var_character_6681 = nil
                local var_vector_b0c7 = nil
                if not var_name_647a.var_humanoid_fb34 then
                    local var_player_150a, _, bestDist3D = fn_GetHandler_6b8e()
                    if var_player_150a then
                        local var_humanoid_cd77 = fn_ResetHelper_1ef1(var_player_150a.Character)
                        local var_viewportSize_ced1, _ = var_rootPart_fbb0.WorldToViewportPoint(var_rootPart_fbb0,var_humanoid_cd77)
                        var_success_4c04 = Vector2.new(var_viewportSize_ced1.X, var_viewportSize_ced1.Y)
                        var_success_d43f = bestDist3D
                        var_character_6681 = var_humanoid_cd77
                        var_vector_b0c7 = var_player_150a
                        var_name_647a.var_position_61e3 = bestDist3D
                    end
                end
                local var_backgroundTransparency_72d9 = false
                if State.var_connection_2a07 and State.var_connection_67ee and var_player_503c then
                    local var_vector_82b8 = var_humanoid_b99f or (var_vector_b0c7 and fn_ResetHelper_1ef1(var_vector_b0c7.Character))
                    if var_vector_82b8 then
                        local var_vector_1014 = var_rootPart_fbb0.CFrame.Position
                        local var_vector_d809 = var_vector_82b8 - var_vector_1014
                        local var_rootPart_5810 = Vector3.new(var_vector_d809.X, 0, var_vector_d809.Z)
                        local var_vector_8bc5 = var_rootPart_5810.Magnitude
                        local var_vector_da8e = var_vector_d809.Y
                        local var_vector_b7cd = WorkspaceService.Gravity * (State.state_unhookYourself_1454 or 1)
                        local var_color_14ee = fn_ServerHandler_8e25(var_vector_8bc5, var_vector_da8e, var_vector_b7cd)
                        if var_color_14ee then
                            local var_color_3e7a = tick() - State.var_connection_67ee
                            if var_color_3e7a >= var_color_14ee then var_backgroundTransparency_72d9 = true end
                        end
                    end
                end
                local var_success_73a2 = nil
                local var_position_f136 = ""
                local var_position_833a = 0
                if var_name_647a.var_humanoid_fb34 and var_position_a45f then
                    var_success_73a2 = var_position_994a
                    var_position_f136 = var_name_647a.var_success_ae01
                    var_position_833a = var_position_8517
                elseif var_success_4c04 then
                    var_success_73a2 = var_success_4c04
                    var_position_f136 = var_vector_b0c7 and var_vector_b0c7.Name or ""
                    var_position_833a = var_success_d43f
                end
                local var_success_abb9 = pcall(function()
                    if not State.var_backgroundTransparency_b0a6 or not State.var_uiCorner_ca7b or not State.var_uiCorner_8bbb or not var_rootPart_fbb0 then
                        if State.var_backgroundTransparency_b0a6 then State.var_backgroundTransparency_b0a6.Visible = false end
                        if State.var_uiCorner_ca7b then State.var_uiCorner_ca7b.Visible = false end
                        if State.var_uiCorner_8bbb then State.var_uiCorner_8bbb.Visible = false end
                        return
                    end
                    if not var_success_73a2 then
                        State.var_backgroundTransparency_b0a6.Visible = false
                        State.var_uiCorner_ca7b.Visible = false
                        State.var_uiCorner_8bbb.Visible = false
                        var_name_647a.var_position_61e3 = math.huge
                        return
                    end
                    local var_viewportSize_a48c = var_rootPart_1bb5
                    local var_viewportSize_8541 = var_success_73a2
                    local var_position_6793 = var_viewportSize_8541 - var_viewportSize_a48c
                    local length = var_position_6793.Magnitude
                    if length < 2 then
                        State.var_backgroundTransparency_b0a6.Visible = false
                        State.var_uiCorner_ca7b.Visible = false
                        State.var_uiCorner_8bbb.Visible = false
                        return
                    end
                    local var_backgroundTransparency_bad9 = var_backgroundTransparency_72d9
                    local var_backgroundTransparency_45bf = var_backgroundTransparency_bad9 and Color3.fromRGB(0, 255, 120) or Color3.fromRGB(255, 220, 0)
                    local var_backgroundTransparency_e30f = var_backgroundTransparency_bad9 and 0.08 or 0.35
                    State.var_backgroundTransparency_b0a6.BackgroundColor3 = var_backgroundTransparency_45bf
                    State.var_backgroundTransparency_b0a6.BackgroundTransparency = var_backgroundTransparency_e30f
                    State.var_backgroundTransparency_b0a6.Size = UDim2.fromOffset(length, var_backgroundTransparency_bad9 and (2.0) or (1.0))
                    State.var_backgroundTransparency_b0a6.Position = UDim2.fromOffset((var_viewportSize_a48c.X + var_viewportSize_8541.X) * 0.5, (var_viewportSize_a48c.Y + var_viewportSize_8541.Y) * 0.5)
                    State.var_backgroundTransparency_b0a6.Rotation = math.deg(math.atan2(var_position_6793.Y, var_position_6793.X))
                    State.var_backgroundTransparency_b0a6.Visible = true
                    State.var_uiCorner_ca7b.BackgroundColor3 = var_backgroundTransparency_45bf
                    State.var_uiCorner_ca7b.Position = UDim2.fromOffset(var_viewportSize_8541.X, var_viewportSize_8541.Y)
                    State.var_uiCorner_ca7b.Visible = true
                    if Config.spearShowNameStuds and var_position_f136 ~= "" then
                        State.var_uiCorner_8bbb.Text = string.format("%s [%dm]", var_position_f136, math.floor(var_position_833a))
                        State.var_uiCorner_8bbb.TextColor3 = var_backgroundTransparency_45bf
                        State.var_uiCorner_8bbb.Position = UDim2.fromOffset(var_viewportSize_8541.X, var_viewportSize_8541.Y - (14.0))
                        State.var_uiCorner_8bbb.Visible = true
                    else
                        State.var_uiCorner_8bbb.Visible = false
                    end
                end)
                if not var_success_abb9 then
                    if State.var_backgroundTransparency_b0a6 then State.var_backgroundTransparency_b0a6.Visible = false end
                    if State.var_uiCorner_ca7b then State.var_uiCorner_ca7b.Visible = false end
                    if State.var_uiCorner_8bbb then State.var_uiCorner_8bbb.Visible = false end
                end
            end)

            RegisterTask("Spear_UpdateSpearSystem", 0, function()
                if State.var_uiCorner_8eda then
                    State.var_uiCorner_8eda.Visible = State.spearFovCircleEnabled
                    local var_sizeOrPosition_8ebb = Config.spearFovRadius * 2
                    if State.var_uiCorner_8eda.Size.X.Offset ~= var_sizeOrPosition_8ebb then
                        State.var_uiCorner_8eda.Size = UDim2.new((0.0), var_sizeOrPosition_8ebb, (0.0), var_sizeOrPosition_8ebb)
                    end
                end
                if not State.silentSpearEnabled then
                    State.var_predictedPosition_a992 = nil
                    State.var_predictedPosition_ff6d = nil
                end
                local var_player_22b6 = LocalPlayer.Character
                local var_rootPart_e4f1 = var_player_22b6 and var_player_22b6.GetAttribute(var_player_22b6,"spearmode")
                if not State.spearAimIndicatorEnabled or not var_rootPart_e4f1 then
                    if State.var_rootPart_9387 then State.var_rootPart_9387.Enabled = false end
                    if not State.silentSpearEnabled or not var_rootPart_e4f1 then return end
                end
                local var_player_503c = var_player_22b6 and var_player_22b6.FindFirstChild(var_player_22b6,"HumanoidRootPart")
                if not var_player_503c then return end
                local var_rootPart_fbb0 = workspace.CurrentCamera
                if not var_rootPart_fbb0 then return end
                if State.spearAimIndicatorEnabled and var_rootPart_e4f1 and State.var_rootPart_9387 then
                    State.var_rootPart_9387.Enabled = true
                end
                local var_player_150a = nil
                local var_player_8bb0 = math.huge
                local bestDist3D = math.huge
                local var_player_dad1 = false
                local var_player_86a2 = Vector2.new(var_rootPart_fbb0.ViewportSize.X / (2.0), var_rootPart_fbb0.ViewportSize.Y / 2)
                for _, player in ipairs(Players.GetPlayers(Players)) do
                    if player ~= LocalPlayer and GetPlayerRole(player) == "survivor" then
                        local var_player_568c = player.Character
                        if var_player_568c then
                            local var_rootPart_a3ac = var_player_568c.FindFirstChildOfClass(var_player_568c,"Humanoid")
                            local var_humanoid_cd77 = fn_ResetHelper_1ef1(var_player_568c)
                            local var_rootPart_599c = var_player_568c.FindFirstChild(var_player_568c,"HumanoidRootPart")
                            if var_rootPart_a3ac and var_rootPart_a3ac.Health > 50 and typeof(var_humanoid_cd77) == "Vector3" and var_rootPart_599c and not var_player_568c.GetAttribute(var_player_568c,"IsHooked") then
                                local var_vector_f0f8 = (var_humanoid_cd77 - var_player_503c.Position).Magnitude
                                local var_viewportSize_ced1, onScreen = var_rootPart_fbb0.WorldToViewportPoint(var_rootPart_fbb0,var_humanoid_cd77)
                                if onScreen then
                                    local var_viewportSize_4830 = (Vector2.new(var_viewportSize_ced1.X, var_viewportSize_ced1.Y) - var_player_86a2).Magnitude
                                    if var_viewportSize_4830 <= Config.spearFovRadius then
                                        if var_viewportSize_4830 < var_player_8bb0 then
                                            var_player_8bb0 = var_viewportSize_4830
                                            bestDist3D = var_vector_f0f8
                                            var_player_150a = player
                                            var_player_dad1 = true
                                        end
                                    elseif not var_player_dad1 and var_vector_f0f8 < bestDist3D then
                                        bestDist3D = var_vector_f0f8
                                        var_player_150a = player
                                    end
                                elseif not var_player_dad1 and var_vector_f0f8 < bestDist3D then
                                    bestDist3D = var_vector_f0f8
                                    var_player_150a = player
                                end
                            end
                        end
                    end
                end
                if var_player_150a and var_player_150a.Character then
                    local var_humanoid_cd77 = fn_ResetHelper_1ef1(var_player_150a.Character)
                    if var_humanoid_cd77 then var_player_dad1 = fn_ResetHelper_d5a6(var_rootPart_fbb0, var_humanoid_cd77, Config.spearFovRadius) end
                end
                if State.spearAimIndicatorEnabled and var_rootPart_e4f1 then
                    if not var_player_150a or not var_player_150a.Character then
                        State.var_uiCorner_3eed.Text = "NO TARGET"
                        State.var_uiCorner_3eed.TextColor3 = Color3.fromRGB(200, 200, 200)
                        State.var_viewportSize_69bb.BackgroundColor3 = Color3.fromRGB(80, 80, (80.0))
                        State.var_backgroundTransparency_c521.Text = "Aim to Survivor"
                        return
                    end
                    local var_humanoid_cd77 = fn_ResetHelper_1ef1(var_player_150a.Character)
                    local var_vector_1014 = var_rootPart_fbb0.CFrame.Position
                    local var_vector_d809 = var_humanoid_cd77 - var_vector_1014
                    local var_rootPart_5810 = Vector3.new(var_vector_d809.X, 0, var_vector_d809.Z)
                    local var_vector_8bc5 = var_rootPart_5810.Magnitude
                    local var_vector_da8e = var_vector_d809.Y
                    local var_vector_f0f8 = var_vector_d809.Magnitude
                    local var_vector_b7cd = WorkspaceService.Gravity * (State.state_unhookYourself_1454 or 1)
                    local var_color_14ee = fn_ServerHandler_8e25(var_vector_8bc5, var_vector_da8e, var_vector_b7cd)
                    local var_color_cbce = var_player_150a.Name
                    local var_color_ced7 = string.format("%.0f", var_vector_f0f8)
                    if not var_color_14ee then
                        State.var_uiCorner_3eed.Text = "OUT OF RANGE"
                        State.var_uiCorner_3eed.TextColor3 = Color3.fromRGB((255.0), 80, (80.0))
                        State.var_viewportSize_69bb.BackgroundColor3 = Color3.fromRGB((255.0), 50, (50.0))
                        State.var_backgroundTransparency_c521.Text = string.format("%s | %s studs", var_color_cbce, var_color_ced7)
                    elseif not var_player_dad1 then
                        State.var_uiCorner_3eed.Text = "AIM AT TARGET"
                        State.var_uiCorner_3eed.TextColor3 = Color3.fromRGB((255.0), (150.0), 150)
                        State.var_viewportSize_69bb.BackgroundColor3 = Color3.fromRGB((255.0), 100, 100)
                        local var_viewportSize_ced1, onScreen = var_rootPart_fbb0.WorldToViewportPoint(var_rootPart_fbb0,var_humanoid_cd77)
                        local var_viewportSize_bea0 = Vector2.new(var_rootPart_fbb0.ViewportSize.X / 2, var_rootPart_fbb0.ViewportSize.Y / (2.0))
                        local var_viewportSize_4830 = (Vector2.new(var_viewportSize_ced1.X, var_viewportSize_ced1.Y) - var_viewportSize_bea0).Magnitude
                        local var_viewportSize_4471 = string.format("%.0f", var_viewportSize_4830 - Config.spearFovRadius)
                        if not onScreen then
                            State.var_backgroundTransparency_c521.Text = "Target di belakang kamera"
                        else
                            State.var_backgroundTransparency_c521.Text = string.format("Masuk FOV: %s px lagi", var_viewportSize_4471)
                        end
                    elseif not State.var_connection_2a07 then
                        State.var_uiCorner_3eed.Text = "READY"
                        State.var_uiCorner_3eed.TextColor3 = Color3.fromRGB(255, 255, 255)
                        State.var_viewportSize_69bb.BackgroundColor3 = Color3.fromRGB(150, 150, (200.0))
                        State.var_backgroundTransparency_c521.Text = string.format("%s | %s studs | Hold: %ss", var_color_cbce, var_color_ced7, string.format("%.2f", var_color_14ee))
                    else
                        local var_color_3e7a = tick() - State.var_connection_67ee
                        local var_color_499a = string.format("%.2f", var_color_3e7a)
                        local var_color_8553 = string.format("%.2f", var_color_14ee)
                        local var_color_5bf6 = fn_ResetHelper_d5a6(var_rootPart_fbb0, var_humanoid_cd77, Config.spearFovRadius)
                        if not var_color_5bf6 then
                            State.var_uiCorner_3eed.Text = "AIM AT TARGET"
                            State.var_uiCorner_3eed.TextColor3 = Color3.fromRGB(255, 150, 150)
                            State.var_viewportSize_69bb.BackgroundColor3 = Color3.fromRGB(255, 100, (100.0))
                            State.var_backgroundTransparency_c521.Text = "Target keluar FOV!"
                        elseif var_color_3e7a >= var_color_14ee then

                            local stabNow = State.spearLastStab
                            if stabNow ~= nil and stabNow < 0.35 then
                                State.var_uiCorner_3eed.Text = "UNSTABLE!"
                                State.var_uiCorner_3eed.TextColor3 = Color3.fromRGB((255.0), 150, 50)
                                State.var_viewportSize_69bb.BackgroundColor3 = Color3.fromRGB((255.0), 150, 50)
                                State.var_backgroundTransparency_c521.Text = "Target bermanuver, tahan dulu..."
                            else
                                State.var_uiCorner_3eed.Text = "RELEASE!"
                                State.var_uiCorner_3eed.TextColor3 = Color3.fromRGB(80, (255.0), 120)
                                State.var_viewportSize_69bb.BackgroundColor3 = Color3.fromRGB(50, (255.0), (100.0))
                                State.var_backgroundTransparency_c521.Text = string.format("Hold: %ss | Ideal: %ss", var_color_499a, var_color_8553)
                            end
                        else
                            State.var_uiCorner_3eed.Text = "HOLD..."
                            State.var_uiCorner_3eed.TextColor3 = Color3.fromRGB(255, (220.0), 100)
                            State.var_viewportSize_69bb.BackgroundColor3 = Color3.fromRGB(255, (200.0), 50)
                            State.var_backgroundTransparency_c521.Text = string.format("Hold: %ss | Ideal: %ss", var_color_499a, var_color_8553)
                        end
                    end
                end
                if State.silentSpearEnabled and var_rootPart_e4f1 and var_player_150a and var_player_150a.Character then
                    local var_humanoid_cd77 = fn_ResetHelper_1ef1(var_player_150a.Character)
                    local var_rootPart_599c = var_player_150a.Character.FindFirstChild(var_player_150a.Character,"HumanoidRootPart")
                    if typeof(var_humanoid_cd77) == "Vector3" and var_rootPart_599c then
                        local var_rootPart_b754 = fn_ResetHelper_d5a6(var_rootPart_fbb0, var_humanoid_cd77, Config.spearFovRadius)
                        if var_rootPart_b754 then
                            local var_vector_1014 = var_rootPart_fbb0.CFrame.Position
                            local var_vector_2e5d = var_humanoid_cd77 - var_vector_1014
                            local var_predictedPosition_3ad5 = var_vector_2e5d.Magnitude
                            if var_predictedPosition_3ad5 > 0.1 then
                                local var_predictedPosition_1c68 = 142.5
                                if State.var_connection_2a07 and State.var_connection_67ee then
                                    local var_unknownValue_0020_6151 = tick() - State.var_connection_67ee
                                    if var_unknownValue_0020_6151 >= 2 then var_predictedPosition_1c68 = 165
                                    elseif var_unknownValue_0020_6151 >= 1 then var_predictedPosition_1c68 = 142.5
                                    else var_predictedPosition_1c68 = math.max(23, var_unknownValue_0020_6151 * 150) end
                                end

                                local var_predictedPosition_459e = var_predictedPosition_1c68
                                var_predictedPosition_1c68 = var_predictedPosition_459e * (tonumber(State.var_predictionResult_36d0) or 1.0)
                                local var_vector_b7cd = WorkspaceService.Gravity * (State.state_unhookYourself_1454 or (1.0))
                                local var_velocity_f9b4, stabNow = nil, (1.0)
                                if Config.spearAutoPrediction then
                                    var_velocity_f9b4, stabNow = fn_RemoveHandler_4a9f(var_basePart_6ff5, var_player_150a.Character, var_humanoid_cd77)
                                else
                                    var_basePart_6ff5.char, var_basePart_6ff5.hist, var_basePart_6ff5.var_playerGui_e1fe = nil, {}, Vector3.new(0, 0, 0)
                                    var_basePart_6ff5.turn = (0.0)
                                    local vel = var_rootPart_599c.AssemblyLinearVelocity
                                    var_velocity_f9b4 = Vector3.new(vel.X, 0, vel.Z)
                                    if var_velocity_f9b4.Magnitude > 65 then var_velocity_f9b4 = var_velocity_f9b4.Unit * 65 end
                                end
                                State.var_predictedPosition_615c = var_velocity_f9b4
                                State.spearLastStab = math.clamp(stabNow or (1.0), 0, 1)

                                local var_rootPart_d1d6 = (1.0)
                                if Config.spearAntiStrafing then var_rootPart_d1d6 = 0.55 + 0.45 * State.spearLastStab end
                                local var_predictedPosition_c4d9, travelTime = fn_internalFunction_445a(var_vector_1014, var_humanoid_cd77, var_predictedPosition_1c68, var_vector_b7cd)
                                if var_predictedPosition_c4d9 and travelTime then

                                    local var_predictedPosition_b43d = Spear_PingSec() * (tonumber(Config.spearPingLead) or 1.0)
                                    local lead = State.var_predictedPosition_615c * ((travelTime + var_predictedPosition_b43d) * var_rootPart_d1d6)

                                    local var_predictedPosition_1dce = math.max(var_predictedPosition_3ad5 * 0.4, (4.0))
                                    if lead.Magnitude > var_predictedPosition_1dce then lead = lead.Unit * var_predictedPosition_1dce end
                                    local predictedPos = var_humanoid_cd77 + lead
                                    local var_predictedPosition_8ecb, finalTime = fn_internalFunction_445a(var_vector_1014, predictedPos, var_predictedPosition_1c68, var_vector_b7cd)

                                    if var_predictedPosition_8ecb and finalTime and finalTime > 0.35 then
                                        local var_predictedPosition_f534 = State.var_predictedPosition_615c * ((finalTime + var_predictedPosition_b43d) * var_rootPart_d1d6)
                                        if var_predictedPosition_f534.Magnitude > var_predictedPosition_1dce then var_predictedPosition_f534 = var_predictedPosition_f534.Unit * var_predictedPosition_1dce end
                                        local var_predictedPosition_dd70 = var_humanoid_cd77 + var_predictedPosition_f534
                                        local var_predictedPosition_60b5 = fn_internalFunction_445a(var_vector_1014, var_predictedPosition_dd70, var_predictedPosition_1c68, var_vector_b7cd)
                                        if var_predictedPosition_60b5 then var_predictedPosition_8ecb, predictedPos = var_predictedPosition_60b5, var_predictedPosition_dd70 end
                                    end
                                    if var_predictedPosition_8ecb then
                                        State.var_predictedPosition_a992 = predictedPos
                                        State.var_predictedPosition_ff6d = var_predictedPosition_8ecb
                                        State.spearLastShot = { dist = var_predictedPosition_3ad5, speed = var_predictedPosition_1c68, raw = var_predictedPosition_459e, tof = travelTime, lead = lead.Magnitude, ping = var_predictedPosition_b43d, t = tick(), grav = (State.state_unhookYourself_1454 or 1), stab = State.spearLastStab }
                                    else
                                        State.var_predictedPosition_a992 = nil
                                        State.var_predictedPosition_ff6d = nil
                                        State.spearLastShot = nil
                                    end
                                else
                                    State.var_predictedPosition_a992 = nil
                                    State.var_predictedPosition_ff6d = nil
                                end
                            else
                                State.var_predictedPosition_a992 = nil
                                State.var_predictedPosition_ff6d = nil
                            end
                        else
                            State.var_predictedPosition_a992 = nil
                            State.var_predictedPosition_ff6d = nil
                        end
                    else
                        State.var_predictedPosition_a992 = nil
                        State.var_predictedPosition_ff6d = nil
                    end
                else
                    State.var_predictedPosition_a992 = nil
                    State.var_predictedPosition_ff6d = nil
                end
            end)
        end

        local fn_NoclipHelper_a1f8, StopJerk
        do
            local var_humanoid_e738 = nil
            local var_humanoid_6c99 = nil
            local var_animationId_8760 = nil
            local track = nil
        if false then local var_success_c4f0=440 end
            local var_humanoid_134f = false

            local function fn_NoclipHandler_87b0()
                var_humanoid_134f = false
                if track then
                    pcall(function() track.Stop(track) end)
                    track = nil
                end
            end

            function StopJerk()
                fn_NoclipHandler_87b0()
                if var_humanoid_6c99 then
                    pcall(function() task.cancel(var_humanoid_6c99) end)
                    var_humanoid_6c99 = nil
                end
                if var_humanoid_e738 then
                    pcall(function() var_humanoid_e738.Destroy(var_humanoid_e738) end)
                    var_humanoid_e738 = nil
                end
            end

            function fn_NoclipHelper_a1f8()
                StopJerk()

                local char = LocalPlayer.Character
                if not char then return end
                local var_humanoid_3937 = char.FindFirstChildOfClass(char,"Humanoid")
                local var_humanoid_4237 = LocalPlayer.FindFirstChildOfClass(LocalPlayer,"Backpack")
                if not var_humanoid_3937 or not var_humanoid_4237 then return end


                var_humanoid_e738 = Instance.new("Tool")
                var_humanoid_e738.Name = "Jerk Off"
                var_humanoid_e738.ToolTip = "in the stripped club. straight up \"jorking it\" . and by \"it\" , haha, well. let's justr say. My peanits."
                var_humanoid_e738.RequiresHandle = false
                var_humanoid_e738.Parent = var_humanoid_4237


                var_humanoid_e738.Equipped.Connect(var_humanoid_e738.Equipped,function() var_humanoid_134f = true end)
                var_humanoid_e738.Unequipped.Connect(var_humanoid_e738.Unequipped,fn_NoclipHandler_87b0)
                var_humanoid_3937.Died.Connect(var_humanoid_3937.Died,fn_NoclipHandler_87b0)


                var_humanoid_6c99 = task.spawn(function()
                    while task.wait() do
                        if not var_humanoid_134f then continue end

                        local var_humanoid_bf6a = LocalPlayer.Character
                        local var_humanoid_f06e = var_humanoid_bf6a and var_humanoid_bf6a.FindFirstChildOfClass(var_humanoid_bf6a,"Humanoid")
                        if not var_humanoid_f06e then continue end

                        local var_humanoid_d997 = var_humanoid_f06e.RigType == Enum.HumanoidRigType.R15

                        if not track then
                            var_animationId_8760 = Instance.new("Animation")

                            var_animationId_8760.AnimationId = not var_humanoid_d997 and "rbxassetid://72042024" or "rbxassetid://698251653"
                            pcall(function()
                                track = var_humanoid_f06e.LoadAnimation(var_humanoid_f06e,var_animationId_8760)
                            end)
                        end

                        if track then
                            pcall(function()
                                track.Play(track)
                                track.AdjustSpeed(track,var_humanoid_d997 and 0.7 or 0.65)
                                track.TimePosition = 0.6
                            end)

                            task.wait(0.1)


                            while track and track.TimePosition < (not var_humanoid_d997 and 0.65 or 0.7) do
                                task.wait(0.1)
                            end

                            if track then
                                pcall(function() track.Stop(track) end)
                                track = nil
                            end
                        end
                    end
                end)
            end
        end

        local fn_HitboxHandler_6d2c, StopNoclip
        do
            local var_connection_1d12 = nil


            local var_descendant_e322 = {}





            local var_connection_1a9a = (getgenv and getgenv()) or _G
            var_connection_1a9a.BolongNoclipGen = (tonumber(var_connection_1a9a.BolongNoclipGen) or 0) + 1
            local var_connection_78cc = var_connection_1a9a.BolongNoclipGen






            local function fn_NoclipHelper_8276(char, collideOn)
                if not char then return end
                if not var_descendant_e322[char] then var_descendant_e322[char] = {} end
                local var_descendant_46c0 = var_descendant_e322[char]
                if collideOn then
                    for part, _ in pairs(var_descendant_46c0) do
                        if part and part.Parent then
                            pcall(function() part.CanCollide = true end)
                        end
                    end
                    var_descendant_e322[char] = {}
                else
                    for _, var_value_d1f9 in ipairs(char.GetDescendants(char)) do
                        if var_value_d1f9.IsA(var_value_d1f9,"BasePart") and var_descendant_46c0[var_value_d1f9] == nil then
                            local var_success_abb9, cur = pcall(function() return var_value_d1f9.CanCollide end)
                            if var_success_abb9 and cur then
                                var_descendant_46c0[var_value_d1f9] = true
                                pcall(function() var_value_d1f9.CanCollide = false end)
                            end
                        end
                    end
                end
            end

            local function fn_NoclipHandler_5ae0()
                local var_connection_546b = {}
                for char, _ in pairs(var_descendant_e322) do
                    if not char or not char.Parent then var_connection_546b[#var_connection_546b + 1] = char end
                end
                for _, char in ipairs(var_connection_546b) do var_descendant_e322[char] = nil end
            end

            function fn_HitboxHandler_6d2c()
                StopNoclip()
                State.var_connection_4945 = true
                var_connection_1d12 = RunService.Stepped.Connect(RunService.Stepped,function()
                    if var_connection_78cc ~= var_connection_1a9a.BolongNoclipGen then
                        pcall(function() var_connection_1d12.Disconnect(var_connection_1d12) end)
                        var_connection_1d12 = nil
                        return
                    end
                    if not State.var_connection_4945 then return end
                    local char = LocalPlayer.Character
                    if char then fn_NoclipHelper_8276(char, false) end
                end)
            end

            function StopNoclip()
                State.var_connection_4945 = false
                if var_connection_1d12 then
                    pcall(function() var_connection_1d12.Disconnect(var_connection_1d12) end)
                    var_connection_1d12 = nil
                end
                fn_NoclipHandler_5ae0()
                local char = LocalPlayer.Character
                if char then fn_NoclipHelper_8276(char, true) end
            end

            LocalPlayer.CharacterAdded.Connect(LocalPlayer.CharacterAdded,function()
                fn_NoclipHandler_5ae0()
            end)


            fn_NoclipHandler_5ae0()
            pcall(function()
                local char = LocalPlayer.Character
                if char then fn_NoclipHelper_8276(char, true) end
            end)
        end

        local fn_HitboxHandler_b031, StopFlyGui
        do
            local var_rootPart_ee56 = "https://raw.githubusercontent.com/b00l08g87b/trbg/refs/heads/main/FlyGuiV3.lua"

            local function fn_HitboxHelper_3003()
                local char = LocalPlayer.Character
                if not char then return end
                local var_rootPart_2226 = char.FindFirstChild(char,"HumanoidRootPart")
                if var_rootPart_2226 then
                    pcall(function() var_rootPart_2226.AssemblyLinearVelocity = Vector3.zero end)
                end
                local var_humanoid_3937 = char.FindFirstChildOfClass(char,"Humanoid")
                if var_humanoid_3937 then
                    pcall(function() var_humanoid_3937.PlatformStand = false end)
                    for _, var_vector_b1de in ipairs(Enum.HumanoidStateType.GetEnumItems(Enum.HumanoidStateType)) do



                        if var_vector_b1de ~= Enum.HumanoidStateType.None then
                            pcall(function() var_humanoid_3937.SetStateEnabled(var_humanoid_3937,var_vector_b1de, true) end)
                        end
                    end
                end


                for _, var_descendant_fe40 in ipairs(char.GetDescendants(char)) do
                    if var_descendant_fe40.IsA(var_descendant_fe40,"BodyGyro") or var_descendant_fe40.IsA(var_descendant_fe40,"BodyVelocity")
                        or var_descendant_fe40.IsA(var_descendant_fe40,"BodyPosition") or var_descendant_fe40.IsA(var_descendant_fe40,"BodyForce") then
                        pcall(function() var_descendant_fe40.Destroy(var_descendant_fe40) end)
                    end
                end
                local var_playerGui_942a = char.FindFirstChild(char,"Animate")
                if var_playerGui_942a then pcall(function() var_playerGui_942a.Disabled = false end) end
            end

            function fn_HitboxHandler_b031()
                pcall(function()
                    local var_rootPart_b4f9 = PlayerGui.FindFirstChild(PlayerGui,"main")
                    if var_rootPart_b4f9 then var_rootPart_b4f9.Destroy(var_rootPart_b4f9) end
                end)
                local var_success_abb9, err = pcall(function()
                    loadstring(game.HttpGet(game,var_rootPart_ee56))()
                end)
                if not var_success_abb9 then
                    Notify("Fly GUI", "Gagal memuat: " .. tostring(err), 2)
                end
            end

            function StopFlyGui()




                pcall(function()
                    local var_remoteEvent_1e8c = (getgenv and getgenv()) or _G
                    var_remoteEvent_1e8c.nowe = false
                    var_remoteEvent_1e8c.tpwalking = false
                end)
                pcall(function()
                    local gui = PlayerGui.FindFirstChild(PlayerGui,"main")
                    if gui then gui.Destroy(gui) end
                end)
                fn_HitboxHelper_3003()
            end




            pcall(function()
                local var_remoteEvent_1e8c = (getgenv and getgenv()) or _G
                var_remoteEvent_1e8c.nowe = false
                var_remoteEvent_1e8c.tpwalking = false
            end)
        end

        do
            local function fn_HitboxHelper_d27e(player, char)
                if player == LocalPlayer then return end
                if not char or not char.Parent or player.Character ~= char then return end
                AttachESPToChar(player, char)
                AttachOutlineToChar(player, char)
                if Config.hitboxModifierEnabled then
                    task.wait(0.3)
                    if player.Character == char and char.Parent then
                        fn_HitboxHelper_f984(player, char)
                    end
                end
                if Config.hitboxEspEnabled then fn_HitboxHelper_cca4(player, char) end
                if State.autoParryEnabled or (AP_State and AP_State.Enabled) then
                    if AP_HookKiller then AP_HookKiller(player, char) end
                end
            end

            local function fn_ParryHelper_10ed(player)
                if player == LocalPlayer then return end
                UpdatePlayerRole(player)
                var_player_1981(player)
        do local var_error_3eca=665 end
                var_player_edf8(player)
                player:GetPropertyChangedSignal("Team"):Connect(function()
                    UpdatePlayerRole(player)
                    task.wait(0.2)
                    if State.autoParryEnabled or (AP_State and AP_State.Enabled) then
                        if AP_HookKiller then AP_HookKiller(player) end
                    end
                end)
                if player.Character then
                    task.spawn(function() fn_HitboxHelper_d27e(player, player.Character) end)
                end
                player.CharacterAdded.Connect(player.CharacterAdded,function(char)
                    task.spawn(function() fn_HitboxHelper_d27e(player, char) end)
                end)
            end

            local function fn_CameraZoomHandler_b436(player)
                RemovePlayerESP(player)
                fn_HitboxHandler_6f00(player)
                if player.Character then fn_HitboxHelper_ffd1(player, player.Character) end
            end

            Players.PlayerAdded.Connect(Players.PlayerAdded,fn_ParryHelper_10ed)
            Players.PlayerRemoving.Connect(Players.PlayerRemoving,fn_CameraZoomHandler_b436)

            for _, player in ipairs(Players.GetPlayers(Players)) do
                if player ~= LocalPlayer then fn_ParryHelper_10ed(player) end
            end




            local function fn_CameraZoomHandler_9490(char)
                State.var_head_dacf = false
                State.var_humanoid_ffa8 = nil
                State.var_connection_dd8d = false
                State.var_connection_eef0 = false
                CV_ClearLock()
                if State.var_connection_6698 then task.defer(CV_ScanAttackButtons) end
                task.spawn(SetupMovementForChar, char)
                if State.var_humanoid_4458 then
                    task.wait(0.3)
                    fn_GeneratorHandler_9092()
                    fn_GeneratorHandler_9e93()
                end
                if Config.cfg_showName_9982 then
                    task.wait(0.1)
                    State.var_distance_b26a = nil
                    fn_CameraZoomHelper_18c6(Config.cfg_showName_8138)
                end
                if Config.cfg_enableKillerWarn_fa0d then
                    task.wait(0.1)
                    State.var_originalValue_1103 = nil
                    fn_CameraZoomHandler_47e1(Config.cameraZoomValue)
                end
                if Config.cfg_enableKillerPerksInfo_53d3 then
                    task.delay(1, function()
                        pcall(DestroyGenBoostButton)
                        pcall(CreateGenBoostButton)
                    end)
                end
                if GetPlayerRole(LocalPlayer) ~= "killer" and FP_ReArm then
                    task.delay(1, function()
                        if GetPlayerRole(LocalPlayer) ~= "killer" then pcall(FP_ReArm) end
                    end)
                end
            end

            if LocalPlayer.Character then
                task.spawn(fn_CameraZoomHandler_9490, LocalPlayer.Character)
            end
            LocalPlayer.CharacterAdded.Connect(LocalPlayer.CharacterAdded,function(char)
                task.spawn(fn_CameraZoomHandler_9490, char)
            end)
        end

        do

            local var_connection_9349    = nil
            local var_connection_496a = nil
            local function fn_RemoveHelper_bc2d()
                local window = ReplicatedStorage.FindFirstChild(ReplicatedStorage,"Remotes") and ReplicatedStorage.Remotes.FindFirstChild(ReplicatedStorage.Remotes,"Window")
                if not window then return end
                var_connection_9349    = window.FindFirstChild(window,"fastvault")
                var_connection_496a = window.FindFirstChild(window,"VaultCompleteEventpart1")
            end
            pcall(fn_RemoveHelper_bc2d)




            local function fn_RemoveHelper_f53b()
                if not Config.cfg_moonwalkMode_32f7 then return end
                local var_now_2834 = tick()
                if var_now_2834 < State.var_basePart_25b0 then return end
                State.var_basePart_f944 = var_now_2834 + 0.5
                State.var_basePart_25b0 = var_now_2834 + (Config.cfg_swaySpeed_4309 or 15)
            end



            local function fn_RemoveHelper_9e06()
                local var_descendant_ebc5 = false
                local function fn_RemoveHelper_2803(var_descendant_fe40)
                    return var_descendant_fe40.IsA(var_descendant_fe40,"BasePart") and (var_descendant_fe40.Name == "VaultTrigger" or var_descendant_fe40.Name == "VaultPoint")
                end
                local function fn_RemoveHelper_a581(var_descendant_fe40)
                    if not fn_RemoveHelper_2803(var_descendant_fe40) then return end
                    for _, var_viewportSize_cfe6 in ipairs(State.fastVaultPoints) do
                        if var_viewportSize_cfe6 == var_descendant_fe40 then return end
                    end
                    table.insert(State.fastVaultPoints, var_descendant_fe40)
                end
                local function fn_RemoveHandler_e9e8(var_descendant_fe40)
                    for var_remoteEvent_5dde, var_viewportSize_cfe6 in ipairs(State.fastVaultPoints) do
                        if var_viewportSize_cfe6 == var_descendant_fe40 then table.remove(State.fastVaultPoints, var_remoteEvent_5dde) break end
                    end
                end
                if var_descendant_ebc5 then return end
                var_descendant_ebc5 = true
                for _, var_descendant_186f in ipairs(CollectionService.GetTagged(CollectionService,"VaultPoint")) do
                    fn_RemoveHelper_a581(var_descendant_186f)
                end
                WorkspaceService.DescendantAdded.Connect(WorkspaceService.DescendantAdded,fn_RemoveHelper_a581)
                WorkspaceService.DescendantRemoving.Connect(WorkspaceService.DescendantRemoving,fn_RemoveHandler_e9e8)
            end
            fn_RemoveHelper_9e06()


            local function fn_GetHandler_a4b4(pos, var_rootPart_985f)
                local var_rootPart_ee78, var_player_d377 = nil, var_rootPart_985f
                for _, var_viewportSize_cfe6 in ipairs(State.fastVaultPoints) do
                    if var_viewportSize_cfe6 and var_viewportSize_cfe6.Parent then
                        local var_distance_8193 = (var_viewportSize_cfe6.Position - pos).Magnitude
                        if var_distance_8193 < var_player_d377 then
                            var_player_d377 = var_distance_8193
                            var_rootPart_ee78 = var_viewportSize_cfe6
                        end
                    end
                end
                return var_rootPart_ee78
            end





            RegisterTask("FastVault", 0.05, function()
                if not Config.cfg_moonwalkMode_1943 then return end
                if GetPlayerRole(LocalPlayer) == "killer" then return end

                local char = LocalPlayer.Character
                local var_rootPart_186c = char and char.FindFirstChild(char,"HumanoidRootPart")
                if not char or not var_rootPart_186c then return end


                if fn_GetHandler_a4b4(var_rootPart_186c.Position, 6) then
                    pcall(function()
                        char.SetAttribute(char,"Sprinting", true)
                        char.SetAttribute(char,"IsRunning", true)
                    end)
                end
            end)


            UserInputService.InputBegan.Connect(UserInputService.InputBegan,function(input, gameProcessed)
                if not Config.cfg_moonwalkMode_1943 then return end
                if GetPlayerRole(LocalPlayer) == "killer" then return end
                if gameProcessed then return end

                local detectedKiller = input.KeyCode
                if detectedKiller ~= Enum.KeyCode.Space and detectedKiller ~= Enum.KeyCode.E then return end

                local char = LocalPlayer.Character
                local var_rootPart_186c = char and char.FindFirstChild(char,"HumanoidRootPart")
                if not char or not var_rootPart_186c then return end

                local var_viewportSize_cfe6 = fn_GetHandler_a4b4(var_rootPart_186c.Position, 9)
                if not var_viewportSize_cfe6 then return end


                local var_connection_fd87 = var_viewportSize_cfe6.Position - var_rootPart_186c.Position
                var_connection_fd87 = Vector3.new(var_connection_fd87.X, 0, var_connection_fd87.Z)
                if var_connection_fd87.Magnitude > 0.05 then
                    var_connection_fd87 = var_connection_fd87.Unit
                else
                    var_connection_fd87 = Vector3.new(var_rootPart_186c.CFrame.LookVector.X, 0, var_rootPart_186c.CFrame.LookVector.Z).Unit
                end


                local vel = var_rootPart_186c.AssemblyLinearVelocity
                local speed = Vector3.new(vel.X, (0.0), vel.Z).Magnitude
                if speed < 13 then
                    pcall(function()
                        char.SetAttribute(char,"Sprinting", true)
                        char.SetAttribute(char,"IsRunning", true)
                    end)
                    var_rootPart_186c.CFrame = CFrame.new(var_rootPart_186c.Position, var_rootPart_186c.Position + var_connection_fd87)
                    var_rootPart_186c.AssemblyLinearVelocity = var_connection_fd87 * 22
                end
            end)





            local var_success_abb9, SurvivorActions = pcall(function()
                local var_velocity_9658 = ReplicatedStorage.FindFirstChild(ReplicatedStorage,"Modules", true)
                local var_success_3f43 = var_velocity_9658 and var_velocity_9658.FindFirstChild(var_velocity_9658,"SurvivorActions", true)
                return var_success_3f43 and require(var_success_3f43)
            end)
            if var_success_abb9 and SurvivorActions and SurvivorActions.startVault then
                local var_remote_9ebf = SurvivorActions.startVault
                SurvivorActions.startVault = newcclosure(function(controller, vaultPoint)


                    fn_RemoveHelper_f53b()
                    if not Config.cfg_moonwalkMode_1943 then
                        return var_remote_9ebf(controller, vaultPoint)
                    end


                    pcall(function()
                        local char = controller and controller.character
                        if char then
                            char.SetAttribute(char,"Sprinting", true)
                            char.SetAttribute(char,"IsRunning", true)
                            local var_rootPart_186c = char.FindFirstChild(char,"HumanoidRootPart")
                            if var_rootPart_186c then
                                local var_viewportSize_cfe6 = vaultPoint and (vaultPoint.Position or (vaultPoint.IsA(vaultPoint,"Model") and vaultPoint.PrimaryPart and vaultPoint.PrimaryPart.Position))
                                if var_viewportSize_cfe6 then
                                    local var_connection_fd87 = var_viewportSize_cfe6 - var_rootPart_186c.Position
                                    var_connection_fd87 = Vector3.new(var_connection_fd87.X, 0, var_connection_fd87.Z)
                                    if var_connection_fd87.Magnitude > 0.05 then
                                        var_rootPart_186c.AssemblyLinearVelocity = var_connection_fd87.Unit * 22
                                    end
                                end
                            end
                        end
                    end)
                    local var_child_f90c = { var_remote_9ebf(controller, vaultPoint) }

                    if var_connection_9349 then
                        pcall(function() var_connection_9349.FireServer(var_connection_9349,LocalPlayer) end)
                    end
                    if var_connection_496a then
                        pcall(function() var_connection_496a.FireServer(var_connection_496a) end)
                    end
                    return unpack(var_child_f90c)
                end)
            end





            pcall(function()
                local var_velocity_9658 = ReplicatedStorage.FindFirstChild(ReplicatedStorage,"Modules", true)
                local var_animationTrack_3cb5 = var_velocity_9658 and var_velocity_9658.FindFirstChild(var_velocity_9658,"SurvivorAnimationsController", true)
                local var_animationTrack_5476 = var_animationTrack_3cb5 and require(var_animationTrack_3cb5)
                if var_animationTrack_5476 and var_animationTrack_5476._isFacingStraightEnough then
                    local var_animationTrack_11c8 = var_animationTrack_5476._isFacingStraightEnough
                    var_animationTrack_5476._isFacingStraightEnough = newcclosure(function(...)
                        if not Config.cfg_moonwalkMode_1943 then
                            return var_animationTrack_11c8(...)
                        end
                        return true
                    end)
                end
            end)




            local function fn_PerkHandler_2850()
                local var_backgroundTransparency_2836 = {
                gui      = nil,
                panel    = nil,
                rows     = nil,
                taskName = "KillerPerksInfo",
                var_head_d126  = nil,
                dragConn = {},
                perkSet  = {},
                var_success_33d5 = false,
                var_flowstateSection_f9f0  = nil,
                var_success_6897 = false,
            }

            local var_success_2c84 = {
                "Predator", "Eternal Torment", "Play With Your Food", "Terror Spread",
                "Sloppy Mess", "Resentment Clinger", "Echo Location", "Enhanced Senses",
                "Next in Line", "Corrupted Path", "Abyssal Covenant", "Shadow Trace",
                "Piercing Reverie", "Blood Between Worlds", "Echo Of The Void",
                "Excitement", "Brutal Strength", "Offscreen Scare", "Hard Swing",
                "Combo Streak", "Crackdown", "Sustenance", "Foundation Staff",
                "Desire For The Living", "Deep Wound", "All Seeing Eye", "Touch Of Death",
                "Murderous Acrobatics", "Eyes Of Hell", "Stage Fright",
                "Trade Off", "Containment", "King's Scourge",
            }

            local function fn_PerkHelper_d4af(name)
                if not name then return "" end
                return tostring(name):lower():gsub("[^%a%d]", ""):gsub("excitment", "excitement")
            end

            local var_name_2774 = {
                exposuretherapy = true,
            }

            local function fn_PerkHelper_2959(name)
                if not name or name == "" then return end
                local var_success_ca3f = fn_PerkHelper_d4af(name)
                if var_success_ca3f == "" then return end
                if var_name_2774[var_success_ca3f] then return end
                var_backgroundTransparency_2836.perkSet[var_success_ca3f] = name
            end

            local function fn_PerkHelper_cd5a()
                if var_backgroundTransparency_2836.var_success_33d5 then return end
                var_backgroundTransparency_2836.var_success_33d5 = true
                for _, var_success_b19f in ipairs(var_success_2c84) do
                    fn_PerkHelper_2959(var_success_b19f)
                end
                pcall(function()
                    local var_child_74ab = {
                        ReplicatedStorage.FindFirstChild(ReplicatedStorage,"Killers"),
                        ReplicatedStorage.FindFirstChild(ReplicatedStorage,"ShopKillers"),
                        ReplicatedStorage.FindFirstChild(ReplicatedStorage,"Perks"),
                        ReplicatedStorage.FindFirstChild(ReplicatedStorage,"KillerPerks"),
                    }
                    for _, var_child_f07f in ipairs(var_child_74ab) do
                        if var_child_f07f then
                            for _, var_instance_4e7f in ipairs(var_child_f07f.GetChildren(var_child_f07f)) do
                                if var_child_f07f.Name == "Perks" or var_child_f07f.Name == "KillerPerks" then
                                    fn_PerkHelper_2959(var_instance_4e7f.Name)
                                else
                                    local var_child_6e7c = var_instance_4e7f.FindFirstChild(var_instance_4e7f,"Perks")
                                    if var_child_6e7c then
                                        for _, var_uiCorner_3581 in ipairs(var_child_6e7c.GetChildren(var_child_6e7c)) do
                                            fn_PerkHelper_2959(var_uiCorner_3581.Name)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end)
            end

            local function fn_PerkHelper_9cf4()
                for _, var_player_2e5f in ipairs(Players.GetPlayers(Players)) do
                    if GetPlayerRole(var_player_2e5f) == "killer" then
                        return var_player_2e5f
                    end
                end
                for _, var_player_2e5f in ipairs(Players.GetPlayers(Players)) do
                    local var_success_abb9, team = pcall(function() return var_player_2e5f.Team and var_player_2e5f.Team.Name or "" end)
                    if var_success_abb9 and tostring(team):lower():find("killer") then
                        return var_player_2e5f
                    end
                end
                return nil
            end

            local function fn_PerkHelper_b36b(var_success_ca3f, var_child_f90c)
                if var_success_ca3f == "" then return end
                for var_unknownValue_0052_11fd, var_name_e313 in pairs(var_backgroundTransparency_2836.perkSet) do
                    if var_success_ca3f == var_unknownValue_0052_11fd or var_success_ca3f.find(var_success_ca3f,var_unknownValue_0052_11fd, 1, true) or var_unknownValue_0052_11fd.find(var_unknownValue_0052_11fd,var_success_ca3f, (1.0), true) then
                        if not var_child_f90c[var_name_e313] then
                            var_child_f90c[var_name_e313] = true
                        end
                        return
                    end
                end
            end

            local function fn_PerkHandler_594b(killer)
                local var_child_f90c = {}
                local function fn_PerkHandler_2462(name)
                    fn_PerkHelper_b36b(fn_PerkHelper_d4af(name), var_child_f90c)
                end
                local char = killer.Character

                pcall(function()
                    for _, var_value_d1f9 in pairs(killer.GetAttributes(killer)) do
                        fn_PerkHandler_2462(tostring(var_value_d1f9))
                    end
                    for name in pairs(killer.GetAttributes(killer)) do
                        fn_PerkHandler_2462(name)
                    end
                end)

                pcall(function()
                    local var_child_ee67 = killer.FindFirstChild(killer,"EquippedPerks") or killer.FindFirstChild(killer,"Perks")
                    if var_child_ee67 then
                        for _, var_instance_4e7f in ipairs(var_child_ee67.GetChildren(var_child_ee67)) do
                            fn_PerkHandler_2462(var_instance_4e7f.Name)
                            if var_instance_4e7f.IsA(var_instance_4e7f,"ValueBase") and type(var_instance_4e7f.Value) == "string" then
                                fn_PerkHandler_2462(var_instance_4e7f.Value)
                            end
                        end
                    end
                end)

                if char then
                    pcall(function()
                        for _, var_value_d1f9 in pairs(char.GetAttributes(char)) do
                            fn_PerkHandler_2462(tostring(var_value_d1f9))
                        end
                        for name in pairs(char.GetAttributes(char)) do
                            fn_PerkHandler_2462(name)
                        end
                    end)
                    pcall(function()
                        for _, var_instance_4e7f in ipairs(char.GetChildren(char)) do
                            fn_PerkHandler_2462(var_instance_4e7f.Name)
                        end
                    end)
                end
                return var_child_f90c
            end

            local function fn_PerkHelper_aabb()
                local var_success_abb9, var_child_a03d = pcall(function()
                    if gethui then return gethui() end
                    return nil
                end)
                if var_success_abb9 and var_child_a03d then return var_child_a03d end
                local var_playerGui_7d48, core = pcall(function() return game.GetService(game,"CoreGui") end)
                if var_playerGui_7d48 and core then return core end
                return PlayerGui
            end

            local function fn_PerkHandler_2521()
                local var_uiCorner_5af2 = Instance.new("ScreenGui")
                var_uiCorner_5af2.Name = "BolongKillerPerksInfo"
                var_uiCorner_5af2.ResetOnSpawn = false
                var_uiCorner_5af2.IgnoreGuiInset = true
                var_uiCorner_5af2.DisplayOrder = 9999998
                var_uiCorner_5af2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                var_uiCorner_5af2.Parent = fn_PerkHelper_aabb()

                local panel = Instance.new("Frame")
                panel.Name = "Panel"
                panel.BackgroundColor3 = Color3.fromRGB(10, (10.0), 14)
                panel.BackgroundTransparency = 0.06
                panel.BorderSizePixel = 0
                panel.Size = UDim2.fromOffset(220, 0)
                panel.AutomaticSize = Enum.AutomaticSize.Y
                panel.Position = State.kpiPos or UDim2.new(1, (-12.0), (0.0), 12)
                panel.AnchorPoint = Vector2.new(1, 0)
                panel.Active = true
                panel.Parent = var_uiCorner_5af2

                local var_uiCorner_2ff8 = Instance.new("UICorner")
                var_uiCorner_2ff8.CornerRadius = UDim.new((0.0), 8)
                var_uiCorner_2ff8.Parent = panel

                local var_uiCorner_5a7b = Instance.new("UIStroke")
                var_uiCorner_5a7b.Color = Color3.fromRGB(60, 60, (75.0))
                var_uiCorner_5a7b.Thickness = (1.0)
                var_uiCorner_5a7b.Parent = panel

                local var_uiStroke_d9fc = Instance.new("UIPadding")
                var_uiStroke_d9fc.PaddingLeft = UDim.new((0.0), 8)
                var_uiStroke_d9fc.PaddingRight = UDim.new((0.0), 8)
                var_uiStroke_d9fc.PaddingTop = UDim.new(0, 6)
                var_uiStroke_d9fc.PaddingBottom = UDim.new(0, 6)
                var_uiStroke_d9fc.Parent = panel

                local var_backgroundTransparency_1b7a = Instance.new("UIListLayout")
                var_backgroundTransparency_1b7a.Padding = UDim.new(0, (3.0))
                var_backgroundTransparency_1b7a.SortOrder = Enum.SortOrder.LayoutOrder
                var_backgroundTransparency_1b7a.Parent = panel

                local var_button_1489 = Instance.new("Frame")
                var_button_1489.Name = "Header"
                var_button_1489.LayoutOrder = 1
                var_button_1489.BackgroundTransparency = 1
                var_button_1489.BorderSizePixel = 0
                var_button_1489.Size = UDim2.new(1, (0.0), 0, 16)
                var_button_1489.Parent = panel

                local var_button_a241 = Instance.new("TextLabel")
                var_button_a241.Name = "Title"
                var_button_a241.BackgroundTransparency = (1.0)
                var_button_a241.BorderSizePixel = 0
                var_button_a241.Size = UDim2.new((1.0), -20, 0, 16)
                var_button_a241.Text = "KILLER"
                var_button_a241.TextColor3 = Color3.fromRGB(255, 255, 255)
                var_button_a241.TextSize = 11
                var_button_a241.Font = Enum.Font.GothamBold
                var_button_a241.TextXAlignment = Enum.TextXAlignment.Left
                var_button_a241.TextYAlignment = Enum.TextYAlignment.Center
                var_button_a241.RichText = true
                var_button_a241.Parent = var_button_1489

                local var_button_cc32 = Instance.new("TextButton")
                var_button_cc32.Name = "Minimize"
                var_button_cc32.BackgroundTransparency = 1
                var_button_cc32.BorderSizePixel = 0
                var_button_cc32.Size = UDim2.new(0, (16.0), 0, 16)
                var_button_cc32.Position = UDim2.new(1, (-16.0), 0, (0.0))
                var_button_cc32.Text = "-"
                var_button_cc32.TextColor3 = Color3.fromRGB(160, (162.0), 170)
                var_button_cc32.TextSize = 13
                var_button_cc32.Font = Enum.Font.GothamBold
                var_button_cc32.Parent = var_button_1489

                var_button_cc32.MouseButton1Click.Connect(var_button_cc32.MouseButton1Click,function()
                    var_backgroundTransparency_2836.minimized = not var_backgroundTransparency_2836.minimized
                    if var_backgroundTransparency_2836.rows then
                        var_backgroundTransparency_2836.rows.Visible = not var_backgroundTransparency_2836.minimized
                    end
                    local var_backgroundTransparency_6114 = panel.FindFirstChild(panel,"Divider")
                    if var_backgroundTransparency_6114 then var_backgroundTransparency_6114.Visible = not var_backgroundTransparency_2836.minimized end
                end)

                local var_backgroundTransparency_b703 = Instance.new("Frame")
                var_backgroundTransparency_b703.Name = "Divider"
                var_backgroundTransparency_b703.LayoutOrder = 1.5
                var_backgroundTransparency_b703.BackgroundColor3 = Color3.fromRGB(60, 60, 75)
                var_backgroundTransparency_b703.BackgroundTransparency = 0.4
                var_backgroundTransparency_b703.BorderSizePixel = (0.0)
                var_backgroundTransparency_b703.Size = UDim2.new(1, 0, 0, (1.0))
                var_backgroundTransparency_b703.Parent = panel

                local rows = Instance.new("Frame")
                rows.Name = "Rows"
                rows.LayoutOrder = 3
                rows.BackgroundTransparency = (1.0)
                rows.BorderSizePixel = 0
                rows.Size = UDim2.new(1, (0.0), (0.0), (0.0))
                rows.AutomaticSize = Enum.AutomaticSize.Y
                rows.Parent = panel

                local var_connection_5ff2 = Instance.new("UIListLayout")
                var_connection_5ff2.Padding = UDim.new(0, 2)
                var_connection_5ff2.SortOrder = Enum.SortOrder.LayoutOrder
                var_connection_5ff2.Parent = rows


                local var_connection_1eea, var_connection_94c7, var_viewportSize_a48c
                var_button_1489.Active = true
                var_button_1489.InputBegan.Connect(var_button_1489.InputBegan,function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        var_connection_1eea = true
                        var_connection_94c7 = input.Position
                        var_viewportSize_a48c = panel.Position
                    end
                end)
                var_button_1489.InputChanged.Connect(var_button_1489.InputChanged,function(input)
                    if var_connection_1eea and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                        local var_vector_d809 = input.Position - var_connection_94c7
                        panel.Position = UDim2.new((1.0), var_viewportSize_a48c.X.Offset + var_vector_d809.X, (0.0), var_viewportSize_a48c.Y.Offset + var_vector_d809.Y)
                    end
                end)
                var_button_1489.InputEnded.Connect(var_button_1489.InputEnded,function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        var_connection_1eea = false
                        State.kpiPos = panel.Position
                    end
                end)

                var_backgroundTransparency_2836.gui = var_uiCorner_5af2
                var_backgroundTransparency_2836.panel = panel
                var_backgroundTransparency_2836.rows = rows
        do local var_position_998f=1056%96 end
            end

            local function fn_PerkHelper_7065()
                if not var_backgroundTransparency_2836.gui or not var_backgroundTransparency_2836.gui.Parent then return end

                local killer = fn_PerkHelper_9cf4()
                local detectedKiller, text
                if not killer then
                    detectedKiller = "none"
                    text = "<font color=\"rgb(160,162,170)\">Tidak ada Killer.</font>"
                else
                    local var_name_63fe = fn_PerkHandler_594b(killer)
                    local var_buffer_b227 = {}
                    for name in pairs(var_name_63fe) do
                        table.insert(var_buffer_b227, name)
                    end
                    table.sort(var_buffer_b227)
                    detectedKiller = killer.Name .. "|" .. table.concat(var_buffer_b227, ",")
                    local var_buffer_2e17 = {}
                    for _, name in ipairs(var_buffer_b227) do
                        table.insert(var_buffer_2e17, "<font color=\"rgb(200,200,210)\">- " .. name .. "</font>")
                    end
                    if #var_buffer_2e17 == 0 then
                        text = (function() if var_section_a5d6 and buffer then local _bf=buffer.create(64) local _by={60,102,111,110,116,32,99,111,108,111,114,61,34,114,103,98,40,49,54,48,44,49,54,50,44,49,55,48,41,34,62,84,105,100,97,107,32,97,100,97,32,112,101,114,107,32,116,101,114,100,101,116,101,107,115,105,46,60,47,102,111,110,116,62} for _i=1,#_by do buffer.writeu8(_bf,_i-1,_by[_i]) end local _s={} for _i=1,#_by do _s[_i]=string.char(buffer.readu8(_bf,_i-1)) end return table.concat(_s) else local _by={60,102,111,110,116,32,99,111,108,111,114,61,34,114,103,98,40,49,54,48,44,49,54,50,44,49,55,48,41,34,62,84,105,100,97,107,32,97,100,97,32,112,101,114,107,32,116,101,114,100,101,116,101,107,115,105,46,60,47,102,111,110,116,62} local _s={} for _i=1,#_by do _s[_i]=string.char(_by[_i]) end return table.concat(_s) end end)()
                    else
                        text = table.concat(var_buffer_2e17, "\n")
                    end
                    detectedKiller = detectedKiller .. "#" .. tostring(killer.Character and killer.Character.Name or "")
                end

                if detectedKiller == var_backgroundTransparency_2836.var_head_d126 then return end
                var_backgroundTransparency_2836.var_head_d126 = detectedKiller

                local var_button_a241 = var_backgroundTransparency_2836.panel and var_backgroundTransparency_2836.panel.FindFirstChild(var_backgroundTransparency_2836.panel,"Header") and var_backgroundTransparency_2836.panel:FindFirstChild("Header"):FindFirstChild("Title")
                if var_button_a241 then
                    var_button_a241.Text = killer and ("KILLER <font color=\"rgb(255,80,80)\">-</font> <font color=\"rgb(252,235,229)\">" .. killer.Name .. "</font>") or "KILLER"
                end

                if var_backgroundTransparency_2836.rows then
                    var_backgroundTransparency_2836.rows.Visible = not var_backgroundTransparency_2836.minimized
                    for _, var_instance_4e7f in ipairs(var_backgroundTransparency_2836.rows.GetChildren(var_backgroundTransparency_2836.rows)) do
                        if var_instance_4e7f.IsA(var_instance_4e7f,"TextLabel") then
                            var_instance_4e7f.Destroy(var_instance_4e7f)
                        end
                    end
                    local var_backgroundTransparency_a342 = 1
                    for var_uiCorner_d268 in string.gmatch(text, "[^\n]+") do
                        local label = Instance.new("TextLabel")
                        label.BackgroundTransparency = 1
                        label.BorderSizePixel = 0
                        label.AutomaticSize = Enum.AutomaticSize.XY
                        label.LayoutOrder = var_backgroundTransparency_a342
                        var_backgroundTransparency_a342 = var_backgroundTransparency_a342 + 1
                        label.Text = var_uiCorner_d268
                        label.TextColor3 = Color3.fromRGB(200, (200.0), (210.0))
                        label.TextSize = 12
                        label.Font = Enum.Font.Gotham
                        label.RichText = true
                        label.TextXAlignment = Enum.TextXAlignment.Left
                        label.Parent = var_backgroundTransparency_2836.rows
                    end
                end
            end

            function StartKillerPerksInfo()
                if not Config.cfg_deactivatePower_e908 then return end
                fn_PerkHelper_cd5a()
                if var_backgroundTransparency_2836.gui and var_backgroundTransparency_2836.gui.Parent then
                    var_backgroundTransparency_2836.gui.Enabled = true
                else
                    fn_PerkHandler_2521()
                end
                fn_PerkHelper_7065()
                if not var_backgroundTransparency_2836.var_success_6897 then
                    RegisterTask(var_backgroundTransparency_2836.taskName, 2, function()
                        if not Config.cfg_deactivatePower_e908 then return end
                        fn_PerkHelper_7065()
                    end)
                    var_backgroundTransparency_2836.var_success_6897 = true
                end
            end

            function StopKillerPerksInfo()
                if var_backgroundTransparency_2836.gui then
                    pcall(function() var_backgroundTransparency_2836.gui.Destroy(var_backgroundTransparency_2836.gui) end)
                    var_backgroundTransparency_2836.gui = nil
                    var_backgroundTransparency_2836.panel = nil
                    var_backgroundTransparency_2836.rows = nil
                end
                var_backgroundTransparency_2836.var_head_d126 = nil
            end

            function SetKPI_ToggleRef(toggle)
                var_backgroundTransparency_2836.var_flowstateSection_f9f0 = toggle
            end
            end
            fn_PerkHandler_2850()




            RegisterTask("Flowstate", 0.1, function()
                if not Config.cfg_moonwalkMode_32f7 then return end
                if GetPlayerRole(LocalPlayer) == "killer" then return end

                local char = LocalPlayer.Character
                local var_now_2834 = tick()
                local active = not (var_now_2834 < State.var_basePart_25b0) or (var_now_2834 < State.var_basePart_f944)


                local var_flowstateSection_a365 = { LocalPlayer, char }
                local var_name_5191 = { "climb_obsessing", "climb_collisoning", "climb_collisioning", "climb_colliding" }
                local var_flowstateSection_4c19 = false
                for _, name in ipairs(var_name_5191) do
                    local var_name_29a9 = WorkspaceService.FindFirstChild(WorkspaceService,name)
                    if var_name_29a9 then
                        local var_child_6e7c = var_name_29a9.FindFirstChild(var_name_29a9,LocalPlayer.Name)
                        if var_child_6e7c and var_child_6e7c.IsA(var_child_6e7c,"Model") then
                            var_flowstateSection_4c19 = true
                            table.insert(var_flowstateSection_a365, var_child_6e7c)
                        end
                    end
                end
                if var_flowstateSection_4c19 then fn_RemoveHelper_f53b() end

                for _, target in ipairs(var_flowstateSection_a365) do
                    if target then
                        local cur = target.GetAttribute(target,"Flowstate")
                        if cur ~= active then
                            pcall(function() target.SetAttribute(target,"Flowstate", active) end)
                        end
                    end
                end
            end)




            RegisterTask("FlowstateUI", 0.2, function()
                local var_descendant_5584 = LocalPlayer.FindFirstChildOfClass(LocalPlayer,"PlayerGui")
                if not var_descendant_5584 then return end

                local gui = var_descendant_5584.FindFirstChild(var_descendant_5584,"FlowstateUIGui")
                local var_playerGui_ceeb = Config.cfg_moonwalkMode_32f7 and not Config.cfg_pcLockForwardKey_89cf

                if not var_playerGui_ceeb then
                    if gui then pcall(function() gui.Destroy(gui) end) end
                    return
                end


                if not gui then
                    gui = Instance.new("ScreenGui")
                    gui.Name = "FlowstateUIGui"
                    gui.IgnoreGuiInset = true
                    gui.Parent = var_descendant_5584

                    local label = Instance.new("TextLabel")
                    label.Name = "FlowstateCooldownLabel"
                    label.BackgroundTransparency = 1
                    label.TextXAlignment = Enum.TextXAlignment.Center
                    label.TextYAlignment = Enum.TextYAlignment.Center
                    label.TextScaled = false
                    label.TextSize = (16.0)
                    label.TextStrokeTransparency = 0
                    label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                    label.Size = UDim2.new(0, (220.0), 0, 22)
                    label.Position = UDim2.new(0.5, 0, (0.0), (55.0))
                    label.AnchorPoint = Vector2.new(0.5, (0.0))
                    label.Font = Enum.Font.GothamBold
                    label.Parent = gui
                end

                local label = gui.FindFirstChild(gui,"FlowstateCooldownLabel")
                if label then
                    local var_now_2834 = tick()
                    if var_now_2834 < State.var_basePart_25b0 then
                        label.Text = "FLOWSTATE: " .. tostring(math.ceil(State.var_basePart_25b0 - var_now_2834)) .. "s"
                        label.TextColor3 = Color3.fromRGB(255, (60.0), 60)
                    else
                        label.Text = "FLOWSTATE: READY"
                        label.TextColor3 = Color3.fromRGB((0.0), 255, 120)
                    end
                end
            end)
        end

        local fn_FlowstateHelper_f867, FP_SetPerk
        do
            State.fpBuffs = State.fpBuffs or {}
            State.fpConns = State.fpConns or {}
            State.fpOn = State.fpOn or {}
            if State.fpCooldown == nil then State.fpCooldown = 10 end
            if State.fpLastEnd == nil then State.fpLastEnd = (0.0) end

            local function fn_FlowstateHelper_a369()
                return LocalPlayer.Character
            end

            local function fn_FlowstateHandler_70be()
                local var_remoteEvent_e831 = 0
                local var_now_2834 = tick()
                for _, var_rootPart_b34c in pairs(State.fpBuffs or {}) do
                    if var_now_2834 < var_rootPart_b34c.endTime then var_remoteEvent_e831 = var_remoteEvent_e831 + var_rootPart_b34c.amt end
                end
                return var_remoteEvent_e831
            end




            local function fn_FlowstateHelper_104a()
                if GetPlayerRole(LocalPlayer) == "killer" then return end
                local char = fn_FlowstateHelper_a369()
                local var_remoteEvent_e831 = fn_FlowstateHandler_70be()
                if char then
                    pcall(function()
                        char.SetAttribute(char,"speedboost", var_remoteEvent_e831 > 0 and (1 + var_remoteEvent_e831 / 14) or (1.0))
                    end)
                end
            end

            function fn_FlowstateHelper_f867(name, amt, dur)
                if GetPlayerRole(LocalPlayer) == "killer" then return end
                if State.fpBuffs[name] then return end
                if tick() - State.fpLastEnd < (State.fpCooldown or 10) and next(State.fpBuffs) == nil then return end
                State.fpBuffs[name] = { amt = amt, endTime = tick() + dur }
                if name == "PerfectLanding" then State.fpPLAnnounced = false end
                fn_FlowstateHelper_104a()
                Notify("Fake Perks", "[" .. name .. "] Aktif! +" .. math.floor(amt / 14 * 100) .. "% Speed (" .. dur .. "s)", (3.0))
            end

            local function fn_FlowstateHandler_e1d0(name)
                local var_player_441f = State.fpConns[name]
                if var_player_441f then
                    for _, var_connection_d9f3 in ipairs(var_player_441f) do pcall(function() var_connection_d9f3.Disconnect(var_connection_d9f3) end) end
                    State.fpConns[name] = nil
                end
            end

            local function fn_FlowstateHelper_9f69(name, var_connection_90bd)
                if var_connection_90bd == nil then return end
                if not State.fpConns[name] then State.fpConns[name] = {} end
                table.insert(State.fpConns[name], var_connection_90bd)
            end

            local function fn_FlowstateHandler_f349(name, fn)
                fn_FlowstateHelper_9f69(name, LocalPlayer.CharacterAdded.Connect(LocalPlayer.CharacterAdded,fn))
                local cur = fn_FlowstateHelper_a369()
                if cur then pcall(fn, cur) end
            end

            function FP_SetPerk(name, var_rootPart_db85)
                if name == "Flowstate" then State.fpOn.Flowstate = nil
                return end
                State.fpOn[name] = var_rootPart_db85 and true or false
                if not var_rootPart_db85 then
        do local var_flowstateSection_eb6c=1600%56 end
                    fn_FlowstateHandler_e1d0(name)
                    State.fpBuffs[name] = nil
                    if name == "PerfectLanding" then State.fpPLAnnounced = false end
                    fn_FlowstateHelper_104a()
                    return
                end
                if name == "QuickRecovery" then



                    local function fn_GeneratorHelper_c5e7(_, sprintFlag)
                        if not State.fpOn.QuickRecovery then return end
                        if sprintFlag ~= true then return end
                        fn_FlowstateHelper_f867("QuickRecovery", 5.6, 3)
                    end
                    pcall(function()
                        local var_remoteEvent_19f1 = ReplicatedStorage.FindFirstChild(ReplicatedStorage,"Remotes")
                        local var_connection_9c26 = var_remoteEvent_19f1 and var_remoteEvent_19f1.FindFirstChild(var_remoteEvent_19f1,"Window")
                        local var_humanoid_e94a = var_connection_9c26 and var_connection_9c26.FindFirstChild(var_connection_9c26,"Vaultbindable")
                        if var_humanoid_e94a and var_humanoid_e94a.IsA(var_humanoid_e94a,"BindableEvent") then fn_FlowstateHelper_9f69(name, var_humanoid_e94a.Event.Connect(var_humanoid_e94a.Event,fn_GeneratorHelper_c5e7)) end
                    end)
                elseif name == "PerfectLanding" then
                    fn_FlowstateHandler_f349(name, function(ch)
                        local var_humanoid_3937 = ch.FindFirstChildOfClass(ch,"Humanoid")
                        if not var_humanoid_3937 then return end
                        local var_humanoid_6688, fallStart = false, 0
                        fn_FlowstateHelper_9f69(name, var_humanoid_3937.StateChanged.Connect(var_humanoid_3937.StateChanged,function(_, new)
                            if not State.fpOn.PerfectLanding then return end
                            if new == Enum.HumanoidStateType.Freefall then
                                var_humanoid_6688, fallStart = true, tick()
                            elseif var_humanoid_6688 and (new == Enum.HumanoidStateType.Landed or new == Enum.HumanoidStateType.Running) then
                                var_humanoid_6688 = false
                                if tick() - fallStart >= 0.25 then
                                    fn_FlowstateHelper_f867("PerfectLanding", 5.6, 3)
                                end
                            end
                        end))
                    end)
                elseif name == "AdrenalineRush" then
                    fn_FlowstateHandler_f349(name, function(ch)
                        local var_humanoid_3937 = ch.FindFirstChildOfClass(ch,"Humanoid")
                        if not var_humanoid_3937 then return end
                        local var_humanoid_c5bf = var_humanoid_3937.Health
                        fn_FlowstateHelper_9f69(name, var_humanoid_3937.HealthChanged.Connect(var_humanoid_3937.HealthChanged,function(newHP)
                            if State.fpOn.AdrenalineRush and newHP < var_humanoid_c5bf and newHP <= 50 and newHP > (0.0) then
                                fn_FlowstateHelper_f867("AdrenalineRush", 4, 5)
                            end
                            var_humanoid_c5bf = newHP
                        end))
                    end)
                end
            end





            function FP_ReArm()
                for name, var_rootPart_db85 in pairs(State.fpOn or {}) do
                    if var_rootPart_db85 then
                        pcall(FP_SetPerk, name, false)
                        pcall(FP_SetPerk, name, true)
                    end
                end
            end

            RegisterTask("FakePerks", 0.1, function()
                if next(State.fpBuffs) == nil then return end
                local var_now_2834 = tick()
                local var_character_af96 = false
                for var_unknownValue_0048_522a, var_rootPart_b34c in pairs(State.fpBuffs) do
                    if var_now_2834 >= var_rootPart_b34c.endTime then
                        State.fpBuffs[var_unknownValue_0048_522a] = nil
                        var_character_af96 = true
                    end
                end
                if var_character_af96 and next(State.fpBuffs) == nil then
                    State.fpLastEnd = var_now_2834
                end




                local var_success_5859 = State.fpBuffs.PerfectLanding
                if var_success_5859 and var_now_2834 < var_success_5859.endTime then
                    local char = LocalPlayer.Character
                    if char then
                        pcall(function()
                            if char.GetAttribute(char,"MovementLocked") then
                                char.SetAttribute(char,"MovementLocked", false)
                                if not State.fpPLAnnounced then
                                    State.fpPLAnnounced = true
                                    print("[FP] MovementLocked ditahan OFF (PerfectLanding)")
                                end
                            end
                        end)
                    end
                end
                fn_FlowstateHelper_104a()
            end)
        end

        local fn_GetHelper_e9d6, StopPotato
        do
            local var_name_f1cd = (800.0)
            local var_success_496f = 0.008

            local var_character_8f96 = {
                generator=true,generators=true,character=true,avatar=true,
                survivor=true,killer=true,window=true,vault=true,
                wood=true,wooden=true,plank=true,planks=true,
                log=true,logs=true,trunk=true,tree=true,
                equipment=true,item=true,items=true,tool=true,tools=true,
                hitbox=true,interaction=true,interact=true,prompt=true,
                attack=true,weapon=true,weapons=true,spear=true,spears=true,
            }
            local var_child_ddc7 = {
                Humanoid=true,Animator=true,Animation=true,
                AnimationController=true,Tool=true,ProximityPrompt=true,
                ClickDetector=true,Weld=true,WeldConstraint=true,
                Motor6D=true,ManualWeld=true,
            }
            local var_animationTrack_8b3b = {
                ParticleEmitter=true,Smoke=true,Fire=true,Beam=true,Sparkles=true,
            }
            local var_name_205b = {
                leaf=true,leaves=true,leaflet=true,leaflets=true,
                leafmesh=true,leaf_mesh=true,leafpart=true,leaf_part=true,
                leaftexture=true,leaf_texture=true,leafcard=true,leaf_card=true,
                leafplane=true,leaf_plane=true,leafcluster=true,leaf_cluster=true,
                leafgroup=true,leaf_group=true,foliageleaf=true,foliage_leaf=true,
                treetop=true,tree_top=true,treeleaves=true,tree_leaves=true,
                leavesmesh=true,leaves_mesh=true,
            }
            local var_name_e19d = {
                grass=true,grassblade=true,grass_blade=true,
            }

            local var_success_21d4, LeafKeywords, GrassKeywords = {},{},{}
            for var_child_5b0e in pairs(var_character_8f96) do var_success_21d4[#var_success_21d4+1] = var_child_5b0e end
            for var_child_5b0e in pairs(var_name_205b) do LeafKeywords[#LeafKeywords+1] = var_child_5b0e end
            for var_child_5b0e in pairs(var_name_e19d) do GrassKeywords[#GrassKeywords+(1.0)] = var_child_5b0e end

            local function fn_CutsceneHelper_76a2(var_value_d1f9)
                return string.lower(tostring(var_value_d1f9))
            end

            local function fn_CutsceneHelper_213d(name, var_player_441f)
                name = fn_CutsceneHelper_76a2(name)
                for var_remoteEvent_5dde = 1, #var_player_441f do
                    if string.find(name, var_player_441f[var_remoteEvent_5dde], 1, true) then
                        return true
                    end
                end
                return false
            end




            local var_name_cb17 = {
                "endscreen", "endscreencutscene", "cutsceneend",
                "cutsceneend2", "cutsceneendwithownchar", "endgame", "end_screen",
            }

            local function fn_GetHelper_d266(var_instance_5397)
                if not var_instance_5397 then return false end
                local var_connection_d9f3 = var_instance_5397
                for _ = 1, (4.0) do
                    if not var_connection_d9f3 then break end
                    if fn_CutsceneHelper_213d(var_connection_d9f3.Name, var_name_cb17) then return true end
                    var_connection_d9f3 = var_connection_d9f3.Parent
                end
                return false
            end



            local var_name_62e5 = {
                "fog", "mist", "haze", "smoke", "steam", "vapor",
            }

            local function fn_GetHelper_7253(var_instance_5397)
                if not var_instance_5397 then return false end
                if not (var_instance_5397.IsA(var_instance_5397,"ParticleEmitter") or var_instance_5397.IsA(var_instance_5397,"Smoke") or var_instance_5397.IsA(var_instance_5397,"Beam")) then
                    return false
                end
                local var_connection_d9f3 = var_instance_5397
                for _ = 1, 12 do
                    if not var_connection_d9f3 then break end
                    local name = fn_CutsceneHelper_76a2(var_connection_d9f3.Name)
                    if string.find(name, "exit", 1, true)
                        or string.find(name, "escape", 1, true)
                        or string.find(name, "door", 1, true) then
                        if fn_CutsceneHelper_213d(name, var_name_62e5) then return true end
                    end
                    if fn_CutsceneHelper_213d(name, var_name_62e5) then
                        local var_child_a03d = var_connection_d9f3.Parent
                        for _ = 1, (8.0) do
                            if not var_child_a03d then break end
                            local var_name_8806 = fn_CutsceneHelper_76a2(var_child_a03d.Name)
                            if string.find(var_name_8806, "exit", 1, true)
                                or string.find(var_name_8806, "escape", 1, true)
                                or string.find(var_name_8806, "door", (1.0), true) then
                                return true
                            end
                            var_child_a03d = var_child_a03d.Parent
                        end
                    end
                    var_connection_d9f3 = var_connection_d9f3.Parent
                end
                return false
            end

            local function fn_PalletHandler_f42d(var_connection_d9f3)
                if var_connection_d9f3 then State.var_originalValue_3fb0[var_connection_d9f3] = true end
            end

            local function fn_PalletHandler_a200(var_connection_d9f3)
                if var_connection_d9f3 then
                    State.var_originalValue_3fb0[var_connection_d9f3] = nil
                    State.var_success_7811[var_connection_d9f3] = nil
                end
            end

            local function fn_PalletHelper_983b(var_player_2e5f)
                return var_player_2e5f and var_player_2e5f.Team and var_player_2e5f.Team.Name == "killer"
            end

            local function fn_PalletHelper_719d(var_player_2e5f)
                if not var_player_2e5f then return end
                local var_connection_d9f3 = var_player_2e5f.Character
                if var_connection_d9f3 then
                    if fn_PalletHelper_983b(var_player_2e5f) then
                        State.var_success_7811[var_connection_d9f3] = true
                    else
                        State.var_success_7811[var_connection_d9f3] = nil
                    end
                end
            end

            local function fn_PalletHelper_80f1(var_player_2e5f)
                if not var_player_2e5f then return end
                if var_player_2e5f.Character then
                    fn_PalletHandler_f42d(var_player_2e5f.Character)
                    fn_PalletHelper_719d(var_player_2e5f)
                end
                table.insert(State.var_player_f65b, var_player_2e5f.CharacterAdded.Connect(var_player_2e5f.CharacterAdded,function(var_connection_d9f3)
                    fn_PalletHandler_f42d(var_connection_d9f3)
                    task.defer(function() fn_PalletHelper_719d(var_player_2e5f) end)
                end))
                table.insert(State.var_player_f65b, var_player_2e5f.CharacterRemoving.Connect(var_player_2e5f.CharacterRemoving,function(var_connection_d9f3)
                    fn_PalletHandler_a200(var_connection_d9f3)
                end))
                table.insert(State.var_player_f65b, var_player_2e5f:GetPropertyChangedSignal("Team"):Connect(function()
                    fn_PalletHelper_719d(var_player_2e5f)
                end))
            end

            local function fn_PalletHelper_b74c(var_instance_5397)
                local var_connection_d9f3 = var_instance_5397
                for _ = 1, (20.0) do
                    if not var_connection_d9f3 then return false end
                    if State.var_originalValue_3fb0[var_connection_d9f3] then return true end
                    var_connection_d9f3 = var_connection_d9f3.Parent
                end
                return false
            end

            local function fn_PalletHelper_34a7(var_instance_5397)
                if not var_instance_5397 or not var_animationTrack_8b3b[var_instance_5397.ClassName] then return false end
                local var_connection_d9f3 = var_instance_5397
                for _ = 1, 20 do
                    if not var_connection_d9f3 then return false end
                    if State.var_success_7811[var_connection_d9f3] then return true end
                    var_connection_d9f3 = var_connection_d9f3.Parent
                end
                return false
            end

            local function fn_PalletHelper_11db(var_instance_5397)
                local var_connection_d9f3 = var_instance_5397
                for _ = 1, 20 do
                    if not var_connection_d9f3 then return false end
                    if string.find(fn_CutsceneHelper_76a2(var_connection_d9f3.Name), "pallet", 1, true) then return true end
                    var_connection_d9f3 = var_connection_d9f3.Parent
                end
                return false
            end

            local function fn_PalletHelper_bdda(var_instance_5397)
                if not var_instance_5397 then return nil end
                local var_connection_d9f3 = var_instance_5397
                for _ = 1, 20 do
                    if not var_connection_d9f3 then return nil end
                    if string.find(fn_CutsceneHelper_76a2(var_connection_d9f3.Name), "pallet", (1.0), true) then return var_connection_d9f3 end
                    var_connection_d9f3 = var_connection_d9f3.Parent
                end
                return nil
            end

            local function fn_internalFunction_cdd6(var_instance_5397)
                if not var_instance_5397 then return false end
                if fn_CutsceneHelper_213d(var_instance_5397.Name, LeafKeywords) then return true end
                local var_player_2e5f = var_instance_5397.Parent
                for _ = 1, 4 do
                    if not var_player_2e5f then break end
                    if fn_CutsceneHelper_213d(var_player_2e5f.Name, LeafKeywords) then return true end
                    var_player_2e5f = var_player_2e5f.Parent
                end
                return false
            end

            local function fn_PalletHelper_570e(var_instance_5397)
                if not var_instance_5397 then return true end
                if var_child_ddc7[var_instance_5397.ClassName] then return true end
                if fn_PalletHelper_b74c(var_instance_5397) then return true end
                if fn_PalletHelper_11db(var_instance_5397) then return false end
                local var_connection_d9f3 = var_instance_5397
                for _ = 1, 7 do
                    if not var_connection_d9f3 then break end
                    if fn_CutsceneHelper_213d(var_connection_d9f3.Name, var_success_21d4) then return true end
                    var_connection_d9f3 = var_connection_d9f3.Parent
                end
                return false
            end

            local function fn_PalletHelper_8e51()
                local var_rootPart_fbb0 = workspace.CurrentCamera
                return var_rootPart_fbb0 and var_rootPart_fbb0.CameraType == Enum.CameraType.Scriptable
            end

            local function fn_PalletHelper_4005(var_instance_5397)
                if not var_instance_5397 or not var_instance_5397.Parent then return end
                if var_instance_5397.IsA(var_instance_5397,"MeshPart") then
                    pcall(function()
                        var_instance_5397.Material = Enum.Material.SmoothPlastic
                        var_instance_5397.CastShadow = false
                        var_instance_5397.TextureID = ""
                    end)
                elseif var_instance_5397.IsA(var_instance_5397,"BasePart") then
                    pcall(function()
                        var_instance_5397.Material = Enum.Material.SmoothPlastic
                        var_instance_5397.CastShadow = false
                    end)
                elseif var_instance_5397.IsA(var_instance_5397,"Decal") or var_instance_5397.IsA(var_instance_5397,"Texture") then
                    pcall(function() var_instance_5397.Transparency = 1 end)
                elseif var_instance_5397.IsA(var_instance_5397,"SurfaceAppearance") then
                    pcall(function() var_instance_5397.Destroy(var_instance_5397) end)
                elseif var_instance_5397.IsA(var_instance_5397,"SpecialMesh") then
                    pcall(function() var_instance_5397.TextureId = "" end)
                end
            end

            local function fn_PalletHelper_b521(var_instance_5397)
                if not var_instance_5397 or not var_instance_5397.Parent then return end
                if var_child_ddc7[var_instance_5397.ClassName] then return end
                if var_instance_5397.IsA(var_instance_5397,"BasePart") then
                    pcall(function()
                        var_instance_5397.Transparency = 1
                        var_instance_5397.CanCollide = false
                        var_instance_5397.CanTouch = false
                        var_instance_5397.CanQuery = false
                    end)
                elseif var_instance_5397.IsA(var_instance_5397,"Decal") or var_instance_5397.IsA(var_instance_5397,"Texture") then
                    pcall(function() var_instance_5397.Transparency = 1 end)
                elseif var_instance_5397.IsA(var_instance_5397,"SpecialMesh") then
                    pcall(function() var_instance_5397.TextureId = "" end)
                elseif var_instance_5397.IsA(var_instance_5397,"SurfaceAppearance") then
                    pcall(function() var_instance_5397.Destroy(var_instance_5397) end)
                elseif var_instance_5397.IsA(var_instance_5397,"ParticleEmitter")
                    or var_instance_5397.IsA(var_instance_5397,"Beam")
                    or var_instance_5397.IsA(var_instance_5397,"Smoke")
                    or var_instance_5397.IsA(var_instance_5397,"Fire")
                    or var_instance_5397.IsA(var_instance_5397,"Sparkles") then
                    pcall(function() var_instance_5397.Enabled = false end)
                end
            end


            local var_descendant_fc28 = false

            local function fn_PalletHelper_3f42(var_instance_5397)
                if not var_instance_5397 or not var_instance_5397.Parent then return end
                if State.potatoProcessed[var_instance_5397] then return end
                if fn_GetHelper_d266(var_instance_5397) then
                    State.potatoProcessed[var_instance_5397] = true
                    return
                end
                if fn_GetHelper_7253(var_instance_5397) then
                    pcall(function() var_instance_5397.Enabled = false end)
                    State.potatoProcessed[var_instance_5397] = true
                    return
                end
                if fn_PalletHelper_8e51() then return end
                if fn_PalletHelper_11db(var_instance_5397) then
                    local var_success_ba3a = fn_PalletHelper_bdda(var_instance_5397)
                    if var_success_ba3a then
                        State.potatoPallets[var_success_ba3a] = true
                        fn_PalletHelper_4005(var_instance_5397)
                        State.potatoProcessed[var_instance_5397] = true
                        return
                    end
                end
                if fn_PalletHelper_34a7(var_instance_5397) then
                    pcall(function() var_instance_5397.Enabled = false end)
                    State.potatoProcessed[var_instance_5397] = true
                    return
                end
                if fn_PalletHelper_b74c(var_instance_5397) then
                    State.potatoProcessed[var_instance_5397] = true
                    return
                end
                if var_child_ddc7[var_instance_5397.ClassName] then
                    State.potatoProcessed[var_instance_5397] = true
                    return
                end
                if fn_internalFunction_cdd6(var_instance_5397) then
                    fn_PalletHelper_b521(var_instance_5397)
                    State.potatoProcessed[var_instance_5397] = true
                    return
                end
                if fn_PalletHelper_570e(var_instance_5397) then
                    State.potatoProcessed[var_instance_5397] = true
                    return
                end
                if fn_CutsceneHelper_213d(var_instance_5397.Name, GrassKeywords) then
                    State.potatoProcessed[var_instance_5397] = true
                    return
                end
                if var_instance_5397.IsA(var_instance_5397,"BasePart") then
                    pcall(function()
                        var_instance_5397.Material = Enum.Material.SmoothPlastic
                        var_instance_5397.CastShadow = false
                    end)
                    State.potatoProcessed[var_instance_5397] = true
                    return
                end
                if var_instance_5397.IsA(var_instance_5397,"Decal") or var_instance_5397.IsA(var_instance_5397,"Texture") then
                    local var_player_2e5f = var_instance_5397.Parent
                    if not var_player_2e5f or not fn_CutsceneHelper_213d(var_player_2e5f.Name, var_success_21d4) then
                        pcall(function() var_instance_5397.Transparency = 1 end)
                    end
                    State.potatoProcessed[var_instance_5397] = true
                    return
                end
        do local var_success_fe34=1345%63 end
                if var_instance_5397.IsA(var_instance_5397,"SurfaceAppearance") then
                    local var_player_2e5f = var_instance_5397.Parent
                    if var_player_2e5f and fn_internalFunction_cdd6(var_player_2e5f) then
                        pcall(function() var_instance_5397.Destroy(var_instance_5397) end)
                    end
                    State.potatoProcessed[var_instance_5397] = true
                    return
                end
                if var_instance_5397.IsA(var_instance_5397,"SpecialMesh") then
                    local var_player_2e5f = var_instance_5397.Parent
                    if var_player_2e5f and fn_internalFunction_cdd6(var_player_2e5f) then
                        pcall(function() var_instance_5397.TextureId = "" end)
                    end
                    State.potatoProcessed[var_instance_5397] = true
                    return
                end
                State.potatoProcessed[var_instance_5397] = true
            end

            local function fn_GetHelper_6a81(var_rootPart_186c)
                if not var_rootPart_186c then return false end
                if var_rootPart_186c == LocalPlayer.Character then return false end
                if State.var_originalValue_3fb0[var_rootPart_186c] then return false end
                if var_rootPart_186c.IsA(var_rootPart_186c,"Camera") or var_rootPart_186c.IsA(var_rootPart_186c,"Terrain") then return false end
                return var_rootPart_186c.IsA(var_rootPart_186c,"Model")
                    or var_rootPart_186c.IsA(var_rootPart_186c,"Folder")
                    or (var_rootPart_186c.IsA(var_rootPart_186c,"BasePart") and var_rootPart_186c.Parent == workspace)
            end

            local function fn_GetHelper_d2e3(var_instance_5397)
                if not State.state_gateColor_339a or not var_instance_5397 or not var_instance_5397.Parent then return end
                if var_descendant_fc28 then
                    State.potatoProcessed[var_instance_5397] = true
                    return
                end
                if State.potatoProcessed[var_instance_5397] or State.var_success_8270[var_instance_5397] then return end
                if fn_GetHelper_d266(var_instance_5397) then
                    State.potatoProcessed[var_instance_5397] = true
                    return
                end
                if fn_GetHelper_7253(var_instance_5397) then
                    pcall(function() var_instance_5397.Enabled = false end)
                    State.potatoProcessed[var_instance_5397] = true
                    return
                end
                if var_child_ddc7[var_instance_5397.ClassName] then return end
                if fn_PalletHelper_b74c(var_instance_5397) and not fn_PalletHelper_34a7(var_instance_5397) then return end
                State.var_success_4a66 = State.var_success_4a66 + 1
                State.var_success_f3dd[State.var_success_4a66] = var_instance_5397
                State.var_success_8270[var_instance_5397] = true
            end



            local function fn_GetHandler_c2c4()
                if State.var_success_12b6 > State.var_success_4a66 then
                    State.var_success_f3dd = {}
                    State.var_success_12b6 = 1
                    State.var_success_4a66 = (0.0)
                    State.var_success_8270 = {}
                end
            end






            local function fn_GetHandler_b0ff()
                State.var_success_f3dd = {}
                State.var_success_12b6, State.var_success_4a66, State.var_success_8270 = (1.0), 0, {}
                State.var_descendant_eaf3 = {}
                State.var_descendant_80a1 = nil
                State.var_descendant_f24e = 1
            end

            local function fn_GetHelper_6872()
                if var_descendant_fc28 then return end
                var_descendant_fc28 = true
                fn_GetHandler_b0ff()
            end

            local function fn_GetHelper_da45(var_instance_5397)
                return var_instance_5397 ~= nil and var_instance_5397.Name == "endscreen"
                    and var_instance_5397.Parent ~= nil and var_instance_5397.Parent.Name == "Map"
            end

            local function fn_GetHelper_8efd(var_descendant_7978, var_endScreen_3842)
                if var_endScreen_3842 >= var_name_f1cd then return false end
                if os.clock() - var_descendant_7978 >= var_success_496f then return false end
                if fn_PalletHelper_8e51() then return false end
                return true
            end

            function fn_GetHelper_e9d6()
                if State.state_gateColor_339a then return end
                State.state_gateColor_339a = true
                var_descendant_fc28 = false
                pcall(function()
                    local var_descendant_b2cb = workspace.FindFirstChild(workspace,"Map")
                    if var_descendant_b2cb and var_descendant_b2cb.FindFirstChild(var_descendant_b2cb,"endscreen") then
                        fn_GetHelper_6872()
                    end
                end)
                pcall(function()
                    State.var_endScreen_73dc = settings().Rendering.QualityLevel
                    settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
                end)
                pcall(function()
                    local var_child_137c = game:GetService("Lighting")
                    State.var_success_2056 = var_child_137c.GlobalShadows
                    State.var_success_ee37 = var_child_137c.FogEnd
                    var_child_137c.GlobalShadows = false
                    var_child_137c.FogEnd = 1000000
                end)
                State.var_player_7669 = {}
        if (1512%2==0) then local var_child_9776=236 else local var_child_9776=649 end
                pcall(function()
                    for _, var_instance_5397 in ipairs(game:GetService("Lighting"):GetChildren()) do
                        if var_instance_5397.IsA(var_instance_5397,"PostEffect") and var_instance_5397.Enabled then
                            var_instance_5397.Enabled = false
                            State.var_player_7669[#State.var_player_7669 + 1] = var_instance_5397
                        end
                    end
                end)
                for _, var_player_2e5f in ipairs(Players.GetPlayers(Players)) do fn_PalletHelper_80f1(var_player_2e5f) end
                table.insert(State.var_player_f65b, Players.PlayerAdded.Connect(Players.PlayerAdded,fn_PalletHelper_80f1))
                table.insert(State.var_player_f65b, Players.PlayerRemoving.Connect(Players.PlayerRemoving,function(var_player_2e5f)
                    if var_player_2e5f.Character then fn_PalletHandler_a200(var_player_2e5f.Character) end
                end))
                table.insert(State.var_player_f65b, workspace.ChildAdded.Connect(workspace.ChildAdded,function(var_rootPart_186c)
                    if not State.state_gateColor_339a then return end
                    if var_descendant_fc28 then return end
                    if fn_GetHelper_d266(var_rootPart_186c) then return end
                    if fn_GetHelper_6a81(var_rootPart_186c) then
                        State.var_descendant_eaf3[#State.var_descendant_eaf3 + 1] = var_rootPart_186c
                    end
                end))
                table.insert(State.var_player_f65b, workspace.DescendantAdded.Connect(workspace.DescendantAdded,function(var_instance_5397)
                    if not State.state_gateColor_339a or not var_instance_5397 or not var_instance_5397.Parent then return end
                    if fn_GetHelper_da45(var_instance_5397) then
                        fn_GetHelper_6872()
                        return
                    end
                    if var_descendant_fc28 then
                        State.potatoProcessed[var_instance_5397] = true
                        return
                    end
                    if State.potatoProcessed[var_instance_5397] or State.var_success_8270[var_instance_5397] then return end
                    if fn_GetHelper_d266(var_instance_5397) then
                        State.potatoProcessed[var_instance_5397] = true
                        return
                    end
                    if fn_GetHelper_7253(var_instance_5397) then
                        pcall(function() var_instance_5397.Enabled = false end)
                        State.potatoProcessed[var_instance_5397] = true
                        return
                    end
                    if fn_PalletHelper_b74c(var_instance_5397) and not fn_PalletHelper_34a7(var_instance_5397) then return end
                    if var_child_ddc7[var_instance_5397.ClassName] then return end
                    fn_GetHelper_d2e3(var_instance_5397)
                end))
                pcall(function()
                    for _, var_rootPart_186c in ipairs(workspace.GetChildren(workspace)) do
                        if fn_GetHelper_6a81(var_rootPart_186c) then
                            State.var_descendant_eaf3[#State.var_descendant_eaf3 + (1.0)] = var_rootPart_186c
                        end
                    end
                end)
            end

            function StopPotato()
                State.state_gateColor_339a = false
                var_descendant_fc28 = false
                for _, var_connection_90bd in ipairs(State.var_player_f65b) do
                    pcall(function() var_connection_90bd.Disconnect(var_connection_90bd) end)
                end
                State.var_player_f65b = {}
                State.var_descendant_eaf3 = {}
                State.var_descendant_80a1 = nil
                State.var_descendant_f24e = 1
                State.var_success_f3dd = {}
                State.var_success_12b6, State.var_success_4a66, State.var_success_8270 = 1, (0.0), {}
                State.var_originalValue_3fb0 = {}
                State.var_success_7811 = {}
                pcall(function()
                    if State.var_endScreen_73dc then
                        settings().Rendering.QualityLevel = State.var_endScreen_73dc
                    end
                end)
                pcall(function()
                    local var_child_137c = game:GetService("Lighting")
                    if State.var_success_2056 ~= nil then var_child_137c.GlobalShadows = State.var_success_2056 end
                    if State.var_success_ee37 ~= nil then var_child_137c.FogEnd = State.var_success_ee37 end
                    for _, var_instance_5397 in ipairs(State.var_player_7669) do
                        if var_instance_5397 and var_instance_5397.Parent then var_instance_5397.Enabled = true end
                    end
                end)
                State.var_player_7669 = {}
            end

            RegisterTask("PotatoStream", (0.0), function()
                if not State.state_gateColor_339a then return end
                if var_descendant_fc28 then return end
                if fn_PalletHelper_8e51() then return end
                local var_descendant_7978 = os.clock()
                local var_endScreen_3842 = 0
                while State.var_success_12b6 <= State.var_success_4a66 and fn_GetHelper_8efd(var_descendant_7978, var_endScreen_3842) do
                    local var_instance_5397 = State.var_success_f3dd[State.var_success_12b6]
                    State.var_success_f3dd[State.var_success_12b6] = nil
                    State.var_success_12b6 = State.var_success_12b6 + 1
                    if var_instance_5397 then State.var_success_8270[var_instance_5397] = nil end
                    if var_instance_5397 and var_instance_5397.Parent then fn_PalletHelper_3f42(var_instance_5397) end
                    var_endScreen_3842 = var_endScreen_3842 + 1
                end
                fn_GetHandler_c2c4()
                if State.var_descendant_80a1 == nil and #State.var_descendant_eaf3 > (0.0) and fn_GetHelper_8efd(var_descendant_7978, var_endScreen_3842) then
                    local var_rootPart_186c = table.remove(State.var_descendant_eaf3, 1)
                    if var_rootPart_186c and var_rootPart_186c.Parent and fn_GetHelper_6a81(var_rootPart_186c) then
                        local var_success_abb9, objs = pcall(function() return var_rootPart_186c.GetDescendants(var_rootPart_186c) end)
                        if var_success_abb9 and objs then
                            State.var_descendant_80a1 = objs
                            State.var_descendant_f24e = 1
                        end
                    end
                end
                while State.var_descendant_80a1 ~= nil and fn_GetHelper_8efd(var_descendant_7978, var_endScreen_3842) do
                    local var_player_441f = State.var_descendant_80a1
                    local var_unknownValue_0043_3a07 = State.var_descendant_f24e
                    local var_instance_5397 = var_player_441f[var_unknownValue_0043_3a07]
                    State.var_descendant_f24e = var_unknownValue_0043_3a07 + 1
                    if var_unknownValue_0043_3a07 > #var_player_441f then
                        State.var_descendant_80a1 = nil
                        State.var_descendant_f24e = 1
                    elseif var_instance_5397 and var_instance_5397.Parent then
                        fn_PalletHelper_3f42(var_instance_5397)
                    end
                    var_endScreen_3842 = var_endScreen_3842 + (1.0)
                end
            end)
        end

        RunService.Heartbeat.Connect(RunService.Heartbeat,function(var_rootPart_6336)
            for var_remoteEvent_5dde = 1, #tasks do
                local t = tasks[var_remoteEvent_5dde]
                t.timer = t.timer + var_rootPart_6336
                if t.timer >= t.interval then
                    t.timer = 0
                    t.fn(var_rootPart_6336)
                end
            end
        end)

        local var_section_1d15
        local var_character_11ae
        do
            local var_character_d81c = false
            local var_rootPart_bd82 = false
            local var_rootPart_1569
            local var_rootPart_1fc3
            local var_remote_25e7 = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Carry"):WaitForChild("SelfUnHookEvent")
            local var_descendant_9ea6 = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Generator"):WaitForChild("RepairEvent")

            local function fn_ServerHandler_83f5(pos)
                local var_player_d377 = nil
                local var_nearestDistance_7fa2 = math.huge
                for _, item in ipairs(WorkspaceService.GetDescendants(WorkspaceService)) do
                    if item.Name == "Hook" and (item.IsA(item,"Model") or item.IsA(item,"BasePart")) and item.Parent then
                        local var_success_abb9, cf = pcall(function()
                            if item.IsA(item,"Model") then return item.GetPivot(item) end
                            return item.CFrame
                        end)
                        if var_success_abb9 and cf then
                            local dist = (cf.Position - pos).Magnitude
                            if dist < var_nearestDistance_7fa2 then
                                var_nearestDistance_7fa2 = dist
                                var_player_d377 = cf
                            end
                        end
                    end
                end
                return var_player_d377
            end

            local function fn_ServerHandler_4f61(var_rootPart_2226, char)
                if var_rootPart_1569 then
                    var_rootPart_1569.Disconnect(var_rootPart_1569)
                    var_rootPart_1569 = nil
                end
                var_rootPart_bd82 = false
                var_rootPart_2226.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                var_rootPart_2226.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                if not var_rootPart_1fc3 then
                    char.PivotTo(char,var_rootPart_2226.CFrame * CFrame.new(0, 15, 0))
                else
                    char.PivotTo(char,var_rootPart_1fc3 * CFrame.new((0.0), 3, (0.0)))
                end
                task.wait(0.1)
                var_rootPart_2226.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
            end

            local function fn_ServerHandler_522d()
                if LocalPlayer.Character then
                    local killer = nil
                    for _, var_player_2e5f in ipairs(Players.GetPlayers(Players)) do
                        local isKiller = var_player_2e5f.Team
                        if isKiller then
                            isKiller = (var_player_2e5f.Team.Name == "Killer")
                        end
                        if isKiller then
                            killer = var_player_2e5f
                            break
                        end
                    end
                    if killer then
                        if var_rootPart_1569 then
                            var_rootPart_1569.Disconnect(var_rootPart_1569)
                            var_rootPart_1569 = nil
                        end
                        var_rootPart_1569 = RunService.Heartbeat.Connect(RunService.Heartbeat,function()
                            local char = LocalPlayer.Character
                            local var_rootPart_2226 = char
                            if var_rootPart_2226 then
                                var_rootPart_2226 = char.FindFirstChild(char,"HumanoidRootPart")
                            end
                            local var_descendant_7b53 = not var_rootPart_bd82
                            if not var_descendant_7b53 then
                                var_descendant_7b53 = not char
                            end
                            if not var_descendant_7b53 then
                                var_descendant_7b53 = not var_rootPart_2226
                            end
                            if not var_descendant_7b53 then
                                if char.GetAttribute(char,"IsHooked") then
                                    local var_rootPart_23a6 = killer.Character
                                    local var_rootPart_dd5b = var_rootPart_23a6
                                    if var_rootPart_dd5b then
                                        var_rootPart_dd5b = var_rootPart_23a6.FindFirstChild(var_rootPart_23a6,"HumanoidRootPart")
                                    end
                                    if var_rootPart_dd5b then
                                        local var_rootPart_5cae = char.GetAttribute(char,"anticampCharge")
                                        if not var_rootPart_5cae then
                                            var_rootPart_5cae = 0
                                        end
                                        if not (var_rootPart_5cae >= 100) then
                                            var_rootPart_2226.CFrame = var_rootPart_dd5b.CFrame * CFrame.new(0, -15, 10)
                                            return
                                        else
                                            fn_ServerHandler_4f61(var_rootPart_2226, char)
                                            task.wait(0.9)
                                            var_remote_25e7.FireServer(var_remote_25e7)
                                            return
                                        end
                                    else
                                        var_rootPart_bd82 = false
                                        return
                                    end
                                else
                                    fn_ServerHandler_4f61(var_rootPart_2226, char)
                                    return
                                end
                            else
                                if var_rootPart_1569 then
                                    var_rootPart_1569.Disconnect(var_rootPart_1569)
                                    var_rootPart_1569 = nil
                                end
                                return
                            end
                        end)
                        return
                    else
                        return
                    end
                else
                    return
                end
            end

            var_character_11ae = function()
                var_character_d81c = true
                var_section_1d15()
            end

            var_section_1d15 = function()
                if var_character_d81c then
                    local char = LocalPlayer.Character
                    if char then
                        if char.GetAttribute(char,"IsHooked") then
                            var_rootPart_bd82 = not var_rootPart_bd82
                            if not var_rootPart_bd82 then
                                if var_rootPart_1569 then
                                    var_rootPart_1569.Disconnect(var_rootPart_1569)
                                    var_rootPart_1569 = nil
                                end
                                return
                            else
                                local var_rootPart_2226 = char.FindFirstChild(char,"HumanoidRootPart")
                                if var_rootPart_2226 then
                                    var_rootPart_1fc3 = fn_ServerHandler_83f5(var_rootPart_2226.Position)
                                    task.wait(1)
                                    local var_descendant_7b53 = not var_rootPart_bd82
                                    if not var_descendant_7b53 then
                                        var_descendant_7b53 = not char.GetAttribute(char,"IsHooked")
                                    end
                                    if not var_descendant_7b53 then
                                        local var_child_946d = nil
                                        for _, var_distance_8193 in ipairs(WorkspaceService.GetDescendants(WorkspaceService)) do
                                            local m = var_distance_8193.Name.match(var_distance_8193.Name,"^GeneratorPoint")
        if (2124%2==0) then local var_descendant_56c0=936 else local var_descendant_56c0=327 end
                                            if m then
                                                m = var_distance_8193.IsA(var_distance_8193,"BasePart")
                                            end
                                            if m then
                                                var_child_946d = var_distance_8193
                                                break
                                            end
                                        end
        do local var_remote_e1ed=62 end
                                        if var_child_946d then
                                            var_rootPart_2226.CFrame = var_child_946d.CFrame + Vector3.new((0.0), (3.0), 0)
                                            task.wait(0.1)
                                            var_descendant_9ea6.FireServer(var_descendant_9ea6,var_child_946d, true)
                                            task.wait(0.25)
                                            var_descendant_9ea6.FireServer(var_descendant_9ea6,var_child_946d, false)
                                            task.wait(0.1)
                                            fn_ServerHandler_522d()
                                        end
                                        return
                                    else
                                        return
                                    end
                                else
                                    return
                                end
                            end
                        else
                            return
                        end
                    else
        do local var_unknownValue_0008_b063=986 end
                        return
                    end
                else
                    return
                end
            end
        end

        local function fn_CameraVeilHandler_f416()
            local Window = UI.Window(UI,{
                Title = "BOLONG-HUB",
                Image = "84034353458936",
                Footer = "Violence District",
                Author = "Discord.gg/pWpgqVGxNK",
                Color = NOTIFY_COLOR, Version = 1, Search = true,
                Folder = "BolongHub",
            })
            Window.InfoTab(Window,{
                Name = "Info", Icon = "info", SectionTitle = "Information", Banner = "79662603577585",
                BannerAspectRatio = 16/5, Version = VERSION, DiscordLink = "https://discord.gg/pWpgqVGxNK",
                DiscordName = "Community BolongHub", DiscordText = (function() if var_section_a5d6 and buffer then local _bf=buffer.create(30) local _by={71,97,98,117,110,103,32,117,110,116,117,107,32,117,112,100,97,116,101,32,38,32,115,117,112,112,111,114,116,46} for _i=1,#_by do buffer.writeu8(_bf,_i-1,_by[_i]) end local _s={} for _i=1,#_by do _s[_i]=string.char(buffer.readu8(_bf,_i-1)) end return table.concat(_s) else local _by={71,97,98,117,110,103,32,117,110,116,117,107,32,117,112,100,97,116,101,32,38,32,115,117,112,112,111,114,116,46} local _s={} for _i=1,#_by do _s[_i]=string.char(_by[_i]) end return table.concat(_s) end end)(),
                DiscordDesc = "Made by 11rill - features: Killer & Survivor Hitbox/ESP, Auto Aim, Auto Generator, Killer Warn, Camera Veil, and many more.",
                CardsWidget = { { catwidget = (function() if var_section_a5d6 and buffer then local _bf=buffer.create(28) local _by={114,98,120,97,115,115,101,116,105,100,58,47,47,49,49,55,52,56,54,51,52,53,48,48,48,51,49,56} for _i=1,#_by do buffer.writeu8(_bf,_i-1,_by[_i]) end local _s={} for _i=1,#_by do _s[_i]=string.char(buffer.readu8(_bf,_i-1)) end return table.concat(_s) else local _by={114,98,120,97,115,115,101,116,105,100,58,47,47,49,49,55,52,56,54,51,52,53,48,48,48,51,49,56} local _s={} for _i=1,#_by do _s[_i]=string.char(_by[_i]) end return table.concat(_s) end end)() } },
            })

            local ExclusiveTab = Window.AddTab(Window,{ Name = "Exclusive", Icon = "sparkles" })
            local KillerTab = Window.AddTab(Window,{ Name = "Killer", Icon = "swords" })
            local SurvivorTab = Window.AddTab(Window,{ Name = "Survivor", Icon = "user" })
            local VisualTab = Window.AddTab(Window,{ Name = "Visual", Icon = "eye" })
            local MiscTab = Window.AddTab(Window,{ Name = "Misc", Icon = "settings" })
            local ConfigTab = Window.AddTab(Window,{ Name = "Config", Icon = "save" })

        do

            local var_section_1f0d = ExclusiveTab.AddSection(ExclusiveTab,"Invisible Op", nil)
            var_section_1f0d.AddToggle(var_section_1f0d,{
                Title = "Enable Invisible",
                Default = false,
                Callback = function(var_value_d1f9) fn_GetHandler_71fb(var_value_d1f9) end,
            })
            local var_section_2baa = ExclusiveTab.AddSection(ExclusiveTab,"Auto Parry", nil)
            local var_section_4eef = var_section_2baa.AddHStack(var_section_2baa)
            var_section_4eef.AddToggle(var_section_4eef,{
                Title = "Auto Parry", Default = false,
                Callback = function(var_value_d1f9)
                    State.autoParryEnabled = var_value_d1f9
                    if not var_value_d1f9 then
                        State.state_unhookYourself_bfd8 = {}
                        State.state_unhookYourself_d58e = {}
                        State.state_unhookYourself_c84b = {}
                    end
                end,
            })
            var_section_4eef.AddToggle(var_section_4eef,{
                Title = "Radius ESP", Default = false,
                Callback = function(var_value_d1f9)
                    State.parryRadiusEspEnabled = var_value_d1f9
                    if fn_ParryHelper_6254 then
                        fn_ParryHelper_6254(var_value_d1f9)
                    end
                end,
            })
            var_section_2baa.AddSlider(var_section_2baa,{
                Title = "Parry Radius (Stud)", Min = 4, Max = 40, Default = (11.0), Increment = 1,
                Callback = function(var_value_d1f9)
                    State.parryRadius = var_value_d1f9
                end,
            })
            var_section_2baa.AddSlider(var_section_2baa,{
                Title = "Aim Strictness", Min = -1, Max = (1.0), Default = 0.1, Increment = 0.1,
                Callback = function(var_value_d1f9)
                    State.aimStrictness = var_value_d1f9
                end,
            })

            var_section_2baa.AddToggle(var_section_2baa,{
                Title = "Face Killer (Smooth)", Default = true,
                Callback = function(var_value_d1f9)
                    State.autoParryAutoFace = var_value_d1f9
                    if not var_value_d1f9 then
                        local character = LocalPlayer.Character
                        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
                        if humanoid then pcall(function() humanoid.AutoRotate = true end) end
                    end
                end,
            })
            var_section_2baa.AddSlider(var_section_2baa,{
                Title = "Face Smoothness", Min = 2, Max = 30, Default = 14, Increment = 1,
                Callback = function(var_value_d1f9)
                    State.autoParryFaceSmoothness = var_value_d1f9
                end,
            })
            var_section_2baa.AddSlider(var_section_2baa,{
                Title = "Face Lead (s)", Min = 0, Max = 0.20, Default = 0.08, Increment = 0.01,
                Callback = function(var_value_d1f9)
                    State.autoParryFaceLead = var_value_d1f9
                end,
            })

            local var_section_4466 = ExclusiveTab.AddSection(ExclusiveTab,"Unhook Yourself", nil)
            var_section_4466.AddParagraph(var_section_4466,{
                Title = "Unhook Yourself",
                Content = "Bypass Hook.",
            })
            var_section_4466.AddButton(var_section_4466,{
                Title = "Unhook Yourself",
                Callback = function() var_character_11ae() end,
            })
            var_section_4466.AddKeybind(var_section_4466,{
                Title = "Unhook Keybind",
                Default = Enum.KeyCode.Unknown,
                Callback = function() var_section_1d15() end,
            })


    -- ============================================================
    -- SILENT SPEAR / VEIL â€” BIDIKAN TERSEMBUNYI
    -- ============================================================
        local var_section_7b3c = ExclusiveTab.AddSection(ExclusiveTab,"Silent Spear (Veil)", nil)
            var_section_7b3c.AddParagraph(var_section_7b3c,{
                Title = "Aim Guide",
                Content = "[ID] Saat Indikator/Snapline berubah hijau atau menampilkan \"RELEASE\", itu adalah waktu paling akurat untuk melepaskan SPEAR (90% kena target jika target diam).\n\n[EN] When the Indicator/Snapline turns green or shows \"RELEASE\", it is the most accurate time to release the SPEAR (90% hit chance if the target is stationary)."
            })
            var_section_7b3c.AddToggle(var_section_7b3c,{
                Title = "Silent Spear", Default = false,
                Callback = function(var_value_d1f9)
                    State.silentSpearEnabled = var_value_d1f9

                    if not var_value_d1f9 then
                        State.state_unhookYourself_bc03 = 142.5
                        State.state_unhookYourself_1454 = 0.5
                        State.spearLastShot = nil
                    end
                end,
            })
            local var_row_da6f = var_section_7b3c.AddHStack(var_section_7b3c)
            local var_row_50f4 = var_section_7b3c.AddHStack(var_section_7b3c)
            var_row_da6f.AddToggle(var_row_da6f,{
                Title = "FOV Circle", Default = false,
                Callback = function(var_value_d1f9) State.spearFovCircleEnabled = var_value_d1f9 end,
            })
            var_row_da6f.AddToggle(var_row_da6f,{
                Title = "Aim Indicator", Default = false,
                Callback = function(var_value_d1f9) State.spearAimIndicatorEnabled = var_value_d1f9 end,
            })
            var_row_50f4.AddToggle(var_row_50f4,{
                Title = "SnapLine", Default = false,
                Callback = function(var_value_d1f9) State.SPEAR_SNAPLINE.enabled = var_value_d1f9 end,
            })
            var_row_50f4.AddToggle(var_row_50f4,{
                Title = "Show Name/Studs", Default = true,
                Callback = function(var_value_d1f9) Config.spearShowNameStuds = var_value_d1f9 end,
            })
            var_section_7b3c.AddSlider(var_section_7b3c,{
                Title = "Spear FOV Radius", Min = 30, Max = 500, Default = 150, Step = 5,
                Callback = function(var_value_d1f9) Config.spearFovRadius = var_value_d1f9 end,
            })
            var_section_7b3c.AddToggle(var_section_7b3c,{
                Title = "Spear Auto Prediction",
                Default = true,
                Callback = function(var_value_d1f9) Config.spearAutoPrediction = var_value_d1f9 end,
            })
            var_section_7b3c.AddToggle(var_section_7b3c,{
                Title = "Spear Anti-Strafing", Content = "Redam lead saat survivor tiba-tiba balik arah",
                Default = true,
                Callback = function(var_value_d1f9) Config.spearAntiStrafing = var_value_d1f9 end,
            })


    -- ============================================================
    -- SILENT AIM / TWIST OF FATE â€” BIDIKAN TERSEMBUNYI
    -- ============================================================
        local var_section_1ca8 = ExclusiveTab.AddSection(ExclusiveTab,"Silent Aim (Twist of Fate)", nil)
            var_section_1ca8.AddToggle(var_section_1ca8,{
                Title = "Silent Aim", Default = false,
                Callback = function(var_value_d1f9) State.silentAimEnabled = var_value_d1f9 end,
            })
            local var_enabled_8f32 = var_section_1ca8.AddTargetSelector(var_section_1ca8,{
                Title = "Silent Aim",
                DropdownTitle = "Target Type",
                Options = { "KILLER", "SURVIVOR", "ZOMBIE" },
                Values = { "Killer", "Survivor", "Zombie" },
                Default = Config.silentAimTargetType or "Killer",
                Callback = function(var_value_d1f9) Config.silentAimTargetType = var_value_d1f9 end,
            })
            local var_row_e01a = var_section_1ca8.AddHStack(var_section_1ca8)
            var_row_e01a.AddToggle(var_row_e01a,{
                Title = "FOV Circle", Default = false,
                Callback = function(var_value_d1f9) State.silentAimFovCircleEnabled = var_value_d1f9 end,
            })
            var_row_e01a.AddToggle(var_row_e01a,{
                Title = "Laser ESP", Default = false,
                Callback = function(var_value_d1f9) State.silentAimLaserEspEnabled = var_value_d1f9 end,
            })
            var_section_1ca8.AddToggle(var_section_1ca8,{
                Title = "Auto Prediction (ToF)", Default = true,
                Callback = function(var_value_d1f9) Config.silentAimAutoPrediction = var_value_d1f9 end,
            })
            var_section_1ca8.AddToggle(var_section_1ca8,{
                Title = "Adaptive Damping (Zigzag)", Default = true,
                Callback = function(var_value_d1f9) Config.silentAimAdaptiveDamping = var_value_d1f9 end,
            })
            var_section_1ca8.AddSlider(var_section_1ca8,{
                Title = "Aim FOV Radius", Min = 30, Max = 500, Default = 150, Step = 5,
                Callback = function(var_value_d1f9) Config.silentAimFovRadius = var_value_d1f9 end,
            })

            local var_section_5edb = ExclusiveTab.AddSection(ExclusiveTab,"Crosshair", nil)
            var_section_5edb.AddToggle(var_section_5edb,{
                Title = "Enable Crosshair", Default = false,
                Callback = function(var_value_d1f9)
                    var_frame_e783.SetEnabled(var_frame_e783,var_value_d1f9)
                end,
            })
            var_section_5edb.AddDropdown(var_section_5edb,{
                Title = "Style / Model", Options = CROSSHAIR_STYLES, Default = "Dot",
                Callback = function(var_value_d1f9)
                    var_frame_e783.SetStyle(var_frame_e783,var_value_d1f9)
                end,
            })
            var_section_5edb.AddSlider(var_section_5edb,{
                Title = "Size", Min = (1.0), Max = 100, Default = 20, Increment = 1,
                Callback = function(var_value_d1f9)
                    var_frame_e783.SetSize(var_frame_e783,var_value_d1f9)
                end,
            })
            var_section_5edb.AddSlider(var_section_5edb,{
                Title = "Opacity", Min = (0.0), Max = (100.0), Default = 100, Increment = 1,
                Callback = function(var_value_d1f9)
                    var_frame_e783.SetOpacity(var_frame_e783,var_value_d1f9 / (100.0))
                end,
            })
            var_section_5edb.AddInput(var_section_5edb,{
                Title = "Position X (px)", Default = "0",
                Placeholder = "Offset from center (positive = right)",
                Callback = function(var_value_d1f9)
                    local var_color_8bed = tonumber(var_value_d1f9)
                    if var_color_8bed then
                        var_frame_e783.SetOffsetX(var_frame_e783,math.clamp(var_color_8bed, -1000, (1000.0)))
                    end
                end,
            })
            var_section_5edb.AddInput(var_section_5edb,{
                Title = "Position Y (px)", Default = "0",
                Placeholder = "Offset from center (positive = down)",
                Callback = function(var_value_d1f9)
                    local var_color_8bed = tonumber(var_value_d1f9)
                    if var_color_8bed then
                        var_frame_e783.SetOffsetY(var_frame_e783,math.clamp(var_color_8bed, (-1000.0), 1000))
                    end
                end,
            })
            var_section_5edb.AddColorPicker(var_section_5edb,{
                Title = "Crosshair Color", Default = Color3.fromRGB((255.0), 255, 255),
                Callback = function(color)
                    var_frame_e783.SetColor(var_frame_e783,color)
                end,
            })

            local var_section_aa6f = ExclusiveTab.AddSection(ExclusiveTab,"God Mode", nil)
            var_section_aa6f.AddParagraph(var_section_aa6f,{ Title = "God Mode", Content = "Instant Heal + Anti Knock/Down.\nSangat Cocok Jika Digunakan Untuk Main Pistol-pistolan." })
            var_section_aa6f.AddToggle(var_section_aa6f,{
                Title = "Enable God Mode", Default = false,
                Callback = function(var_value_d1f9) if var_value_d1f9 then fn_GeneratorHandler_9e93() else fn_GeneratorHandler_9092() end end,
            })


    -- ============================================================
    -- AIMLOCK FLASHLIGHT â€” KUNCI TARGET FLASHLIGHT
    -- ============================================================
        local var_section_d782 = ExclusiveTab.AddSection(ExclusiveTab,"Aimlock Flashlight", nil)
            var_section_d782.AddToggle(var_section_d782,{
                Title = "Enable Aimlock Flashlight",
                Content = "Auto senter ke kepala Killer terdekat (max 30 studs)",
                Default = false,
                Callback = function(var_value_d1f9)
                    State.flashlightAimlockEnabled = var_value_d1f9
                    if not var_value_d1f9 then State.flashlightAimlockLocked = false end
                end,
            })
            var_section_d782.AddSlider(var_section_d782,{
                Title = "Smoothness", Min = 0.05, Max = 1.0, Default = 0.35, Step = 0.01,
                Callback = function(var_value_d1f9) State.flashlightAimlockSmoothness = tonumber(var_value_d1f9) or 0.35 end,
            })


    -- ============================================================
    -- AIM LOCK â€” KUNCI BIDIKAN
    -- ============================================================
        local var_section_8947 = ExclusiveTab.AddSection(ExclusiveTab,"Aim Lock (Legit)", nil)
            var_section_8947.AddToggle(var_section_8947,{
                Title = "Enable Aim Lock", Default = false,
                Callback = function(var_value_d1f9)
                    Config.aimLockEnabled = var_value_d1f9
                    if var_value_d1f9 then fn_GetHandler_3f25() else StopCameralock() end
                end,
            })
            var_section_8947.AddTargetSelector(var_section_8947,{
                Title = "Aim Lock",
                DropdownTitle = "Lock Target",
                Options = { "ZOMBIE", "SURVIVOR", "KILLER" },
                Values = { "Zombie", "Survivor", "Killer" },
                Default = Config.aimLockTargetType or "Zombie",
                Callback = function(var_value_d1f9) Config.aimLockTargetType = var_value_d1f9 end,
            })

            var_section_8947.AddDropdown(var_section_8947,{
                Title = "Aim Part", Options = { "Torso", "Head" }, Default = "Torso",
                Callback = function(var_value_d1f9) Config.aimLockPart = var_value_d1f9 end,
            })
            var_section_8947.AddDropdown(var_section_8947,{
                Title = "Lock Mode", Content = "Recommended Use: Hold to Lock (PC: Right Click / Mobile: Slasher Attack Button)",
                Options = { "Always Lock", "Hold to Lock" }, Default = "Always Lock",
                Callback = function(var_value_d1f9) Config.aimLockMode = var_value_d1f9 end,
            })
            var_section_8947.AddSlider(var_section_8947,{
                Title = "Max Distance", Content = "Maximum distance to lock target (studs)",
                Min = 20, Max = 700, Default = Config.aimLockMaxDistance, Increment = 5,
                Callback = function(var_value_d1f9) Config.aimLockMaxDistance = var_value_d1f9 end,
            })
            var_section_8947.AddSlider(var_section_8947,{
                Title = "Camera Smoothness",
                Min = 0.01, Max = (1.0), Default = Config.aimLockCameraSmoothness, Increment = 0.01,
                Callback = function(var_value_d1f9) Config.aimLockCameraSmoothness = var_value_d1f9 end,
            })

            local var_section_b22f = ExclusiveTab.AddSection(ExclusiveTab,"Camera Veil (Legit)", nil)
            var_section_b22f.AddToggle(var_section_b22f,{
                Title = "Camera Veil", Default = false,
                Callback = function(var_value_d1f9)
                    Config.cameraVeilEnabled = var_value_d1f9
                    local var_success_abb9 = pcall(function() if var_value_d1f9 then fn_RemoveHelper_ac9a() else StopCameraVeil() end end)
                    if not var_success_abb9 then
                        Config.cameraVeilEnabled = false
                        Notify("Camera Veil", (function() if var_section_a5d6 and buffer then local _bf=buffer.create(30) local _by={71,97,103,97,108,32,109,101,110,103,97,107,116,105,102,107,97,110,32,67,97,109,101,114,97,32,86,101,105,108} for _i=1,#_by do buffer.writeu8(_bf,_i-1,_by[_i]) end local _s={} for _i=1,#_by do _s[_i]=string.char(buffer.readu8(_bf,_i-1)) end return table.concat(_s) else local _by={71,97,103,97,108,32,109,101,110,103,97,107,116,105,102,107,97,110,32,67,97,109,101,114,97,32,86,101,105,108} local _s={} for _i=1,#_by do _s[_i]=string.char(_by[_i]) end return table.concat(_s) end end)(), 2)
                    end
                end,
            })
            var_section_b22f.AddToggle(var_section_b22f,{
                Title = "SnapLine ESP", Default = false,
                Callback = function(var_value_d1f9)
                    Config.cameraVeilSnaplineEnabled = var_value_d1f9
                    if not var_value_d1f9 then
                        if State.state_maxDistance_7c1c then State.state_maxDistance_7c1c.Visible = false end
                        if State.state_maxDistance_b5b0 then State.state_maxDistance_b5b0.Visible = false end
                    end
                end,
            })
        end

        do


    -- ============================================================
    -- HITBOX MODIFIER â€” MODIFIKASI HITBOX
    -- ============================================================
        local var_section_e824 = KillerTab.AddSection(KillerTab,"Hitbox Modifier", nil)
            var_section_e824.AddToggle(var_section_e824,{
                Title = "Enable Hitbox Modifier", Default = false,
                Callback = function(var_value_d1f9)
                    Config.hitboxModifierEnabled = var_value_d1f9
                    if var_value_d1f9 then fn_HitboxHelper_b4e9() else fn_HitboxHandler_76e8() end
                end,
            })
            local var_row_5829 = var_section_e824.AddSlider(var_section_e824,{
                Title = "Survivor Hitbox Size (%)", Content = "Ukuran hitbox Survivor (100% = normal)",
                Min = 100, Max = 700, Default = 100, Increment = 5,
                Callback = function(var_value_d1f9)
                    Config.survivorHitboxPercent = var_value_d1f9
                    if Config.hitboxModifierEnabled then fn_HitboxHelper_b4e9() end
                end,
            })
            local var_enabled_ff20 = var_section_e824.AddSlider(var_section_e824,{
                Title = "Killer Hitbox Size (%)", Content = "Ukuran hitbox Killer (100% = normal)",
                Min = 100, Max = (700.0), Default = 100, Increment = 5,
                Callback = function(var_value_d1f9)
                    Config.killerHitboxPercent = var_value_d1f9
                    if Config.hitboxModifierEnabled then fn_HitboxHelper_b4e9() end
                end,
            })
            local var_row_eee7 = var_section_e824.AddHStack(var_section_e824)
            var_row_eee7.AddButton(var_row_eee7,{
                Title = "Default",
                Callback = function()
                    var_row_5829.Set(var_row_5829,100)
                    var_enabled_ff20.Set(var_enabled_ff20,(100.0))
                    if Config.hitboxModifierEnabled then fn_HitboxHelper_b4e9() end
                    Notify("Hitbox Preset", "Reset ke Default (100%)", 1.5)
                end,
            })
            var_row_eee7.AddButton(var_row_eee7,{
                Title = "Big (200%)",
                Callback = function()
                    var_row_5829.Set(var_row_5829,200)
                    var_enabled_ff20.Set(var_enabled_ff20,200)
                    if Config.hitboxModifierEnabled then fn_HitboxHelper_b4e9() end
                    Notify("Hitbox Preset", "Big Hitbox aktif (200%)", 1.5)
                end,
            })

            var_section_e824.AddToggle(var_section_e824,{
                Title = "Enable Hitbox ESP", Default = false,
                Callback = function(var_value_d1f9)
                    Config.hitboxEspEnabled = var_value_d1f9
                    if var_value_d1f9 then fn_HitboxHandler_2c22() else fn_HitboxHandler_ebe1() end
                end,
            })
            var_section_e824.AddSlider(var_section_e824,{
                Title = "Fill Transparency", Min = 0, Max = 100, Default = (50.0), Increment = (5.0),
                Callback = function(var_value_d1f9)
                    Config.hitboxFillTransparency = var_value_d1f9 / (100.0)
                    if not Config.hitboxEspOutlineOnly then fn_HitboxHandler_d51b() end
                end,
            })
            local var_section_d78e = var_section_e824.AddHStack(var_section_e824)
            var_section_d78e.AddColorPicker(var_section_d78e,{
                Title = "Hitbox Survivor Color", Default = Config.survivorHitboxColor,
                Callback = function(color) Config.survivorHitboxColor = color
                fn_HitboxHandler_d51b() end,
            })
            var_section_d78e.AddColorPicker(var_section_d78e,{
                Title = "HitBox Killer Color", Default = Config.killerHitboxColor,
                Callback = function(color) Config.killerHitboxColor = color
                fn_HitboxHandler_d51b() end,
            })


            local var_section_eccb = KillerTab.AddSection(KillerTab,"Killer No Cooldown", nil)
            var_section_eccb.AddToggle(var_section_eccb,{
                Title = "Enable No Cooldown Bypass",
                Content = "Hidden, Abysswalker, Masked, More",
                Default = false,
                Callback = function(var_value_d1f9)
                    noCooldownEnabled = var_value_d1f9
                    if var_value_d1f9 then
                        EnableNoCooldownHook()
                    else
                        DisableNoCooldownHook()
                    end
                end
            })

            local var_row_3859 = var_section_eccb.AddHStack(var_section_eccb)
            var_row_3859.AddButton(var_row_3859,{
                Title = "Fire Corrupt (Abyss)",
                Callback = function()
                    pcall(function()
                        local var_section_1617 = game:GetService("ReplicatedStorage").Remotes.Killers.Abysswalker.corrupt
                        var_section_1617.FireServer(var_section_1617)
                    end)
                end
            })
            var_row_3859.AddButton(var_row_3859,{
                Title = "Fire Slash (Abyss)",
                Callback = function()
                    pcall(function()
                        local var_section_1617 = game:GetService("ReplicatedStorage").Remotes.Attacks.BasicAttack
                        var_section_1617.FireServer(var_section_1617,true)
                    end)
                end
            })



    -- ============================================================
    -- MAYERS / STALKER â€” TANPA COOLDOWN
    -- ============================================================
        local var_section_eefa = KillerTab.AddSection(KillerTab,"Mayers (Stalker) No Cooldown", nil)
            var_section_eefa.AddToggle(var_section_eefa,{
                Title = "Enable Mayers No Cooldown",
                Content = "PC: Q | Mobile: Button Jambak",
                Default = false,
                Callback = function(var_value_d1f9)
                    State.state_hitboxKillerColor_98d5 = var_value_d1f9
                    if var_value_d1f9 and not noCooldownEnabled then
                        EnableNoCooldownHook()
                    end
                    if var_value_d1f9 then
                        StartMayersMobileHook()
                    else
                        StopMayersMobileHook()
                    end
                end
            })
            var_section_eefa.AddToggle(var_section_eefa,{
                Title = "Stalk While Moving (Auto)",
                Content = "Auto Stalking ke survivor terdekat",
                Default = false,
                Callback = function(var_value_d1f9)
                    State.state_fireCorruptAbyss_bb68 = var_value_d1f9
                end
            })
            local var_row_72ab = var_section_eefa.AddHStack(var_section_eefa)
            var_row_72ab.AddButton(var_row_72ab,{
                Title = "Dash (Q) NoCD",
                Callback = function()
                    RunMayersMobileAction()
                end
            })
            var_row_72ab.AddButton(var_row_72ab,{
                Title = "Grab Nearest",
                Callback = function()
                    pcall(function()
                        local target = GetNearestSurvivorForMayers((8.0))
                        if target then
                            local var_remote_b96e = game:GetService("ReplicatedStorage").Remotes.Killers.Stalker:FindFirstChild("grab")
                            if var_remote_b96e then
                                var_remote_b96e.FireServer(var_remote_b96e,target)
                                Notify("Mayers", "Grab fired: " .. target.Name, 1.2)
                            end
                        else
                            Notify("Mayers", "No target within 8 studs", 1.2)
                        end
                    end)
                end
            })

            local var_section_6727 = KillerTab.AddSection(KillerTab,"Infinite Lunge", nil)
            var_section_6727.AddToggle(var_section_6727,{
                Title = "Enable Infinite Lunge",
                Content = "Lunge saat menahan attack tidak pernah berakhir",
                Default = Config.cfg_enableMayersNoCooldown_b604,
                Callback = function(var_value_d1f9)
                    Config.cfg_enableMayersNoCooldown_b604 = var_value_d1f9
                    if var_value_d1f9 then
                        HandleMayersTarget()
                    else
                        TriggerMayersAttack()
                    end
                end,
            })

            local var_row_22c0 = var_section_eccb.AddHStack(var_section_eccb)
            var_row_22c0.AddButton(var_row_22c0,{
                Title = "Fire Leap (Hidden)",
                Callback = function()
                    pcall(function()
                        local var_section_1617 = game:GetService("ReplicatedStorage").Remotes.Killers.Hidden.Leap
                        var_section_1617.FireServer(var_section_1617,true)
                    end)
                end
            })
            var_row_22c0.AddButton(var_row_22c0,{
                Title = "Fire M2 (Hidden)",
                Callback = function()
                    pcall(function()
                        local var_section_1617 = game:GetService("ReplicatedStorage").Remotes.Killers.Hidden.M2
                        var_section_1617.FireServer(var_section_1617,{}, false)
                    end)
                end
            })



    -- ============================================================
    -- HIDDEN M2 AIMLOCK â€” KUNCI M2
    -- ============================================================
        local var_section_b953 = KillerTab.AddSection(KillerTab,"Aimlock M2 Skill Hidden", nil)
            var_section_b953.AddToggle(var_section_b953,{
                Title = "Enable AIMLOCK M2",
                Content = (function() if var_section_a5d6 and buffer then local _bf=buffer.create(42) local _by={65,117,116,111,32,108,111,99,107,32,115,117,114,118,105,118,111,114,32,116,101,114,100,101,107,97,116,32,40,109,97,120,32,53,48,32,115,116,117,100,115,41} for _i=1,#_by do buffer.writeu8(_bf,_i-1,_by[_i]) end local _s={} for _i=1,#_by do _s[_i]=string.char(buffer.readu8(_bf,_i-1)) end return table.concat(_s) else local _by={65,117,116,111,32,108,111,99,107,32,115,117,114,118,105,118,111,114,32,116,101,114,100,101,107,97,116,32,40,109,97,120,32,53,48,32,115,116,117,100,115,41} local _s={} for _i=1,#_by do _s[_i]=string.char(_by[_i]) end return table.concat(_s) end end)(),
                Default = false,
                Callback = function(var_value_d1f9)
                    State.state_fireLeapHidden_d47b = var_value_d1f9
                    if var_value_d1f9 then
                        fn_ResetHelper_5a8a()
                    else
                        StopHiddenM2Hook()
                    end
                end,
            })
            var_section_b953.AddSlider(var_section_b953,{
                Title = "Smoothness", Min = 0.05, Max = 1.0, Default = 1.0, Step = 0.01,
                Callback = function(var_value_d1f9) State.state_fireLeapHidden_6108 = tonumber(var_value_d1f9) or 1.0 end,
            })

            local var_section_5498 = KillerTab.AddSection(KillerTab,"Masked Skill Spammer", nil)
            local var_section_f933 = "Cobra"
            var_section_5498.AddDropdown(var_section_5498,{
                Title = "Select Mask Power",
                Options = {"Alex", "Brandon", "Cobra", "Rabbit", "Richter", "Tony"},
                Default = "Cobra",
                Callback = function(var_value_d1f9) var_section_f933 = var_value_d1f9 end
            })

            local var_row_24c6 = var_section_5498.AddHStack(var_section_5498)
            var_row_24c6.AddButton(var_row_24c6,{
                Title = "Activate Power",
                Callback = function()
                    pcall(function()
                        local var_section_1617 = game:GetService("ReplicatedStorage").Remotes.Killers.Masked.Activatepower
                        var_section_1617.FireServer(var_section_1617,var_section_f933)
                    end)
                    Notify("Masked", "Power Activated: " .. var_section_f933, 1.5)
                end
            })
            var_row_24c6.AddButton(var_row_24c6,{
                Title = "Deactivate Power",
                Callback = function()
                    pcall(function()
                        local var_section_1617 = game:GetService("ReplicatedStorage").Remotes.Killers.Masked.Deactivatepower
                        var_section_1617.FireServer(var_section_1617)
                    end)
                    Notify("Masked", "Power Deactivated", 1.5)
                end
            })

            local var_section_73ac = KillerTab.AddSection(KillerTab,"Anti Blind", nil)
            var_section_73ac.AddToggle(var_section_73ac,{
                Title = "Anti Flashlight Blind",
                Content = "Mencegah kamu terkena efek buta (Blinded) dari senter Survivor",
                Default = false,
                Callback = function(var_value_d1f9)
                    Config.cfg_smoothness_d9e8 = var_value_d1f9
                    if var_value_d1f9 and type(getgenv().SetupAntiBlindHook) == "function" then
                        pcall(getgenv().SetupAntiBlindHook)
                    end
                end,
            })
            local var_section_545d = KillerTab.AddSection(KillerTab,"Anti Looping", nil)
            var_section_545d.AddToggle(var_section_545d,{
                Title = "Anti Loop Window",
                Content = "Membuat semua window di map tidak bisa digunakan untuk looping",
                Default = false,
                Callback = function(var_value_d1f9)
                    State.state_selectMaskPower_a0a0 = var_value_d1f9
                    if var_value_d1f9 then
                        ApplyAntiLoopWindow()
                    else
                        DisableAntiLoopWindow()
                    end
                end
            })
            var_section_545d.AddButton(var_section_545d,{
                Title = "Auto Drop All Pallets",
                Callback = function()
                    DropAllPallets()
                end
            })

            local var_section_2f30 = KillerTab.AddSection(KillerTab,"Killer Perks Info", nil)
            local var_section_ba2e = var_section_2f30.AddToggle(var_section_2f30,{
                Title = "Enable Killer Perks Info",
                Default = Config.cfg_deactivatePower_e908,
                Callback = function(var_value_d1f9)
                    Config.cfg_deactivatePower_e908 = var_value_d1f9
                    if var_value_d1f9 then
                        StartKillerPerksInfo()
                    else
                        StopKillerPerksInfo()
                    end
                end,
            })
            SetKPI_ToggleRef(var_section_ba2e)

            local var_section_5855 = KillerTab.AddSection(KillerTab,"Hook Counter", nil)
            var_section_5855.AddToggle(var_section_5855,{
                Title = "Show Hook Counter",
                Default = Config.cfg_antiFlashlightBlind_774e,
                Callback = function(var_value_d1f9)
                    Config.cfg_antiFlashlightBlind_774e = var_value_d1f9
                    if var_value_d1f9 then
                        if State._HookCounter_Enable then pcall(State._HookCounter_Enable) end
                    else
                        if State._HookCounter_Disable then pcall(State._HookCounter_Disable) end
                    end
                end,
            })
        end

        do


    -- ============================================================
    -- AUTO GENERATOR â€” OTOMATISASI GENERATOR
    -- ============================================================
        local var_section_fffd = SurvivorTab.AddSection(SurvivorTab,"Auto Generator", nil)
            var_section_fffd.AddToggle(var_section_fffd,{
                Title = "Auto Generator", Default = Config.cfg_antiLoopWindow_9682,
                Callback = function(var_value_d1f9) Config.cfg_antiLoopWindow_9682 = var_value_d1f9 end,
            })
            var_section_fffd.AddDropdown(var_section_fffd,{
                Title = "Mode", Content = "Normal = safe zone | Perfect = zona Perfect | Instant = FAST | Random = Succes/Neutral",
                Options = { "Instant", "Perfect", "Normal", "Random" }, Default = Config.cfg_autoDropAllPallets_f46e,
                Callback = function(var_value_d1f9) Config.cfg_autoDropAllPallets_f46e = var_value_d1f9 end,
            })

    -- ============================================================
    -- GENERATOR BOOST â€” PENINGKATAN GENERATOR
    -- ============================================================
        local var_section_3e7c = SurvivorTab.AddSection(SurvivorTab,"Generator Boost", nil)
            var_section_3e7c.AddToggle(var_section_3e7c,{
                Title = "Show GenBoost Button",
                Default = false,
                Callback = function(var_value_d1f9)
                    Config.cfg_enableKillerPerksInfo_53d3 = var_value_d1f9
                    if var_value_d1f9 then CreateGenBoostButton() else DestroyGenBoostButton() end
                end,
            })
            var_section_3e7c.AddKeybind(var_section_3e7c,{
                Title = "GenBoost Keybind",
                Default = Enum.KeyCode.Unknown,
                Callback = function() PerformGenBoost() end,
            })
            local var_section_1345 = SurvivorTab.AddSection(SurvivorTab,"Anti Fall Slow", nil)
            var_section_1345.AddToggle(var_section_1345,{
                Title = "Anti Fall Slow",
                Content = "Mencegah karakter melambat saat mendarat / jatuh dari ketinggian berapa pun",
                Default = false,
                Callback = function(var_value_d1f9)
                    State.state_autoGenerator_e4d4 = var_value_d1f9
                    local char = LocalPlayer.Character
                    local var_humanoid_3937 = char and char.FindFirstChildOfClass(char,"Humanoid")
                    if var_value_d1f9 then _StartAntiFallSlow(var_humanoid_3937) else _StopAntiFallSlow(var_humanoid_3937) end
                end,
            })
            local var_humanoid_48c2 = SurvivorTab.AddSection(SurvivorTab,"Speed Boost", nil)
            var_humanoid_48c2.AddToggle(var_humanoid_48c2,{
                Title = "Speed Boost",
                Default = false,
                Callback = function(var_value_d1f9)
                    fn_GetHandler_953c(var_value_d1f9)
                end,
            })
            var_humanoid_48c2.AddSlider(var_humanoid_48c2,{
                Title = "Boost Multiplier",
                Min = 0, Max = 2, Default = 0.3, Increment = 0.01,
                Callback = function(var_value_d1f9)
                    State.state_showGenBoostButton_f0c8 = var_value_d1f9
                    if State.SB_Retarget then pcall(State.SB_Retarget) end
                end,
            })
            var_humanoid_48c2.AddToggle(var_humanoid_48c2,{
                Title = "Count Speed Perks", Content = "Perk & slow bawaan game ikut dihitung",
                Default = true,
                Callback = function(var_value_d1f9)
                    State.state_showGenBoostButton_f398 = var_value_d1f9
                    if State.SB_RefreshAll then pcall(State.SB_RefreshAll) end
                end,
            })
            var_humanoid_48c2.AddToggle(var_humanoid_48c2,{
                Title = "Pause when Crouching", Content = "SpeedBoost berhenti saat crouch, otomatis lanjut setelah tidak crouch",
                Default = false,
                Callback = function(var_value_d1f9)
                    State.state_genboostKeybind_a660 = var_value_d1f9
                end,
            })

            local var_humanoid_14b3 = SurvivorTab.AddSection(SurvivorTab,"No Slowdown", nil)
            var_humanoid_14b3.AddToggle(var_humanoid_14b3,{
                Title = "No Slowdown",
                Default = false,
                Callback = function(var_value_d1f9)
                    State.state_antiFallSlow_dab5 = var_value_d1f9
                    local char = LocalPlayer.Character
                    local var_humanoid_3937 = char and char.FindFirstChildOfClass(char,"Humanoid")
                    if var_value_d1f9 then _StartNoSlowdown(var_humanoid_3937) else _StopNoSlowdown() end
                end,
            })
            var_humanoid_14b3.AddToggle(var_humanoid_14b3,{
                Title = "Safe Mode (No Slowdown)",
                Content = "No Slowdown tidak menimpa efek slow dari (parry / item).",
                Default = true,
                Callback = function(var_value_d1f9)
                    State.state_speedBoost_2538 = var_value_d1f9
                end,
            })
            local var_section_32de = SurvivorTab.AddSection(SurvivorTab,"Auto Crouch (Abyss)", nil)
            var_section_32de.AddToggle(var_section_32de,{
                Title = "Auto Crouch", Default = false,
                Callback = function(var_value_d1f9)
                    Config.cfg_boostMultiplier_5533 = var_value_d1f9
                    if not var_value_d1f9 then fn_ServerHandler_d7d9(false) end
                end
            })
            var_section_32de.AddSlider(var_section_32de,{
                Title = "Crouch Radius (Stud)", Min = 4, Max = 40, Default = (18.0), Increment = (1.0),
                Callback = function(var_value_d1f9) Config.cfg_countSpeedPerks_b7f3 = var_value_d1f9 end,
            })
            local var_section_545d = SurvivorTab.AddSection(SurvivorTab,"Auto Drop Nearby Pallet", nil)
            var_section_545d.AddToggle(var_section_545d,{
                Title = "Auto Drop Nearby Pallet",
                Default = false,
                Callback = function(var_value_d1f9)
                State.state_pauseWhenCrouching_1ac5 = var_value_d1f9
                if var_value_d1f9 then
                    State.state_pauseWhenCrouching_82c7 = nil
                end
            end
            })
            local var_section_9583 = SurvivorTab.AddSection(SurvivorTab,"Moonwalk", nil)
            var_section_9583.AddToggle(var_section_9583,{
                Title = "Enable Moonwalk (Mobile GUI)",
                Default = false,
                Callback = function(var_value_d1f9)
                    Config.cfg_enableMoonwalkMobileGUI_29e3 = var_value_d1f9
                    if var_value_d1f9 then
                        fn_MoonwalkHelper_b566()
                        if State.state_safeModeNoSlowdown_14dc then State.state_safeModeNoSlowdown_14dc.Enabled = true end
                    else
                        if State.state_safeModeNoSlowdown_14dc then State.state_safeModeNoSlowdown_14dc.Enabled = false end
                        State.state_safeModeNoSlowdown_1609 = (0.0)
                        State.state_moonwalkMode_6f50 = false
                        State.state_enableMoonwalkMobileGUI_4fa3 = false
                    end
                end
            })

            var_section_9583.AddDropdown(var_section_9583,{
                Title = "Moonwalk Mode", Content = "Classic = lock murni versi lama. Sway = versi goyang kiri-kanan.",
                Options = { "Classic", "Sway" }, Default = "Classic",
                Callback = function(var_value_d1f9) Config.cfg_autoCrouch_7b00 = var_value_d1f9 end,
            })
            var_section_9583.AddSlider(var_section_9583,{
                Title = "Sway Width", Content = "Lebar goyangan kiri-kanan (khusus mode Sway)",
                Min = 0.1, Max = 1.5, Default = 0.55, Increment = 0.05,
                Callback = function(var_value_d1f9) Config.cfg_autoCrouch_bdbb = var_value_d1f9 end,
            })
            var_section_9583.AddSlider(var_section_9583,{
                Title = "Sway Speed", Content = "Kecepatan flip goyangan (khusus mode Sway)",
                Min = 1, Max = 12, Default = 6, Increment = 0.5,
                Callback = function(var_value_d1f9) Config.cfg_crouchRadiusStud_b8d0 = var_value_d1f9 end,
            })
            var_section_9583.AddKeybind(var_section_9583,{
                Title = "PC Lock Forward Key",
                Default = Enum.KeyCode.Unknown,
                Callback = function()
                    if Config.cfg_enableMoonwalkMobileGUI_29e3 then
                        State.state_moonwalkMode_6f50 = not State.state_moonwalkMode_6f50
                        if State.state_moonwalkMode_6f50 then State.state_enableMoonwalkMobileGUI_4fa3 = false end
                    end
                end
            })

            var_section_9583.AddKeybind(var_section_9583,{
                Title = "PC Lock Backward Key",
                Default = Enum.KeyCode.Unknown,
                Callback = function()
                    if Config.cfg_enableMoonwalkMobileGUI_29e3 then
                        State.state_enableMoonwalkMobileGUI_4fa3 = not State.state_enableMoonwalkMobileGUI_4fa3
                        if State.state_enableMoonwalkMobileGUI_4fa3 then State.state_moonwalkMode_6f50 = false end
                    end
                end
            })

            local var_section_7926 = SurvivorTab.AddSection(SurvivorTab,"Fast Vault Op", nil)
            var_section_7926.AddToggle(var_section_7926,{
                Title = "Always Fast Vault",
                Default = false,
                Callback = function(var_value_d1f9) Config.cfg_moonwalkMode_1943 = var_value_d1f9 end,
            })

            local var_section_4f47 = SurvivorTab.AddSection(SurvivorTab,"Flowstate (Force Perk)", nil)
            var_section_4f47.AddToggle(var_section_4f47,{
                Title = "Force Flowstate Perk",
                Default = false,
                Callback = function(var_value_d1f9)
                    Config.cfg_moonwalkMode_32f7 = var_value_d1f9
                    if not var_value_d1f9 then
                        pcall(function() LocalPlayer.SetAttribute(LocalPlayer,"Flowstate", nil) end)
                        local char = LocalPlayer.Character
                        if char then pcall(function() char.SetAttribute(char,"Flowstate", nil) end) end
                    end
                end,
            })
            var_section_4f47.AddSlider(var_section_4f47,{
                Title = "Flowstate Cooldown (s)",
                Min = 0, Max = 60, Default = (15.0), Increment = 1,
                Callback = function(var_value_d1f9) Config.cfg_swaySpeed_4309 = var_value_d1f9 end,
            })
            var_section_4f47.AddToggle(var_section_4f47,{
                Title = "Hide Flowstate UI",
                Default = false,
                Callback = function(var_value_d1f9) Config.cfg_pcLockForwardKey_89cf = var_value_d1f9 end,
            })
            local var_section_1c3c = SurvivorTab.AddSection(SurvivorTab,"Fake Perks", nil)
            var_section_1c3c.AddSlider(var_section_1c3c,{
                Title = "Perk Cooldown", Content = "Cooldown semua Fake Perks (detik)",
                Min = 0, Max = (60.0), Default = 10, Increment = 1,
                Callback = function(var_value_d1f9) State.fpCooldown = var_value_d1f9 end,
            })
            var_section_1c3c.AddToggle(var_section_1c3c,{
                Title = "Quick Recovery", Content = "Mendapat +40% speed 3 detik setelah Fast/Medium Vault di Window",
                Default = false,
                Callback = function(var_value_d1f9)
                    FP_SetPerk("QuickRecovery", var_value_d1f9)
                end,
            })
            var_section_1c3c.AddToggle(var_section_1c3c,{
                Title = "Perfect Landing", Content = "+40% speed 3 detik setelah jatuh dari ketinggian",
                Default = false,
                Callback = function(var_value_d1f9)
                    FP_SetPerk("PerfectLanding", var_value_d1f9)
                end,
            })
            var_section_1c3c.AddToggle(var_section_1c3c,{
                Title = "Adrenaline Rush", Content = "+4 speed 5 detik saat HP drop ke 50",
                Default = false,
                Callback = function(var_value_d1f9)
                    FP_SetPerk("AdrenalineRush", var_value_d1f9)
                end,
            })
            local var_section_6bd1 = SurvivorTab.AddSection(SurvivorTab,"Escape Gate", nil)
            var_section_6bd1.AddButton(var_section_6bd1,{
                Title = "Auto Escape (Teleport)",
                Callback = function() fn_ServerHelper_97a6() end
            })
            var_section_6bd1.AddToggle(var_section_6bd1,{
                Title = "Ghost Gate (Legit Mode)", Default = false,
                Callback = function(var_value_d1f9)
                    State.state_flowstateCooldownS_9e95 = var_value_d1f9
                    fn_ServerHandler_b0c3()
                end
            })
            local var_section_ed53 = SurvivorTab.AddSection(SurvivorTab,"Lock FOV", nil)
            var_section_ed53.AddToggle(var_section_ed53,{
                Title = "Lock FOV", Default = Config.cfg_showName_9982,
                Callback = function(var_value_d1f9)
                    Config.cfg_showName_9982 = var_value_d1f9
                    if var_value_d1f9 then fn_CameraZoomHelper_18c6(Config.cfg_showName_8138) else fn_CameraZoomHandler_5aab() end
                end,
            })
            var_section_ed53.AddSlider(var_section_ed53,{
                Title = "FOV Value", Min = 30, Max = 120, Default = Config.cfg_showName_8138, Increment = 1,
                Callback = function(var_value_d1f9)
                    Config.cfg_showName_8138 = var_value_d1f9
                    if Config.cfg_showName_9982 then fn_CameraZoomHelper_18c6(var_value_d1f9) end
                end,
            })
        end

        do


    -- ============================================================
    -- KILLER ESP â€” DETEKSI KILLER
    -- ============================================================
        local var_section_2a91 = VisualTab.AddSection(VisualTab,"Killer ESP", nil)
            local var_section_9f9a = var_section_2a91.AddHStack(var_section_2a91)
            var_section_9f9a.AddToggle(var_section_9f9a,{
                Title = "Show Name", Default = Config.cfg_showName_58b7,
                Callback = function(var_value_d1f9) Config.cfg_showName_58b7 = var_value_d1f9
                fn_GetHandler_d1b6() end,
            })
            var_section_9f9a.AddToggle(var_section_9f9a,{
                Title = "Show Outline", Default = Config.cfg_showName_435d,
                Callback = function(var_value_d1f9) Config.cfg_showName_435d = var_value_d1f9
                fn_GetHandler_d1b6() end,
            })
        do local var_callback_22a4=1825%18 end
            var_section_2a91.AddColorPicker(var_section_2a91,{
                Title = "Killer Color", Default = Config.cfg_showName_957b,
                Callback = function(color) Config.cfg_showName_957b = color
                fn_GetHandler_d1b6() end,
            })

    -- ============================================================
    -- SURVIVOR ESP â€” DETEKSI SURVIVOR
    -- ============================================================
        local var_section_aa54 = VisualTab.AddSection(VisualTab,"Survivor ESP", nil)
            local var_section_7e05 = var_section_aa54.AddHStack(var_section_aa54)
            var_section_7e05.AddToggle(var_section_7e05,{
                Title = "Show Name", Default = Config.cfg_showName_4ad0,
                Callback = function(var_value_d1f9) Config.cfg_showName_4ad0 = var_value_d1f9
                fn_GetHandler_d1b6() end,
            })
            var_section_7e05.AddToggle(var_section_7e05,{
                Title = "Show Outline", Default = Config.cfg_showName_4d79,
                Callback = function(var_value_d1f9) Config.cfg_showName_4d79 = var_value_d1f9
                fn_GetHandler_d1b6() end,
            })
            var_section_aa54.AddColorPicker(var_section_aa54,{
                Title = "Survivor Color", Default = Config.cfg_showName_a907,
                Callback = function(color) Config.cfg_showName_a907 = color
                fn_GetHandler_d1b6() end,
            })

    -- ============================================================
    -- ZOMBIE / SCP ESP â€” DETEKSI NPC
    -- ============================================================
        local var_section_c4cc = VisualTab.AddSection(VisualTab,"Zombie / SCP ESP", nil)
            var_section_c4cc.AddToggle(var_section_c4cc,{
                Title = "Enable SCP ESP",
                Default = Config.cfg_showName_ff90,
                Callback = function(var_value_d1f9)
                    Config.cfg_showName_ff90 = var_value_d1f9
                    if not var_value_d1f9 then
                        for var_child_415e, _ in pairs(State.scpEspObjects) do fn_ZombieESPHandler_ff04(var_child_415e) end
                    end
                end,
            })
            local var_row_4798 = var_section_c4cc.AddHStack(var_section_c4cc)
            var_row_4798.AddToggle(var_row_4798,{
                Title = "Show Name", Default = Config.cfg_showName_75a4,
                Callback = function(var_value_d1f9)
                    Config.cfg_showName_75a4 = var_value_d1f9
                    RefreshScpEsp()
                end,
            })
            var_section_c4cc.AddColorPicker(var_section_c4cc,{
                Title = "SCP Color", Default = Config.cfg_showName_673f,
                Callback = function(color)
                    Config.cfg_showName_673f = color
                    for _, var_highlight_df32 in pairs(State.scpEspObjects) do
                        if var_highlight_df32.highlight then
                            var_highlight_df32.highlight.FillColor = color
                            var_highlight_df32.highlight.OutlineColor = color
                        end
                    end
                end,
            })
            var_section_c4cc.AddSlider(var_section_c4cc,{
                Title = "SCP ESP Distance", Min = 25, Max = 600, Default = Config.cfg_showOutline_7bb8, Live = true,
                Callback = function(var_value_d1f9)
                    Config.cfg_showOutline_7bb8 = var_value_d1f9
                    RefreshScpEsp()
                end,
            })
            local var_section_ae5d = VisualTab.AddSection(VisualTab,"Player ESP Settings", nil)
            var_section_ae5d.AddToggle(var_section_ae5d,{
                Title = "Outline Only",
                Content = "Tampilkan outline saja tanpa fill (berlaku untuk Killer & Survivor)",
                Default = Config.cfg_enableSCPESP_f2ce,
                Callback = function(var_value_d1f9)
                    Config.cfg_enableSCPESP_f2ce = var_value_d1f9
                    Config.cfg_enableSCPESP_dd03 = var_value_d1f9
                    fn_GetHandler_d1b6()
                end,
            })
            var_section_ae5d.AddButton(var_section_ae5d,{
                Title = "Refresh All ESP",
                Callback = function()
                    ForceRefreshAllESP()
                end,
            })
            var_section_ae5d.AddSlider(var_section_ae5d,{
                Title = "Killer ESP Distance", Min = 25, Max = 600, Default = Config.cfg_showName_99cf, Live = true,
                Callback = function(var_value_d1f9) Config.cfg_showName_99cf = var_value_d1f9
                fn_GetHandler_d1b6() end,
            })
            var_section_ae5d.AddSlider(var_section_ae5d,{
                Title = "Survivor ESP Distance", Min = 25, Max = (600.0), Default = Config.cfg_showName_addf, Live = true,
                Callback = function(var_value_d1f9) Config.cfg_showName_addf = var_value_d1f9
                fn_GetHandler_d1b6() end,
            })
            local var_section_8b26 = VisualTab.AddSection(VisualTab,"Show Item Survivor", nil)
            var_section_8b26.AddToggle(var_section_8b26,{
                Title = "Show Equipped Item",
                Default = false,
                Callback = function(var_value_d1f9)
                    Config.cfg_scpESPDistance_66fd = var_value_d1f9
                end,
            })
            local var_section_315b = VisualTab.AddSection(VisualTab,"Object ESP", nil)
            local var_section_6c3f = var_section_315b.AddHStack(var_section_315b)
            var_section_6c3f.AddToggle(var_section_6c3f,{
                Title = "ESP Generator", Default = Config.cfg_showGeneratorInfo_9e74,
                Callback = function(var_value_d1f9) Config.cfg_showGeneratorInfo_9e74 = var_value_d1f9
                fn_GeneratorHelper_f945() end,
            })
            var_section_6c3f.AddToggle(var_section_6c3f,{
                Title = "Progress Gen", Default = Config.cfg_outlineOnly_2e99,
                Callback = function(var_value_d1f9)
                    Config.cfg_outlineOnly_2e99 = var_value_d1f9
                    for _, var_instance_5397 in ipairs(State.state_espHook_4896.Generators) do
                        if var_instance_5397 and var_instance_5397.Parent then
                            var_instance_5397.SetAttribute(var_instance_5397,"__BolongGenLastPct__", nil)
                            if not var_value_d1f9 then
                                local var_rootPart_b34c = var_instance_5397.FindFirstChild(var_instance_5397,"__BolongGenProgress__")
                                if var_rootPart_b34c then var_rootPart_b34c.Destroy(var_rootPart_b34c) end
                            end
                        end
                    end
                    fn_GeneratorHelper_f945()
                end,
            })

            var_section_315b.AddToggle(var_section_315b,{
                Title = "Show Generator Info", Default = Config.cfg_survivorESPDistance_e369,
                Content = "Player & Break",
                Callback = function(var_value_d1f9)
                    Config.cfg_survivorESPDistance_e369 = var_value_d1f9
                    for _, var_instance_5397 in ipairs(State.state_espHook_4896.Generators) do
                        if var_instance_5397 and var_instance_5397.Parent then
                            var_instance_5397.SetAttribute(var_instance_5397,"__BolongGenLastPct__", nil)
                        end
                    end
                end,
            })
            local var_row_ebf5 = var_section_315b.AddHStack(var_section_315b)
            var_row_ebf5.AddToggle(var_row_ebf5,{
                Title = "ESP Window", Default = Config.cfg_showEquippedItem_e752,
                Callback = function(var_value_d1f9)
                    Config.cfg_showEquippedItem_e752 = var_value_d1f9
                    fn_GeneratorHelper_f945()
                end,
            })
            var_row_ebf5.AddToggle(var_row_ebf5,{
                Title = "ESP Pallet", Default = Config.cfg_espGenerator_21a5,
                Callback = function(var_value_d1f9) Config.cfg_espGenerator_21a5 = var_value_d1f9
                fn_GeneratorHelper_f945() end,
            })
            local var_row_2e13 = var_section_315b.AddHStack(var_section_315b)
            var_row_2e13.AddToggle(var_row_2e13,{
                Title = "ESP Hook", Default = Config.cfg_progressGen_4bd4,
                Callback = function(var_value_d1f9) Config.cfg_progressGen_4bd4 = var_value_d1f9
                fn_GeneratorHelper_f945() end,
            })
            var_row_2e13.AddToggle(var_row_2e13,{
                Title = "ESP Gate", Default = Config.cfg_showGeneratorInfo_4daa,
                Callback = function(var_value_d1f9) Config.cfg_showGeneratorInfo_4daa = var_value_d1f9
                fn_GeneratorHelper_f945() end,
            })

            local var_row_ccc5 = var_section_315b.AddHStack(var_section_315b)
            var_row_ccc5.AddColorPicker(var_row_ccc5,{
                Title = "Generator Color", Default = Config.cfg_showGeneratorInfo_8492,
                Callback = function(color)
                    Config.cfg_showGeneratorInfo_8492 = color
                    if Config.cfg_showGeneratorInfo_9e74 then
                        for _, var_instance_5397 in ipairs(State.state_espHook_4896.Generators) do
                            if var_instance_5397 and var_instance_5397.Parent then
                                local var_highlight_980e = var_instance_5397.FindFirstChild(var_instance_5397,"__BolongHL__")
                                if var_highlight_980e then var_highlight_980e.FillColor = color
                                var_highlight_980e.OutlineColor = color end
                            end
                        end
                    end
                end,
            })
            var_row_ccc5.AddColorPicker(var_row_ccc5,{
                Title = "Window Color", Default = Config.cfg_espWindow_51ce,
                Callback = function(color)
                    Config.cfg_espWindow_51ce = color
                    for part, var_color_5039 in pairs(State.state_espWindow_920d) do
                        if var_color_5039 and var_color_5039.Parent then
                            pcall(function()
                                var_color_5039.Color3 = color
                            end)
                        end
                    end
                end,
            })
            local var_row_9dfc = var_section_315b.AddHStack(var_section_315b)
            var_row_9dfc.AddColorPicker(var_row_9dfc,{
                Title = "Pallet Color", Default = Config.cfg_espHook_ce98,
                Callback = function(color)
                    Config.cfg_espHook_ce98 = color
                    for _, var_connection_5b02 in ipairs(State.state_espHook_4896.Pallets) do
                        if var_connection_5b02 then
                            local var_highlight_980e = var_connection_5b02.FindFirstChild(var_connection_5b02,"__BolongHL__")
                            if var_highlight_980e then var_highlight_980e.FillColor = color
                            var_highlight_980e.OutlineColor = color end
                        end
                    end
                end,
            })
            var_row_9dfc.AddColorPicker(var_row_9dfc,{
                Title = "Hook Color", Default = Config.cfg_generatorColor_f209,
                Callback = function(color)
                    Config.cfg_generatorColor_f209 = color
                    for _, var_callback_f4cc in ipairs(State.state_espHook_4896.Hooks) do
                        if var_callback_f4cc and var_callback_f4cc.Parent then
                            local var_child_33e9 = State.state_windowColor_5aaf[var_callback_f4cc]
                            if var_child_33e9 then
                                for _, var_player_2e5f in ipairs(var_child_33e9) do
                                    local var_highlight_980e = var_player_2e5f.FindFirstChild(var_player_2e5f,"__BolongHL__")
                                    if var_highlight_980e then var_highlight_980e.FillColor = color
                                    var_highlight_980e.OutlineColor = color end
                                end
                            end
                        end
                    end
                end,
            })
            local var_row_8a49 = var_section_315b.AddHStack(var_section_315b)
            var_row_8a49.AddColorPicker(var_row_8a49,{
                Title = "Gate Color", Default = Config.cfg_palletColor_6b93,
                Callback = function(color)
                    Config.cfg_palletColor_6b93 = color
                    for _, var_child_897f in ipairs(State.state_espHook_4896.Gates) do
                        if var_child_897f and var_child_897f.Parent then
                            local var_highlight_980e = var_child_897f.FindFirstChild(var_child_897f,"__BolongHL__")
                            if var_highlight_980e then var_highlight_980e.FillColor = color
                            var_highlight_980e.OutlineColor = color end
                        end
                    end
                end,
            })
            local var_section_4c7d = VisualTab.AddSection(VisualTab,"Prediction Map&Killer", nil)
            var_section_4c7d.AddToggle(var_section_4c7d,{
                Title = "Show Prediction Monitor",
                Default = false,
                Callback = function(var_value_d1f9)
                    if var_value_d1f9 then StartPrediction() else StopPrediction() end
                end,
            })
            local var_section_b019 = VisualTab.AddSection(VisualTab,"World Settings", nil)
            var_section_b019.AddToggle(var_section_b019,{
                Title = "Fullbright", Default = false,
                Callback = function(var_value_d1f9)
                    State.state_hookColor_83ac = var_value_d1f9
                    if var_value_d1f9 then fn_RemoveHandler_b854() else restoreLighting() end
                end,
            })
            var_section_b019.AddToggle(var_section_b019,{
                Title = "Remove Visual Effects", Content = "BoostFps", Default = false,
                Callback = function(var_value_d1f9)
                    State.state_gateColor_965a = var_value_d1f9
                    if var_value_d1f9 then removeVisualEffects() else restoreVisualEffects() end
                end,
            })
        end

        do

            local var_section_6e84 = MiscTab.AddSection(MiscTab,"Potato Graphics By Ruv", nil)
            var_section_6e84.AddParagraph(var_section_6e84,{
                Title = "Potato Graphics",
                Content = "by ruvlegacys.",
            })
            var_section_6e84.AddButton(var_section_6e84,{
                Title = "Apply Potato Graphics",
                Callback = function()
                    if State.state_gateColor_339a then
                        Notify("Potato Graphics", "Sudah aktif", 1.5)
                        return
                    end
                    Config.cfg_gateColor_fa96 = true
                    fn_GetHelper_e9d6()
                    Notify("Potato Graphics", "Potato mode diterapkan", 2)
                end,
            })
            local var_section_44cc = MiscTab.AddSection(MiscTab,"Anti AFK", nil)
            var_section_44cc.AddToggle(var_section_44cc,{
                Title = "Enable Anti AFK",
                Default = false,
                Callback = function(var_value_d1f9)
                    fn_ServerHandler_163d(var_value_d1f9)
                end,
            })
            local var_section_1c16 = MiscTab.AddSection(MiscTab,"Killer Warn", nil)
            var_section_1c16.AddToggle(var_section_1c16,{
                Title = "Enable Killer Warn",
                Content = "The ! sign above your head when the killer is around you",
                Default = Config.cfg_fullbright_2910,
                Callback = function(var_value_d1f9) Config.cfg_fullbright_2910 = var_value_d1f9 end,
            })
            local var_section_5aec = MiscTab.AddSection(MiscTab,"Stun Timer", nil)
            var_section_5aec.AddToggle(var_section_5aec,{
                Title = "Enable Stun Timer",
                Content = "Show Stun x.xs countdown above stunned Killer head",
                Default = false,
                Callback = function(var_value_d1f9)
                    if var_value_d1f9 then fn_StunTimerHandler_8693() else StopStunTimer() end
                end,
            })
            var_section_5aec.AddSlider(var_section_5aec,{
                Title = "Max Distance",
                Min = 50, Max = 500, Default = 250, Increment = 10,
                Callback = function(var_value_d1f9)
                    State.state_potatoGraphics_4818 = var_value_d1f9
                    for _, var_backgroundTransparency_2a69 in pairs(State.stunTimerBoards) do
                        pcall(function() var_backgroundTransparency_2a69.MaxDistance = var_value_d1f9 end)
                    end
                end,
            })

            local var_section_544a = MiscTab.AddSection(MiscTab,"Performance Monitor", nil)
            var_section_544a.AddToggle(var_section_544a,{
                Title = "Show Performance Window", Default = false,
                Callback = function(var_value_d1f9) if var_value_d1f9 then fn_PredictionHandler_5b46() else StopPerfMonitor() end end,
            })
            local var_section_9cc5 = MiscTab.AddSection(MiscTab,"Spectator Count", nil)
            var_section_9cc5.AddToggle(var_section_9cc5,{
                Title = "Show Spectator Counter", Default = false,
                Callback = function(var_value_d1f9) if var_value_d1f9 then fn_CrosshairHelper_810c() else StopSpectatorCount() end end,
            })
            local var_section_38d0 = MiscTab.AddSection(MiscTab,"Camera Zoom", nil)
            var_section_38d0.AddToggle(var_section_38d0,{
                Title = "Max Camera Zoom", Default = Config.cfg_enableKillerWarn_fa0d,
                Callback = function(var_value_d1f9)
                    Config.cfg_enableKillerWarn_fa0d = var_value_d1f9
                    if var_value_d1f9 then fn_CameraZoomHandler_47e1(Config.cameraZoomValue) else fn_CameraZoomHelper_fda4() end
                end,
            })
            local var_section_10ac = MiscTab.AddSection(MiscTab,"Camera Stiffness", nil)
            var_section_10ac.AddToggle(var_section_10ac,{
                Title = "Smooth Camera", Default = Config.cfg_showPerformanceWindow_3f44,
                Content = (function() if var_section_a5d6 and buffer then local _bf=buffer.create(43) local _by={68,66,68,32,84,114,101,110,100,32,67,97,109,101,114,97,32,40,72,97,110,121,97,32,87,111,114,107,32,68,105,100,97,108,97,109,32,77,97,116,99,104,46} for _i=1,#_by do buffer.writeu8(_bf,_i-1,_by[_i]) end local _s={} for _i=1,#_by do _s[_i]=string.char(buffer.readu8(_bf,_i-1)) end return table.concat(_s) else local _by={68,66,68,32,84,114,101,110,100,32,67,97,109,101,114,97,32,40,72,97,110,121,97,32,87,111,114,107,32,68,105,100,97,108,97,109,32,77,97,116,99,104,46} local _s={} for _i=1,#_by do _s[_i]=string.char(_by[_i]) end return table.concat(_s) end end)(),
                Callback = function(var_value_d1f9)
                    Config.cfg_showPerformanceWindow_3f44 = var_value_d1f9
                    if var_value_d1f9 then
                        if not fn_CameraZoomHelper_8538(Config.cfg_showSpectatorCounter_d192) then
                        end
                    else
                        fn_CameraZoomHandler_732a()
                    end
                end,
            })
            var_section_10ac.AddSlider(var_section_10ac,{
                Title = "Stiffness", Content = "Lebih kecil = lebih smooth",
                Min = 1, Max = (10.0), Default = 5, Increment = 0.1,
                Callback = function(var_value_d1f9)
                    Config.cfg_showSpectatorCounter_d192 = var_value_d1f9
                end,
            })
            local var_section_e4a0 = MiscTab.AddSection(MiscTab,"Aspect Ratio", nil)
            var_section_e4a0.AddToggle(var_section_e4a0,{
                Title = "Stretched Res", Default = Config.cfg_maxCameraZoom_a6e2,
                Callback = function(var_value_d1f9)
                    Config.cfg_maxCameraZoom_a6e2 = var_value_d1f9
                    if var_value_d1f9 then fn_PredictionHandler_91ee() else fn_GetHandler_4e74() end
                end,
            })
            local var_success_87b7
            var_section_e4a0.AddDropdown(var_section_e4a0,{
                Title = "Preset", Options = { "Normal 16:9", "4:3 Stretched", "16:10", "21:9 Ultrawide" }, Default = "Normal 16:9",
                Callback = function(var_value_d1f9)
                    local var_descendant_b2cb = { ["Normal 16:9"] = 16 / 9, ["4:3 Stretched"] = (4.0) / (3.0), ["16:10"] = 16 / 10, ["21:9 Ultrawide"] = (21.0) / (9.0) }
                    local var_remoteEvent_19f1 = var_descendant_b2cb[var_value_d1f9] or 1.777777777778
                    Config.cfg_stiffness_28c2 = var_remoteEvent_19f1
                    if var_success_87b7 then pcall(function() var_success_87b7.Set(var_success_87b7,var_remoteEvent_19f1) end) end
                end,
            })
            var_success_87b7 = var_section_e4a0.AddSlider(var_section_e4a0,{
                Title = "Custom Ratio",
                Min = 0.8, Max = 2.5, Default = (16.0) / 9, Increment = 0.01,
                Callback = function(var_value_d1f9)
                    Config.cfg_stiffness_28c2 = var_value_d1f9
                end,
            })
            local var_section_2b9c = MiscTab.AddSection(MiscTab,"Force Cursor (PC Only)", nil)
            local var_section_b4e4 = var_section_2b9c.AddToggle(var_section_2b9c,{
                Title = "Force Mouse Cursor",
                Content = "Forces the mouse cursor to always appear on the screen.",
                Default = false,
                Callback = function(var_value_d1f9)
                    Config.cfg_stretchedRes_63a4 = var_value_d1f9
                    if var_value_d1f9 then
                        fn_PredictionHandler_333b()
                        Notify("Force Cursor", "Mouse cursor forced to appear!", 2)
                    else
                        fn_PredictionHandler_dee4()
                    end
                end,
            })
            var_section_2b9c.AddKeybind(var_section_2b9c,{
                Title = "Toggle Keybind",
                Default = Enum.KeyCode.Y,
                Callback = function()
                    local var_section_2cdc = not Config.cfg_stretchedRes_63a4
                    var_section_b4e4.Set(var_section_b4e4,var_section_2cdc)
                end
            })
            local var_section_305e = MiscTab.AddSection(MiscTab,"Protect Name", nil)
            var_section_305e.AddToggle(var_section_305e,{
                Title = "Enable Protect Name", Default = false,
                Callback = function(var_value_d1f9) if var_value_d1f9 then fn_GetHandler_6d1d() else StopProtectName() end end,
            })
            local var_section_aed0 = MiscTab.AddSection(MiscTab,"Skip Cutscene", nil)
            local var_section_b0b7 = false
            local var_section_5a59, skipEndDarknessToggle

            var_section_5a59 = var_section_aed0.AddToggle(var_section_aed0,{
                Title = "Skip End Screen",
                Default = false,
                Callback = function(var_value_d1f9)
                    if var_section_b0b7 then return end
                    Config.cfg_toggleKeybind_3cc7 = var_value_d1f9
                    if var_value_d1f9 then

                        var_section_b0b7 = true
                        Config.cfg_toggleKeybind_cb2f = false
                        if skipEndDarknessToggle then skipEndDarknessToggle.Set(skipEndDarknessToggle,false) end
                        var_section_b0b7 = false
                        fn_CreateHandler_cba1()
                        fn_CutsceneHandler_ddf3(false)
                    else
                        fn_CreateHandler_cba1()
                    end
                end,
            })

            skipEndDarknessToggle = var_section_aed0.AddToggle(var_section_aed0,{
                Title = "Skip Loading & End Screen",
                Default = false,
                Callback = function(var_value_d1f9)
                    if var_section_b0b7 then return end
                    Config.cfg_toggleKeybind_cb2f = var_value_d1f9
                    if var_value_d1f9 then
                        var_section_b0b7 = true
                        Config.cfg_toggleKeybind_3cc7 = false
                        if var_section_5a59 then var_section_5a59.Set(var_section_5a59,false) end
                        var_section_b0b7 = false
                        fn_CreateHandler_cba1()
                        fn_CutsceneHandler_ddf3(true)
                    else
                        fn_CreateHandler_cba1()
                    end
                end,
            })


            local var_section_3f83 = MiscTab.AddSection(MiscTab,"Avatar Copy (Visual)", nil)
            var_section_3f83.AddPresetManager(var_section_3f83,{
                Title = "Profile Avatar By Username / ID",
                Placeholder = "Jandel / 1234...",
                Default = "",
                Presets = {
                    ["Boy1"] = "kiicaine",
                    ["Boy2"] = "444jamesss",
                    ["Boy3"] = "KiLouo14",
                    ["Girl1"] = "9kinb",
                    ["Girl2"] = "winterilous",
                    ["Girl3"] = "ellea_893"
                },
                Callback = function(text)
                    currentAvatarInput = text
                end
            })
            var_section_3f83.AddButton(var_section_3f83,{
                Title = "Copy Avatar",
                Callback = function()
                    if currentAvatarInput and currentAvatarInput ~= "" then
                        fn_CreateHelper_9092(currentAvatarInput)
                    else
                        Notify("BolongHub", "Masukkan Username/ID terlebih dahulu!", 2)
                    end
                end
            })

            local var_section_be93 = MiscTab.AddSection(MiscTab,"Jerk Off (Fun)", nil)
            var_section_be93.AddToggle(var_section_be93,{
                Title = "Enable Jerk Off",
                Default = false,
                Callback = function(var_value_d1f9)
                    if var_value_d1f9 then
                        fn_NoclipHelper_a1f8()
                    else
                        StopJerk()
                    end
                end
            })
            local var_section_296a = MiscTab.AddSection(MiscTab,"Noclip & Fly", nil)
            var_section_296a.AddToggle(var_section_296a,{
                Title = "Enable Noclip",
                Default = false,
                Callback = function(var_value_d1f9)
                    if var_value_d1f9 then
                        fn_HitboxHandler_6d2c()
                    else
                        StopNoclip()
                    end
                end
            })
            var_section_296a.AddToggle(var_section_296a,{
                Title = "Fly GUI (V3)",
                Default = false,
                Callback = function(var_value_d1f9)
                    if var_value_d1f9 then
                        fn_HitboxHandler_b031()
                    else
                        StopFlyGui()
                    end
                end
            })
            local var_section_f709 = MiscTab.AddSection(MiscTab,"Hop Server / Respawn", nil)
            var_section_f709.AddParagraph(var_section_f709,{
                Title = "Info",
                Content = "Hop: pindah ke server random.\nRejoin: masuk ulang ke server ini.\nRespawn: mati dan hidup kembali.",
            })
            var_section_f709.AddButton(var_section_f709,{
                Title = "Hop Server",
                Callback = function()
                    local var_success_abb9 = pcall(function()
                        game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer)
                    end)
                    Notify("Server", var_success_abb9 and "Teleporting ke server lain..." or "Gagal hop server", 2)
                end,
            })
            var_section_f709.AddButton(var_section_f709,{
                Title = "Rejoin Server",
                Callback = function()
                    local var_success_abb9 = pcall(function()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
                    end)
                    Notify("Server", var_success_abb9 and "Rejoin server..." or "Gagal rejoin server", 2)
                end,
            })
            var_section_f709.AddButton(var_section_f709,{
                Title = "Respawn",
                Callback = function()
                    local var_child_d65d = false
                    pcall(function()
                        local var_remoteEvent_6e78 = {
                            Respawn = true, RequestRespawn = true, Spawn = true,
                            SpawnCharacter = true, RespawnCharacter = true,
                        }
                        local function fn_ServerHelper_1194(var_instance_5397)
                            if var_child_d65d then return end
                            if var_remoteEvent_6e78[var_instance_5397.Name]
                                and (var_instance_5397.IsA(var_instance_5397,"RemoteEvent") or var_instance_5397.IsA(var_instance_5397,"RemoteFunction")) then
                                pcall(function()
                                    if var_instance_5397.IsA(var_instance_5397,"RemoteEvent") then
                                        var_instance_5397.FireServer(var_instance_5397)
                                    else
                                        var_instance_5397.InvokeServer(var_instance_5397)
                                    end
                                end)
                                var_child_d65d = true
                            end
                        end
                        for _, var_child_2af6 in ipairs({ game:GetService("ReplicatedStorage"), workspace }) do
                            if var_child_d65d then break end
                            for _, var_instance_5397 in ipairs(var_child_2af6.GetChildren(var_child_2af6)) do
                                fn_ServerHelper_1194(var_instance_5397)
                                if var_child_d65d then break end
                            end
                        end
                    end)
                    pcall(function()
                        local char = LocalPlayer.Character
                        local var_humanoid_3937 = char and char.FindFirstChildOfClass(char,"Humanoid")
                        if var_humanoid_3937 then var_humanoid_3937.Health = 0 end
                    end)
                    task.spawn(function()
                        local var_humanoid_db43 = os.clock()
                        while os.clock() - var_humanoid_db43 < 6 do
                            local char = LocalPlayer.Character
                            local var_humanoid_3937 = char and char.FindFirstChildOfClass(char,"Humanoid")
                            if var_humanoid_3937 and var_humanoid_3937.Health > 0 then
                                Notify("Server", "Respawn berhasil", 2)
                                return
                            end
                            task.wait(0.5)
                        end
                        Notify("Server", "Karakter mati - game menolak respawn paksa, tunggu round berikutnya", 3)
                    end)
                end,
            })
        end

        do

            local var_section_870f = ConfigTab.AddSection(ConfigTab,"Configuration", true)
            var_section_870f.AddConfig(var_section_870f)
        end
        end

        fn_CameraVeilHandler_f416()

        print("BOLONGHUB LOADED!")
    end

-- Titik masuk asli setelah wrapper dibuka.
BolongHub()
