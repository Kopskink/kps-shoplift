Config = Config or {}

Config.Debug = true -- boolean

Config.NeedPolice = true -- Set to false if police presence is not required
Config.MinPolice = 1 -- Minimum number of police required

Config.Target = 'ox' -- the targeting system your server uses (ox or qb) | I haven't fully tested qb-target so it could come with some problems.

Config.Loot = {"aidkit", "sandwich", "scratch_ticket"} -- the player will receive one of these from the shoplift

Config.RobCooldown = 5 -- in minutes (cooldown allowing to snatch items again)
Config.DoorsClosed = 60 -- in seconds
Config.GrabbingItems = 2500 -- in milliseconds (how long the person is grabbing items for)

Config.Location = {
    ['store1'] = { -- 5038 (postal code)
        coords = vector3(-3240.7, 1001.93, 12.89), -- boxzone coords
        rotation = 175.37, -- boxzone rotation / heading
        doorname = 'store1_double', -- name of the door that is connected with this table
    },
    ['store2'] = { -- 9094
        coords = vector3(-49.85, -1758.59, 29.5),
        rotation = 226.93,
        doorname = 'store2_double',
    },
    ['store3'] = { -- 5048
        coords = vector3(-3038.24, 586.95, 7.77),
        rotation = 200.0,
        doorname = 'store3_double',
    },
    ['store4'] = { -- 7302
        coords = vector3(1163.38, -325.36, 69.19),
        rotation = 97.53,
        doorname = 'store4_double',
    },
    ['store5'] = { -- 7326
        coords = vector3(1135.0, -982.42, 46.02),
        rotation = 9.0,
        doorname = 'store5_single',
    },
    ['store6'] = { -- 9046
        coords = vector3(25.13, -1346.65, 29.0),
        rotation = 0.98,
        doorname = 'store6_double',
    },
    ['store7'] = { -- 8140
        coords = vector3(-704.7, -913.58, 20.0),
        rotation = 177.88,
        doorname = 'store7_double',
    },
    ['store8'] = { -- 8092
        coords = vector3(-1222.3, -907.69, 11.9),
        rotation = 123.44,
        doorname = 'store8_single',
    },
    ['store9'] = { -- 5065
        coords = vector3(-2967.29, 390.74, 14.56),
        rotation = 179.23,
        doorname = 'store9_single',
    },
    ['store10'] = { -- 7093
        coords = vector3(373.28, 326.54, 103.2),
        rotation = 161.97,
        doorname = 'store10_double',
    },
    ['store11'] = { -- 7354
        coords = vector3(2556.82, 381.4, 108.27),
        rotation = 265.25,
        doorname = 'store11_double',
    },
    ['store12'] = { -- 3051
        coords = vector3(2676.7, 3280.85, 54.73),
        rotation = 237.88,
        doorname = 'store12_double',
    },
    ['store13'] = { -- 3008
        coords = vector3(1959.67, 3741.81, 31.75),
        rotation = 32.36,
        doorname = 'store13_double',
    },
    ['store14'] = { -- 2006
        coords = vector3(1697.3, 4921.3, 43.06),
        rotation = 52.1,
        doorname = 'store14_double',
    },
}
