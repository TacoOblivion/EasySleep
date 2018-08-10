#use 1.13 parsing

tag @a[scores={ES.InBed=1..}] add InBed
scoreboard players reset @a[scores={ES.InBed=1..}] ES.InBed

execute at @a[tag=InBed,nbt={Sleeping:0b}] run scoreboard players reset @p ES.TimeInBed
execute at @a[tag=InBed,nbt={Sleeping:0b}] run tag @p remove InBed

scoreboard players add @a[tag=InBed] ES.TimeInBed 1
execute as @a[tag=InBed,scores={ES.TimeInBed=1}] run tellraw @p ["",{"selector":"@p"},{"text":" is now sleeping","color":"yellow"}]

execute at @a[tag=InBed] if score @p ES.TimeInBed >= TimeInBedReq ES.Options run function easy_sleep:sleep
