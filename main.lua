-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
--[[
local composer = require ("composer")
--print("composer")
composer.gotoScene("calculadora")
]]
local widget =  require ("widget")

local zero
local ponto
local igual
local um
local dois
local tres
local mais
local quatro
local cinco
local seis
local menos
local sete
local oito
local nove
local mutiplicacao
local ca
local botaoEmBranco
local divisao
local resultado
local guardandoSoma = 0
local pontos = true

local zero2 = true 
local ponto2 = true 
local igual2 = true 
local um2 = true 
local dois2 = true 
local tres2 = true 
local mais2 = true 
local quatro2 = true 
local cinco2 = true 
local seis2 = true 
local menos2 = true 
local sete2 = true 
local oito2 = true 
local nove2 = true 
local mutiplicacao2 = true 
local divisao2 = true 

function criarTelaDaCalculadora()
		
	resultado = native.newTextField(display.contentWidth  - 160, display.contentHeight - 300 , display.contentWidth , 50 )

	zero = widget.newButton( {label="0", x = display.contentWidth/2 - 122, y = display.contentHeight/2 + 200, width = 242 , shape="rect", fillColor = { default={1,1,1,1}, over={1,0.1,0.7,0.4} } } )
	ponto = widget.newButton( {label=".", x = display.contentWidth/2 + 41, y = display.contentHeight/2 + 200, width = 79, shape="rect",  fillColor = { default={1,1,1,1}, over={1,0.1,0.7,0.4} } } )
	igual = widget.newButton( {label="=", x = display.contentWidth/2 + 122, y = display.contentHeight/2 + 200, width = 80, shape="rect", fillColor = { default={1,0.2,0,1}, over={1,0.1,0.7,0.4} } }  )
	--zero:setFillColor(0,1,0)

	um = widget.newButton( {label="1", x = display.contentWidth/2 - 122, y = display.contentHeight/2 + 150, width = 81, shape="rect", fillColor = { default={1,1,1,1}, over={1,0.1,0.7,0.4} } }  )
	dois = widget.newButton( {label="2", x = display.contentWidth/2 - 40, y = display.contentHeight/2 + 150, width = 79, shape="rect", fillColor = { default={1,1,1,1}, over={1,0.1,0.7,0.4} } }  )
	tres = widget.newButton( {label="3", x = display.contentWidth/2 + 41, y = display.contentHeight/2 + 150, width = 79, shape="rect", fillColor = { default={1,1,1,1}, over={1,0.1,0.7,0.4} } }  )
	mais = widget.newButton( {label="+", x = display.contentWidth/2 + 122, y = display.contentHeight/2 + 150, width = 80, shape="rect",fillColor = { default={1,0.2,0,1}, over={1,0.1,0.7,0.4} } }  )

	quatro = widget.newButton( {label="4", x = display.contentWidth/2 - 122, y = display.contentHeight/2 + 100, width = 81, shape="rect", fillColor = { default={1,1,1,1}, over={1,0.1,0.7,0.4} } }  )
	cinco = widget.newButton( {label="5", x = display.contentWidth/2 - 40, y = display.contentHeight/2 + 100, width = 79, shape="rect", fillColor = { default={1,1,1,1}, over={1,0.1,0.7,0.4} } }  )
	seis = widget.newButton( {label="6", x = display.contentWidth/2 + 41, y = display.contentHeight/2 + 100, width = 79, shape="rect", fillColor = { default={1,1,1,1}, over={1,0.1,0.7,0.4} } }  )
	menos = widget.newButton( {label="-", x = display.contentWidth/2 + 122, y = display.contentHeight/2 + 100, width = 80, shape="rect", fillColor = { default={1,0.2,0,1}, over={1,0.1,0.7,0.4} } }  )

	sete = widget.newButton( {label="7", x = display.contentWidth/2 - 122, y = display.contentHeight/2 + 50, width = 81, shape="rect", fillColor = { default={1,1,1,1}, over={1,0.1,0.7,0.4} } }  )
	oito = widget.newButton( {label="8", x = display.contentWidth/2 - 40, y = display.contentHeight/2 + 50, width = 79, shape="rect",fillColor = { default={1,1,1,1}, over={1,0.1,0.7,0.4} } }  )
	nove = widget.newButton( {label="9", x = display.contentWidth/2 + 41, y = display.contentHeight/2 + 50, width = 79, shape="rect", fillColor = { default={1,1,1,1}, over={1,0.1,0.7,0.4} }  } )
	mutiplicacao = widget.newButton( {label="x", x = display.contentWidth/2 + 122, y = display.contentHeight/2 + 50, width = 80, shape="rect", fillColor = { default={1,0.2,0,1}, over={1,0.1,0.7,0.4} } }  )


	ca = widget.newButton( {label="CA", x = display.contentWidth/2 - 122, y = display.contentHeight/2, width = 81, shape="rect", fillColor = { default={0.3,0.6,0.3,1}, over={1,0.1,0.7,0.4} } }  )
	myRectangle = display.newRect(  display.contentWidth/2 , display.contentHeight/2, 160,50)
	myRectangle:setFillColor( 1,1,1 )
	divisao = widget.newButton( {label="/", x = display.contentWidth/2 + 122, y = display.contentHeight/2, width = 80, shape="rect", fillColor = { default={1,0.2,0,1}, over={1,0.1,0.7,0.4} } }  )

