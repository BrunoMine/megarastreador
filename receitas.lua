--
-- Receitas 
--

minetest.register_craft({
	output = 'megarastreador:rastreador_ferramenta_mese',
	recipe = {
		{'default:bronze_ingot',	'group:stick',			'default:bronze_ingot'},
		{'group:stick',				'default:mese_crystal',	'group:stick'},
		{'default:bronze_ingot',	'group:stick',			'default:bronze_ingot'},
	}
})