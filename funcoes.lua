--
-- Funcoes
--

-- Desligar rastreador
function megarastreador_desligar_rastreador(player, item)
	local inv = player:get_inventory()
	if inv:contains_item("main", item) then
		inv:remove_item("main", item)
		for n, row in ipairs(megarastreador_rastreadores) do
			local nome = row[1]
			local ferramenta_ativa = "megarastreador:rastreador_ferramenta_"..nome.."_ativo"
			if item:get_name() == ferramenta_ativa then
				item:set_name("megarastreador:rastreador_ferramenta_"..nome)
			end
		end
		inv:add_item("main", item)
	end
end

-- Pegar nome da ferramenta inativa
function megarastreador_pegar_inativo(item)
	local nome_ant = item:get_name()
	for n, row in ipairs(megarastreador_rastreadores) do
		local nome = row[1]
		local ferramenta_ativa = "megarastreador:rastreador_ferramenta_"..nome.."_ativo"
		if item == ferramenta_ativa then
			item:set_name("megarastreador:rastreador_ferramenta_"..nome)
			return item
		end
	end
end

-- Atribuir item unicos
function megarastreador_atribuir_item_unico(item)
	if megarastreador_item_unico1 == "" then
		megarastreador_item_unico1 = item
	else
		if megarastreador_item_unico2 == "" then
			megarastreador_item_unico2 = item
		else
			if megarastreador_item_unico3 == "" then
				megarastreador_item_unico3 = item
			else
				if megarastreador_item_unico4 == "" then
					megarastreador_item_unico4 = item
				else
					if megarastreador_item_unico5 == "" then
						megarastreador_item_unico5 = item
					else
						if megarastreador_item_unico6 == "" then
							megarastreador_item_unico6 = item
						else
							if megarastreador_item_unico7 == "" then
								megarastreador_item_unico7 = item
							else
								if megarastreador_item_unico8 == "" then
									megarastreador_item_unico8 = item
								else
									if megarastreador_item_unico9 == "" then
										megarastreador_item_unico9 = item
									else
										if megarastreador_item_unico10 == "" then
											megarastreador_item_unico10 = item
										else
											if megarastreador_item_unico11 == "" then
												megarastreador_item_unico11 = item
											else
												if megarastreador_item_unico12 == "" then
													megarastreador_item_unico12 = item
												else
													if megarastreador_item_unico13 == "" then
														megarastreador_item_unico13 = item
													else
														if megarastreador_item_unico14 == "" then
															megarastreador_item_unico14 = item
														else
															if megarastreador_item_unico15 == "" then
																megarastreador_item_unico15 = item
															else
																if megarastreador_item_unico16 == "" then
																	megarastreador_item_unico16 = item
																else
																	if megarastreador_item_unico17 == "" then
																		megarastreador_item_unico17 = item
																	else
																		if megarastreador_item_unico18 == "" then
																			megarastreador_item_unico18 = item
																		else
																			if megarastreador_item_unico19 == "" then
																				megarastreador_item_unico19 = item
																			else
																				if megarastreador_item_unico20 == "" then
																					megarastreador_item_unico20 = item
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
	if player~=nil and player:is_player() then
		minetest.sound_play("megarastreador_beep", {
			--to_player = player,
			pos=player:getpos(),
			gain = 3.0,
			max_hear_distance = 3,
		})
	end
end

-- Funcao de tocar Beep redefiniu
function megarastreador_beepar_redefiniu(player)
	if player~=nil and player:is_player() then
		minetest.sound_play("megarastreador_beep_redefiniu", {
			pos=player:getpos(),
			gain = 6.0,
			max_hear_distance = 3,
		})
	end
end

-- Funcao de tocar Beep 
function megarastreador_beepar_descarregou(player)
	if player~=nil and player:is_player() then
		minetest.sound_play("megarastreador_beep_descarregou", {
			pos=player:getpos(),
			gain = 5.0,
			max_hear_distance = 3,
		})
	end
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
	if itemstack:get_name()~="" and inv:contains_item("main", itemstack)then
		local pos = player:getpos()
		if pos and minetest.find_node_near(pos, 1, referencia) ~= nil then
			megarastreador_beepar(player)
			minetest.after(0.1, megarastreador_rastrear, player, itemstack, referencia)
		elseif pos and minetest.find_node_near(pos, 2, referencia) ~= nil then
			megarastreador_beepar(player)
			minetest.after(0.2, megarastreador_rastrear, player, itemstack, referencia)
		elseif pos and minetest.find_node_near(pos, 3, referencia) ~= nil then
			megarastreador_beepar(player)
			minetest.after(0.3, megarastreador_rastrear, player, itemstack, referencia)
		elseif pos and minetest.find_node_near(pos, 5, referencia) ~= nil then
			megarastreador_beepar(player)
			minetest.after(0.5, megarastreador_rastrear, player, itemstack, referencia)
		elseif pos and minetest.find_node_near(pos, 8, referencia) ~= nil then
			megarastreador_beepar(player)
			minetest.after(0.8, megarastreador_rastrear, player, itemstack, referencia)
		elseif pos and minetest.find_node_near(pos, 10, referencia) ~= nil then
			megarastreador_beepar(player)
			minetest.after(1.0, megarastreador_rastrear, player, itemstack, referencia)
		elseif pos and minetest.find_node_near(pos, 15, referencia) ~= nil then
			megarastreador_beepar(player)
			minetest.after(1.5, megarastreador_rastrear, player, itemstack, referencia)
		elseif pos and minetest.find_node_near(pos, 20, referencia) ~= nil then
			megarastreador_beepar(player)
			minetest.after(2.0, megarastreador_rastrear, player, itemstack, referencia)
		else
			megarastreador_beepar(player)
			minetest.after(4.0, megarastreador_rastrear, player, itemstack, referencia)
		end
	end
end

-- Verifica Qual sera o novo tipo de rastreador
function megarastreador_verificar_referencia(item)
	for n, row in ipairs(megarastreador_rastreadores) do
		local nome = row[1]
		local exemplar = row[6]
		local novo_node = "megarastreador:rastreador_"..nome
		if item == exemplar then
			return novo_node
		end
	end
end

-- Verificar se eh o unico
function megarastreador_verificar_se_eh_unico(inv)
	local num_ativ = 0
	local lim_ativ = megarastreador_lim_ferram_ati - 1
	for n, row in ipairs(megarastreador_rastreadores) do
		local nome = row[1]
		local ferramenta_ativa = "megarastreador:rastreador_ferramenta_"..nome.."_ativo"
		if inv:contains_item("main", ferramenta_ativa) then
			num_ativ = num_ativ + 1
		end
	end
	if num_ativ == lim_ativ then
		return true
	else
		return false
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
megarastreador_item_unico1 = ""
megarastreador_item_unico2 = ""
megarastreador_item_unico3 = ""
megarastreador_item_unico4 = ""
megarastreador_item_unico5 = ""
megarastreador_item_unico6 = ""
megarastreador_item_unico7 = ""
megarastreador_item_unico8 = ""
megarastreador_item_unico9 = ""
megarastreador_item_unico10 = ""
megarastreador_item_unico11 = ""
megarastreador_item_unico12 = ""
megarastreador_item_unico13 = ""
megarastreador_item_unico14 = ""
megarastreador_item_unico15 = ""
megarastreador_item_unico16 = ""
megarastreador_item_unico17 = ""
megarastreador_item_unico18 = ""
megarastreador_item_unico19 = ""
megarastreador_item_unico20 = ""
