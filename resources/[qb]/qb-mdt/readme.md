# Preview
![image](https://user-images.githubusercontent.com/82112471/152825147-c016f3fd-ceae-41df-8be4-c7420a5438d5.png)
![image](https://user-images.githubusercontent.com/82112471/153021462-a8eb7bc7-7d5a-4f71-9636-093ceacb487e.png)
![image](https://user-images.githubusercontent.com/82112471/153021166-d18b3668-85cc-4aa2-bda5-93c6a0d26ada.png)


This MDT is work in progress and features may not work properly. 

## Dependencies
- [Polyzone](https://github.com/mkafrin/PolyZone)
- [oxmysql](https://github.com/overextended/oxmysql)

# Dispatch System
- https://github.com/Project-Sloth/qb-dispatch

# Credit

Original Repo: https://github.com/FlawwsX/erp_mdt

#
## QBCore Changes for License
#
- qb-core/server/player.lua
- replace the old logic of licenses to this new logic
- search for ```PlayerData.metadata["licences"]``` and replace the whole block of licences with the block below

```lua
if PlayerData.metadata["licences"]["drive_truck"] ~= nil then
    PlayerData.metadata['licences'] = PlayerData.metadata['licences']
else
    PlayerData.metadata['licences'] = {
        ['driver'] = true,
        ['business'] = false,
        ['weapon'] = false,
        ["drive_bike"] = false,
        ["drive_truck"] = false,
        ["pilot"] = false,
    }
end
```