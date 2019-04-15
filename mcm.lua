local config = require("weaponSheathing.config")

local function saveConfig()
    mwse.saveConfig("weaponSheathing", config)
    mwse.log(json.encode(config, {indent=true}))
end

return {
    name = "Weapon Sheathing",
    pages = {
        {
            label = "Preferences",
            class = "SideBarPage",
            components = {
                {
                    label = "Show unreadied weapons",
                    class = "OnOffButton",
                    description = "Show unreadied weapons\n\nThis option controls whether or not equipped weapons will be visible while unreadied. Objects blocked by exclusion lists do not respect this setting and will always have their visibility disabled.\n\nDefault: On",
                    variable = {
                        class = "TableVariable",
                        id = "showWeapon",
                        table = config,
                    },
                },
                {
                    label = "Show unreadied shields on back",
                    class = "OnOffButton",
                    description = "Show unreadied shields on back\n\nThis option controls whether or not equipped shields will be visible on the character's back while unreadied. Objects blocked by exclusion lists do not respect this setting and will always have their visibility disabled.\n\nDefault: Off",
                    variable = {
                        class = "TableVariable",
                        id = "showShield",
                        table = config,
                    },
                },
                {
                    label = "Show custom scabbards and quivers",
                    class = "OnOffButton",
                    description = "Show custom scabbards and quivers\n\nThis option controls whether or not custom art assets will be used in conjunction with the other mod features. Objects blocked by exclusion lists do not respect this setting and will always have their visibility disabled.\n\nDefault: On",
                    variable = {
                        class = "TableVariable",
                        id = "showCustom",
                        table = config,
                    },
                },
            },
            sidebarComponents = {
                {
                    class = "MouseOverInfo",
                    text = "Weapon Sheathing, Version 1.5\n\nWelcome to the configuration menu! Here you can customize which features of the mod will be turned on or off.\n\nMouse over the individual options for more information. Changes made here may require a reload of your save game to take effect.\n\nThis mod is only possible thanks to the contributions of our talented community members. You can use the links below to find more of their content.\n",
                },
                {
                    class = "Category",
                    label = "Credits:",
                    components = {
                        {
                            class = "Hyperlink",
                            text = "Greatness7",
                            exec = "start https://www.nexusmods.com/morrowind/users/64030?tab=user+files",
                        },
                        {
                            class = "Hyperlink",
                            text = "Heinrich",
                            exec = "start https://www.nexusmods.com/morrowind/users/49330348?tab=user+files",
                        },
                        {
                            class = "Hyperlink",
                            text = "Hrnchamd",
                            exec = "start https://www.nexusmods.com/morrowind/users/843673?tab=user+files",
                        },
                        {
                            class = "Hyperlink",
                            text = "London Rook",
                            exec = "start https://www.nexusmods.com/users/9114769?tab=user+files",
                        },
                        {
                            class = "Hyperlink",
                            text = "Lord Berandas",
                            exec = "start https://www.nexusmods.com/morrowind/users/1858915?tab=user+files",
                        },
                        {
                            class = "Hyperlink",
                            text = "Melchior Dahrk",
                            exec = "start https://www.nexusmods.com/morrowind/users/962116?tab=user+files",
                        },
                        {
                            class = "Hyperlink",
                            text = "MementoMoritius",
                            exec = "start https://www.nexusmods.com/morrowind/users/20765944?tab=user+files",
                        },
                        {
                            class = "Hyperlink",
                            text = "NullCascade",
                            exec = "start https://www.nexusmods.com/morrowind/users/26153919?tab=user+files",
                        },
                        {
                            class = "Hyperlink",
                            text = "Petethegoat",
                            exec = "start https://www.nexusmods.com/morrowind/users/25319994?tab=user+files",
                        },
                        {
                            class = "Hyperlink",
                            text = "Remiros",
                            exec = "start https://www.nexusmods.com/morrowind/users/899234?tab=user+files",
                        },
                    },
                },
            },
        },
        {
            label = "Exclusions",
            class = "ExclusionsPage",
            description = "Weapon Sheathing by default will support all characters and equipment in your game. In some cases this is not ideal, and you may prefer to exclude certain objects from being processed. This page provides an interface to accomplish that. Using the lists below you can easily view or edit which objects are to be blocked and which are to be allowed.",
            variable = {
                id = "blocked",
                class = "TableVariable",
                table = config,
            },
            filters = {
                {
                    label = "Plugins",
                    type = "Plugin",
                },
                {
                    label = "Characters",
                    type = "Object",
                    objectType = tes3.objectType.npc,
                },
                {
                    label = "Creatures",
                    type = "Object",
                    objectType = tes3.objectType.creature,
                },
                {
                    label = "Shields",
                    type = "Object",
                    objectType = tes3.objectType.armor,
                    objectFilters = {
                        slot = tes3.armorSlot.shield
                    },
                },
                {
                    label = "Weapons",
                    type = "Object",
                    objectType = tes3.objectType.weapon,
                },
            },
        },
    },
    onClose = saveConfig,
}
