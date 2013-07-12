CREATE TABLE IF NOT EXISTS `active_event_id` (
  `active_event` int(10) unsigned NOT NULL,
  `name` text COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`active_event`)
);

DELETE FROM `active_event_id` WHERE `active_event`=36;
INSERT INTO `active_event_id` (`active_event`, `name`) VALUES (36,"Darkmoon Faire: Elwynn Forest Building");

SET @SPID := 400000;
SET @GOID := 400000;

DELETE FROM `creature_spawns` WHERE `id` BETWEEN @SPID+1 AND @SPID+9;
INSERT INTO `creature_spawns` (`id`, `entry`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `movetype`, `displayid`, `faction`, `flags`, `bytes0`, `bytes1`, `bytes2`, `emote_state`, `npc_respawn_link`, `channel_spell`, `channel_target_sqlid`, `channel_target_sqlid_creature`, `standstate`, `death_state`, `mountdisplayid`, `slot1item`, `slot2item`, `slot3item`, `CanFly`, `phase`) VALUES
	(@SPID+1,14849,0,-9528.68,92.4662,58.9648,6.0912,0,14890,1555,768,16777472,0,4097,0,0,0,0,0,0,0,0,3362,13604,0,0,1),
	(@SPID+2,14849,0,-9530.22,96.3252,58.9648,0.628319,0,14890,1555,768,16777472,0,4097,0,0,0,0,0,0,0,0,3362,13604,0,0,1),
	(@SPID+3,14849,0,-9581.36,59.2771,61.5242,0.308834,0,14890,1555,768,16777472,0,4097,0,0,0,0,0,0,0,0,3362,13604,0,0,1),
	(@SPID+4,14849,0,-9551.95,134.237,58.9648,1.72788,0,14890,1555,768,16777472,0,4097,0,0,0,0,0,0,0,0,3362,13604,0,0,1),
	(@SPID+5,14849,0,-9547.84,73.6699,58.9674,4.64258,0,14890,1555,768,16777472,0,4097,0,0,0,0,0,0,0,0,3362,13604,0,0,1),
	(@SPID+6,14849,0,-9537.16,70.2721,59.0065,5.03524,0,14890,1555,768,16777472,0,4097,0,0,0,0,0,0,0,0,3362,13604,0,0,1),
	(@SPID+7,14849,0,-9545.6,116.265,59.2087,4.90953,0,14890,1555,768,16777472,0,4097,69,0,0,0,0,0,0,0,3362,13604,0,0,1),
	(@SPID+8,14849,0,-9532.41,67.9315,58.9648,5.39307,0,14890,1555,768,16777472,0,4097,0,0,0,0,0,0,0,0,3362,13604,0,0,1),
	(@SPID+9,14849,0,-9546.6,124.032,59.3384,4.87607,0,14890,1555,768,16777472,0,4097,69,0,0,0,0,0,0,0,3362,13604,0,0,1);

