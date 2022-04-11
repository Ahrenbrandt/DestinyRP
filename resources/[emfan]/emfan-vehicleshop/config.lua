Config = Config or {}

Config = { 

    PlayersTableName = "players",       -- Name of your table containing your players
    VehiclesTableName = "player_vehicles",  -- Name of your table containing the player owned vehicles. 
    TableName = "emfan_vehicleshop", -- change this to the name of your vehicles table in your database.
    OrderTableName = "emfan_vehicle_orders", -- The table that stores the ordered vehicles.

    PolyZones = true,                   -- Set to false if you're not using polyzones resource.

    FuelResource = "lj-fuel",        -- The resource you're using for fuel management.

    OpenVehicle = "futo",           -- The vehicle that will be shown when you open the order menu.

    NumberPlateText = "DEMO",       -- The numberplate text on the vehicles in the shop.

    DownPayment = 5,            -- DownPayment for ordering a vehicle in percent(Doesn't apply to cardealers)

    ProfitMargin = 30,  --Percentage(%) of each sold vehicle that is profit for the cardealer bossmenu minus the employee commission.

    SendBackVehicle = 10,   -- Percentage(%) of the vehicle price that loose when you send the vehicle back to the import.

    EmployeeCommission = 10,  -- Percentage(%) of the sold vehicle that goes to the employee as comission.
    
    Interest1 = 5,          -- Interest(%) for financing vehicle 1-4 weeks.

    Interest2 = 10,         -- Interest(%) for financing vehicle 5-8 weeks.
    
    ShopLocation = vector3(-42.02, -1097.61, 26.42),        -- The position of your shop (for calculating distance to spawn and despawn vehicles for performance.)

    SpawnBoughtVehPosition = vector4(-31.62, -1090.32, 26.42, 323.17),         -- Position where you want the bought vehicles to spawn. If you don't want them to move then use false.

    VehiclesMenuPosition = vector4(19.53, -1109.52, 42.37, 334.28),         -- The position where the vehicles spawn when you're browsing the shop. (Don't worry they are invisible for everyone else.)

    VehicleManagementPosition = vector3(-29.92, -1106.11, 27.24),               -- Position of the computer that you use to manage the vehicles in the shop. 

    TruckVehicle = 'phantom',           -- The vehicle being used for doing pickups and deliveries.

    SpawnTruckPos = vector4(-17.54, -1101.12, 26.74, 160.0),            -- Position where the trucks spawns that you use to pickup vehicles for the shop.
    
    SpawnTrailerPos = vector4(501.59, -3182.96, 6.14, 0.38),            -- The position the trailer with your car delivery spawns.

    JobName = "cardealer",                          -- Name of the job that can do vehicle deliveries.
    
    PickUpTime = 24,                                -- How long time it takes to load up the vehicles for pickup (in minutes)

    ReserveKey = 47,                                 -- Key for reserving vehicle, standard is G, don't forget to change in locales as well.

    ActionKey = 38,                                  -- Key for putting vehicle to sale or interact with vehicle. Standard E


    UseTeleport = false,                            -- Set to true if you're using a vehicle shop that doesnt allow you to drive in the vehicles.

    TeleportVehicle = {                             -- Position where you drive your vehicle and them teleport them into the store.(ONLY IF UseTeleport = true)
        -- ['x'] = -23.63261, 
        -- ['y'] = -1094.507, 
        -- ['z'] = 26.700361, },

        ['x'] = -31.13, ['y'] = -1090.36, ['z'] = 26.42},
    
    TeleportVehicleSold = {                         -- Position where the vehicle spawns when it's bought. (ONLY IF UseTeleport = true)
        ['x'] = -23.63261, 
        ['y'] = -1094.507, 
        ['z'] = 26.700361, 
        ['h'] = 340.48318, },
    
    TeleportPositions = {                           -- Where The vehicles are being put if they are being teleported (ONLY IF UseTeleport = true)
        [1] = vector4(-36.762, -1093.298, 26.783, 77.444),
        [2] = vector4(-54.534, -1097.147, 26.536079, 26.777),
        [3] = vector4(-50.041, -1083.57, 26.778, 204.687),
        [4] = vector4(-47.869, -1091.988, 26.782, 251.743),
        [5] = vector4(-42.019, -1101.371, 26.5, 357.570),
    }, 

    Peds = {
        [1] = {
            ['Name'] = "HarborPed",
            ['Model'] = "mp_m_securoguard_01",
            ['Animation'] = "WORLD_HUMAN_SMOKING_POT",
            ['PedNumber'] = nil,
            ['Coords'] = {
                ['X'] = 470.51,
                ['Y'] = -3144.84,
                ['Z'] = 6.07,
                ['H'] = 250.87
            },
        },
        [2] = {
            ['Name'] = "ShopPed",
            ['Model'] = "mp_m_securoguard_01",
            ['Animation'] = "WORLD_HUMAN_SMOKING_POT",
            ['PedNumber'] = nil,
            ['Coords'] = {
                ['X'] = -36.76,
                ['Y'] = -1084.41,
                ['Z'] = 26.42,
                ['H'] = 229.63
            },
        },
    },

    BuySlots = {
        { ['x'] = -49.29502, ['y'] = -1101.215, ['z'] = 25.898876, ['h'] = 349.3338 },
        { ['x'] = -46.06, ['y'] = -1102.07, ['z'] = 25.9, ['h'] = 334.58 },
        { ['x'] = -48.05, ['y'] = -1092.55, ['z'] = 25.9, ['h'] = 132.12 },
        { ['x'] = -45.1, ['y'] = -1093.98, ['z'] = 25.9, ['h'] = 126.66 },
        { ['x'] = -41.86, ['y'] = -1095.14, ['z'] = 25.9, ['h'] = 137.65 },
        { ['x'] = -38.25, ['y'] = -1101.2, ['z'] = 25.9, ['h'] = 65.84 },
        { ['x'] = -13.9, ['y'] = -1108.29, ['z'] = 26.15, ['h'] = 98.51 },
        { ['x'] = -13.25, ['y'] = -1105.44, ['z'] = 26.15, ['h'] = 102.86 },
        { ['x'] = -11.73, ['y'] = -1102.46, ['z'] = 26.15, ['h'] = 102.81 },
        { ['x'] = -11.03, ['y'] = -1099.7, ['z'] = 26.15, ['h'] = 103.56 },
        { ['x'] = -9.95, ['y'] = -1096.85, ['z'] = 26.15, ['h'] = 103.97 },
    },

    Categories = {
        ['bicycles']        =   'Bicycles',
        ['motorcycles']     =   'Motorcycles',
        ['compacts']        =   'Compacts',
        ['sedans']          =   'Sedans',
        ['offroad']         =   'Offroad',
        ['suvs']            =   'SUVs',
        ['vans']            =   'Vans',
        ['sportsclassics']  =   'Sports Classics',
        ['muscle']          =   'Muscle Cars',
        ['sport']           =   'Sport Cars',
        ['super']           =   'Super Cars',
    }



}


