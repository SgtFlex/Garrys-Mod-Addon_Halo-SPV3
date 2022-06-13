return {
    name = "[VJ] Halo SPV3", --ONLY APPLIES TO ROOT NODE. If provided, the root node will be named this. Otherwise it will use the filename
    --icon = "icon16/bomb.png", --The icon for the root node
    subtree = {
        ["Settings"] = { --An example with all possible table values filled so you know what you can work with
            subtree = {
                ["Damage/Health"] = {
                    controls = {
                        ["Health Modifier"] = {
                            convar = "vj_spv3_HealthModifier", --The name of the convar you wish to use. Make sure it's unique!
                            default = 1, --The default value used when the convars(Console variables) are created
                            desc = "Multiplies the Health of SPV3 units by x.", --Tooltip displayed on hover
                            panel = {type = "DNumberWang", decimals = 2},
                        },
                        ["Shield Modifier"] = {
                            convar = "vj_spv3_ShieldModifier", --The name of the convar you wish to use. Make sure it's unique!
                            default = 1, --The default value used when the convars(Console variables) are created
                            desc = "Multiplies the Shields of SPV3 units by x.", --Tooltip displayed on hover
                            panel = {type = "DNumberWang", decimals = 2},
                        },
                        ["Damage Modifier"] = {
                            convar = "vj_spv3_DamageModifier", --The name of the convar you wish to use. Make sure it's unique!
                            default = 0.5, --The default value used when the convars(Console variables) are created
                            desc = "Multiplies the Damage of SPV3 units by x.", --Tooltip displayed on hover
                            panel = {type = "DNumberWang", decimals = 2},
                        },
                        ["Infection Form Count Modifier"] = {
                            convar = "vj_spv3_infModifier", --The name of the convar you wish to use. Make sure it's unique!
                            default = 1, --The default value used when the convars(Console variables) are created
                            desc = "Multiplies the Amount of Infection Forms spawned by x.", --Tooltip displayed on hover
                            panel = {type = "DNumberWang"},
                            tags = {"flood"}
                        },
                        ["Precision Damage Threshold"] = {
                            convar = "vj_spv3_PrecisionThreshold", --The name of the convar you wish to use. Make sure it's unique!
                            default = 15.1, --The default value used when the convars(Console variables) are created
                            desc = "Weapons must deal x damage per shot in order to be considered a precision shot (for headshot instant kills and other things).", --Tooltip displayed on hover
                            panel = {type = "DNumberWang", decimals = 2},
                        },
                        ["NPC Vulnerability"] = {
                            convar = "vj_spv3_NPCTakeDamageModifier", --The name of the convar you wish to use. Make sure it's unique!
                            default = 2, --The default value used when the convars(Console variables) are created
                            desc = "SPV3 units will take x times more damage from NPCs.", --Tooltip displayed on hover
                            panel = {type = "DNumberWang", decimals = 2},
                        },
                    }
                },
                ["Miscellaneous"] = { --An example with all possible table values filled so you know what you can work with
                    controls = {
                        ["UNSC FF Retaliation"] = {
                            convar = "vj_spv3_retal",
                            default = 1,
                            desc = "UNSC units will retaliate after taking repeated damage from a player",
                            panel = {type = "DCheckBox"}
                        },
                        ["%Chance Covenant spawn with UNSC weapon"] = {
                            convar = "vj_spv3_CovenantExtraWeaponChance",
                            default = 15,
                            desc = "%Chance that certain Covenant units will spawn with UNSC weapons.",
                            panel = {type = "DNumSlider"}
                        },
                        ["%Chance UNSC spawn with Covenant weapon"] = {
                            convar = "vj_spv3_UNSCExtraWeaponChance",
                            default = 15,
                            desc = "%Chance that certain UNSC units will spawn with Covenant weapons.",
                            panel = {type = "DNumSlider"}
                        },
                        ["%Chance Flood spawn with weapon"] = {
                            convar = "vj_spv3_FloodExtraWeaponChance",
                            default = 25,
                            desc = "%Chance that certain Flood units will spawn with weapons.",
                            panel = {type = "DNumSlider"}
                        },
                        ["%Chance Elite Flood spawn with Shields"] = {
                            convar = "vj_spv3_floodEliteShield",
                            default = 50,
                            desc = "%Chance that certain Flood units will spawn with Shields.",
                            panel = {type = "DNumSlider"}
                        },
                        ["Infection Forms explode"] = {
                            convar = "vj_spv3_infFormsExplode",
                            default = 1,
                            desc = "Whether or not Infection Forms explode on death (thus causing chain kills).",
                            panel = {type = "DCheckBox"}
                        },
                        ["SPV3 NPCs drop grenades"] = {
                            convar = "vj_spv3_dropGrenades",
                            default = 1,
                            desc = "Whether or not NPCs drop grenades on death.",
                            panel = {type = "DCheckBox"}
                        },
                        ["Transformable by Flood"] = {
                            convar = "vj_spv3_floodOption",
                            default = "anything",
                            desc = "What NPCs can be transformed by the Flood.",
                            panel = {type = "DComboBox", options = {
                                ["anything"] = "Anything can be transformed by the Flood.",
                                ["onlyHalo"] = "Only Halo-related NPCs can be transformed by the Flood.",
                                ["nothing"] = "Nothing can be transformed by the Flood.",
                            }},
                        },
                    }
                },
            }
        },
    }
}
--convar REQUIRED per control (except DButton)
--default REQUIRED per control (except DButton)
--everything else is optional. Values will be autocompleted (like type will be autofilled to DNumberWang) or left out (like desc) if blank.
--DButton can execute code when clicked. Look at example above