end

criarTelaDaCalculadora()

------------------------------------------------------------------------------------------------------------------------------

function toqueNaTelaZero(event)

	if event.phase == "began" then
		
		if zero2 == true then
			resultado.text = resultado.text .. "0"
		end
	end
end

function toqueNaTelaPonto(event)
	
	if event.phase == "began" then

		if ponto2 == true then
			if pontos == true then
				resultado.text = resultado.text .. "."
				pontos = false
			end
		end
	end
end

function toqueNaTelaIgual(event)

	botaoIgual = true

	if event.phase == "began" then

		if igual == true then
		
			if soma == true then
				valor =  guardandoSoma + resultado.text .. ""
				resultado.text = ""
				resultado.text =  valor

			elseif sub == true then
				valor2 = guardandosubtracao - resultado.text .. ""
				resultado.text = ""
				resultado.text = valor2
			
			elseif divide == true then

				if resultado.text == "0" then
					resultado.text = "Erro"
				else
				valor3 = guardandoDivisao / resultado.text .. ""
				resultado.text = ""
				resultado.text = valor3
				end

			elseif mult == true then
				valor4 = guardandoMultiplicacao * resultado.text .. ""
				resultado.text = ""
				resultado.text = valor4			
			end
			soma = false
			mult = false
			sub  = false
			divide = false

			zero2 = false
			ponto2 = false
			igual2 = false
			um2 = false
			dois2 = false
			tres2 = false
			mais2 = false
			quatro2 = false
			cinco2 = false
			seis2 = false
			menos2 = false
			sete2 = false
			oito2 = false
			nove2 = false
			mutiplicacao2 = false
			divisao2 = false
		end
	end
end

---------------------------------------------------------------------------------

function toqueNaTelaUm(event)

	if event.phase == "began" then

		if um2 == true then

			if resultado.text == "." or resultado.text == ".." or resultado.text == "..." or resultado.text == "...." or resultado.text == "0" or resultado.text == "00" or resultado.text == "000" or resultado.text == "0000"  then
				resultado.text = "1"
			elseif resultado.text ~= "0" and resultado.text ~= "." then
				resultado.text = resultado.text .. "1"
			end
		end	
	end
end

function toqueNaTelaDois(event)

	if event.phase == "began" then

		if dois2 == true then

			if resultado.text == "." or resultado.text == ".." or resultado.text == "..." or resultado.text == "...." or resultado.text == "0" or resultado.text == "00" or resultado.text == "000" or resultado.text == "0000"  then
				resultado.text = "2"
			elseif resultado.text ~= "0" and resultado.text ~= "." then
				resultado.text = resultado.text .. "2"
			end
		end
	end
end

function toqueNaTelaTres(event)

	if event.phase == "began" then

		if tres2 == true then
		
			if resultado.text == "." or resultado.text == ".." or resultado.text == "..." or resultado.text == "...." or resultado.text == "0" or resultado.text == "00" or resultado.text == "000" or resultado.text == "0000"  then
				resultado.text = "3"
			elseif resultado.text ~= "0" and resultado.text ~= "." then
				resultado.text = resultado.text .. "3"
			end
		end
	end
end

function toqueNaTelaMais(event)

	if event.phase == "began" then

		if resultado.text == "." then
			resultado.text = "Erro"
		elseif mais2 == true then
			guardandoSoma = resultado.text
			resultado.text = ""
			soma = true
			mult = false
			sub  = false
			divide = false
			pontos = true
		end
	end
end

--------------------------------------------------------------------------------


function toqueNaTelaQuatro(event)

	if event.phase == "began" then
		
		if quatro2 == true then
		
			if resultado.text == "." or resultado.text == ".." or resultado.text == "..." or resultado.text == "...." or resultado.text == "0" or resultado.text == "00" or resultado.text == "000" or resultado.text == "0000"  then
				resultado.text = "4"
			elseif resultado.text ~= "0" and resultado.text ~= "." then
				resultado.text = resultado.text .. "4"
			end
		end
	end
end

function toqueNaTelaCinco(event)
	
	if event.phase == "began" then
		
		if cinco2 == true then
		
			if resultado.text == "." or resultado.text == ".." or resultado.text == "..." or resultado.text == "...." or resultado.text == "0" or resultado.text == "00" or resultado.text == "000" or resultado.text == "0000"  then
				resultado.text = "5"
			elseif resultado.text ~= "0" and resultado.text ~= "." then
				resultado.text = resultado.text .. "5"
			end
		end
	end
