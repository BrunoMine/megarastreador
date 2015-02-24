--
-- Diretrizes do Rastreador
--
-- Diretrizes para definir
-- (Voce pode definir algumas partes do mod como achar necessario)
--

-- Tempo total da bateria
local tempo_bateria_em_minutos = 10

-- Item que funciona como bateria (Id do item)
local bateria = ""

-- Limite de ferramentas ativas (por jogador)
local limite_de_ferramentas_ativas = 1

-- Tabela de Rastreadores (seja cuidadoso ao montar as texturas,  tome como referencias as já prontas)
megarastreador_rastreadores = {
	-- name			Description					Reference(string)				Texture of tool										Texture of node							Ativador(string)
	{"mese",		"Rastreador de Mese",		"default:stone_with_mese",		"megarastreador_imagem_inventario_mese.png"	,		"megarastreador_frente_mese.png",		"default:mese_crystal"},
	{"diamante",	"Rastreador de Diamante",	"default:stone_with_diamond",	"megarastreador_imagem_inventario_diamante.png",	"megarastreador_frente_diamante.png",	"default:diamond"},
	{"ouro",		"Rastreador de Ouro",		"default:stone_with_gold",		"megarastreador_imagem_inventario_ouro.png",		"megarastreador_frente_ouro.png",		"default:gold_ingot"},
	{"cobre",		"Rastreador de Cobre",		"default:stone_with_copper",	"megarastreador_imagem_inventario_cobre.png",		"megarastreador_frente_cobre.png",		"default:copper_ingot"},
	{"ferro",		"Rastreador de Ferro",		"default:stone_with_iron",		"megarastreador_imagem_inventario_ferro.png",		"megarastreador_frente_ferro.png",		"default:steel_ingot"},
}

megarastreador_bateria = bateria
if megarastreador_bateria == "" then
	if type(brazutec_laptop)=="table" then
		megarastreador_bateria = "brazutec:bateria"
	else
		megarastreador_bateria = "default:mese_crystal_fragment"
	end
end

megarastreador_tempo_bateria = (65535/(tempo_bateria_em_minutos*60))*5

megarastreador_lim_ferram_ati = limite_de_ferramentas_ativas
