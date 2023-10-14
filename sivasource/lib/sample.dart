/*
configPvd.mappingOfOutputs = [{1: {valve: [[L 1 : V1, ORO Smart RTU, 1, 1, 34], [L 1 : V2, ORO Smart RTU, 1, 2, 35], [L 1 : V3, -, -, -, 36], [L 1 : V4, -, -, -, 37], [L 1 : V5, -, -, -, 38]], main_valve: [[L 1 : MV1, -, -, -, 39], [L 1 : MV2, -, -, -, 40]], injector: [[L 1 : injector1, -, -, -, 7, 41], [L 1 : injector2, -, -, -, 8, 42]], Booster: [[L 1 : Booster1, -, -, -, 7, 43], [L 1 : Booster2, -, -, -, 8, 44]], filter: [[L 1 : filter1, -, -, -, 45]], D_valve: [L 1 : D_valve, -, -, -, 46]}}, {2: {valve: [[L 2 : V1, -, -, -, 47], [L 2 : V2, -, -, -, 48], [L 2 : V3, -, -, -, 49], [L 2 : V4, -, -, -, 50], [L 2 : V5, -, -, -, 51]], main_valve: [[L 2 : MV1, -, -, -, 52]], injector: [[L 2 : injector1, -, -, -, 9, 53]], Booster: [[L 2 : Booster1, -, -, -, 9, 54]], filter: [[L 2 : filter1, -, -, -, 55]], D_valve: []}}]

valve(0 : name,1 : which rtu(no device list), 2 : w rf(RTU)? , 3 : w out?, 4 : 1(default) , 5 : si no)
inj(0 : name,1 : which rtu, 2 : w rf? , 3 : w out?, 4 : 1(default) , 5 : si no)

configPvd.mappingOfInputs = [{1: {pressure_sensor: [L 1 : Pressure sensor, ORO Smart RTU, 1, 1, A-I, 56], water_meter: [L 1 : water meter, ORO Smart RTU, 1, 2, RS485, 57], ORO_sense: [[L 1 : ORO Sense1, -, -, -, -, 58]], dosing_meter: [[L 1 : dosing_meter1, -, -, -, -, 7, 59], [L 1 : dosing_meter2, -, -, -, -, 8, 60]], D_pressure_sensor: []}}, {2: {pressure_sensor: [L 2 : Pressure sensor, -, -, -, -, 61], water_meter: [L 2 : water meter, -, -, -, -, 62], ORO_sense: [[L 2 : ORO Sense1, -, -, -, -, 63]], dosing_meter: [[L 2 : dosing_meter1, -, -, -, -, 9, 64]], D_pressure_sensor: [L 2 : D_pressure_sensor, -, -, -, -, 65]}}]

dm (0 : name,1 : which rtu, 2 : w rf? , 3 : w out?, 4 : w i-types(i/o type),5 : channel id(dont see), 6 : si no)
ps (0 : name,1 : which rtu, 2 : w rf? , 3 : w out?, 4 : w i-types, 5 : si no)


configPvd.SP_MO : [{1: {pump: [1, -, -, -, 1], water_meter: [true, -, -, -, -, 2]}}, {2: {pump: [1, -, -, -, 3], water_meter: [true, -, -, -, -, 4]}}]

sp(0 : which p?,1 : which rtu, 2 : w rf? , 3 : w out?, 4 : 1(default) , 5 : si no)
sp/wm (0 : which wm?,1 : which rtu, 2 : w rf? , 3 : w out?, 4 : w i-types, 5 : si no)

configPvd.IP_MO : [{3: {pump: [1, -, -, -, 5], water_meter: [true, -, -, -, -, 6]}}, {4: {pump: [1, -, -, -, 7], water_meter: [true, -, -, -, -, 8]}}]

configPvd.CD_for_MO : [{1: {injector: [[1, -, -, -, 1, 9]], dosing_meter: [[true, -, -, -, -, 1, 10]], booster: [[false, -, -, -, 4, 3]]}}, {2: {injector: [[1, -, -, -, 2, 12]], dosing_meter: [[true, -, -, -, -, 2, 13]], booster: [[true, -, -, -, 2, 14]]}}, {3: {injector: [[1, -, -, -, 3, 15], [2, -, -, -, 4, 18]], dosing_meter: [[true, -, -, -, -, 3, 16], [true, -, -, -, -, 4, 19]], booster: [[true, -, -, -, 3, 17], [true, -, -, -, 4, 20]]}}, {4: {injector: [[1, -, -, -, 5, 21], [2, -, -, -, 6, 24]], dosing_meter: [[true, -, -, -, -, 5, 22], [true, -, -, -, -, 6, 25]], booster: [[true, -, -, -, 5, 23], [true, -, -, -, 6, 26]]}}]

configPvd.CF_for_MO : [{1: {filter: [[1, -, -, -, 27], [2, -, -, -, 33]], D_S_valve: [true, -, -, -, 28], P_sensor: [false, -, -, -, -, 21]}}, {2: {filter: [[1, -, -, -, 30]], D_S_valve: [true, -, -, -, 31], P_sensor: [true, -, -, -, -, 32]}}]



"206": "1,SP_1.1,4,1,1,1;2,SP_1.2,4,2,1,1;3,IP_1.1,2,1,1,1;4,IP_1.2,2,1,2,1;5,IP_2.1,2,2,1,1;6,IP_2.2,4,3,1,1;7,VL_1.1,3,1,1,1;8,VL_1.2,3,1,2,1;9,VL_1.3,3,1,3,1;10,VL_1.4,3,1,4,1;11,VL_1.5,3,1,5,1;12,VL_1.6,3,2,1,1;13,VL_1.7,3,2,2,1;14,VL_1.8,3,2,3,1;15,VL_1.9,3,2,4,1;16,VL_1.10,3,2,5,1;17,VL_2.1,3,3,1,1;18,VL_2.2,3,3,2,1;19,VL_2.3,3,3,3,1;20,VL_2.4,3,3,4,1;21,VL_2.5,3,3,5,1;22,VL_2.6,3,4,1,1;23,VL_2.7,3,4,2,1;24,VL_2.8,3,4,3,1;25,VL_2.9,3,4,4,1;26,VL_2.10,3,4,5,1;27,FC_1.1.C,2,1,3,1;28,FC_1.2.C,2,1,4,1;29,FC_1.3.C,2,1,5,1;30,FC_1.4.C,2,1,6,1;31,FC_1.1.L,2,1,7,1;32,FC_1.2.L,2,1,8,1;33,FC_1.3.L,2,1,9,1;34,FC_1.4.L,2,1,10,1;35,FC_2.1.C,2,2,2,1;36,FC_2.2.C,2,2,3,1;37,FC_2.3.C,2,2,4,1;38,FC_2.4.C,2,2,5,1;39,FC_2.1.L,2,2,6,1;40,FC_2.2.L,2,2,7,1;41,FC_2.3.L,2,2,8,1;42,FC_2.4.L,2,2,9,1;43,FB_1.1_C,2,1,11,1;44,FB_1.1_L,2,1,12,1;45,FB_2.1_C,2,2,10,1;46,FB_2.1_L,2,2,11,1;47,AG_1.1,2,1,13,1;48,AG_1.2,2,1,14,1;49,AG_2.1,2,2,12,1;50,AG_2.2,2,2,13,1;51,FL_1.1.C,2,1,15,1;52,FL_1.1.L,2,1,16,1;53,FL_1.2.L,2,1,17,1;54,FL_1.3.L,2,1,18,1;55,FL_2.1.C,2,2,14,1;56,FL_2.1.L,2,2,15,1;57,FL_2.2.L,2,2,16,1;58,FT_1.1,2,1,19,1;59,FT_1.2,2,1,20,1;60,FT_1.3,2,1,21,1;61,FT_1.4,2,1,22,1;62,FM_2.1.C,2,2,1,4;63,FM_2.2.C,2,2,2,4;64,FM_2.3.C,2,2,3,4;65,FM_2.4.C,2,2,4,4;66,PI_1.1,2,1,1,2;67,PI_2.1,2,2,1,2;68,PO_1.1,2,1,2,2;69,PO_2.1,2,2,2,2;70,EC_1.1,2,1,3,2;71,EC_1.2,2,1,4,2;72,EC_2.1,2,2,3,2;73,EC_2.2,2,2,4,2;74,PH_1.1,2,1,5,2;75,PH_1.2,2,1,6,2;76,PH_2.1,2,2,5,2;77,PH_2.2,2,2,6,2;78,WM_1.1,2,1,1,4;79,WM_2.1,2,2,6,4;80,LV_1.1,6,1,1,5;81,LV_2.1,6,2,1,5;82,DS_1.1,2,1,3,3;83,DS_2.1,2,2,7,3;84,VP_1.1,3,1,1,2;85,VP_2.1,3,3,1,2;86,SM_1.1,7,1,1,2;87,SM_1.2,7,1,2,2;88,SM_2.1,7,2,1,2;89,SM_2.2,7,2,2,2;90,ST_1.1,7,1,1,3;91,ST_2.1,7,2,1,3;92,AH_1.1,7,1,1,6;93,AH_2.1,7,2,1,6;94,AT_1.1,7,1,1,6;95,AT_2.1,7,2,1,6;96,CO_1.1,7,1,1,6;97,CO_2.1,7,2,1,6;98,SL_1.1,2,1,1,5;99,TL_2.1,2,2,1,5;100,MV_1.1,3,1,6,1;101,MV_1.2,3,1,7,1;102,MV_2.1,3,3,6,1;"
*/