DELETE FROM `gameobject_spawns` WHERE `id` BETWEEN @GOID+1 AND @GOID+58;
INSERT INTO `gameobject_spawns` (`id`, `Entry`, `map`, `position_x`, `position_y`, `position_z`, `Facing`, `orientation1`, `orientation2`, `orientation3`, `orientation4`, `State`, `Flags`, `Faction`, `Scale`, `stateNpcLink`, `phase`, `overrides`) VALUES
	(@GOID+1,179973,0,-9545.68,129.577,58.9418,0.767945,0,0,0.374607,0.927184,1,0,0,1,0,1,0),
	(@GOID+2,179968,0,-9534.28,100.962,58.8815,-2.61799,0,0,-0.965925,0.258821,1,0,0,1,0,1,0),
	(@GOID+3,179977,0,-9553.6,73.6054,60.7574,-1.0821,0,0,-0.515036,0.857168,1,0,0,1,0,1,0),
	(@GOID+4,179968,0,-9533.42,100.851,59.5759,0.523599,0,0,0.258819,0.965926,1,0,0,1,0,1,0),
	(@GOID+5,179969,0,-9535.14,64.5122,60.1245,1.41372,0,0,0.649449,0.760405,1,0,0,1,0,1,0),
	(@GOID+6,179969,0,-9553.71,73.5554,60.1254,-0.20944,0,0,-0.104529,0.994522,1,0,0,1,0,1,0),
	(@GOID+7,180046,0,-9584.9,43.5214,60.0673,-0.087267,0,0,-0.0436197,0.999048,1,0,0,1,0,1,0),
	(@GOID+8,179972,0,-9536.11,64.7925,58.8815,1.15192,0,0,0.54464,0.83867,1,0,0,1,0,1,0),
	(@GOID+9,180049,0,-9579.24,38.2489,61.0309,-2.00713,0,0,-0.843392,0.537299,1,0,0,1,0,1,0),
	(@GOID+10,180045,0,-9580.55,34.8943,60.6254,-0.331612,0,0,-0.165047,0.986286,1,32,0,1,0,1,0),
	(@GOID+11,180007,0,-9531.6,66.9169,58.8815,-0.20944,0,0,-0.104529,0.994522,1,0,0,1,0,1,0),
	(@GOID+12,180048,0,-9556.21,112.962,59.397,-0.087267,0,0,-0.0436197,0.999048,1,0,0,1,0,1,0),
	(@GOID+13,180052,0,-9583.73,38.0032,60.1551,0.139626,0,0,0.0697563,0.997564,1,0,0,1,0,1,0),
	(@GOID+14,179969,0,-9534.44,65.839,58.8815,-0.645772,0,0,-0.317305,0.948324,1,0,0,1,0,1,0),
	(@GOID+15,179976,0,-9532.27,98.8036,58.8815,-2.33874,0,0,-0.920505,0.390732,1,0,0,1,0,1,0),
	(@GOID+16,180043,0,-9583.03,39.3649,60.1749,-1.98968,0,0,-0.838672,0.544637,1,0,0,1,0,1,0),
	(@GOID+17,179977,0,-9529.46,98.6237,59.8937,1.46608,0,0,0.669132,0.743144,1,0,0,1,0,1,0),
	(@GOID+18,179967,0,-9530.15,99.3,58.9005,-3.10669,0,0,-0.999848,0.0174505,1,0,0,1,0,1,0),
	(@GOID+19,179972,0,-9561.86,74.0052,58.9062,3.03687,0,0,0.998629,0.0523374,1,0,0,1,0,1,0),
	(@GOID+20,180046,0,-9580.22,38.3075,60.4316,1.58825,0,0,0.713251,0.700909,1,0,0,1,0,1,0),
	(@GOID+21,179969,0,-9561.14,73.6756,60.1415,1.44862,0,0,0.662619,0.748957,1,0,0,1,0,1,0),
	(@GOID+22,180007,0,-9548.02,72.3468,58.9184,-1.91986,0,0,-0.819151,0.573577,1,0,0,1,0,1,0),
	(@GOID+23,180007,0,-9552.11,135.655,58.8815,2.47837,0,0,0.945519,0.325567,1,0,0,1,0,1,0),
	(@GOID+24,179972,0,-9560.6,75.2109,58.8826,-1.20428,0,0,-0.566407,0.824125,1,0,0,1,0,1,0),
	(@GOID+25,179969,0,-9545.8,128.19,59.0148,0.296706,0,0,0.147809,0.989016,1,0,0,1,0,1,0),
	(@GOID+26,180046,0,-9556.52,112.122,58.8921,-0.2618,0,0,-0.130526,0.991445,1,0,0,1,0,1,0),
	(@GOID+27,180043,0,-9582.59,60.599,61.6029,-2.98451,0,0,-0.996917,0.0784606,1,0,0,1,0,1,0),
	(@GOID+28,179972,0,-9534.53,64.3109,58.8815,1.74533,0,0,0.766045,0.642787,1,0,0,1,0,1,0),
	(@GOID+29,179967,0,-9559.8,76.8996,58.8817,-2.53073,0,0,-0.953717,0.300705,1,0,0,1,0,1,0),
	(@GOID+30,180007,0,-9529.04,97.136,58.8951,1.20428,0,0,0.566407,0.824125,1,0,0,1,0,1,0),
	(@GOID+31,180006,0,-9572.58,28.1636,61.4756,1.76278,0,0,0.771624,0.636079,1,0,0,1,0,1,0),
	(@GOID+32,179967,0,-9537.69,65.5724,58.8815,2.75762,0,0,0.981627,0.190809,1,0,0,1,0,1,0),
	(@GOID+33,179968,0,-9546.95,129.768,58.9237,2.96706,0,0,0.996195,0.0871556,1,0,0,1,0,1,0),
	(@GOID+34,180007,0,-9527.19,92.1539,58.913,0.558505,0,0,0.275637,0.961262,1,0,0,1,0,1,0),
	(@GOID+35,179970,0,-9558.64,74.9394,58.8828,0.349066,0,0,0.173648,0.984808,1,0,0,1,0,1,0),
	(@GOID+36,180050,0,-9556.04,113.011,59.4166,-0.925024,0,0,-0.446198,0.894934,1,0,0,1,0,1,0),
	(@GOID+37,179977,0,-9534.43,65.8022,59.5134,1.76278,0,0,0.771624,0.636079,1,0,0,1,0,1,0),
	(@GOID+38,180047,0,-9579.16,38.2434,60.5159,1.48353,0,0,0.67559,0.737277,1,0,0,1,0,1,0),
	(@GOID+39,180046,0,-9584.63,41.6998,60.0233,0.506145,0,0,0.25038,0.968148,1,0,0,1,0,1,0),
	(@GOID+40,179970,0,-9558.7,76.1096,58.8822,1.39626,0,0,0.642786,0.766046,1,0,0,1,0,1,0),
	(@GOID+41,179967,0,-9530.4,98.406,58.8917,-1.79769,0,0,-0.782608,0.622514,1,0,0,1,0,1,0),
	(@GOID+42,179970,0,-9545.82,128.185,59.6476,0.820305,0,0,0.398749,0.91706,1,0,0,1,0,1,0),
	(@GOID+43,180045,0,-9559.42,113.733,58.9944,-1.95477,0,0,-0.829038,0.559192,1,32,0,1,0,1,0),
	(@GOID+44,179970,0,-9535.61,66.1034,58.8815,1.90241,0,0,0.814116,0.580702,1,0,0,1,0,1,0),
	(@GOID+45,179968,0,-9533.59,101.373,58.8815,0.523599,0,0,0.258819,0.965926,1,0,0,1,0,1,0),
	(@GOID+46,179973,0,-9556.81,74.3175,58.8824,2.58309,0,0,0.961262,0.275636,1,0,0,1,0,1,0),
	(@GOID+47,179972,0,-9553.88,73.4533,58.8824,0.122173,0,0,0.0610485,0.998135,1,0,0,1,0,1,0),
	(@GOID+48,180043,0,-9547.15,130.869,58.9007,-1.36136,0,0,-0.629322,0.777145,1,0,0,1,0,1,0),
	(@GOID+49,179967,0,-9529.48,98.628,58.9005,-1.91986,0,0,-0.819151,0.573577,1,0,0,1,0,1,0),
	(@GOID+50,180043,0,-9574.43,29.2368,61.3682,1.36136,0,0,0.629322,0.777145,1,0,0,1,0,1,0),
	(@GOID+51,179972,0,-9560.35,73.5978,58.8919,0.314159,0,0,0.156434,0.987688,1,0,0,1,0,1,0),
	(@GOID+52,179968,0,-9533.06,100.432,58.8815,-0.994838,0,0,-0.477159,0.878817,1,0,0,1,0,1,0),
	(@GOID+53,180047,0,-9556.16,113.024,58.8894,-0.523599,0,0,-0.258819,0.965926,1,0,0,1,0,1,0),
	(@GOID+54,180006,0,-9576.48,28.5868,61.2078,1.0821,0,0,0.515036,0.857168,1,0,0,1,0,1,0),
	(@GOID+55,179967,0,-9536.88,66.2043,58.8815,-1.29154,0,0,-0.601814,0.798637,1,0,0,1,0,1,0),
	(@GOID+56,179968,0,-9556.75,73.0311,58.8824,1.0821,0,0,0.515036,0.857168,1,0,0,1,0,1,0),
	(@GOID+57,179967,0,-9559.65,72.3264,58.8912,0.331613,0,0,0.165048,0.986286,1,0,0,1,0,1,0),
	(@GOID+58,180051,0,-9579.01,38.1403,61.0277,1.0821,0,0,0.515036,0.857168,1,0,0,1,0,1,0);
