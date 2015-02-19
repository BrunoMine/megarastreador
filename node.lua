--
-- Nodes e ferramentas
--

for _, row in ipairs(megarastreador_rastreadores) do
	local nome = row[1]
	local desc = row[2]
	local refe = row[3]
	local textura_ferramenta = row[4]
	local textura_node = row[5]
	local exemplar = row[6]
	local novo_node = "megarastreador:rastreador_"..nome
	megarastreador_gerar_exemplar(exemplar, novo_node)
	-- Ferramenta Rastreadora
	minetest.register_tool("megarastreador:rastreador_ferramenta_"..nome, {
		description = desc,
		inventory_image = textura_ferramenta,
		on_use = function(itemstack, user)
			itemstack:set_name("megarastreador:rastreador_ferramenta_"..nome.."_ativo")
			local referencia = refe
			minetest.after(1, megarastreador_rastrear, user, itemstack, referencia)
			minetest.after(1, megarastreador_desgastar, user, itemstack)
			return itemstack
		end,
		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type == "node" and itemstack:get_wear() == 0 then
				local node = minetest.get_node(pointed_thing.under)
				node.name = "megarastreador:rastreador_"..nome
				local meta = minetest.get_meta(pointed_thing.above)
				minetest.env:set_node(pointed_thing.above, node)
				nodeupdate(pointed_thing.above)
			end
		end,
	})
	
	-- Ferramenta Rastreadora Ativa
	minetest.register_tool("megarastreador:rastreador_ferramenta_"..nome.."_ativo", {
		description = desc.." Ativo",
		inventory_image = textura_ferramenta,
		on_use = function(itemstack, user)
			itemstack:set_name("megarastreador:rastreador_ferramenta_"..nome)
			return itemstack
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
		groups = {attached_node=1, not_in_creative_inventory = 1, oddly_breakable_by_hand=3},
		sounds = default.node_sound_stone_defaults(),
		drop = "megarastreador:rastreador_ferramenta_"..nome,
	    on_rightclick = function(pos, node, player, itemstack)
	    	local item = itemstack:get_name()
	    	local novo_rastreador = megarastreador_verificar_referencia(item)
	    	if novo_rastreador ~= nil then
	    		node.name = novo_rastreador
				minetest.env:set_node(pos, node)
				nodeupdate(pos)
	    	end
	    end,
	})
	-- Receita para recarga
	minetest.register_craft({
	type = "shapeless",
	output = "megarastreador:rastreador_ferramenta_"..nome,
	recipe = {"megarastreador:rastreador_ferramenta_"..nome, megarastreador_bateria},
})
end