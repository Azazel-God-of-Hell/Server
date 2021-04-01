-----------------------------------
-- Area: West Ronfaure
--  NPC: Palcomondau
-- Type: Patrol
-- !pos -349.796 -45.345 344.733 100
-----------------------------------
local ID = require("scripts/zones/West_Ronfaure/IDs")
require("scripts/globals/pathfind")
require("scripts/globals/quests")
-----------------------------------
local entity = {}

local path =
{
    -373.096863, -45.742077, 340.182159,
    -361.441864, -46.052444, 340.367371,
    -360.358276, -46.063702, 340.457428,
    -359.297211, -46.093231, 340.693817,
    -358.264465, -46.285988, 341.032928,
    -357.301941, -45.966343, 341.412994,
    -356.365295, -45.641331, 341.804657,
    -353.933533, -45.161453, 342.873901,
    -346.744659, -45.006634, 346.113251,
    -345.843506, -44.973419, 346.716309,
    -345.138519, -44.939915, 347.540436,
    -344.564056, -44.925575, 348.463470,
    -344.069366, -44.945713, 349.431824,
    -343.621704, -45.004826, 350.421936,
    -343.194946, -45.062874, 351.421173,
    -342.118958, -45.391632, 354.047485,
    -334.448578, -44.964996, 373.198242,
    -333.936615, -45.028484, 374.152283,
    -333.189636, -45.068111, 374.939209,
    -332.252838, -45.073158, 375.488129,
    -331.241516, -45.065205, 375.888031,
    -330.207855, -45.043056, 376.226532,
    -329.165100, -45.022049, 376.536011,
    -328.118622, -45.000935, 376.832428,
    -323.437805, -45.726982, 378.101166,
    -305.333038, -49.030193, 382.936646,
    -304.308228, -49.435581, 383.130188,
    -303.259979, -49.765697, 383.194305,
    -302.209290, -50.104950, 383.175659,
    -301.161774, -50.446033, 383.117767,
    -300.114624, -50.787590, 383.041473,
    -298.422943, -51.390713, 382.898590,
    -281.798126, -56.178822, 381.370544,
    -280.718414, -56.161697, 381.241425,
    -279.641785, -56.142433, 381.087341,
    -278.567627, -56.121262, 380.917938,
    -261.485809, -55.875919, 378.010284,
    -260.404205, -55.893314, 377.898254,
    -259.317078, -55.908813, 377.861389,
    -258.229248, -55.923473, 377.879669,
    -257.142151, -55.938625, 377.919037,
    -254.834976, -55.888081, 378.032623,
    -224.857941, -56.603645, 379.721832,
    -194.892044, -59.911034, 381.416382,
    -178.437729, -61.500011, 382.347656, -- report?
    -179.524124, -61.500011, 382.285919,
    -209.530518, -58.837189, 380.588806,
    -239.543137, -56.145073, 378.891602,
    -257.769012, -55.930656, 377.861328,
    -258.856445, -55.915405, 377.839905,
    -259.943420, -55.900009, 377.884918,
    -261.025116, -55.882565, 377.999329,
    -262.102173, -55.864536, 378.151794,
    -263.193237, -55.845242, 378.320587,
    -279.088043, -56.134182, 381.021332,
    -280.165344, -56.153133, 381.172882,
    -281.246033, -56.168983, 381.299683,
    -282.302917, -56.181866, 381.408691,
    -301.977173, -50.175457, 383.230652,
    -302.993134, -49.847698, 383.246735,
    -303.998260, -49.580284, 383.147003,
    -305.083649, -49.109840, 382.933411,
    -306.061432, -48.755005, 382.706818,
    -307.152679, -48.355675, 382.435608,
    -327.497711, -45.027401, 377.016663,
    -328.548553, -45.009663, 376.735291,
    -331.569672, -45.071396, 375.927429,
    -332.566711, -45.084835, 375.500153,
    -333.347351, -45.055779, 374.749634,
    -333.952423, -44.990082, 373.848999,
    -334.454071, -44.958176, 372.884399,
    -334.909607, -44.930862, 371.896698,
    -335.338989, -44.939476, 370.897034,
    -336.319305, -45.033978, 368.508484,
    -344.092773, -44.934128, 349.103394,
    -344.599304, -44.920494, 348.142578,
    -345.289124, -44.948330, 347.305328,
    -346.152740, -44.981884, 346.646881,
    -347.087494, -45.014847, 346.091278,
    -348.052368, -45.047348, 345.589172,
    -349.030975, -45.039383, 345.114044,
    -350.016052, -45.036438, 344.652252,
    -357.274414, -45.947830, 341.359833,
    -358.277222, -46.126381, 340.958984,
    -359.326965, -46.091412, 340.679291,
    -360.404205, -46.072746, 340.529785,
    -361.488525, -46.061684, 340.441284,
    -362.575226, -46.055046, 340.388184,
    -363.662323, -46.050694, 340.353088,
    -367.288086, -45.562141, 340.276978,
    -397.408386, -46.031933, 339.796722,
    -427.522491, -45.366581, 339.319641,
    -457.651947, -45.910805, 338.841827,
    -463.498932, -45.831551, 338.757111,
    -464.580750, -45.752060, 338.776215,
    -465.656433, -45.603558, 338.822693,
    -467.953491, -45.463387, 338.967407,
    -494.403381, -45.661190, 340.958710,
    -495.442017, -45.667831, 341.254303,
    -496.256042, -45.713417, 341.966400,
    -496.865723, -45.720673, 342.866852,
    -497.385132, -45.755371, 343.821838,
    -498.376312, -45.856812, 345.908539,
    -498.820007, -45.996841, 346.899353,
    -499.174530, -46.197227, 347.923767,
    -499.352539, -46.093906, 348.989563,
    -499.416016, -46.074814, 350.073944,
    -499.423279, -46.070366, 351.161072,
    -499.397400, -46.084679, 352.248505,
    -499.358795, -46.133957, 353.335815,
    -498.771545, -46.025249, 365.000885,
    -498.687347, -45.804886, 366.615082,
    -498.166779, -45.846115, 376.640106,
    -498.109924, -45.862961, 377.726410,
    -497.697968, -45.951462, 385.738007,
    -497.694122, -46.004673, 386.825317,
    -497.737915, -46.056293, 387.912231,
    -497.809082, -46.020039, 388.997162,
    -498.192322, -46.074364, 393.595886,
    -499.513733, -47.018887, 408.449036,
    -499.682556, -47.223618, 409.509949,
    -499.959503, -47.415245, 410.549194,
    -500.307434, -47.595810, 411.566589,
    -500.686859, -48.017868, 412.545349,
    -501.077026, -48.478256, 413.506836,
    -501.873901, -49.394321, 415.425659,
    -502.207245, -49.737534, 416.425812,
    -502.382660, -50.058594, 417.464630,
    -502.406891, -50.394829, 418.516327,
    -502.342438, -50.724243, 419.565948,
    -502.251190, -51.088074, 420.607056,
    -502.139435, -51.460213, 421.645935,
    -501.954468, -52.022106, 423.198792,
    -500.171021, -55.784023, 437.153931,
    -500.033447, -56.010731, 438.356873,
    -499.879120, -56.021641, 439.981689,
    -499.679840, -55.963177, 442.392639,
    -499.790558, -55.536102, 443.497894,
    -500.205383, -55.237358, 444.453308,
    -500.785736, -55.148598, 445.369598,
    -501.427277, -55.099243, 446.246521,
    -502.103760, -55.051254, 447.097015,
    -502.791046, -55.003696, 447.939423,
    -503.574524, -55.015862, 448.879730,
    -510.872284, -55.089428, 457.484222,
    -511.691742, -55.159729, 458.188812,
    -512.678040, -55.280975, 458.628448,
    -513.720825, -55.419674, 458.910309,
    -514.785461, -55.554832, 459.097260,
    -515.851929, -55.741619, 459.240265,
    -516.923096, -55.906597, 459.366913,
    -517.998413, -56.087105, 459.482513,
    -521.921387, -56.035919, 459.879913,
    -522.965271, -55.886223, 460.131927,
    -523.947327, -55.785652, 460.568665,
    -524.886719, -55.581245, 461.082581,
    -525.805237, -55.438984, 461.645203,
    -526.824829, -55.279068, 462.300720,
    -531.560181, -54.945484, 465.464722,
    -532.406555, -54.961479, 466.143524,
    -533.060120, -54.995003, 467.010559,
    -533.618408, -55.030079, 467.943695,
    -534.158691, -55.026203, 468.887848,
    -538.343323, -55.609158, 476.336639,
    -538.852539, -55.920918, 477.273773,
    -539.335510, -56.089600, 478.277985,
    -539.767029, -56.035652, 479.274902,
    -540.283997, -56.042004, 480.532135,
    -544.975769, -55.047729, 492.510040,
    -545.471375, -55.034317, 493.475891,
    -546.206604, -55.009632, 494.270599,
    -547.121643, -54.949020, 494.853882,
    -548.100342, -54.921333, 495.329163,
    -549.105103, -54.930302, 495.747131,
    -550.121033, -54.979893, 496.133270,
    -551.140991, -55.035213, 496.507385,
    -556.089600, -55.924522, 498.256134,
    -557.125793, -56.028824, 498.568329,
    -558.182983, -56.208153, 498.806641,
    -559.256592, -56.133862, 498.981354,
    -560.335327, -56.116646, 499.118896,
    -562.091736, -56.104050, 499.314911,
    -574.530396, -56.559124, 500.553680,
    -575.606262, -56.603722, 500.706024,
    -576.649963, -56.813107, 500.963989,
    -577.670288, -57.037365, 501.291138,
    -578.679321, -57.266209, 501.647278,
    -579.683105, -57.510010, 502.019379,
    -581.321777, -57.800549, 502.643463,
    -608.199463, -60.061394, 513.086548, -- turn around
    -607.195618, -59.956524, 512.696411,
    -579.141602, -57.367210, 501.788940,
    -578.157959, -57.136345, 501.407318,
    -577.150146, -56.915344, 501.086304,
    -576.116089, -56.711021, 500.848358,
    -575.049622, -56.572414, 500.676178,
    -573.971497, -56.540531, 500.535004,
    -572.891418, -56.511803, 500.410767,
    -571.541260, -56.454227, 500.267334,
    -559.917480, -56.117676, 499.110870,
    -558.841248, -56.137356, 498.953400,
    -557.782593, -56.166878, 498.714447,
    -556.750061, -55.982758, 498.415985,
    -555.608704, -55.807209, 498.053894,
    -553.104614, -55.239231, 497.204651,
    -547.725464, -54.925472, 495.326019,
    -546.765625, -54.984024, 494.821899,
    -546.022339, -55.011047, 494.032928,
    -545.445923, -55.024132, 493.110931,
    -544.951660, -55.061985, 492.142212,
    -544.503357, -55.055382, 491.151031,
    -544.083557, -55.041119, 490.147827,
    -543.675354, -55.021049, 489.139801,
    -540.065735, -56.014805, 479.933258,
    -539.634155, -56.052246, 478.935516,
    -539.166565, -56.161896, 477.960266,
    -538.697327, -55.847233, 477.044403,
    -538.208557, -55.557598, 476.136658,
    -537.436646, -55.298710, 474.733032,
    -533.392761, -55.013466, 467.513885,
    -532.726868, -54.979912, 466.657013,
    -531.930054, -54.948929, 465.917389,
    -531.075134, -54.949390, 465.244354,
    -530.197693, -54.950920, 464.600464,
    -529.308838, -54.990524, 463.974792,
    -525.172791, -55.543240, 461.159485,
    -524.214478, -55.720425, 460.668243,
    -523.196838, -55.850220, 460.304413,
    -522.141357, -56.015007, 460.066986,
    -521.068726, -56.020702, 459.886475,
    -519.991577, -56.039570, 459.735687,
    -518.911011, -56.055336, 459.609558,
    -517.433777, -55.982838, 459.449738,
    -513.966614, -55.460213, 459.099396,
    -512.921997, -55.323360, 458.849701,
    -512.001587, -55.181244, 458.291351,
    -511.179230, -55.105251, 457.583893,
    -510.412476, -55.032543, 456.816132,
    -509.680267, -54.958725, 456.014191,
    -508.602783, -54.942749, 454.788452,
    -500.669189, -55.143158, 445.473999,
    -500.128296, -55.247131, 444.541412,
    -499.898651, -55.518276, 443.507935,
    -499.821869, -55.910942, 442.468292,
    -499.832764, -56.027439, 441.384308,
    -499.881256, -56.021374, 440.297485,
    -499.962463, -56.011227, 439.212982,
    -500.072205, -56.031265, 438.133789,
    -500.329163, -55.395157, 435.970062,
    -502.441742, -50.690495, 419.476440,
    -502.485474, -50.371307, 418.460999,
    -502.368835, -50.054039, 417.447144,
    -502.131531, -49.750740, 416.450317,
    -501.775696, -49.393009, 415.406342,
    -501.394318, -48.913757, 414.410278,
    -500.999023, -48.445408, 413.431396,
    -500.303253, -47.637516, 411.756561,
    -499.980103, -47.454823, 410.747284,
    -499.763947, -47.256901, 409.705627,
    -499.603699, -47.051754, 408.654358,
    -499.474274, -46.886150, 407.591583,
    -499.360931, -46.714558, 406.528320,
    -497.842590, -45.999271, 389.667542,
    -497.735077, -46.047218, 388.312012,
    -497.702972, -46.022728, 387.226166,
    -497.717407, -45.968018, 386.140686,
    -497.752014, -45.910450, 385.054596,
    -498.532532, -45.704178, 369.587616,
    -498.589294, -45.753151, 368.501129,
    -499.547089, -46.040310, 350.040375,
    -499.412354, -46.078503, 348.964417,
    -499.099609, -46.221172, 347.926239,
    -498.741913, -46.030338, 346.926208,
    -498.351959, -45.860306, 345.923828,
    -497.941467, -45.805256, 344.918884,
    -497.518524, -45.751751, 343.918427,
    -497.074768, -45.707314, 342.926636,
    -496.434631, -45.690395, 342.056549,
    -495.518555, -45.685642, 341.481903,
    -494.478638, -45.677624, 341.169525,
    -493.406281, -45.681431, 340.990509,
    -492.333801, -46.148170, 340.858154,
    -491.272858, -45.972626, 340.751801,
    -490.196564, -45.903652, 340.655212,
    -466.653748, -45.466057, 338.859863,
    -465.575256, -45.615093, 338.803314,
    -464.496521, -45.763508, 338.779785,
    -463.410126, -45.832458, 338.774506,
    -433.375122, -45.735828, 339.226624,
    -403.243805, -46.015915, 339.704468,
}

entity.onSpawn = function(npc)
    npc:initNpcAi()
    npc:setPos(xi.path.first(path))
end

entity.onPath = function(npc)
    if npc:atPoint(xi.path.get(path, 45)) then
        GetNPCByID(npc:getID() + 3):showText(npc, ID.text.PALCOMONDAU_REPORT)
        -- small delay after path finish
        npc:wait(8000)
    end

    xi.path.patrol(npc, path)
end

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if player:getQuestStatus(xi.quest.log_id.SANDORIA, xi.quest.id.sandoria.THE_PICKPOCKET) == QUEST_ACCEPTED then
        player:showText(npc, ID.text.PALCOMONDAU_DIALOG + 5)
    else
        player:showText(npc, ID.text.PALCOMONDAU_DIALOG)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
