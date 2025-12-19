return {
	["misc"] = {
		["dictionary"] = {
			["k_relic"] = "Price Tag",
			["k_chaching_ex"] = "Cha-ching!",
			["k_whiteout_ex"] = "Erased!",
			["k_promote_ex"] = "Promoted!",
			["k_hey_ex"] = "Heyo!",
			["k_plus_beta"] = "run>Beta",
			["k_tagged_ex"] = "Tagged!",
			["k_cuckoo_ex"] = "Cuckoo!",
			["k_divide_ex"] = "Mitosis!",
			["k_caught_dream"] = "Caught!",
			["k_stop_ex"] = "Stop!",
			["k_slow_ex"] = "Hold!",
			["k_go_ex"] = "GO!",
			["k_broke_ex"] = "Shattered!",
			["k_snow_ex"] = "Snow!",
			["k_filmcard_ex"] = "Channel!",
			["k_reroll_ex"] = "Reroll!",
			["k_tryone_ex"] = "Get One Free!",
			["k_tryfree_ex"] = "What A Bargain!",
			["k_dug_ex"] = "Excavated!",
			["k_mineral_ex"] = "Mineral!",
			["k_filmpack_ex"] = "Cinema!",
			["k_debuff_tag"] = "Hand is a ",
			["k_locked1"] = "Beat Boss",
			["k_locked2"] = "to Reroll",
			["k_hue"] = "Hue",
			["k_staff"] = "Yoink!",
			["bld_ui_blindcards"] = "Blind Cards",
			["bld_ui_unknown"] = "???",
			["bld_ui_edition"] = "Editions",
			["bld_ui_boosters"] = "Booster Packs",
			["bld_ui_enhance"] = "Trims",
			["bld_ui_trinkets"] = "Trinkets",
			["bld_ui_filmcards"] = "Channels",
			["bld_ui_minerals"] = "Minerals",
			["bld_ui_runes"] = "Runes",
			["bld_ui_jokers"] = "Jokers",
			["bld_ui_tags"] = "Tags",
			["bld_ui_relics"] = "Relics",
			['k_bld_symbol_pack'] = 'Symbol Pack',
			['k_bld_mineral_pack'] = 'Crystalline Pack',
			['bld_3_hands'] = '3 Random Hands',
			['k_bld_filmcard_pack'] = 'Cinema Pack',
			['k_bld_ritual_pack'] = 'Hallow Pack',
			['k_bld_noble_pack'] = 'Noble Pack',
			['ui_bld_deck_view'] = 'Deck View',
			["ph_mask_saved"] = "Saved by Ancient Mask",
			['matryoshka_none'] = "None!",
			['bld_fineart_dead'] = "Devalued!",
			['k_base_blinds'] = "Base Blinds",
			['k_fossil_excavate'] = "Excavated!",
			},
		["v_dictionary"] = {
			["a_rmult"] = "-#1#",
			["a_pchips"] = "-#1#%",
			["ante_x_price_tag"] = "ANTE #1# PRICE TAG",
		},
        ["suits_singular"] = {
			["bld_Red"] = 'Red',
			["bld_Green"] = 'Green',
			["bld_Blue"] = 'Blue',
			["bld_Yellow"] = 'Yellow',
			["bld_Purple"] = 'Purple',
			["bld_Faded"] = 'Faded',
        },
        ["suits_plural"] = {
			["bld_Red"] = 'Red',
			["bld_Green"] = 'Green',
			["bld_Blue"] = 'Blue',
			["bld_Yellow"] = 'Yellow',
			["bld_Purple"] = 'Purple',
			["bld_Faded"] = 'Faded',
        },
        ["labels"] = {
			["bld_upgrade"] = 'Upgraded',
			["bld_enameled"] = 'Enamel',
			["bld_mint"] = 'Mint',
			["bld_finish"] = 'Finish',
			["bld_wild_seal"] = 'Wild Blind',
			["bld_astral_seal"] = 'Astral Blind',
			["bld_floral_seal"] = 'Floral Blind',
			["bld_spooky_seal"] = 'Spooky Blind',
			["bld_ruin_seal"] = 'Ruin Blind',
			["bld_tech_seal"] = 'Tech Blind',
			["bld_hunter_seal"] = 'Hunter Blind',
			["bld_frost_seal"] = 'Frost Blind',
        },
		["poker_hands"] = {
            ['bld_blind_high'] = 'Bet',
            ['bld_blind_2oak'] = 'Pair',
            ['bld_blind_2pair'] = 'Two Pair',
            ['bld_blind_3oak'] = 'Three of a Blind',
            ['bld_blind_flush'] = 'Flush',
            ['bld_blind_fullhouse'] = 'Full House',
            ['bld_raise'] = 'Raise',
            ['bld_blind_4oak'] = 'Four of a Blind',
            ['bld_blind_stack'] = 'Stack',
            ['bld_allin'] = 'All In',
		},
		["poker_hand_descriptions"] = {
            ['bld_blind_high'] = {
                "If the played hand is not any of the above",
                "hands, only the first played Blind scores"
            },
            ['bld_blind_2oak'] = {
                "2 Blinds that share the same hue. They may",
                "be played with up to 3 other unscored Blinds"
            },
            ['bld_blind_2pair'] = {
                "2 pairs of Blinds with different hues, may",
                "be played with 1 other unscored Blind"
            },
            ['bld_blind_3oak'] = {
                "3 Blinds that share the same hue. They may",
                "be played with up to 2 other unscored Blinds"
            },
            ['bld_blind_flush'] = {
                "5 Blinds that share the same hue"
            },
            ['bld_blind_fullhouse'] = {
                "A Three of a Blind and a Pair"
            },
            ['bld_raise'] = {
                "5 Blinds that are different hues"
            },
            ['bld_blind_4oak'] = {
                "4 Blinds that share the same hue. They may",
                "be played with up to 1 other unscored Blind"
            },
            ['bld_blind_stack'] = {
                "A Flush of 5 unique blinds",
            },
            ['bld_allin'] = {
                "5 of the same blind"
            }
		}
	},
	["descriptions"] = {
		["Back"] = {
			["b_bld_whitedispenser"] = {
				["name"] = "White Deck?",
				["text"] = {
					"???",
					"{C:attention}+1{} hand size"
				},
			},
			["b_bld_reddispenser"] = {
				["name"] = "Red Deck?",
				["text"] = {
					"???",
					"{C:attention}+2{} {C:red}discard{} size"
				},
			},
			["b_bld_greendispenser"] = {
				["name"] = "Green Deck?",
				["text"] = {
					"???",
					"{C:attention}+1{} consumable slot",
					"Start with {C:attention,T:v_bld_coolrock}Cool Rock{}",
					"and {C:attention,T:v_bld_television}Television{}",
				},
			},
			["b_bld_blackdispenser"] = {
				["name"] = "Black Deck?",
				["text"] = {
					"???",
					"{C:attention}+1{} Trinket slot",
					"{C:blue}-2{} hands",
				},
			},
			["b_bld_bluedispenser"] = {
				["name"] = "Blue Deck?",
				["text"] = {
					"???",
					"Leftover hands",
					"give {C:money}$2{} each",
					"{C:red}-1{} discard",
				},
			},
			["b_bld_yellowdispenser"] = {
				["name"] = "Yellow Deck?",
				["text"] = {
					"???",
					"Start with {C:attention,T:v_bld_swearjar}Swear Jar",
					"{s:0.2} {}",
					"Extra hands earn",
					"{C:attention}no money"
				},
			},
			["b_bld_painteddispenser"] = {
				["name"] = "Painted Deck?",
				["text"] = {
					"???",
					"{C:attention}+2{} hand size",
					"{C:attention}-1{} Trinket slot",
				},
			}
		},
		['Voucher'] = {
			['v_bld_grabbyhand'] = {
				["name"] = "Grabby Hand",
				["text"] = {
					"+1 {C:blue}Hand{} at",
					"start of round",
				}
			},
			['v_bld_prosthetic'] = {
				["name"] = "Prosthetic",
				["text"] = {
					"+1 {C:blue}Hand{} at",
					"start of round",
				}
			},
			['v_bld_bindle'] = {
				["name"] = "Bindle",
				["text"] = {
					"+1 {C:red}Discard{} at",
					"start of round",
				}
			},
			['v_bld_bagofholding'] = {
				["name"] = "Bag of Holding",
				["text"] = {
					"+1 {C:red}Discard{} at",
					"start of round",
				}
			},
			["v_bld_scissors"] = {
				["name"] = "Scissors",
				["text"] = {
					"Leftmost initial blind or",
					"booster each shop is {C:attention}free"
				},
			},
			["v_bld_swearjar"] = {
				["name"] = "Swear Jar",
				["text"] = {
					"Earn {C:money}interest{} on",
					"held {C:money}money"
					--[["Gain {C:money}$1{} for each",
					"held {C:money}$5{} at end",
					"of round",]]
				},
			},
			["v_bld_magnifyingglass"] = {
				["name"] = "Magnifying Glass",
				["text"] = {
					"Create a {C:attention}Reroll{} Tag after",
					"each {C:attention}Joker{} is defeated"
				},
			},
			["v_bld_meteor"] = {
				["name"] = "Meteor",
				["text"] = {
					"{C:green}1 in 2{} chance to",
					"retrigger {C:bld_obj_mineral}Mineral{} cards"
				},
			},
			["v_bld_timecapsule"] = {
				["name"] = "Time Capsule",
				["text"] = {
					"{C:attention}-1{} Ante",
					"{C:attention}-1{} Hand Size"
				},
			},
			["v_bld_jugglingballs"] = {
				["name"] = "Juggling Balls",
				["text"] = {
					"Create a {C:attention}Juggle{} Tag after",
					"each {C:attention}Boss Joker{} is defeated"
				},
			},
			["v_bld_antidote"] = {
				["name"] = "Antidote",
				["text"] = {
					"{C:attention}+#1#{} shop slot"
				},
			},
			["v_bld_coolrock"] = {
				["name"] = "Cool Rock",
				["text"] = {
					"{C:bld_obj_mineral}Mineral{} cards may appear",
					"in Blind Shops"
				},
			},
			["v_bld_television"] = {
				["name"] = "Television",
				["text"] = {
					"{C:bld_obj_filmcard}Channel{} cards may appear",
					"in Blind Shops"
				},
			},
		},
		["Tag"] = {
			["tag_bld_reroll"] = {
				["name"] = "Reroll Tag",
				["text"] = {
					"{C:attention}1{} free",
					"reroll in shop",
				},
			},
			["tag_bld_grabbyhand_relic"] = {
				["name"] = "Grabby Hand",
				["text"] = {
					"+1 {C:blue}Hand{} at",
					"start of round",
				},
			},
			["tag_bld_prosthetic_relic"] = {
				["name"] = "Prosthetic",
				["text"] = {
					"+1 {C:blue}Hand{} at",
					"start of round",
				},
			},
			["tag_bld_scissors_relic"] = {
				["name"] = "Scissors",
				["text"] = {
					"Leftmost initial blind or",
					"booster each shop is {C:attention}free"
				},
			},
			["tag_bld_swearjar_relic"] = {
				["name"] = "Swear Jar",
				["text"] = {
					"Gain {C:money}$1{} for each",
					"held {C:money}$5{} at end",
					"of round",
				},
			},
			["tag_bld_magnifyingglass_relic"] = {
				["name"] = "Magnifying Glass",
				["text"] = {
					"Create a {C:attention}Reroll{} Tag after",
					"each {C:attention}Joker{} is defeated"
				},
			},
			["tag_bld_meteor_relic"] = {
				["name"] = "Meteor",
				["text"] = {
					"{C:green}1 in 2{} chance to",
					"retrigger {C:bld_obj_mineral}Mineral{} cards"
				},
			},
			["tag_bld_timecapsule_relic"] = {
				["name"] = "Time Capsule",
				["text"] = {
					"{C:attention}-1{} Ante",
					"{C:attention}-1{} Hand Size"
				},
			},
			["tag_bld_jugglingballs_relic"] = {
				["name"] = "Juggling Balls",
				["text"] = {
					"Create a {C:attention}Juggle{} Tag after",
					"each {C:attention}Boss Joker{} is defeated"
				},
			},
			["tag_bld_bindle_relic"] = {
				["name"] = "Bindle",
				["text"] = {
					"+1 {C:red}Discard{} at",
					"start of round",
				},
			},
			["tag_bld_bagofholding_relic"] = {
				["name"] = "Prosthetic",
				["text"] = {	
					"+1 {C:red}Discard{} at",
					"start of round",
				},
			},
			["tag_bld_debuff"] = {
				["name"] = "Debuff Tag",
				["text"] = {
					"If hand is a {C:attention}#1#{},",
					"hand will not score"
				},
			},
			["tag_bld_maxim"] = {
				["name"] = "Max Tag",
				["text"] = {
					"{X:red,C:white}X1.5{} Mult after",
					"hand is scored"
				},
			},
			["tag_bld_wave"] = {
				["name"] = "Wave Tag",
				["text"] = {
					"Every {C:attention}played blind",
					"counts in scoring"
				},
			},
			["tag_bld_symmetry"] = {
				["name"] = "Symmetry Tag",
				["text"] = {
					"{C:green}#1# in #2#{} chance to retrigger",
					"scoring blinds"
				},
			},
			["tag_bld_additive"] = {
				["name"] = "Additive Tag",
				["text"] = {
					"{C:green}#1# in #2#{} chance to enhance",
					"played blinds"
				},
			},
			["tag_bld_recursive"] = {
				["name"] = "Recursive Tag",
				["text"] = {
					"{C:blue}+#1#{} Chips for",
					"each held tag",
					"{C:inactive}({C:blue}+#2#{C:inactive} Chips)"
				},
			},
			["tag_bld_tech"] = {
				["name"] = "Tech Tag",
				["text"] = {
					"Create a random",
					"{C:bld_doodad}Doodad Trinket",
					"{C:inactive}(Must have room)"
				},
			},
			["tag_bld_magic"] = {
				["name"] = "Magic Tag",
				["text"] = {
					"Create a random",
					"{C:bld_curio}Curio Trinket",
					"{C:inactive}(Must have room)"
				},
			},
			["tag_bld_memory"] = {
				["name"] = "Memory Tag",
				["text"] = {
					"Create a random {C:bld_keepsake,E:1}Keepsake",
					"{C:inactive}(Must have room)"
				},
			},
			["tag_bld_game"] = {
				["name"] = "Game Tag",
				["text"] = {
					"Create a random",
					"{C:bld_hobby}Hobby Trinket",
					"{C:inactive}(Must have room)"
				},
			},
			["tag_bld_collector"] = {
				["name"] = "Collector Tag",
				["text"] = {
					"Next opened {C:attention}Symbol Pack",
					"will have editioned blinds"
				},
			},
			["tag_bld_mining"] = {
				["name"] = "Mining Tag",
				["text"] = {
					"Upgrade {C:attention}3{} random",
					"poker hands"
				},
			},
			["tag_bld_wild"] = {
				["name"] = "Wild Tag",
				["text"] = {
					"Copy next used",
					"skip {C:attention}tag{}"
				},
			},
			["tag_bld_video"] = {
				["name"] = "Video Tag",
				["text"] = {
					"Create up to {C:attention}2",
					"{C:bld_obj_filmcard}Channel{} cards",
					"{C:inactive}(Must have room)"
				},
			},
			["tag_bld_capital"] = {
				["name"] = "Capital Tag",
				["text"] = {
					"Gives the total",
					"sell value of all",
					"current {C:attention}Trinkets",
					"{C:inactive}(Max of {C:money}$40{C:inactive})"
				},
			},
			["tag_bld_toss"] = {
				["name"] = "Toss Tag",
				["text"] = {
					"{C:attention}+1{} Hand Size",
					"this round"
				},
			},
			["tag_bld_antidote_relic"] = {
				["name"] = "Antidote",
				["text"] = {
					"{C:attention}+1{} shop slot",
				},
			},
			["tag_bld_strike"] = {
				["name"] = "Strike Tag",
				["text"] = {
					"{C:mult}+#1#{} Mult whenever {C:money}money{} is",
					"earned while scoring"
				},
			},
			["tag_bld_coolrock_relic"] = {
				["name"] = "Cool Rock",
				["text"] = {
					"{C:bld_obj_mineral}Mineral{} cards may appear",
					"in Blind Shops"
				},
			},
			["tag_bld_television_relic"] = {
				["name"] = "Television",
				["text"] = {
					"{C:bld_obj_filmcard}Channel{} cards may appear",
					"in Blind Shops"
				},
			},
			["tag_bld_dental"] = {
				["name"] = "Dental Tag",
				["text"] = {
					"{C:money}$1{} per",
					"played Blind",
					--"next hand"
				},
			},
			["tag_bld_joker"] = {
				["name"] = "Joker Tag",
				["text"] = {
					"{C:mult}+1{} Mult to Joker",
					"each played hand",
				},
			},
		},
		["bld_obj_mineral"] = {
			["c_bld_stibnite"] = {
				["name"] = "Stibnite",
				["text"] = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} Mult and",
                    "{C:chips}+#4#{} chips"
				},
			},
			["c_bld_alexandrite"] = {
				["name"] = "Alexandrite",
				["text"] = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} Mult and",
                    "{C:chips}+#4#{} chips"
				},
			},
			["c_bld_cassiterite"] = {
				["name"] = "Cassiterite",
				["text"] = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} Mult and",
                    "{C:chips}+#4#{} chips"
				},
			},
			["c_bld_cinnabar"] = {
				["name"] = "Cinnabar",
				["text"] = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} Mult and",
                    "{C:chips}+#4#{} chips"
				},
			},
			["c_bld_erythrite"] = {
				["name"] = "Erythrite",
				["text"] = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} Mult and",
                    "{C:chips}+#4#{} chips"
				},
			},
			["c_bld_hematite"] = {
				["name"] = "Hematite",
				["text"] = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} Mult and",
                    "{C:chips}+#4#{} chips"
				},
			},
			["c_bld_malachite"] = {
				["name"] = "Malachite",
				["text"] = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} Mult and",
                    "{C:chips}+#4#{} chips"
				},
			},
			["c_bld_platinum"] = {
				["name"] = "Platinum",
				["text"] = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} Mult and",
                    "{C:chips}+#4#{} chips"
				},
			},
			["c_bld_pyromorphite"] = {
				["name"] = "Pyromorphite",
				["text"] = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} Mult and",
                    "{C:chips}+#4#{} chips"
				},
			},
			["c_bld_scheelite"] = {
				["name"] = "Scheelite",
				["text"] = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} Mult and",
                    "{C:chips}+#4#{} chips"
				},
			},
		},
		["bld_obj_rune"] = {
			["c_bld_betaexe"] = {
				["name"] = "BETA.STR",
				["text"] = {
                    "When {C:attention}active{}, shuffle",
                    "{C:attention}5 BETA.Blinds{} into",
                    "your deck each round.",
                    "{C:inactive}(#1#/#2# Rounds){}"
				},
			},
			["c_bld_orbit"] = {
				["name"] = "Orbit",
				["text"] = {
                    "When {C:attention}active{}, decrease",
                    "{C:attention}Level{} of enemy Joker" ,
                    "{C:inactive}(#1#/#2# Rounds){}"
				},
			},
			["c_bld_halcyon"] = {
				["name"] = "Halcyon",
				["text"] = {
                    "When {C:attention}active{}, retriggers",
                    "all {X:money,C:white}Yellow{} Blinds" ,
                    "{C:inactive}(#1#/#2# Rounds){}"
				},
			},
			["c_bld_montain"] = {
				["name"] = "Montain",
				["text"] = {
                    "When {C:attention}active{}, all Blinds",
                    "are considered {X:dark_edition,C:white}Faded{}" ,
                    "{C:inactive}(#1#/#2# Rounds){}"
				},
			},
			["c_bld_joker404"] = {
				["name"] = "JOKER 404",
				["text"] = {
                    "When {C:attention}active{}",
                    "{X:dark_edition,C:white}JIMBO{} {X:dark_edition,C:white}NOT{} {X:dark_edition,C:white}FOUND" ,
                    "{C:inactive}(#1#/#2# Rounds){}"
				},
			},
			["c_bld_arengeeone"] = {
				["name"] = "Arengee",
				["text"] = {
                    "{C:inactive}Does nothing...?",
					"{C:inactive}(Changes each hand)",
                    "{C:inactive}(#1#/#2# Rounds){}"
				},
			},
			["c_bld_arengeetwo"] = {
				["name"] = "Arengee",
				["text"] = {
                    "{C:money}+#3#${}",
					"{C:inactive}(Changes each hand)",
                    "{C:inactive}(#1#/#2# Rounds){}"
				},
			},
			["c_bld_arengeethree"] = {
				["name"] = "Arengee",
				["text"] = {
                    "Create a random {C:bld_obj_filmcard}Channel{} Card",
					"{C:inactive}(Changes each hand)",
                    "{C:inactive}(#1#/#2# Rounds){}"
				},
			},
			["c_bld_arengeefour"] = {
				["name"] = "Arengee",
				["text"] = {
                    "{C:blue}+#4#{} Chips",
					"{C:inactive}(Changes each hand)",
                    "{C:inactive}(#1#/#2# Rounds){}"
				},
			},
			["c_bld_arengeefive"] = {
				["name"] = "Arengee",
				["text"] = {
                    "{X:red,C:white}X#5#{} Mult",
					"{C:inactive}(Changes each hand)",
                    "{C:inactive}(#1#/#2# Rounds){}"
				},
			},
			["c_bld_arengeesix"] = {
				["name"] = "Arengee",
				["text"] = {
                    "{C:attention}Retrigger{} all scoring blinds",
					"{C:inactive}(Changes each hand)",
                    "{C:inactive}(#1#/#2# Rounds){}"
				},
			},
			["c_bld_exmega"] = {
				["name"] = "Exmega",
				["text"] = {
                    "When {C:attention}active{}, {X:red,C:white}Red{} Blinds",
                    "give {X:red,C:white}X#3#{} Mult and {C:attention}Burn" ,
                    "{C:inactive}(#1#/#2# Rounds){}"
				},
			},
		},
		["bld_obj_ritual"] = {
			["c_bld_prayer"] = {
				["name"] = "Prayer",
				["text"] = {
					"{C:dark_edition,E:1}Upgrade{} #1#",
					"selected Blind",
				},
			},
			["c_bld_sacrifice"] = {
				["name"] = "Sacrifice",
				["text"] = {
					"Destroy {C:attention}#1#{} random",
					"Blinds held in hand",
					"and gain {C:money}#2#$",
				},
			},
			["c_bld_pentagram"] = {
				["name"] = "Pentagram",
				["text"] = {
					"Destroys {C:attention}#1#{} random Blinds,",
					"{C:dark_edition,E:1}Upgrades{} {C:attention}#2#{} random Blinds",
				},
			},
			["c_bld_intervene"] = {
				["name"] = "Intervene",
				["text"] = {
					"{C:dark_edition,E:1}Upgrade{} {C:attention}#1#{} selected",
					"Blinds and {C:attention}reroll{} them",
					"into Blinds of the",
					"same {C:attention}hue"
				},
			},
			["c_bld_evoke"] = {
				["name"] = "Evoke",
				["text"] = {
					"Create up to {C:attention}#1#{}",
					"{C:bld_obj_ritual}Ritual{} cards and",
					"a {C:attention}Joker Tag{}",
					"{C:inactive}(Must have room)"
				},
			},
			["c_bld_invert"] = {
				["name"] = "Invert",
				["text"] = {
					{"Turn an owned",
					"trinket {C:dark_edition}Negative"},
					{"{C:blue}-#1#{} #2#"}
				},
			},
			--[[					"{C:dark_edition,E:1}Upgrade{} {C:attention}#1#",
					"selected Blinds",
					"{C:attention}Destroy{} a random",
					"trinket"]]
		},
		["bld_obj_filmcard"] = {
			["c_bld_horror"] = {
				["name"] = "Horror",
				["text"] = {
					"{C:attention}Enhance{} #1#",
					"selected blind into a",
					"{C:attention}Spooky Blind{}"
				},
			},
			["c_bld_scifi"] = {
				["name"] = "Sci-Fi",
				["text"] = {
					"{C:attention}Enhance{} up to #1#",
					"selected blinds into",
					"{C:attention}Astral Blinds{}"
				},
			},
			["c_bld_adventure"] = {
				["name"] = "Adventure",
				["text"] = {
					"{C:attention}Enhance{} up to #1#",
					"selected blinds into",
					"{C:attention}Floral Blinds{}"
				},
			},
			["c_bld_comedy"] = {
				["name"] = "Comedy",
				["text"] = {
					"{C:attention}Enhance{} #1#",
					"selected blind into a",
					"{C:attention}Wild Blind{}"
				},
			},
			["c_bld_action"] = {
				["name"] = "Action",
				["text"] = {
					"{C:attention}Destroy{} up to #1#",
					"selected blind"
				},
			},
			["c_bld_fantasy"] = {
				["name"] = "Fantasy",
				["text"] = {
					"Gives {C:money}#2#${} for each",
					"unique hue in hand",
					"{C:inactive}(Currently {C:money}$#1#{C:inactive})"
				},
			},
			["c_bld_superhero"] = {
				["name"] = "Superhero",
				["text"] = {
					"Create a {C:attention}copy",
					"of {C:attention}1{} selected blind",
					"in your hand"
				},
			},
			["c_bld_noir"] = {
				["name"] = "Noir",
				["text"] = {
                    "Creates the last",
                    "{C:bld_obj_filmcard}Channel{} card",
                    "used during this run",
                    "{s:0.8,C:bld_obj_filmcard}Noir{s:0.8} excluded"
                }
			},
			["c_bld_musical"] = {
				["name"] = "Musical",
				["text"] = {
                    "Creates up to {C:attention}#1#",
                    "random {C:bld_obj_mineral}Mineral{} cards",
                    "{C:inactive}(Must have room)"
                }
			},
			["c_bld_mystery"] = {
				["name"] = "Mystery",
				["text"] = {
                    "Creates up to {C:attention}#1#",
                    "random {C:attention}Tags{}",
                }
			},
			["c_bld_romance"] = {
				["name"] = "Romance",
				["text"] = {
                    "Add {C:dark_edition}Enamel{}, {C:dark_edition}Finish{}, or",
                    "{C:dark_edition}Mint{} effect to a",
                    "random blind in hand",
                }
			},
			["c_bld_western"] = {
				["name"] = "Western",
				["text"] = {
					"{C:attention}Enhance{} #1#",
					"selected blind into a",
					"{C:attention}Hunter Blind{}"
				},
			},
			["c_bld_historical"] = {
				["name"] = "Historical",
				["text"] = {
					"{C:attention}Enhance{} #1#",
					"selected blind into a",
					"{C:attention}Ruin Blind{}"
				},
			},
			["c_bld_drama"] = {
				["name"] = "Drama",
				["text"] = {
					"{C:attention}Enhance{} #1#",
					"selected blind into a",
					"{C:attention}Frost Blind{}"
				},
			},
			["c_bld_speculative"] = {
				["name"] = "Speculative",
				["text"] = {
					"{C:attention}Enhance{} #1#",
					"selected blind into a",
					"{C:attention}Tech Blind{}"
				},
			},
			["c_bld_crime"] = {
				["name"] = "Crime",
				["text"] = {
					"Create a random",
					"{C:attention}Dual-Hue{} blind",
					"in your hand"
				},
			},
			["c_bld_thriller"] = {
				["name"] = "Thriller",
				["text"] = {
					"Reroll {C:attention}#1#{} selected",
					"blind into a blind",
					"of the same {C:attention}hue{}"
				},
			},
			["c_bld_experimental"] = {
				["name"] = "Experimental",
				["text"] = {
					"Create {C:attention}#1# Reroll{} tag"
				},
			},
			["c_bld_variety"] = {
				["name"] = "Variety",
				["text"] = {
                    "Creates up to {C:attention}#1#",
                    "random {C:bld_obj_filmcard}Channel{} cards",
                    "{C:inactive}(Must have room)"
				},
			},
			["c_bld_sports"] = {
				["name"] = "Sports",
				["text"] = {
                    "Randomly {C:attention}enhance{} up to",
					"{C:attention}#1#{} selected Blinds",
				},
			},
		},
		["Blind"] = {
			["bl_bld_joker"] = {
				["name"] = "Joker",
				["text"] = {
					"Gains +1 Mult",
					"after every hand"
				},
			},
			["bl_bld_lustyjoker"] = {
				["name"] = "Lusty Joker",
				["text"] = {
					"Gains +2 Mult if",
					"scoring hand contains",
					"a Red Blind",
				},
			},
			["bl_bld_gluttonousjoker"] = {
				["name"] = "Gluttonous Joker",
				["text"] = {
					"Gains +2 Mult if",
					"scoring hand contains",
					"a Green Blind",
				},
			},
			["bl_bld_wrathfuljoker"] = {
				["name"] = "Wrathful Joker",
				["text"] = {
					"Gains +2 Mult if",
					"scoring hand contains",
					"a Purple Blind",
				},
			},
			["bl_bld_slothfuljoker"] = {
				["name"] = "Slothful Joker",
				["text"] = {
					"Gains +2 Mult if",
					"scoring hand contains",
					"a Blue Blind",
				},
			},
			["bl_bld_greedyjoker"] = {
				["name"] = "Greedy Joker",
				["text"] = {
					"Gains +2 Mult if",
					"scoring hand contains",
					"a Yellow Blind",
				},
			},
			["bl_bld_slyjoker"] = {
				["name"] = "Sly Joker",
				["text"] = {
					"Once per Round,",
					"Gains X2 Chips if",
					"played hand contains",
					"a Pair",
				},
			},
			["bl_bld_wilyjoker"] = {
				["name"] = "Wily Joker",
				["text"] = {
					"Once per Round,",
					"gains X3 Chips if",
					"played hand contains",
					"a Three of a Blind",
				},
			},
			["bl_bld_cleverjoker"] = {
				["name"] = "Clever Joker",
				["text"] = {
					"Once per Round,",
					"gains X3 Chips if",
					"played hand contains",
					"a Two Pair",
				},
			},
			["bl_bld_deviousjoker"] = {
				["name"] = "Devious Joker",
				["text"] = {
					"Once per Round,",
					"gains X4 Chips if",
					"played hand contains",
					"a Raise",
				},
			},
			["bl_bld_craftyjoker"] = {
				["name"] = "Crafty Joker",
				["text"] = {
					"Once per Round,",
					"gains X4 Chips if",
					"played hand contains",
					"a Flush",
				},
			},
			["bl_bld_photograph"] = {
				["name"] = "Photochad",
				["text"] = {
					"X8 Mult if",
					"first hand",
					"doesn't win",
				},
			},
			["bl_bld_chad"] = {
				["name"] = "Photochad",
				["text"] = {
					"X8 Mult if",
					"first hand",
					"doesn't win",
				},
			},
			["bl_bld_vagabond"] = {
				["name"] = "Vagabond",
				["text"] = {
					"Halves money after",
					"each hand played",
				},
			},
			["bl_bld_stuntman"] = {
				["name"] = "Stuntman",
				["text"] = {
					"Base chips are tripled",
					"+2 Hand Size",
				},
			},
			["bl_bld_council"] = {
				["name"] = "Council",
				["text"] = {
					"X2 Mult if played hand",
					"is a #1#",
				},
			},
			["bl_bld_hittheroad"] = {
				["name"] = "Hit The Road",
				["text"] = {
					"Gains +1 Mult for",
					"each discarded blind",
				},
			},
			["bl_bld_vampire"] = {
				["name"] = "Vampire",
				["text"] = {
					"Removes trims from",
					"played scoring blinds",
					"+0.5 Mult for each",
					"removed trim"
				},
			},
			["bl_bld_campfire"] = {
				["name"] = "Campfire",
				["text"] = {
					"Very large blind until",
					"a trinket is sold",
				},
			},
			["bl_bld_obelisk"] = {
				["name"] = "Obelisk",
				["text"] = {
					"Gains +2 Mult when",
					"playing a repeat",
					"hand type",
				},
			},
			["bl_bld_pareidolia"] = {
				["name"] = "Pareidolia",
				["text"] = {
					"#1# in #2# blinds are",
					"drawn face down",
				},
			},
			["bl_bld_baron"] = {
				["name"] = "Baron's Court",
				["text"] = {
					"Gains +0.5 Mult",
					"for each blind",
					"held in hand"
				},
			},
			["bl_bld_mime"] = {
				["name"] = "Baron's Court",
				["text"] = {
					"Gains +0.5 Mult",
					"for each blind",
					"held in hand"
				},
			},
			["bl_bld_burglar"] = {
				["name"] = "Burglar",
				["text"] = {
					"Play only one hand",
					"Gain 5 discards",
				},
			},
			["bl_bld_yorick"] = {
				["name"] = "Yorick",
				["text"] = {
					"X2 Mult every time",
					"deck is reshuffled",
				},
			},
		},
		["Enhanced"] = {
			["m_bld_adder"] = {
				["name"] = "The Adder",
				["text"] = {
					"{X:chips,C:white}Blue{}",
					"{C:chips}+#1#{} Chips"
				},
			},
			["m_bld_adder_upgraded"] = {
				["name"] = "The Adder",
				["text"] = {
					"{X:chips,C:white}Blue{}",
					"{C:chips}+#1#{} Chips, {C:white,X:chips}X#2#{} Chips"
				},
			},
			["m_bld_beta"] = {
				["name"] = "BETA.Blind",
				["text"] = {
					{"{X:blue,C:white}Blue{}",
					"{C:chips}+#1#{} Chips",
					"Always Scores"},
					{"{C:attention}Temporary"},
				},
			},
			["m_bld_sharp"] = {
				["name"] = "The Sharp",
				["text"] = {
					"{X:mult,C:white}Red{}",
					"{C:mult}+#1#{} Mult"
				},
			},
			["m_bld_sharp_burn"] = {
				["name"] = "The Sharp",
				["text"] = {
					{"{X:mult,C:white}Red{}",
					"{C:mult}+#1#{} Mult"},
					{"{C:attention}Burns{}"}
				},
			},
			["m_bld_flip"] = {
				["name"] = "The Flip",
				["text"] = {
					{"{X:green,C:white}Green{}",
					"{C:mult}+#1#{} Mult or {C:chips}+#4#{} Chips",},
					{"{C:attention,E:1}Self-Scoring{} with a",
					"{C:green}#2# in #3#{} chance"}
				},
			},
			["m_bld_hook"] = {
				["name"] = "The Hook",
				["text"] = {
					{"{X:mult,C:white}Red{}",
					"{C:mult}+#1#{} Mult"},
					{"{C:red}+#2#{} discard",
					"when scored"},
					{"{C:attention}Burns"}
				},
			},
			["m_bld_hoard"] = {
				["name"] = "The Hoard",
				["text"] = {
					{"{X:mult,C:white}Red{}",
					"{C:mult}+#1#{} Mult"},
					{"{X:mult,C:white}X#2#{} Mult if you own",
					"{C:attention}3{} or less {C:attention}Trinkets{}"}
				},
			},
			["m_bld_blood"] = {
				["name"] = "The Blood",
				["text"] = {
					{"{X:mult,C:white}Red{}",
					"Currently {C:mult}+#1#{} Mult"},
					{"When played, {C:attention}destroys{}",
					"the leftmost owned trinket",
					"and gains {C:mult}+#2#{} Mult"},
				},
			},
			["m_bld_fire"] = {
				["name"] = "The Fire",
				["text"] = {
					{"{X:mult,C:white}Red{}",
					"{C:chips}+#1#{} Chips"},
					{"{C:attention}Burns{}"}
				},
			},
			["m_bld_ox"] = {
				["name"] = "The Ox",
				["text"] = {
					{"{X:money,C:white}Yellow{}",
					"{C:money}+#1#${} if played",
					"{C:attention}poker hand{} is most",
					"played this run"},
					{"Otherwise, {C:mult}+#2#{} Mult"}
				},
			},
			["m_bld_ox_upgraded"] = {
				["name"] = "The Ox",
				["text"] = {
					{"{X:money,C:white}Yellow{}",
					"{C:money}+#1#${} if played",
					"{C:attention}poker hand{} is most",
					"played this run"},
					{"Otherwise, {C:mult}+#2#{} Mult"},
					{"Also scores when",
					"{C:attention}held in hand"}
				},
			},
			["m_bld_wall"] = {
				["name"] = "The Wall",
				["text"] = {
					{"{X:purple,C:white}Purple{}",
					"Currently {X:mult,C:white}X#1#{} Mult"},
					{"Gains {X:mult,C:white}X#2#{} Mult",
					"after being played"},
					{"Always scores"},
				},
			},
			["m_bld_wall_upgraded"] = {
				["name"] = "The Wall",
				["text"] = {
					{"{X:purple,C:white}Purple{}",
					"Currently {X:mult,C:white}X#1#{} Mult"},
					{"Gains {X:mult,C:white}X#2#{} Mult",
					"after being played"},
					{"Always scores, and",
					"scores {C:attention}held in hand"},
				},
			},
			["m_bld_house"] = {
				["name"] = "The House",
				["text"] = {
					{"{X:blue,C:white}Blue{}",
					"{C:chips}+#1#{} Chips"},
					{"Always scores and",
					"{C:attention}returns{} other played",
					"blinds back to hand"},
					{"Drawn {C:attention}face down{}"},
				},
			},
			["m_bld_house_upgraded"] = {
				["name"] = "The House",
				["text"] = {
					{"{X:blue,C:white}Blue{}",
					"{C:chips}+#1#{} Chips, {C:white,X:chips}X#2#{} Chips"},
					{"Always scores and",
					"{C:attention}returns{} other played",
					"blinds back to hand"},
					{"Drawn {C:attention}face down{}"},
				},
			},
			["m_bld_arm"] = {
				["name"] = "The Arm",
				["text"] = {
					{"{X:purple,C:white}Purple{}",
					"{C:bld_obj_mineral}Upgrades{} played hand"},
					{"{C:attention,E:1}Self-Scoring{} with a",
					"{C:green}#1# in #2#{} chance"}
				},
			},
			["m_bld_arm_upgrade"] = {
				["name"] = "The Arm",
				["text"] = {
					{"{X:purple,C:white}Purple{}",
					"{C:bld_obj_mineral}Upgrades{} played hand"},
					{"Always Scores"},
				},
			},
			["m_bld_club"] = {
				["name"] = "The Club",
				["text"] = {
					{"{X:money,C:white}Yellow{} {X:dark_edition,C:white}Faded{}",
					"{C:mult}+#1#{} Mult",
					"{X:mult,C:white}X#2#{} Mult"},
					{"{C:red}Debuffs{} all",
					"scoring {X:mult,C:white}Red{} Blinds",}
				},
			},
			["m_bld_fish"] = {
				["name"] = "The Fish",
				["text"] = {
					{"{X:blue,C:white}Blue{}",
					"{X:chips,C:white}X1{} Chips, and {X:chips,C:white}+X#1#{}",
					"for each Blind",
					"{C:attention}held in hand"},
					{"Flips all Blinds",
					"{C:attention}held in hand",
					"until round end"},
				},
			},
			["m_bld_path"] = {
				["name"] = "The Path",
				["text"] = {
					{"{X:red,C:white}Red{} {X:blue,C:white}Blue{}",
					"{C:mult}+#1#{} Mult"},
					{"If {C:attention}held in hand{} while",
					"played hand contains {C:attention}Two Pair{},",
					"{C:mult}+#1#{} Mult before scoring"},
				},
			},
			["m_bld_path_upgraded"] = {
				["name"] = "The Path",
				["text"] = {
					{"{X:red,C:white}Red{} {X:blue,C:white}Blue{}",
					"{C:mult}+#1#{} Mult"},
					{"If {C:attention}held in hand{} while",
					"played hand contains {C:attention}Pair{},",
					"{C:mult}+#1#{} Mult before scoring"},
				},
			},
			["m_bld_wheel"] = {
				["name"] = "The Wheel",
				["text"] = {
					{"{X:green,C:white}Green{}",
					"{C:chips}+#1#{} Chips"},
					{"{C:attention,E:1}Self-Scoring{} with a",
					"{C:green}#2# in #3#{} chance"},
					{"Drawn {C:attention}face down{}"},
				},
			},
			["m_bld_thorn"] = {
				["name"] = "The Thorn",
				["text"] = {
					{"{X:green,C:white}Green{} {X:red,C:white}Red",
					"{C:mult}-#1#{} Mult to {C:attention}Joker"},
					{"{C:attention,E:1}Self-Scoring{} with a",
					"{C:green}#2# in #3#{} chance"},
				},
			},
			["m_bld_clover"] = {
				["name"] = "The Clover",
				["text"] = {
					{"{X:money,C:white}Yellow{} {X:green,C:white}Green{}",
					"{X:mult,C:white}X#1#{} Mult"},
					{"{C:attention,E:1}Self-Scoring{} with a",
					"{C:green}#2# in #3#{} chance"},
					{"{C:green}Chance{} increases",
					"for each {C:attention}Tag{} held"}
				},
			},
			["m_bld_wedge"] = {
				["name"] = "The Wedge",
				["text"] = {
					{"{X:green,C:white}Green{}",
					"When {C:red}discarded{}, play",
					"discarded hand"},
					{"Always Scores",
					"and {C:attention}Burns{}"}
				},
			},
			["m_bld_wedge_upgraded"] = {
				["name"] = "The Wedge",
				["text"] = {
					{"{X:green,C:white}Green{}",
					"When {C:red}discarded{}, play",
					"discarded hand"},
					{"Always Scores"}
				},
			},
			["m_bld_cell"] = {
				["name"] = "The Cell",
				["text"] = {
					{"{X:green,C:white}Green{}",
					"{C:chips}+#1#{} Chips for each",
					"{X:green,C:white}Green{} blind in full deck",
					"{C:inactive}(Currently {C:chips}+#4#{C:inactive} Chips)"},
					{"{C:green}#2# in #3#{} chance to",
					"copy after scoring",},
					{"{C:attention}Burns"}
				},
			},
			["m_bld_psychic"] = {
				["name"] = "The Psychic",
				["text"] = {
					"{X:money,C:white}Yellow{}",
					"If scoring hand",
					"conatins 5 Blinds, creates a",
					"{C:chips,E:1}Wave Tag{} and {C:attention}burns{}"
				},
			},
			["m_bld_psychic_upgraded"] = {
				["name"] = "The Psychic",
				["text"] = {
					"{X:money,C:white}Yellow{}",
					"Creates a",
					"{C:chips,E:1}Wave Tag{}",
					"and {C:attention}burns{}"
				},
			},
			["m_bld_goad"] = {
				["name"] = "The Goad",
				["text"] = {
					{"{X:purple,C:white}Purple{}",
					"{C:chips}+#1#{} Chips"},
					{"Creates a {C:red}Debuff Tag{}",
					"for played hand"},
				},
			},
			["m_bld_blend"] = {
				["name"] = "The Blend",
				["text"] = {
					{"{X:purple,C:white}Purple{}",
					"Creates up to",
					"{C:attention}2{} random {C:bld_obj_filmcard}Channel{} cards",
					"{C:inactive,S:0.8}(Must have room)"},
					{"{C:red}Debuffs{} all scoring",
					"{X:mult,C:white}Red{} and {X:chips,C:white}Blue{} Blinds"},
				},
			},
			["m_bld_blend_upgraded"] = {
				["name"] = "The Blend",
				["text"] = {
					{"{X:purple,C:white}Purple{}",
					"Creates a random",
					"{C:bld_obj_ritual,E:1}Ritual{} card",
					"{C:inactive,S:0.8}(Must have room)"},
					{"{C:red}Debuffs{} all scoring",
					"{X:mult,C:white}Red{} and {X:chips,C:white}Blue{} Blinds"},
				},
			},
			["m_bld_bolt"] = {
				["name"] = "The Bolt",
				["text"] = {
					{"{X:purple,C:white}Purple{} {X:money,C:white}Yellow{}",
					"{C:bld_obj_mineral}Upgrades{} played hand"},
					{"Creates a {C:red}Debuff Tag{}",
					"for played hand"},
				},
			},
			["m_bld_bolt_upgraded"] = {
				["name"] = "The Bolt",
				["text"] = {
					{"{X:purple,C:white}Purple{} {X:money,C:white}Yellow{}",
					"{C:bld_obj_mineral}Upgrades{} played",
					"hand twice"},
					{"Creates a {C:red}Debuff Tag{}",
					"for played hand"},
				},
			},
			["m_bld_ore"] = {
				["name"] = "The Ore",
				["text"] = {
					{"{X:money,C:white}Yellow{}",
					"{C:money}+#1#${} and creates",
					"a {C:attention}Max Tag"},
					{"{C:attention}Burns"},
				},
			},
			["m_bld_paint"] = {
				["name"] = "The Paint",
				["text"] = {
					"{X:money,C:white}Yellow{}",
					"{C:money}+#1#${} for each",
					"{C:attention}Tag{} held",
				},
			},
			["m_bld_skull"] = {
				["name"] = "The Skull",
				["text"] = {
					{"{X:purple,C:white}Purple{}",
					"Currently {X:mult,C:white}X#2#{} Mult"},
					{"{C:attention}Destroys{} a random",
					"played, unscored Blind and",
					"gains {X:mult,C:white}X#1#{} Mult"},
				},
			},
			["m_bld_water"] = {
				["name"] = "The Water",
				["text"] = {
					{"{X:chips,C:white}Blue{} {X:dark_edition,C:white}Faded{}",
					"Currently {X:chips,C:white}X#1#{} Chips"},
					{"When played,",
					"gains {X:chips,C:white}X#2#{} Chips"},
					{"{C:attention}Burns"},
				},
			},
			["m_bld_bones"] = {
				["name"] = "The Bones",
				["text"] = {
					"{X:green,C:white}Green{} {X:dark_edition,C:white}Faded{}",
					"Increases all {C:green,E:1}probabilities{}",
					"by {C:green}#1#{} this hand",
				},
			},
			["m_bld_bones_upgrade"] = {
				["name"] = "The Bones",
				["text"] = {
					"{X:green,C:white}Green{} {X:dark_edition,C:white}Faded{}",
					"Increases all {C:green,E:1}probabilities{}",
					"by {C:green}#1#{} this hand when scored",
					"or held in hand",
				},
			},
			["m_bld_fruit"] = {
				["name"] = "The Fruit",
				["text"] = {
					{"{X:red,C:white}Red{} {X:dark_edition,C:white}Faded{}",
					"Retriggers all scoring",
					"{X:red,C:white}Red{} Blinds"},
					{"{C:red}Debuffs{} all adjacent",
					"played blinds"},
				},
			},
			["m_bld_fruit_upgraded"] = {
				["name"] = "The Fruit",
				["text"] = {
					"{X:red,C:white}Red{} {X:dark_edition,C:white}Faded{}",
					"Retriggers all scoring",
					"{X:red,C:white}Red{} Blinds",
				},
			},
			["m_bld_window"] = {
				["name"] = "The Window",
				["text"] = {
					{"{X:dark_edition,C:white}Faded{}",
					"{C:money}+#1#${}"},
					{"{C:red}Debuffs{} all",
					"scoring {X:money,C:white}Yellow{} Blinds"},
				},
			},
			["m_bld_manacle"] = {
				["name"] = "The Manacle",
				["text"] = {
					{"{X:dark_edition,C:white}Faded{}",
					"Retriggers all",
					"{C:attention}scored blinds"},
					{"Always Scores"},
					{"If played hand conatins",
					"{C:attention}5{} Blinds, {C:red}debuffs{} self",}
				},
			},
			["m_bld_manacle_upgraded"] = {
				["name"] = "The Manacle",
				["text"] = {
					{"{X:dark_edition,C:white}Faded{}",
					"Retriggers all",
					"{C:attention}scored blinds"},
					{"Always Scores"},
				},
			},
			["m_bld_pot"] = {
				["name"] = "The Pot",
				["text"] = {
					"{X:money,C:white}Yellow{}",
					"{C:money}+#1#${} when scored",
					"or held in hand",
				},
			},
			["m_bld_price"] = {
				["name"] = "The Price",
				["text"] = {
					"{X:money,C:white}Yellow{}",
					"{C:mult}+#1#{} Mult",
					"{C:money}-#2#${}",
				},
			},
			["m_bld_eye"] = {
				["name"] = "The Eye",
				["text"] = {
					{"{X:blue,C:white}Blue{}",
					"{C:mult}+#2#{} Mult"},
					{"{X:chips,C:white}X#1#{} Chips while",
					"{C:attention}held in hand{}"},
				},
			},
			["m_bld_eye_upgrade"] = {
				["name"] = "The Eye",
				["text"] = {	
					{"{X:blue,C:white}Blue{}",
					"{C:mult}+#2#{} Mult"},
					{"{X:chips,C:white}X#1#{} Chips while",
					"{C:attention}held in hand{}"},
					{"{C:green}Retained"},
				},
			},
			["m_bld_peace"] = {
				["name"] = "The Peace",
				["text"] = {
					"{X:blue,C:white}Blue{}",
					"While {C:attention}held in hand{},",
					"gives {C:chips}+#1#{} Chips for each",
					"Blind {C:attention}held in hand",
				},
			},
			["m_bld_lantern"] = {
				["name"] = "The Lantern",
				["text"] = {
					"{X:blue,C:white}Blue{}",
					"{X:blue,C:white}X#1#{} Chips if poker",
					"hand does not contain",
					"{C:attention}Three of a Blind{}"
					--[[{"{X:blue,C:white}Blue{}",
					"Currently {X:blue,C:white}X#1#{} Chips"},
					{"If poker hand does not",
					"contain {C:attention}Three of a Blind{},",
					"gains {X:blue,C:white}X#2#{} Chips"},]]
				},
			},
			["m_bld_meteor"] = {
				["name"] = "The Meteor",
				["text"] = {
					{"{X:blue,C:white}Blue{}",
					"{C:chips}+#1#{} Chips"},
					{"Hand must",
					"be {C:attention}Bet"},
				},
			},
			["m_bld_meteor_upgraded"] = {
				["name"] = "The Meteor",
				["text"] = {
					{"{X:blue,C:white}Blue{}",
					"{C:chips}+#1#{} Chips"},
					{"Hand must be",
					"{C:attention}Bet or {C:attention}Pair"},
				},
			},
			["m_bld_joy"] = {
				["name"] = "The Joy",
				["text"] = {
					"{X:blue,C:white}Blue{} {X:money,C:white}Yellow",
					"{C:chips}+#1#{} Chips for",
					"every {C:money}#3#${} held",
					"{C:inactive}(Currently: {C:blue}+#2#{C:inactive} Chips)",
				},
			},
			["m_bld_hat"] = {
				["name"] = "The Hat",
				["text"] = {
					"{X:dark_edition,C:white}Faded{}",
					"When scored, gives a",
					"{C:green,E:1}varied{} effect",
				},
			},
			["m_bld_hat_upgraded"] = {
				["name"] = "The Hat",
				["text"] = {
					"{X:dark_edition,C:white}Faded{}",
					"When scored or {C:attention}held",
					"{C:attention}in hand{}, gives a",
					"{C:green,E:1}varied{} effect",
				},
			},
			["m_bld_earth"] = {
				["name"] = "The Earth",
				["text"] = {
					{"{X:green,C:white}Green{}",
					"Retrigger all",
					"scoring Blinds"},
					{"{C:attention,E:1}Self-Scoring{} with a",
					"{C:green}#1# in #2#{} chance"},
				},
			},
			["m_bld_earth_upgraded"] = {
				["name"] = "The Earth",
				["text"] = {
					"{X:green,C:white}Green{}",
					"Retrigger all",
					"scoring Blinds"
				},
			},
			["m_bld_mouth"] = {
				["name"] = "The Mouth",
				["text"] = {
					{"{X:purple,C:white}Purple{}",
					"{X:mult,C:white}X#1#{} Mult"},
					{"{C:red}Debuffed{} if hand has not",
					"been played this round"},
				},
			},
			["m_bld_plant"] = {
				["name"] = "The Plant",
				["text"] = {
					{"{X:green,C:white}Green{}",
					"{X:mult,C:white}X#1#{} Mult"},
					{"{C:green}#2# in #3#{} chance to {C:red}debuff",
					"all other played Blinds"},
				},
			},
			["m_bld_serpent"] = {
				["name"] = "The Serpent",
				["text"] = {
					{"{X:green,C:white}Green{}",
					"The next time you",
					"draw from the deck, draw",
					"{C:attention}#1#{} additional Blinds",},
					{"Always Scores"},
				},
			},
			["m_bld_pillar"] = {
				["name"] = "The Pillar",
				["text"] = {
					{"{X:dark_edition,C:white}Faded{}",
					"Once per {C:attention}Ante{},",
					"{X:mult,C:white}X#1#{} Mult",
					"{C:inactive}(Currently: #2#)"},
					{"Otherwise, {C:mult}+#3#{} Mult",
					"and {C:attention}Burns"},
				},
			},
			["m_bld_pillar_inactive"] = {
				["name"] = "The Pillar",
				["text"] = {
					{"{X:dark_edition,C:white}Faded{}",
					"{C:inactive}Once per Ante,",
					"{X:inactive,C:white}X#1#{C:inactive} Mult",
					"{C:inactive}(Currently: #2#)"},
					{"Otherwise, {C:mult}+#3#{} Mult",
					"and {C:attention}Burns"},
				},
			},
			["m_bld_needle"] = {
				["name"] = "The Needle",
				["text"] = {
					{"{X:green,C:white}Green{}",
					"If in {C:attention}first played hand{}",
					"of round, {X:mult,C:white}X#1#{} Mult"},
					{"Otherwise, {C:mult}+#2#{} Mult",
					"and {C:attention}Burns"},
				},
			},
			["m_bld_needle_inactive"] = {
				["name"] = "The Needle",
				["text"] = {
					{"{X:green,C:white}Green{}",
					"{C:inactive}If in first played hand",
					"{C:inactive}of round, {X:inactive,C:white}X#1#{} {C:inactive}Mult"},
					{"Otherwise, {C:mult}+#2#{} Mult",
					"and {C:attention}Burns"},
				},
			},
			["m_bld_head"] = {
				["name"] = "The Head",
				["text"] = {
					{"{X:purple,C:white}Purple{} {X:dark_edition,C:white}Faded{}",
					"{X:mult,C:white}+X#1#{} Mult for each",
					"debuffed {X:purple,C:white}Purple{} Blind"},
					{"{C:red}Debuffs{} all scoring ",
					"{X:purple,C:white}Purple{} Blinds"},
				},
			},
			["m_bld_tooth"] = {
				["name"] = "The Tooth",
				["text"] = {
					"{X:red,C:white}Red{}",
					"{C:money}+#1#${} for each Blind",
					"in {C:attention}played hand",
				},
			},
			["m_bld_tooth_upgraded"] = {
				["name"] = "The Tooth",
				["text"] = {
					"{X:red,C:white}Red{}",
					"{C:money}+#1#${} and {C:mult}+#2# Mult{}",
					"for each Blind",
					"in {C:attention}played hand",
				},
			},
			["m_bld_flint"] = {
				["name"] = "The Flint",
				["text"] = {
					{"{X:money,C:white}Yellow{}",
					"{C:money}+#2#${} when scored"},
					{"{C:mult}+#1#{} Mult while",
					"{C:attention}held in hand{}"},
				},
			},
			["m_bld_mark"] = {
				["name"] = "The Mark",
				["text"] = {
					{"{X:red,C:white}Red{}",
					"{X:mult,C:white}X#1#{} Mult"},
					{"Drawn face down"},
					{"Always scores"},
				},
			},
			["m_bld_blank"] = {
				["name"] = "The Blank",	
				["text"] = {
					{"{X:dark_edition,C:white}Faded{}",
					"Retriggers",
					"{C:attention}adjacent Blinds"},
					{"Always scores"},
				},
			},
			["m_bld_deck"] = {
				["name"] = "The Deck",	
				["text"] = {
					{"{X:chips,C:white}Blue{}",
					"{C:chips}+#1#{} Chips for each",
					"remaining blind in deck",
					"{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)"},
					{"{C:green}Retained"}
				},
			},
			["m_bld_vast"] = {
				["name"] = "The Vast",
				["text"] = {
					"{X:chips,C:white}Blue{}",
					"While held in hand,",
					"if scoring hand contains",
					"{C:attention}#1#{} {X:chips,C:white}Blue{} Blinds, creates a",
					"random {C:attention}Mineral{} card",
					"{C:inactive,S:0.8}(Must have room)"
				},
			},
			["m_bld_vast_upgraded"] = {
				["name"] = "The Vast",
				["text"] = {
					"{X:chips,C:white}Blue{}",
					"While held in hand,",
					"if scoring hand contains",
					"a {X:chips,C:white}Blue{} Blind, creates a",
					"random {C:attention}Mineral{} card",
					"{C:inactive,S:0.8}(Must have room)"
				},
			},
			["m_bld_pile"] = {
				["name"] = "The Pile",	
				["text"] = {
					{"{X:chips,C:white}Blue{}",
					"{C:chips}+#2#{} Chips"},
					{"{C:green}Retain{} all cards",
					"{C:attention}held in hand"},
				},
			},
			["m_bld_pile_upgraded"] = {
				["name"] = "The Pile",
				["text"] = {
					{"{X:chips,C:white}Blue{}",
					"{C:chips}+#2#{} Chips"},
					{"{C:green}Retain{} all cards",
					"{C:attention}held in hand"},
					{"{C:green}Retained"}
				},
			},
			["m_bld_top"] = {
				["name"] = "The Top",	
				["text"] = {
					{"{X:chips,C:white}Blue{} {X:purple,C:white}Purple{}",
					"Currently {C:chips}+#2#{} Chips"},
					{"Gains {C:chips}+#1#{} Chips for",
					"each blind {C:attention}held in hand{}"},
				},
			},
			["m_bld_air"] = {
				["name"] = "The Air",	
				["text"] = {
					"{X:dark_edition,C:white}Faded{}",
					"Makes a {C:attention,E:1}copy{} of an",
					"adjacent scoring Blind",
					"and {C:attention}Burns"
				},
			},
			["m_bld_air_upgrade"] = {
				["name"] = "The Air",	
				["text"] = {
					"{X:dark_edition,C:white}Faded{}",
					"Makes a {C:attention,E:1}copy{} of an",
					"adjacent scoring Blind",
				},
			},
			["m_bld_hammer"] = {
				["name"] = "The Hammer",	
				["text"] = {
					"{X:dark_edition,C:white}Faded{}",
					"While {C:attention}held in hand{},",
					"retrigger {C:attention}first{} scoring",
					"Blind {C:attention}#1#{} times"
				},
			},
			["m_bld_hammer_upgraded"] = {
				["name"] = "The Hammer",
				["text"] = {
					"{X:dark_edition,C:white}Faded{}",
					"While {C:attention}held in hand{},",
					"retrigger {C:attention}first{} and {C:attention}last{}",
					"scoring Blinds {C:attention}#1#{} times"
				},
			},
			["m_bld_sun"] = {
				["name"] = "The Sun",
				["text"] = {
					{"{X:money,C:white}Yellow{}",
					"{C:money}+#1#${} when {C:attention}held in hand",
					"at end of round"},
					{"{C:green}Retained"}
				},
			},
			["m_bld_alert"] = {
				["name"] = "The Alert",
				["text"] = {
					{"{X:money,C:white}Yellow{}",
					"Currently {C:mult}+#1#{} Mult"},
					{"Gains {C:red}+#2#{} Mult",
					"when scored"},
					{"Flips all Blinds",
					"{C:attention}held in hand",
					"until round end"},
				},
			},
			["m_bld_bronze"] = {
				["name"] = "The Bronze",
				["text"] = {
					"{X:red,C:white}Red{}",
					"{X:mult,C:white}X1{} Mult, and {X:mult,C:white}+X#1#{}",
					"for each flipped Blind",
					"{C:attention}held in hand"
				},
			},
			["m_bld_door"] = {
				["name"] = "The Door",	
				["text"] = {
					{"{X:red,C:white}Red{} {X:dark_edition,C:white}Faded{} {X:blue,C:white}Blue{}",
					"{X:green,C:white}Green{} {X:money,C:white}Yellow{} {X:purple,C:white}Purple{}"},
					{"{X:red,C:white}X#1#{} Mult",
					"{C:blue}+#2#{} Chips"},
					{"Always scores",}
				},
			},
			["m_bld_lock"] = {
				["name"] = "The Lock",	
				["text"] = {
					{"{X:dark_edition,C:white}Faded{}",
					"{C:blue}+#1#{} Chips"},
					{"Always scores"},
				},
			},
			["m_bld_lock_upgraded"] = {
				["name"] = "The Lock",	
				["text"] = {
					{"{X:dark_edition,C:white}Faded{}",
					"{C:blue}+#1#{} Chips"},
					{"Always scores"},
					{"Retriggers once"},
				},
			},
			["m_bld_key"] = {
				["name"] = "The Key",	
				["text"] = {
					{"{X:dark_edition,C:white}Faded{}",
					"{X:red,C:white}X#1#{} Mult"},
					{"Always scores"},
				},
			},
			["m_bld_atomic"] = {
				["name"] = "The Atomic",
				["text"] = {
					{"{X:money,C:white}Yellow{} {X:green,C:white}Green{}",
					"Gives a {C:attention}Max Tag{}"},
					{"Retriggers {C:attention}#1#{} times"},
					{"{C:green}#2# in #3#{} chance to",
					"{C:attention}burn{} all blinds played",
					"or held in hand"}
				}
			},
			["m_bld_deep"] = {
				["name"] = "The Deep",
				["text"] = {
					{"{X:chips,C:white}Blue{} {X:dark_edition,C:white}Faded{}",
					"While held in hand,",
					"all {X:chips,C:white}Blue{} Blinds in hand",
					"give {X:chips,C:white}X1.5{} Chips"},
					{"Unplayable",
					"IMPLEMENT CURSE LATER!"}
				}
			},
			["m_bld_bell"] = {
				["name"] = "The Bell",	
				["text"] = {
					{"{X:green,C:white}Green{}",
					"Currently {C:chips}+#2#{} Chips"},
					{"Gains {C:chips}+#1#{} Chips when",
					"deck is {C:attention}reshuffled{}"},
					{"{C:attention}Resets{} each round"}
				},
			},
			["m_bld_butterfly"] = {
				["name"] = "The Butterfly",	
				["text"] = {
					{"{X:green,C:white}Green{} {X:chips,C:white}Blue{}",
					"{X:chips,C:white}X#1#{} Chips"},
					{"{C:attention,E:1}Self-Scoring{} with a",
					"{C:green}#2# in #3#{} chance"},
				},
			},
			["m_bld_moon"] = {
				["name"] = "The Moon",
				["text"] = {
					{"{X:money,C:white}Yellow{}",
					"{C:mult}+#1#{} Mult for",
					"each {C:attention}Tag{} held",
					"{C:inactive}(Currently: {C:mult}+#2#{C:inactive} Mult)"},
					{"Creates a random {C:attention}Tag{}",
					"when discarded"}

				},
			},
			["m_bld_dove"] = {
				["name"] = "The Dove",
				["text"] = {
					{"{X:green,C:white}Green{}",
					"{C:chips}+#1#{} Chips"},
					{"{C:attention,E:1}Self-Scoring{} with a",
					"{C:green}#2# in #3#{} chance"},
					{"{C:green}#2# in #3#{} chance to",
					"score held in hand"}
				},
			},
			["m_bld_staff"] = {
				["name"] = "The Staff",
				["text"] = {
					{"{X:purple,C:white}Purple{}",
					"Randomly {C:attention}enhance{} a",
					"random scoring Blind,",
					"then {C:attention}burn{} it"},
					{"Always scores"}
				},
			},
			["m_bld_staff_upgraded"] = {
				["name"] = "The Staff",
				["text"] = {
					{"{X:purple,C:white}Purple{}",
					"Randomly {C:attention}enhance{} a",
					"random scoring Blind"},
					{"Always scores"}
				},
			},
			["m_bld_bite"] = {
				["name"] = "The Bite",
				["text"] = {
					{"{X:purple,C:white}Purple{}",
					"{X:mult,C:white}X#1#{} Mult"},
					{"{C:red}Debuffs{} all scoring",
					"{C:white,X:red}Red{} Blinds"},
				},
			},
			["m_bld_snow"] = {
				["name"] = "The Snow",
				["text"] = {
					{"{X:purple,C:white}Purple{}",
					"Currently {C:chips}+#1#{} Chips"},
					{"When held in hand,",
					"gains {C:chips}+#2#{} Chips",
					"and is {C:green}retained"},
					{"After being scored, loses",
					"all accumulated {C:chips}Chips{}"},
				},
			},
			["m_bld_clay"] = {
				["name"] = "The Clay",
				["text"] = {
					"{X:mult,C:white}Red{}",
					"{X:mult,C:white}X1{} Mult, and {X:mult,C:white}+X#1#{}",
					"for each Blind {C:attention}burned{}",
					"this round",
					"{C:inactive}(Currently: {X:mult,C:white}X#2#{C:inactive} Mult)",
				},
			},
			["m_bld_wound"] = {
				["name"] = "The Wound",
				["text"] = {
					{"{X:mult,C:white}Red{}"},
					{"{C:attention}Burns{}"}
				},
			},
			["m_bld_wound_upgraded"] = {
				["name"] = "The Wound",
				["text"] = {
					{"{X:mult,C:white}Red{}",
					"{X:mult,C:white}X#1#{} Mult"},
					{"{C:attention}Burns{}"}
				},
			},
			["m_bld_claw"] = {
				["name"] = "The Claw",
				["text"] = {
					{"{X:mult,C:white}Red{} {X:purple,C:white}Purple",
					"{C:mult}+#1#{} Mult for each",
					"copy of {C:attention}The Wound{}",
					"in full deck",
					"{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)"},
					{"After scoring, creates",
					"a copy of {C:attention}The Wound{}",
					"in hand"}
				},
			},
			["m_bld_cloth"] = {
				["name"] = "The Cloth",
				["text"] = {
					"{X:mult,C:white}Red{}",
					"When {C:attention}discarded{}, levels up",
					"discarded hand and {C:attention}Burns",
				},
			},
			["m_bld_cloth_upgraded"] = {
				["name"] = "The Cloth",
				["text"] = {
					"{X:mult,C:white}Red{}",
					"When {C:attention}discarded{}, levels",
					"up discarded hand",
				},
			},
			["m_bld_ghost"] = {
				["name"] = "The Ghost",
				["text"] = {
					{"{X:purple,C:white}Purple{} {X:green,C:white}Green{}",
					"{V:1}Balances{} {C:blue}Chips{} and {C:red}Mult",},
					{"{C:attention,E:1}Self-Scoring{} with a",
					"{C:green}#1# in #2#{} chance"}
				},
			},
			["m_bld_ball"] = {
				["name"] = "The Ball",
				["text"] = {
					"{X:purple,C:white}Purple{}",
					"Creates a {C:attention}Toss Tag",
					"and {C:attention}Burns",
				},
			},
			["m_bld_ball_upgraded"] = {
				["name"] = "The Ball",
				["text"] = {
					"{X:purple,C:white}Purple{}",
					"Creates a {C:attention}Toss Tag"
				},
			},
			["m_bld_spear"] = {
				["name"] = "The Spear",
				["text"] = {
					"{X:mult,C:white}Red{} {X:money,C:white}Yellow{}",
					"If scoring hand",
					"conatins at least",
					"3 Blinds, creates a",
					"{C:mult,E:1}Strike Tag{} and {C:attention}burns{}"
				},
			},
			["m_bld_spear_upgraded"] = {
				["name"] = "The Spear",
				["text"] = {
					{"{X:mult,C:white}Red{} {X:money,C:white}Yellow{}",
					"{C:money}+#1#${}"},
					{"If scoring hand",
					"conatins at least",
					"3 Blinds, creates a",
					"{C:mult,E:1}Strike Tag{} and {C:attention}burns{}"}
				},
			},
			["m_bld_line"] = {
				["name"] = "The Line",
				["text"] = {
					{"{X:purple,C:white}Purple{}",
					"Currently {X:mult,C:white}X#1#{} Mult"},
					{"Removes all {C:red}discards{}",
					"before scoring, and gains",
					"{X:mult,C:white}X#2#{} Mult for each"},
				},
			},
			["m_bld_tears"] = {
				["name"] = "The Tears",
				["text"] = {
					{"{X:chips,C:white}Blue{}",
					"{C:chips}+#1#{} Chips"},
					{"Retriggers",
					"{C:attention}#2#{} times"},
				},
			},
			["m_bld_way"] = {
				["name"] = "The Way",
				["text"] = {
					{"{X:purple,C:white}Purple{}",
					"{C:chips}#1#{} Chips, then",
					"{X:chips,C:white}X#2#{} Chips"},
					{"Always scores"}
				},
			},
			["m_bld_fossil"] = {
				["name"] = "The Fossil",
				["text"] = {
					{"{X:green,C:white}Green{}",
					"When {C:attention}held in hand{},",
					"{C:green}#1# in #2#{} chance to create",
					"a {C:bld_obj_mineral}Mineral{} for the played",
					"poker hand and {C:attention}burn",
					"{C:inactive}(Must have room)"},
					{"{C:green}Retained{}"}
				},
			},
			["m_bld_fossil_upgraded"] = {
				["name"] = "The Fossil",
				["text"] = {
					{"{X:green,C:white}Green{}",
					"When {C:attention}held in hand{},",
					"{C:green}#1# in #2#{} chance to create",
					"a {C:bld_obj_mineral}Mineral{} for the played",
					"poker hand",
					"{C:inactive}(Must have room)"},
					{"{C:green}Retained{}"}
				},
			},
		},
		['Joker'] = {
			['j_bld_paycheck'] = {
				["name"] = "Paycheck",
				["text"] = {
					{"Earn {C:money}$#1#{} at end of round"},
					{"Payout increases by {C:money}$#2#{}",
					"when {C:attention}Raise{} is played"}
				}
			},
			['j_bld_taglock'] = {
				["name"] = "Taglock",
				["text"] = {
					"Freeze all {C:attention}Round Tags",
					"until start of {C:attention}Boss Joker"
				}
			},
			['j_bld_miniature'] = {
				["name"] = "Miniature",
				["text"] = {
					"If {C:attention}Discard{} contains",
					"only 1 Blind, play it",
					"and {C:attention}Burn{} it"
				}
			},
			['j_bld_canvas'] = {
				["name"] = "Canvas",
				["text"] = {
					"If played hand contains a {C:attention}Wild Blind{}",
					"reduce effect of {C:attention}Big{} and {C:attention}Small Jokers"
				}
			},
			['j_bld_toysoldier'] = {
				["name"] = "Toy Soldier",
				["text"] = {
					"{C:mult}+#1#{} Mult for each",
					"remaining Hand",
					"{C:inactive}(Currently: {C:mult}+#2#{C:inactive} Mult)"
				}
			},
			['j_bld_actionfigure'] = {
				["name"] = "Action Figure",
				["text"] = {
					"Each {X:mult,C:white}Red{} Blind held in",
					"hand gives {C:white,X:mult}X#1#{} Mult",
				}
			},
			['j_bld_pirateship'] = {
				["name"] = "Pirate Ship",
				["text"] = {
					"Gains {C:mult}+#2#{} Mult if",
					"discarded hand",
					"is a {C:attention}Bet",
					"{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)",
				}
			},
			['j_bld_talkingfish'] = {
				["name"] = "Talking Fish",
				["text"] = {
					"If held hand contains",
					"only {X:blue,C:white}Blue{} Blinds,",
					"{C:red}+1{} Discard",
				}
			},
			['j_bld_stoplight'] = {
				["name"] = "Stoplight",
				["text"] = {
					"{C:mult}Debuffs{} all blinds",
					"{C:inactive}(Changes next hand){}",
				}
			},
			['j_bld_stoplight_yellow'] = {
				["name"] = "Stoplight",
				["text"] = {
					"{C:inactive}Does nothing..?{}",
					"{C:inactive}(Changes next hand){}",
				}
			},
			['j_bld_stoplight_green'] = {
				["name"] = "Stoplight",
				["text"] = {
					"{C:green}Retriggers{} all blinds",
					"{C:inactive}(Changes next hand){}",
				}
			},
			['j_bld_pumpkin'] = {
				["name"] = "Pumpkin",
				["text"] = {
					"{C:attention}Spooky Blinds{} reduce",
					"Joker Chips by an",
					"additional {X:dark_edition,C:white}10%{} and",
					"are {C:attention}Burned",
				}
			},
			['j_bld_statuette'] = {
				["name"] = "Statuette",
				["text"] = {
					{"{X:mult,C:white}X1{} Mult, and {X:mult,C:white}+X#1#{}",
					"for each {X:dark_edition,C:white}Faded{} Blind",
					"in scoring hand"},
					{"{C:red}Debuffs{} all scoring",
					"{X:dark_edition,C:white}Faded{} Blinds"}
				}
			},
			['j_bld_flag'] = {
				["name"] = "Crimson Flag",
				["text"] = {
					{"Retrigger all scoring",
					"{X:mult,C:white}Red{} Blinds"},
					{"{C:attention}Burn{} all scoring",
					"{X:mult,C:white}Red{} Blinds"},
				}
			},
			['j_bld_microphone'] = {
				["name"] = "Microphone",
				["text"] = {
					"Gives {C:chips}Chips{} equal to",
					"{C:attention}half{} the Chips of {C:attention}previous hand",
					"{C:inactive}(Currently: {C:chips}+#1#{C:inactive} Chips)",
				}
			},
			['j_bld_cellphone'] = {
				["name"] = "Cellphone",
				["text"] = {
					{"{X:mult,C:white}X#1#{} Mult"},
					{"{C:attention}Burn{} all Blinds",
					"{C:attention}held in hand"},
				}
			},
			['j_bld_fineart'] = {
				["name"] = "Fine Art",
				["text"] = {
					{"{C:white,X:mult}X#1#{} Mult"},
					{"{C:green}#2# in #3#{} chance to",
					"{C:red}self-destruct{} each round"}
				}
			},
			['j_bld_bedazzler'] = {
				["name"] = "Bedazzler",
				["text"] = {
					{"When selecting {C:attention}Joker{}, creates",
					"a random {C:bld_obj_mineral}Mineral{} card"},
					{"{C:attention}Enhance{} a random blind",
					"{C:attention}held in hand{} after using",
					"a {C:bld_obj_mineral}Mineral{} card"}
				}
			},
			['j_bld_pickaxe'] = {  -- base will loc later, do not remove note
				["name"] = "Pickaxe",
				["text"] = {
					"Create a {C:bld_obj_mineral}Mineral{} card",
					"after {C:attention}reshuffling{} deck",
					"{C:inactive,S:0.8}(Must have room)"
				}
			},
			['j_bld_crest'] = {
				["name"] = "Cerulean Crest",
				["text"] = {
					{"{X:chips,C:white}X#1#{} Chips"},
					{"{C:red}Debuff{} all scoring blinds",
					"if scoring hand does not",
					"contain a {X:chips,C:white}Blue{} Blind"},
				}
			},
			['j_bld_standard'] = {
				["name"] = "Verdant Standard",
				["text"] = {
					"Doubles all listed",
					"{C:green,E:1}probabilities{}",
				}
			},
			['j_bld_bookmark'] = {
				["name"] = "Bookmark",
				["text"] = {
					"{X:mult,C:white}X#1#{} Mult if deck",
					"has at most {C:attention}2{}",
					"blinds left",
				}
			},
			['j_bld_scratchticket'] = {
				["name"] = "Scratch Ticket",
				["text"] = {
					{"Each hand, {C:green}#2# in #3#{}",
					"chance for {C:money}+#1#${}"},
					{"Payout chance increases",
					"by {C:green}+1{} for each scoring",
					"{X:green,C:white}Green{} Blind"},
					{"Chance resets",
					"after payout"}
				}
			},
			['j_bld_ensign'] = {
				["name"] = "Amber Ensign",
				["text"] = {
					"Every {C:attention}third{} scoring {X:money,C:white}Yellow{} Blind",
					"creates a recursive tag",
					"{C:inactive}(Currently: #1# of #2#)"
				}
			},
			['j_bld_pennant'] = {
				["name"] = "Violet Pennant",
				["text"] = {
					"{C:white,X:mult}X1{} Mult for",
					"each unique scoring",
					"{X:purple,C:white}Purple{} Blind",
				}
			},
			['j_bld_insignia'] = {
				["name"] = "Faded Insignia",
				["text"] = {
					"{X:dark_edition,C:white}Faded{} Blinds count as",
					"all blinds and hues",
				}
			},
			['j_bld_pawn'] = {
				["name"] = "Pawn",
				["text"] = {
					{"{C:mult}+#1#{} Mult"},
					{"{C:inactive}(#3#/8){}",}
				}
			},
			['j_bld_saltlamp'] = {
				["name"] = "Salt Lamp",
				["text"] = {
					"Once per round,",
					"if poker hand contains a {C:attention}Flush{},",
					"creates the {C:bld_obj_mineral}Mineral{} card for your",
					"most played hand",
					"{C:inactive,S:0.8}(Must have room)"
				}
			},
			['j_bld_queen'] = {
				["name"] = "Queen",
				["text"] = {
					"{X:mult,C:white}X#2#{} Mult",
				}
			},
			['j_bld_sunset'] = {
				["name"] = "Sunset",
				["text"] = {
					{"{X:mult,C:white}Red{} and {X:money,C:white}Yellow{}",
					"count as the same hue"},
					{"{X:chips,C:white}Blue{} and {X:purple,C:white}Purple{}",
					"count as the same hue"},
				}
			},
			['j_bld_doubloon'] = {
				["name"] = "Copper Doubloon",
				["text"] = {
					"Retriggers all scoring",
					"{X:green,C:white}Green{} Blinds",
				}
			},
			['j_bld_toyrobot'] = {
				["name"] = "Toy Robot",
				["text"] = {
					"Retriggers all scoring",
					"{C:attention}Tech{} Blinds",
				}
			},
			['j_bld_marble'] = {
				["name"] = "Marble",
				["text"] = {
					"Retriggers all scoring",
					"{X:attention,C:white}Multicolor{} Blinds",
				}
			},
			['j_bld_award'] = {
				["name"] = "Award",
				["text"] = {
					"At the end of round,",
					"{X:money,C:white}Yellow{} Blinds held",
					"in hand give {C:money}+#1#${}",
				}
			},
			['j_bld_kazoo'] = {
				["name"] = "Kazoo",
				["text"] = {
					"If discarded hand contains",
					"3 {X:red,C:white}Red{} Blinds, create",
					"a {C:attention}Max Tag{}"
				}
			},
			['j_bld_snowglobe'] = {
				["name"] = "Snow Globe",
				["text"] = {
					"{C:attention}Frost Blinds{} start with",
					"{X:chips,C:white}X2{} Chips and lose",
					"{X:chips,C:white}X0.1{} Chips for each",
					"hand played this round",
				}
			},
			['j_bld_pendant'] = {
				["name"] = "Pendant",
				["text"] = {
					"{C:attention}Astral{} Blinds",
					"give {C:red}+#1#{} Mult per",
					"hand level"
				}
			},
			['j_bld_glasseye'] = {
				["name"] = "Glass Eye",
				["text"] = {
					{"{X:mult,C:white}X#1#{} Mult"},
					{"Creates a {C:attention}Debuff{} Tag",
					"after each hand"}
				}
			},
			['j_bld_cowskull'] = {
				["name"] = "Cow Skull",
				["text"] = {
					"{C:attention}Hunter{} Blinds",
					"always give {C:money}+#1#${}",
				}
			},
			['j_bld_bracelet'] = {
				["name"] = "Bracelets",
				["text"] = {
					"{C:attention}Floral{} Blinds have",
					"{X:green,C:white}+1{} increased {E:1,C:green}probabilities{} on",
					"each Floral effect"
				}
			},
			['j_bld_stuffedtoy'] = {
				["name"] = "Stuffed Toy",
				["text"] = {
					"If played hand contains,",
					"{C:attention}3{} or less Blinds,",
					"{X:dark_edition,C:white}-#1#%{} Chips to Joker"
				}
			},
			['j_bld_dicejail'] = {
				["name"] = "Dice Jail",
				["text"] = {
					"{C:money}+#1#${} when ",
					"a probability fails",
				}
			},
			['j_bld_clock'] = {
				["name"] = "Cuckoo Clock",
				["text"] = {
					"{C:white,X:mult}X#1#{} every 4 used",
					"{C:blue}hands{} and {C:red}discards{}",
					"{C:inactive}(Currently: #2# left)",
				}
			},
			['j_bld_mask'] = {
				["name"] = "Ancient Mask",
				["text"] = {
                    "Sell trinket to {C:attention}reroll",
                    "upcoming {C:attention}Joker",
				}
			},
			['j_bld_fridgemagnet'] = {
				["name"] = "Fridge Magnet",
				["text"] = {
                    "Retriggers {C:attention}Trinket",
                    "to the right"
				}
			},
			['j_bld_whiteout'] = {
				["name"] = "Whiteout",
				["text"] = {
					"Once per {C:attention}ante{}, if hand",
					"has only 1 Blind, convert",
					"it into a {X:dark_edition,C:white}Blank{}"
				}
			},
			['j_bld_discount'] = {
				["name"] = "Discount",
				["text"] = {
					"Initial packs and cards",
					"in {C:attention}Boss Shop{} are free"
				}
			},
			['j_bld_piggybank'] = {
				["name"] = "Piggy Bank",
				["text"] = {
					{"When {C:attention}Joker{} is selected,",
					"gain {C:money}+#1#${}"},
					{"When a {C:attention}Trinket{} is bought,",
                    "{S:1.1,C:red,E:2}self destructs{}"}
				}
			},
			['j_bld_porcelaindoll'] = {
				["name"] = "Porcelain Doll",
				["text"] = {
					{"At end of {C:attention}Round{},",
					"gains {C:money}+#1#{} Sell Value"},
					{"{C:red}Breaks{} if scoring hand",
					"contains {C:attention}5{} Blinds"},
				}
			},
			['j_bld_porcelaindoll_broken'] = {
				["name"] = "Porcelain Doll",
				["text"] = {
					"{C:inactive}Broken...",
				}
			},
			['j_bld_glasses'] = {
				["name"] = "3D Glasses",
				["text"] = {
					"If scoring hand contains",
					"only both {X:mult,C:white}Red{} and {X:blue,C:white}Blue{} Blinds,",
					"create a {C:bld_obj_filmcard}Channel{} Card",
					"{C:inactive,S:0.8}(Must have room)"
				}
			},
			['j_bld_dreamcatcher'] = {
				["name"] = "Dream Catcher",
				["text"] = {
					"Every #1# {C:blue}Hands{} played,",
					"gain {C:blue}+1 Hand",
					"{C:inactive}(Currently #2#/#1#)"
				}
			},
			['j_bld_microchip'] = {
				["name"] = "Microchip",
				["text"] = {
					"When {C:attention}Joker{} is selected,",
					"creates a {C:green}Recursive Tag"
				}
			},
			['j_bld_breadboard'] = {
				["name"] = "Breadboard",
				["text"] = {
					"{C:attention}Round{} does not end until",
					"all {C:blue}Hands{} are spent"
				}
			},
			['j_bld_barrel'] = {
				["name"] = "Monkey Barrel",
				["text"] = {
					"{X:mult,C:white}X1{} Mult, and {X:mult,C:white}+X#1#{}",
					"for each unique",
					"Blind scored"
				}
			},
			['j_bld_candle'] = {
				["name"] = "Candle",
				["text"] = {
					{"Gains {X:mult,C:white}X#1#{} Mult",
					"each hand where a",
					"Blind {C:attention}burns",
					"{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)"},
					{"{C:attention}Resets{} if no blind",
					"{C:attention}burns{} during hand"}
				}
			},
			['j_bld_pogs'] = {
				["name"] = "Pogs",
				["text"] = {
					"Scoring {X:money,C:white}Yellow{} Blinds",
					"give {C:chips}+1{} Chip per",
					"held {C:money}dollar",
					"{C:inactive}(Currently: {C:chips}+#1#{C:inactive} Chips)"
				}
			},
			['j_bld_crane'] = {
				["name"] = "Paper Crane",
				["text"] = {
					"When a Blind is going",
					"to {C:attention}Burn{}, this trinket",
					"has a {C:green}#1# in #2#{} chance",
					"to prevent it"
				}
			},
			['j_bld_matryoshka'] = {
				["name"] = "Matryoshka",
				["text"] = {
					"When Joker is",
					"selected, create the",
					"last consumed {C:attention}Tag",
					"{C:inactive}(Currently: {C:attention}#1#{C:inactive})"
				}
			},
			['j_bld_sewingkit'] = {
				["name"] = "Sewing Kit",
				["text"] = {
					"Creates a {C:attention}Symmetry Tag",
					"when deck is {C:attention}reshuffled"
				}
			},
			['j_bld_pocketwatch'] = {
				["name"] = "Pocket Watch",
				["text"] = {
					"When deck is",
					"{C:attention}reshuffled{}, Joker loses",
					"{C:mult}-#1#{} Mult"
				}
			},
			['j_bld_bottle'] = {
				["name"] = "Soda Bottle",
				["text"] = {
					"{C:red}+1{} Discard"
				}
			},
			['j_bld_hackysack'] = {
				["name"] = "Hacky Sack",
				["text"] = {
					"{C:attention}+1{} hand size"
				}
			},
			['j_bld_checker'] = {
				["name"] = "Checkers",
				["text"] = {
					"{C:attention}Raise{} can be made with",
					"{C:attention}3{} blinds if poker hand",
					"contains no {C:attention}Pairs"
				}
			},
			['j_bld_necronomicon'] = {
				["name"] = "Necronomicon",
				["text"] = {
					"PLACEHOLDER EFFECT:",
					"Create a channel card",
					"each joker"
				}
			},
			['j_bld_lighter'] = {
				["name"] = "Lighter",
				["text"] = {
					"Discarded blinds",
					"are {C:attention}burned"
				}
			},
			['j_bld_dentures'] = {
				["name"] = "Dentures",
				["text"] = {
					"If exactly {C:attention}3{} hands",
					"are left after play,",
					"create a {C:attention}Dental Tag{}",
				}
			},
			['j_bld_giftbox'] = {
				["name"] = "Gift Box",
				["text"] = {
					"{C:white,X:mult}X1{} Mult, and {X:mult,C:white}+X#1#{}",
					"for each held {C:attention}Tag"
				}
			},
		},
		["Edition"] = {
			['e_bld_enameled'] = {
				name = "Enamel",
				text = {
					"{C:chips}+#1#{} Chips",
				}
			},
			['e_bld_mint'] = {
				name = "Mint",
				text = {
					"{C:money}+#1#${}",
				}
			},
			['e_bld_finish'] = {
				name = "Finish",
				text = {
					"{C:attention}+#1#{} Retrigger",
				}
			},
		},
		["Other"] = {
			["bld_boss_shop"]	= {
				["name"] = "Boss Shop",
				["text"] = {
					"The shop with",
					"{C:attention}Booster Packs",
					"after each {C:attention}Boss",
				}
			},
			["bld_self_scoring"] = {
				["name"] = "Self-Scoring",
				["text"] = {
					"{C:attention}Always scores",
					"{s:0.2} {}",
					"If {C:green}chance{} fails,",
					"{C:red}debuffs{} self"
				}
			},
			["bld_wild_seal"]	= {
				["name"] = "Wild Blind",
				["text"] = {
					"Can be used",
					"as every Hue"
				}
			},
			["bld_astral_seal"]	= {
				["name"] = "Astral Blind",
				["text"] = {
					"{C:mult}+#1#{} Mult for each",
					"level of played hand"
				}
			},
			["bld_tech_seal"] = {
				["name"] = "Tech Blind",
				["text"] = {
					"{C:chips}+#2#{} Chips each time",
					"this Blind is scored",
					"{C:inactive}(Currently: {C:chips}+#1#{C:inactive} Chips)"
				}
			},
			["bld_hunter_seal"] = {
				["name"] = "Hunter Blind",
				["text"] = {
					"{C:money}+#1#${} when scored",
					"during Boss {C:attention}Joker"
				}
			},
			["bld_floral_seal"] = {
				["name"] = "Floral Blind",
				["text"] = {
					"{C:green}#1# in #2#{} chance to",
					"give {C:blue}+#3#{} chips",
					"{C:green}#4# in #5#{} chance to",
					"{C:attention}retrigger{} twice"
				}
			},
			["bld_ruin_seal"] = {
				["name"] = "Ruin Blind",
				["text"] = {
					"{C:white,X:mult}X#1#{} Mult",
					"{C:attention}Burn{} blind",
					"after scoring"
				}
			},
			["bld_frost_seal"] = {
				["name"] = "Frost Blind",
				["text"] = {
					"{C:white,X:blue}#1#{} Chips for each",
					"hand played this round",
					"{C:inactive}(Currently: {X:chips,C:white}X#2#{C:inactive} Chips)"
				}
			},
			["bld_spooky_seal"]	= {
				["name"] = "Spooky Blind",
				["text"] = {
					"{X:dark_edition,C:white}-#1#%{} Chips to Joker",
				}
			},
			["bld_burn"]	= {
				["name"] = "Burn",
				["text"] = {
					"Blind is removed",
					"until end of round",
				}
			},
			["bld_retain"]	= {
				["name"] = "Retained",
				["text"] = {
					"Blind is not",
					"discarded after",
					"play when {C:attention}held",
					"{C:attention}in hand"
				}
			},
			["p_bld_symbol_basic1"]	= {
				["group_name"] = "Symbol Pack",
				["name"] = "Symbol Pack",
				["text"] = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:attention} Blind{} cards to",
					"add to your deck"
				}
			},
			["p_bld_symbol_basic2"]	= {
				["group_name"] = "Symbol Pack",
				["name"] = "Cool Symbol Pack",
				["text"] = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:attention} Blind{} cards to",
					"add to your deck"
				}
			},
			["p_bld_symbol_basic3"]	= {
				["group_name"] = "Symbol Pack",
				["name"] = "Symbol Pack",
				["text"] = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:attention} Blind{} cards to",
					"add to your deck"
				}
			},
			["p_bld_symbol_basic4"]	= {
				["group_name"] = "Symbol Pack",
				["name"] = "Warm Symbol Pack",
				["text"] = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:attention} Blind{} cards to",
					"add to your deck"
				}
			},
			["p_bld_symbol_jumbo1"]	= {
				["group_name"] = "Symbol Pack",
				["name"] = "Jumbo Cool Symbol Pack",
				["text"] = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:attention} Blind{} cards to",
					"add to your deck"
				}
			},
			["p_bld_symbol_jumbo2"]	= {
				["group_name"] = "Symbol Pack",
				["name"] = "Jumbo Warm Symbol Pack",
				["text"] = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:attention} Blind{} cards to",
					"add to your deck"
				}
			},
			["p_bld_symbol_mega1"]	= {
				["group_name"] = "Symbol Pack",
				["name"] = "Mega Symbol Pack",
				["text"] = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:attention} Blind{} cards to",
					"add to your deck"
				}
			},
			["p_bld_symbol_mega2"]	= {
				["group_name"] = "Symbol Pack",
				["name"] = "Mega Symbol Pack",
				["text"] = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:attention} Blind{} cards to",
					"add to your deck"
				}
			},
			["p_bld_mineral_basic1"] = {
				["group_name"] = "Crystalline Pack",
				["name"] = "Crystalline Pack",
				["text"] = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:attention} {C:bld_obj_mineral}Mineral{} cards to",
					"use immediately"
				}
			},
			["p_bld_mineral_basic2"] = {
				["group_name"] = "Crystalline Pack",
				["name"] = "Crystalline Pack",
				["text"] = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:attention} {C:bld_obj_mineral}Mineral{} cards to",
					"use immediately"
				}
			},
			["p_bld_mineral_basic3"] = {
				["group_name"] = "Crystalline Pack",
				["name"] = "Crystalline Pack",
				["text"] = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:attention} {C:bld_obj_mineral}Mineral{} cards to",
					"use immediately"
				}
			},
			["p_bld_mineral_basic4"] = {
				["group_name"] = "Crystalline Pack",
				["name"] = "Crystalline Pack",
				["text"] = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:attention} {C:bld_obj_mineral}Mineral{} cards to",
					"use immediately"
				}
			},
			["p_bld_mineral_jumbo1"] = {
				["group_name"] = "Crystalline Pack",
				["name"] = "Jumbo Crystalline Pack",
				["text"] = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:attention} {C:bld_obj_mineral}Mineral{} cards to",
					"use immediately"
				}
			},
			["p_bld_mineral_jumbo2"] = {
				["group_name"] = "Crystalline Pack",
				["name"] = "Jumbo Crystalline Pack",
				["text"] = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:attention} {C:bld_obj_mineral}Mineral{} cards to",
					"use immediately"
				}
			},
			["p_bld_mineral_mega1"] = {
				["group_name"] = "Crystalline Pack",
				["name"] = "Mega Crystalline Pack",
				["text"] = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:attention} {C:bld_obj_mineral}Mineral{} cards to",
					"use immediately"
				}
			},
			["p_bld_mineral_mega2"] = {
				["group_name"] = "Crystalline Pack",
				["name"] = "Mega Crystalline Pack",
				["text"] = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:attention} {C:bld_obj_mineral}Mineral{} cards to",
					"use immediately"
				}
			},
			["p_bld_filmcard_basic1"] = {
				["group_name"] = "Cinema Pack",
				["name"] = "Cinema Pack",
				["text"] = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:attention} {C:bld_obj_filmcard}Channel{} cards to",
					"use immediately"
				}
			},
			["p_bld_filmcard_basic2"] = {
				["group_name"] = "Cinema Pack",
				["name"] = "Cinema Pack",
				["text"] = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:attention} {C:bld_obj_filmcard}Channel{} cards to",
					"use immediately"
				}
			},
			["p_bld_filmcard_basic3"] = {
				["group_name"] = "Cinema Pack",
				["name"] = "Cinema Pack",
				["text"] = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:attention} {C:bld_obj_filmcard}Channel{} cards to",
					"use immediately"
				}
			},
			["p_bld_filmcard_basic4"] = {
				["group_name"] = "Cinema Pack",
				["name"] = "Cinema Pack",
				["text"] = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:attention} {C:bld_obj_filmcard}Channel{} cards to",
					"use immediately"
				}
			},
			["p_bld_filmcard_jumbo1"] = {
				["group_name"] = "Cinema Pack",
				["name"] = "Jumbo Cinema Pack",
				["text"] = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:attention} {C:bld_obj_filmcard}Channel{} cards to",
					"use immediately"
				}
			},
			["p_bld_filmcard_jumbo2"] = {
				["group_name"] = "Cinema Pack",
				["name"] = "Jumbo Cinema Pack",
				["text"] = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:attention} {C:bld_obj_filmcard}Channel{} cards to",
					"use immediately"
				}
			},
			["p_bld_filmcard_mega1"] = {
				["group_name"] = "Cinema Pack",
				["name"] = "Mega Cinema Pack",
				["text"] = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:attention} {C:bld_obj_filmcard}Channel{} cards to",
					"use immediately"
				}
			},
			["p_bld_filmcard_mega2"] = {
				["group_name"] = "Cinema Pack",
				["name"] = "Mega Cinema Pack",
				["text"] = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:attention} {C:bld_obj_filmcard}Channel{} cards to",
					"use immediately"
				}
			},
			["p_bld_noble_basic1"] = {
				["group_name"] = "Noble Pack",
				["name"] = "Noble Pack",
				["text"] = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:attention} {C:bld_obj_rune}Rune{} cards to hold",
				}
			},
			["p_bld_noble_basic2"] = {
				["group_name"] = "Noble Pack",
				["name"] = "Noble Pack",
				["text"] = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:attention} {C:bld_obj_rune}Rune{} cards to hold",
				}
			},
			["p_bld_noble_jumbo1"] = {
				["group_name"] = "Noble Pack",
				["name"] = "Jumbo Noble Pack",
				["text"] = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:attention} {C:bld_obj_rune}Rune{} cards to hold",
				}
			},
			["p_bld_noble_mega1"] = {
				["group_name"] = "Noble Pack",
				["name"] = "Mega Noble Pack",
				["text"] = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:attention} {C:bld_obj_rune}Rune{} cards to hold",
				}
			},
			["p_bld_ritual_basic1"] = {
				["group_name"] = "Hallow Pack",
				["name"] = "Hallow Pack",
				["text"] = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:attention} {C:bld_obj_rune}Ritual{} cards to",
					"use immediately"
				}
			},
			["p_bld_ritual_basic2"] = {
				["group_name"] = "Hallow Pack",
				["name"] = "Hallow Pack",
				["text"] = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:attention} {C:bld_obj_rune}Ritual{} cards to",
					"use immediately"
				}
			},
			["bld_upgrade"] = {
				["name"] = "Upgraded",
				["text"] = {
					"A more powerful blind",
					"with stronger effects"
				}
			},
		},
	},
}