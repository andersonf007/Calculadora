-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local widget =  require ("widget")

resultado = native.newTextField(display.contentWidth  - 160, display.contentHeight - 300 , display.contentWidth , 50 )

zero = widget.newButton( {label="0", x = display.contentWidth/2 - 122, y = display.contentHeight/2 + 200, width = 81 , shape="rect", fillColor = { default={1,1,1,1}, over={1,0.1,0.7,0.4} } } )
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
--oito = widget.newButton( {label="8", x = display.contentWidth/2 - 35, y = display.contentHeight/2} )
--porgentagem = widget.newButton( {label="%", x = display.contentWidth/2 + 41, y = display.contentHeight/2 , width = 79, shape="rect", fillColor = { default={1,0.2,0,1}, over={1,0.1,0.7,0.4} }  } )
divisao = widget.newButton( {label="/", x = display.contentWidth/2 + 122, y = display.contentHeight/2, width = 80, shape="rect", fillColor = { default={1,0.2,0,1}, over={1,0.1,0.7,0.4} } }  )

--soma = false
--mult = false
--sub  = false
--divide = false

guardandoSoma = 0

------------------------------------------------------------------------------------------------------------------------------

function toqueNaTelaZero(event)

	if event.phase == "began" then
		if botaoIgual == true then
			resultado.text = ""
			botaoIgual = false
		end
		resultado.text = resultado.text .. "0"
	end
end

function toqueNaTelaPonto(event)
	
	if event.phase == "began" then
		resultado.text = resultado.text .. "."
	end
end

function toqueNaTelaIgual(event)

	botaoIgual = true

	if event.phase == "began" then

		if igual == true then
		--	igual = false
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
		end
		soma = false
		mult = false
		sub  = false
		divide = false
	end
end

---------------------------------------------------------------------------------

function toqueNaTelaUm(event)

	if event.phase == "began" then
		if botaoIgual == true then
			resultado.text = ""
			botaoIgual = false
		end
		if resultado.text == "0" or resultado.text == "00" or resultado.text == "000" or resultado.text == "0000" then
		resultado.text = "1"
		elseif resultado.text ~= "0" then
		resultado.text = resultado.text .. "1"
		end
	end
end

function toqueNaTelaDois(event)

	if event.phase == "began" then
		if botaoIgual == true then
			resultado.text = ""
			botaoIgual = false
		end
		if resultado.text == "0" or resultado.text == "00" or resultado.text == "000" or resultado.text == "0000" then
		resultado.text = "2"
		elseif resultado.text ~= "0" then
		resultado.text = resultado.text .. "2"
		end
	end
end

function toqueNaTelaTres(event)

	if event.phase == "began" then
		if botaoIgual == true then
			resultado.text = ""
			botaoIgual = false
		end
		if resultado.text == "0" or resultado.text == "00" or resultado.text == "000" or resultado.text == "0000" then
		resultado.text = "3"
		elseif resultado.text ~= "0" then
		resultado.text = resultado.text .. "3"
		end
	end
end

function toqueNaTelaMais(event)

	if event.phase == "began" then
		guardandoSoma = resultado.text
		resultado.text = ""
		soma = true
		mult = false
		sub  = false
		divide = false
	end
end

--------------------------------------------------------------------------------


function toqueNaTelaQuatro(event)

	if event.phase == "began" then
		if botaoIgual == true then
			resultado.text = ""
			botaoIgual = false
		end
		if resultado.text == "0" or resultado.text == "00" or resultado.text == "000" or resultado.text == "0000" then
		resultado.text = "4"
		elseif resultado.text ~= "0" then
		resultado.text = resultado.text .. "4"
		end
	end
end

function toqueNaTelaCinco(event)

	if event.phase == "began" then
		if botaoIgual == true then
			resultado.text = ""
			botaoIgual = false
		end
		if resultado.text == "0" or resultado.text == "00" or resultado.text == "000" or resultado.text == "0000" then
		resultado.text = "5"
		elseif resultado.text ~= "0" then
		resultado.text = resultado.text .. "5"
		end
	end
end

function toqueNaTelaSeis(event)

	if event.phase == "began" then
		if botaoIgual == true then
			resultado.text = ""
			botaoIgual = false
		end
		if resultado.text == "0" or resultado.text == "00" or resultado.text == "000" or resultado.text == "0000" then
		resultado.text = "6"
		elseif resultado.text ~= "0" then
		resultado.text = resultado.text .. "6"
		end
	end
end

function toqueNaTelaMenos(event)

	if event.phase == "began" then
		guardandosubtracao = resultado.text
		resultado.text = ""

		soma = false
		mult = false
		sub  = true
		divide = false
	--	resultado.text = resultado.text .. "-"
	end
end

-------------------------------------------------------------------------------

function toqueNaTelaSete(event)

	if event.phase == "began" then
		if botaoIgual == true then
			resultado.text = ""
			botaoIgual = false
		end
		if resultado.text == "0" or resultado.text == "00" or resultado.text == "000" or resultado.text == "0000" then
		resultado.text = "7"
		elseif resultado.text ~= "0" then
		resultado.text = resultado.text .. "7"
		end
	end
end

function toqueNaTelaOito(event)
	
	if event.phase == "began" then
		if botaoIgual == true then
			resultado.text = ""
			botaoIgual = false
		end
		if resultado.text == "0" or resultado.text == "00" or resultado.text == "000" or resultado.text == "0000" then
		resultado.text = "8"
		elseif resultado.text ~= "0" then
		resultado.text = resultado.text .. "8"
		end
	end
end

function toqueNaTelaNove(event)

	if event.phase == "began" then
		if botaoIgual == true then
			resultado.text = ""
			botaoIgual = false
		end
		if resultado.text == "0" or resultado.text == "00" or resultado.text == "000" or resultado.text == "0000" then
		resultado.text = "9"
		elseif resultado.text ~= "0" then
		resultado.text = resultado.text .. "9"
		end
	end
end

function toqueNaTelaMult(event)

	if event.phase == "began" then
		guardandoMultiplicacao = resultado.text
		resultado.text = ""

		soma = false
		mult = true
		sub  = false
		divide = false
	--	resultado.text = resultado.text .. "*"
	end
end

--------------------------------------------------------------------------------

function toqueNaTelaCa(event)

	if event.phase == "began" then
		resultado.text = ""
	end
end

function toqueNaTelaDivisao(event)

	if event.phase == "began" then
		guardandoDivisao = resultado.text
		resultado.text = ""

		soma = false
		mult = false
		sub  = false
		divide = true
	--	resultado.text = resultado.text .. "/"
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

