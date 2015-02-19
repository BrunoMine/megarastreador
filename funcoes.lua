--
-- Funcoes
--

-- Gerar exemplar (atribui valores em variaveis)
function megarastreador_gerar_exemplar(exemplar, novo_node)
	if megarastreador_exemplar1 == "" then
		megarastreador_exemplar1 = exemplar
		megarastreador_novo_node1 = novo_node
	else
		if megarastreador_exemplar2 == "" then
			megarastreador_exemplar2 = exemplar
			megarastreador_novo_node2 = novo_node
		else
			if megarastreador_exemplar3 == "" then
				megarastreador_exemplar3 = exemplar
				megarastreador_novo_node3 = novo_node
			else
				if megarastreador_exemplar4 == "" then
					megarastreador_exemplar4 = exemplar
					megarastreador_novo_node4 = novo_node
				else
					if megarastreador_exemplar5 == "" then
						megarastreador_exemplar5 = exemplar
						megarastreador_novo_node5 = novo_node
					else
						if megarastreador_exemplar6 == "" then
							megarastreador_exemplar6 = exemplar
							megarastreador_novo_node6 = novo_node
						else
							if megarastreador_exemplar7 == "" then
								megarastreador_exemplar7 = exemplar
								megarastreador_novo_node7 = novo_node
							else
								if megarastreador_exemplar8 == "" then
									megarastreador_exemplar8 = exemplar
									megarastreador_novo_node8 = novo_node
								else
									if megarastreador_exemplar9 == "" then
										megarastreador_exemplar9 = exemplar
										megarastreador_novo_node9 = novo_node
									else
										if megarastreador_exemplar10 == "" then
											megarastreador_exemplar10 = exemplar
											megarastreador_novo_node10 = novo_node
										else
											if megarastreador_exemplar11 == "" then
												megarastreador_exemplar11 = exemplar
												megarastreador_novo_node11 = novo_node
											else
												if megarastreador_exemplar12 == "" then
													megarastreador_exemplar12 = exemplar
													megarastreador_novo_node12 = novo_node
												else
													if megarastreador_exemplar13 == "" then
														megarastreador_exemplar13 = exemplar
														megarastreador_novo_node13 = novo_node
													else
														if megarastreador_exemplar14 == "" then
															megarastreador_exemplar14 = exemplar
															megarastreador_novo_node14 = novo_node
														else
															if megarastreador_exemplar15 == "" then
																megarastreador_exemplar15 = exemplar
																megarastreador_novo_node15 = novo_node
															else
																if megarastreador_exemplar16 == "" then
																	megarastreador_exemplar16 = exemplar
																	megarastreador_novo_node16 = novo_node
																else
																	if megarastreador_exemplar17 == "" then
																		megarastreador_exemplar17 = exemplar
																		megarastreador_novo_node17 = novo_node
																	else
																		if megarastreador_exemplar18 == "" then
																			megarastreador_exemplar18 = exemplar
																			megarastreador_novo_node18 = novo_node
																		else
																			if megarastreador_exemplar19 == "" then
																				megarastreador_exemplar19 = exemplar
																				megarastreador_novo_node19 = novo_node
																			else
																				if megarastreador_exemplar20 == "" then
																					megarastreador_exemplar20 = exemplar
																					megarastreador_novo_node20 = novo_node
																				else
																					print("[MegaRastreador] Limite de 20 rastreadores exedido")
																				end
																			end
																		end
																	end
																end
															end
														end
													end
												end
											end
										end
									end
								end
							end
						end
					end
				end
			end	
		end
	end
end

-- Funcao de tocar Beep
function megarastreador_beepar(player)
	minetest.sound_play("megarastreador_beep", {
		to_player = player,
		gain = 3.0,
	})
end

-- Funcao de tocar Beep redefiniu
function megarastreador_beepar_redefiniu(player)
	minetest.sound_play("megarastreador_beep_redefiniu", {
		to_player = player,
		gain = 4.0,
	})
end

-- Funcao de tocar Beep 
function megarastreador_beepar_descarregou(player)
	minetest.sound_play("megarastreador_beep_descarregou", {
		to_player = player,
		gain = 4.0,
	})
end

-- Funcao desgaste de bateria
function megarastreador_desgastar(player, itemstack)
	local inv = player:get_inventory()
	if (65535-itemstack:get_wear()) <= (megarastreador_tempo_bateria) then
		megarastreador_beepar_descarregou(player)
	end
	if inv:contains_item("main", itemstack) then
		inv:remove_item("main", itemstack)
		itemstack:add_wear(megarastreador_tempo_bateria) 
		inv:add_item("main", itemstack)
		minetest.after(5, megarastreador_desgastar, player, itemstack)
	end
end

