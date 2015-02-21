--
-- Nodes e ferramentas
--

for n, row in ipairs(megarastreador_rastreadores) do
	local nome = row[1]
	local desc = row[2]
	local refe = row[3]
	local textura_ferramenta = row[4]
	local textura_node = row[5]
	local exemplar = row[6]
	local novo_node = "megarastreador:rastreador_"..nome
	local ferramenta_ativa = "megarastreador:rastreador_ferramenta_"..nome.."_ativo"
	megarastreador_atribuir_item_unico(ferramenta_ativa)
	megarastreador_gerar_exemplar(exemplar, novo_node)
	-- Ferramenta Rastreadora
	local doGroup = { }
	if n ~= 1 then doGroup = {not_in_creative_inventory = 1} end
	
	minetest.register_tool("megarastreador:rastreador_ferramenta_"..nome, {
		description = desc,
		inventory_image = textura_ferramenta,
		on_use = function(itemstack, user)
			local inv = user:get_inventory()
			if megarastreador_verificar_se_eh_unico(inv) then
				itemstack:set_name("megarastreador:rastreador_ferramenta_"..nome.."_ativo")
				local referencia = refe
				minetest.after(1, megarastreador_rastrear, user, itemstack, referencia)
				minetest.after(1, megarastreador_desgastar, user, itemstack)
				return itemstack
			else
				local name = user:get_player_name()
				local lim_ativ = megarastreador_lim_ferram_ati
				minetest.chat_send_player(name, "Apenas "..lim_ativ.." Rastreador(s) Ativo(s) por vez")
			end
		end,
		on_place = function(itemstack, placer, pointed_thing)
			local pos = pointed_thing.above
			local lugar = minetest.get_node(pos)
			if lugar.name=="air" then
				local pos = pointed_thing.above
				local node = minetest.get_node(pos)
				node.name = "megarastreador:rastreador_"..nome
				minetest.place_node(pos, node)
				local meta = minetest.get_meta(pos)
				local desgaste = itemstack:get_wear()
				local porcentagem_desgaste = 100-( math.ceil( (desgaste/65535)*100 ) );
				meta:set_string("desgaste", desgaste)
				meta:set_string("infotext", "Rastreador (Bateria "..porcentagem_desgaste.."%)")
				itemstack:take_item()
				return itemstack
			end
		end,
		groups = doGroup,
	})

	-- Ferramenta Rastreadora Ativa
	minetest.register_tool("megarastreador:rastreador_ferramenta_"..nome.."_ativo", {
		description = desc.." Ativo",
		inventory_image = textura_ferramenta,
		on_use = function(itemstack, user)
			--itemstack:set_name("megarastreador:rastreador_ferramenta_"..nome)
			minetest.after(4, megarastreador_desligar_rastreador, user, itemstack)
		end,
		groups = {not_in_creative_inventory = 1},
	})
	
	-- Rastreador (Node)
	minetest.register_node("megarastreador:rastreador_"..nome, {
		description = "Rastreador Node",
		drawtype = "nodebox",
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = false,
		stack_max = 1,
		tiles = {"megarastreador_cima.png","megarastreador_baixo.png","megarastreador_lado.png","megarastreador_lado.png","megarastreador_fundo.png",textura_node},
		node_box = {type = "fixed",fixed = {{-0.375, -0.5, -0.1875, 0.375, 0.0625, 0.1875},{0.3125, -0.4375, 0.125, 0.25, 0.5, 0.0625},{-0.25, -0.3125, -0.25, -0.0625, 0, -0.125},{-0.3125, -0.25, -0.25, 0, -0.0625, -0.125},{0.125, -0.5, 0, 0.1875, 0.4375, 0.0625}}},
		groups = {not_in_creative_inventory = 1, oddly_breakable_by_hand=3},
		sounds = default.node_sound_stone_defaults(),
		on_dig = function(pos, node, digger)
			local meta = minetest.env:get_meta(pos)
			local desgaste = meta:get_string("desgaste")
			local idItem = "megarastreador:rastreador_ferramenta_"..nome.." 1 "..desgaste
			digger:get_inventory():add_item("main", ItemStack(idItem))
			minetest.remove_node(pos)
		end,
	    on_rightclick = function(pos, node, player, itemstack)
	    	if itemstack:get_name() ~= "" then
		    	if itemstack:get_name() == megarastreador_bateria then
		    		local meta = minetest.env:get_meta(pos)
	    			local desgaste = meta:get_string("desgaste")
			    	local porcentagem_desgaste = 100-( math.ceil( (desgaste/65535)*100 ) );
		    		if porcentagem_desgaste < 100 then
			    		meta:set_string("desgaste", 0)
			    		local desgaste = meta:get_string("desgaste")
			    		local porcentagem_desgaste = 100-( math.ceil( (desgaste/65535)*100 ) );
						meta:set_string("infotext", "Rastreador (Bateria "..porcentagem_desgaste.."%)")
						nodeupdate(pos)
			    		itemstack:take_item()
			    		megarastreador_beepar_redefiniu(player)
			    		return itemstack
			    	end
		    	else
		    		local meta = minetest.env:get_meta(pos)
		    		local desgaste = meta:get_string("desgaste")
		    		print("desgaste = "..desgaste)
		    		local porcentagem_desgaste = 100-( math.ceil( (desgaste/65535)*100 ) );
			    	local item = itemstack:get_name()
			    	local novo_rastreador = megarastreador_verificar_referencia(item)
			    	if novo_rastreador ~= nil then
			    		node.name = novo_rastreador
						minetest.env:set_node(pos, node)
						meta:set_string("infotext", "Rastreador (Bateria "..porcentagem_desgaste.."%)")
						meta:set_string("desgaste", desgaste)
						nodeupdate(pos)
						megarastreador_beepar_redefiniu(player)
			    	end
		    	end
		    end
	    end,
	})
end
