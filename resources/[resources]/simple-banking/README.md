# simple-banking used with QBCore Framework
# All credits for this go to https://github.com/Pawsative 

###### This is by no means a leak, I talked to the original developer of simple banking and we talked about me releasing this for everyone since he is re-coding the banking and he give me his permission to release it. So huge thanks to him.

###### This banking is NP 3.0 styled banking with business and gang accounts 

###### You do not need QB-moneysafe with this banking it has society coded in and only players with specific job/gang and grade can see the business and gang account

### Btw qb-target events are already in the cl_bank.lua for thoes who dont use qb-target sorry but you will have to make loops your self
![Alt text](https://i.imgur.com/Eink1Ox.jpg "In-game screenshot")


### Using society events to deposit money from other resources/scripts
```lua
TriggerEvent('qb-banking:society:server:DepositMoney', src, AMOUNT , JOBNAME)
```

###### first lets start with AMOUNT you need to replace that for example 
###### You have an event that is passing args like this
```lua
 RegisterServerEvent('qb-burgershotjob:server:register', function(id, price)
```
##### now in the event AMOUNT should be replace with price
```lua
TriggerEvent('qb-banking:society:server:DepositMoney', src, price , JOBNAME)
```
##### JOBNAME should be replace with the society name if you want to deposit it to police society account replace JOBNAME with 'police'
```lua
TriggerEvent('qb-banking:society:server:DepositMoney', src, AMOUNT , 'police')
```
### Using the examples above the final triggerevent should look like this
```lua
TriggerEvent('qb-banking:society:server:DepositMoney', src, price , 'police')
```
###### Now why did i do it with src when its triggering the server event, its because of that event security
###### A lot of people asked me why is src as an arg to pass to the event so if on that event there is no source or src event wont run so that some dipshit with hack's
###### cant just keep spaming the event and basicly spawn money into the account.

### Adding grades to the config, adding override grades to the config
```lua
SimpleBanking.Config["business_ranks"] = {  -- Here you add default grades for boss to get access to the account NOTE that grades need to be lower case.
    ["owner"] = true,
    ["coowner"] = true,
    ["chief"] = true,
    ["boss"] = true,
}
```
###### Same thing goes for gang accounts, You can add default grades under business_ranks and add override grades for example
```lua
SimpleBanking.Config["business_ranks_overrides"] = {
    ["lostmc"] = { -- this is example for adding more then one grade to access the account for gangs
        ["boss"] = true,
        ["shot caller"] = true,
    }
}

SimpleBanking.Config["business_ranks_overrides"] = {
    ["police"] = { -- example for adding more then one grade to access the account for job
        ["chief"] = true,
        ["lieutenant"] = true,
        ["sergeant"] = true,
    }
}

```
###### If you are using ms-peds here is the config for peds in banks around the map
```lua
	-- BANK PED'S
	{
		model = `ig_bankman`,
		coords = vector4(241.44, 227.19, 106.29, 170.43),
		gender = 'male', 
		animDict = 'anim@heists@prison_heiststation@cop_reactions',
		animName = 'cop_b_idle'
	},
	{
		model = `ig_bankman`,
		coords = vector4(313.84, -280.58, 54.16, 338.31), 
		gender = 'male', 
		animDict = 'anim@heists@prison_heiststation@cop_reactions',
		animName = 'cop_b_idle'
	},
	{
		model = `ig_bankman`, 
		coords = vector4(149.46, -1042.09, 29.37, 335.43), 
		gender = 'male', 
		animDict = 'anim@heists@prison_heiststation@cop_reactions',
		animName = 'cop_b_idle'
	},
	{
		model = `ig_bankman`, 
		coords = vector4(-351.23, -51.28, 49.04, 341.73), 
		gender = 'male', 
		animDict = 'anim@heists@prison_heiststation@cop_reactions',
		animName = 'cop_b_idle'
	},
	{
		model = `ig_bankman`, 
		coords = vector4(-1211.9, -331.9, 37.78, 20.07), 
		gender = 'male', 
		animDict = 'anim@heists@prison_heiststation@cop_reactions',
		animName = 'cop_b_idle'
	},
	{
		model = `ig_bankman`, 
		coords = vector4(-2961.14, 483.09, 15.7, 83.84), 
		gender = 'male', 
		animDict = 'anim@heists@prison_heiststation@cop_reactions',
		animName = 'cop_b_idle'
	},
	{
		model = `ig_bankman`, 
		coords = vector4(1174.8, 2708.2, 38.09, 178.52), 
		gender = 'male', 
		animDict = 'anim@heists@prison_heiststation@cop_reactions',
		animName = 'cop_b_idle'
	},
	{
		model = `ig_bankman`, 
		coords = vector4(-112.22, 6471.01, 31.63, 134.18), 
		gender = 'male', 
		animDict = 'anim@heists@prison_heiststation@cop_reactions',
		animName = 'cop_b_idle'
	},

```