-- Funcao rastrear
function megarastreador_rastrear(player, itemstack, referencia)
	local inv = player:get_inventory()
	if itemstack:get_name()~="" then
		local pos = player:getpos()
		if pos and minetest.find_node_near(pos, 2, referencia) ~= nil then
			megarastreador_beepar(player)
			minetest.after(0.4, megarastreador_rastrear, player, itemstack, referencia)
		else
			if pos and minetest.find_node_near(pos, 5, referencia) ~= nil then
				megarastreador_beepar(player)
				minetest.after(0.7, megarastreador_rastrear, player, itemstack, referencia)
			else
				if pos and minetest.find_node_near(pos, 9, referencia) ~= nil then
					megarastreador_beepar(player)
					minetest.after(1.2, megarastreador_rastrear, player, itemstack, referencia)
				else
					if pos and minetest.find_node_near(pos, 15, referencia) ~= nil then
						megarastreador_beepar(player)
						minetest.after(2, megarastreador_rastrear, player, itemstack, referencia)
					else
						megarastreador_beepar(player)
						minetest.after(4, megarastreador_rastrear, player, itemstack, referencia)
					end
				end
			end
		end
	end
end

-- Verifica Qual sera o novo tipo de rastreador
function megarastreador_verificar_referencia(item)
	if item == megarastreador_exemplar1 then
		return megarastreador_novo_node1
	else
		if item == megarastreador_exemplar2 then
			return megarastreador_novo_node2
		else
			if item == megarastreador_exemplar3 then
				return megarastreador_novo_node3
			else
				if item == megarastreador_exemplar4 then
					return megarastreador_novo_node4
				else
					if item == megarastreador_exemplar5 then
						return megarastreador_novo_node5
					else
						if item == megarastreador_exemplar6 then
							return megarastreador_novo_node6
						else
							if item == megarastreador_exemplar7 then
								return megarastreador_novo_node7
							else
								if item == megarastreador_exemplar8 then
									return megarastreador_novo_node8
								else
									if item == megarastreador_exemplar9 then
										return megarastreador_novo_node9
									else
										if item == megarastreador_exemplar10 then
											return megarastreador_novo_node10
										else
											if item == megarastreador_exemplar11 then
												return megarastreador_novo_node11
											else
												if item == megarastreador_exemplar12 then
													return megarastreador_novo_node12
												else
													if item == megarastreador_exemplar13 then
														return megarastreador_novo_node13
													else
														if item == megarastreador_exemplar14 then
															return megarastreador_novo_node14
														else
															if item == megarastreador_exemplar15 then
																return megarastreador_novo_node15
															else
																if item == megarastreador_exemplar16 then
																	return megarastreador_novo_node16
																else
																	if item == megarastreador_exemplar17 then
																		return megarastreador_novo_node17
																	else
																		if item == megarastreador_exemplar18 then
																			return megarastreador_novo_node18
																		else
																			if item == megarastreador_exemplar19 then
																				return megarastreador_novo_node19
																			else
																				if item == megarastreador_exemplar20 then
																					return megarastreador_novo_node20
																				end
																			end
																		end
																	end
																end
															end
														end
													end
												end
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end
end

-- Variaveis de Slots
megarastreador_exemplar1 = "";megarastreador_novo_node1 = ""
megarastreador_exemplar2 = "";megarastreador_novo_node2 = ""
megarastreador_exemplar3 = "";megarastreador_novo_node3 = ""
megarastreador_exemplar4 = "";megarastreador_novo_node4 = ""
megarastreador_exemplar5 = "";megarastreador_novo_node5 = ""
megarastreador_exemplar6 = "";megarastreador_novo_node6 = ""
megarastreador_exemplar7 = "";megarastreador_novo_node7 = ""
megarastreador_exemplar8 = "";megarastreador_novo_node8 = ""
megarastreador_exemplar9 = "";megarastreador_novo_node9 = ""
megarastreador_exemplar10 = "";megarastreador_novo_node10 = ""
megarastreador_exemplar11 = "";megarastreador_novo_node11 = ""
megarastreador_exemplar12 = "";megarastreador_novo_node12 = ""
megarastreador_exemplar13 = "";megarastreador_novo_node13 = ""
megarastreador_exemplar14 = "";megarastreador_novo_node14 = ""
megarastreador_exemplar15 = "";megarastreador_novo_node15 = ""
megarastreador_exemplar16 = "";megarastreador_novo_node16 = ""
megarastreador_exemplar17 = "";megarastreador_novo_node17 = ""
megarastreador_exemplar18 = "";megarastreador_novo_node18 = ""
megarastreador_exemplar19 = "";megarastreador_novo_node19 = ""
megarastreador_exemplar20 = "";megarastreador_novo_node20 = ""