end

function toqueNaTelaSeis(event)

	if event.phase == "began" then
		
		if seis2 == true then
		
			if resultado.text == "." or resultado.text == ".." or resultado.text == "..." or resultado.text == "...." or resultado.text == "0" or resultado.text == "00" or resultado.text == "000" or resultado.text == "0000"  then
				resultado.text = "6"
			elseif resultado.text ~= "0" and resultado.text ~= "." then
				resultado.text = resultado.text .. "6"
			end
		end
	end
end

function toqueNaTelaMenos(event)

	if event.phase == "began" then

		if resultado.text == "." then
			resultado.text = "Erro"
		elseif menos2 == true then 
			guardandosubtracao = resultado.text
			resultado.text = ""

			soma = false
			mult = false
			sub  = true
			divide = false
			pontos = true
		end
	end
end

-------------------------------------------------------------------------------

function toqueNaTelaSete(event)

	if event.phase == "began" then
		
		if sete2 == true then
		
			if resultado.text == "." or resultado.text == ".." or resultado.text == "..." or resultado.text == "...." or resultado.text == "0" or resultado.text == "00" or resultado.text == "000" or resultado.text == "0000"  then
				resultado.text = "7"
			elseif resultado.text ~= "0" and resultado.text ~= "." then
				resultado.text = resultado.text .. "7"
			end
		end
	end
end

function toqueNaTelaOito(event)
	
	if event.phase == "began" then
		
		if oito2 == true then
		
			if resultado.text == "." or resultado.text == ".." or resultado.text == "..." or resultado.text == "...." or resultado.text == "0" or resultado.text == "00" or resultado.text == "000" or resultado.text == "0000"  then
				resultado.text = "8"
			elseif resultado.text ~= "0" and resultado.text ~= "." then
				resultado.text = resultado.text .. "8"
			end
		end
	end
end

function toqueNaTelaNove(event)

	if event.phase == "began" then
		
		if seis2 == true then
		
			if resultado.text == "." or resultado.text == ".." or resultado.text == "..." or resultado.text == "...." or resultado.text == "0" or resultado.text == "00" or resultado.text == "000" or resultado.text == "0000"  then
				resultado.text = "9"
			elseif resultado.text ~= "0" and resultado.text ~= "." then
				resultado.text = resultado.text .. "9"
			end
		end
	end
end

function toqueNaTelaMult(event)

	if event.phase == "began" then

		if resultado.text == "." then
			resultado.text = "Erro"
		elseif mutiplicacao2 == true then 
			guardandoMultiplicacao = resultado.text
			resultado.text = ""

			soma = false
			mult = true
			sub  = false
			divide = false
			pontos = true
		end
	end
end

--------------------------------------------------------------------------------

function toqueNaTelaCa(event)

	if event.phase == "began" then
		resultado.text = ""
		pontos = true
		zero2 = true
		ponto2 = true
		igual2 = true
		um2 = true
		dois2 = true
		tres2 = true
		mais2 = true
		quatro2 = true
		cinco2 = true
		seis2 = true
		menos2 = true
		sete2 = true
		oito2 = true
		nove2 = true
		mutiplicacao2 = true
		divisao2 = true

	end
end

function toqueNaTelaDivisao(event)

	if event.phase == "began" then

		if resultado.text == "." then
			resultado.text = "Erro"
		elseif divisao2 == true then 
			guardandoDivisao = resultado.text
			resultado.text = ""

			soma = false
			mult = false
			sub  = false
			divide = true
			pontos = true
		end
	end
end

zero:addEventListener("touch",toqueNaTelaZero)
ponto:addEventListener("touch",toqueNaTelaPonto)
igual:addEventListener("touch",toqueNaTelaIgual)
igual = true

um:addEventListener("touch",toqueNaTelaUm)
dois:addEventListener("touch",toqueNaTelaDois)
tres:addEventListener("touch",toqueNaTelaTres)
mais:addEventListener("touch",toqueNaTelaMais)

quatro:addEventListener("touch",toqueNaTelaQuatro)
cinco:addEventListener("touch",toqueNaTelaCinco)
seis:addEventListener("touch",toqueNaTelaSeis)
menos:addEventListener("touch",toqueNaTelaMenos)

sete:addEventListener("touch",toqueNaTelaSete)
oito:addEventListener("touch",toqueNaTelaOito)
nove:addEventListener("touch",toqueNaTelaNove)
mutiplicacao:addEventListener("touch",toqueNaTelaMult)

ca:addEventListener("touch",toqueNaTelaCa)
divisao:addEventListener("touch",toqueNaTelaDivisao)
