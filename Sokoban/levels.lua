--[[tablePole = { }
for i=1,10 do
	tablePole[i] = {}
	for j=1,10 do
		tablePole[i][j] = 0
	end
end]]


--сколько всего пройдено уровней
whichlevel = 1 
--какой уровень выбран
wholevel = 0
isfinish = false
KudaSmotret = 1

--[[
	Так будет выглядить первый уровень
	0 - ненужное поле (пустота)
	1 - персонаж
	2 - двигаемое поле
	3 - недвигаемое поле 
	5 - куда надо
	10 - поле передвижения
	51 - персонаж на поле куда надо
	52 - куб на поле куда надо 
]]--
--[[
	0 0 0 0 0 0 0 0 0 0
	0 0 0 3 3 3 0 0 0 0
	0 0 0 3 5 3 0 0 0 0
	0 0 0 3 10 3 3 3 3 0
	0 3 3 3 2 10 2 5 3 0
	0 3 5 10 2 1 3 3 3 0
	0 3 3 3 3 2 3 0 0 0
	0 0 0 0 3 5 3 0 0 0
	0 0 0 0 3 3 3 0 0 0
	0 0 0 0 0 0 0 0 0 0
]]--
tableLevel1 = {
	{0,0,0,0,0,0,0,0,0,0},
	{0,0,0,3,3,3,0,0,0,0},
	{0,0,0,3,5,3,0,0,0,0},
	{0,0,0,3,10,3,3,3,3,0},
	{0,3,3,3,2,10,2,5,3,0},
	{0,3,5,10,2,1,3,3,3,0},
	{0,3,3,3,3,2,3,0,0,0},
	{0,0,0,0,3,5,3,0,0,0},
	{0,0,0,0,3,3,3,0,0,0},
	{0,0,0,0,0,0,0,0,0,0}
}

--[[
	3 3 3 3 3 0 0 0 0 0
	3 10 10 10 3 0 0 0 0 0
	3 1 10 10 3 0 3 3 3 0
	3 10 2 10 3 0 3 5 3 0
	3 3 3 10 3 3 3 5 3 0
	0 3 3 10 2 10 10 5 3 0
	0 3 10 10 2 3 10 10 3 0
	0 3 10 10 10 3 3 3 3 0
	0 3 3 3 3 3 0 0 0 0
	0 0 0 0 0 0 0 0 0 0
]]--
tableLevel2 = {
	{3,3,3,3,3,0,0,0,0,0},
	{3,10,10,10,3,0,0,0,0,0},
	{3,1,10,10,3,0,3,3,3,0},
	{3,10,2,10,3,0,3,5,3,0},
	{3,3,3,10,3,3,3,5,3,0},
	{0,3,3,10,2,10,10,5,3,0},
	{0,3,10,10,2,3,10,10,3,0},
	{0,3,10,10,10,3,3,3,3,0},
	{0,3,3,3,3,3,0,0,0,0},
	{0,0,0,0,0,0,0,0,0,0}
}

--[[
	0 0 0 0 3 3 3 3 3 0
	0 0 0 0 3 10 5 5 3 0
	0 0 0 0 3 10 10 10 3 0
	0 0 0 0 3 3 10 3 3 0
	0 3 3 3 3 3 1 3 0 0
	0 3 10 10 10 10 10 3 3 0
	0 3 10 3 3 2 2 10 3 0
	0 3 10 10 10 10 3 10 3 0
	0 3 3 3 3 10 10 10 3 0
	0 0 0 0 3 3 3 3 3 0
]]--
tableLevel3 = {
	{0,0,0,0,3,3,3,3,3,0},
	{0,0,0,0,3,10,5,5,3,0},
	{0,0,0,0,3,10,10,10,3,0},
	{0,0,0,0,3,3,10,3,3,0},
	{0,3,3,3,3,3,1,3,0,0},
	{0,3,10,10,10,10,10,3,3,0},
	{0,3,10,3,3,2,2,10,3,0},
	{0,3,10,10,10,10,3,10,3,0},
	{0,3,3,3,3,10,10,10,3,0},
	{0,0,0,0,3,3,3,3,3,0}
}

--[[
	0 0 0 0  0  0  0 0 0 0
	0 0 3 3  3  3  3 3 3 0
	0 0 3 3  10 10 10 5 3 0
	0 0 3 3  1  3  10 3 3 0
	0 0 3 3  2  10 10 3 3 0
	0 0 3 10 5  2  10 3 3 0
	0 0 3 10 10 10 3 3 3 0
	0 0 3 3  3  3  3 3 3 0
	0 0 0 0  0  0  0 0 0 0
	0 0 0 0  0  0  0 0 0 0
]]--
tableLevel4 = {
	{0,0,0,0,0,0,0,0,0,0},
	{0,0,3,3,3,3,3,3,3,0},
	{0,0,3,3,10,10,10,5,3,0},
	{0,0,3,3,1,3,10,3,3,0},
	{0,0,3,3,2,10,10,3,3,0},
	{0,0,3,10,5,2,10,3,3,0},
	{0,0,3,10,10,10,3,3,3,0},
	{0,0,3,3,3,3,3,3,3,0},
	{0,0,0,0,0,0,0,0,0,0},
	{0,0,0,0,0,0,0,0,0,0}
}

--[[
	0 0 0 0 0 0 0 0 0 0
	0 0 3 3 3 3 3 3 3 0
	0 0 3 5 3 10 10 10 3 0
	0 0 3 1 2 10 10 10 3 0
	0 0 3 10 3 3 10 10 3 0
	0 0 3 5 2 5 10 10 3 0
	0 0 3 10 2 3 10 10 3 0
	0 0 3 10 10 3 3 3 3 0
	0 0 3 3 3 3 3 3 3 0
	0 0 0 0 0 0 0 0 0 0
]]--
tableLevel5 = {
	{0,0,0,0,0,0,0,0,0,0},
	{0,0,3,3,3,3,3,3,3,0},
	{0,0,3,5,3,10,10,10,3,0},
	{0,0,3,1,2,10,10,10,3,0},
	{0,0,3,10,3,3,10,10,3,0},
	{0,0,3,5,2,5,10,10,3,0},
	{0,0,3,10,2,3,10,10,3,0},
	{0,0,3,10,10,3,3,3,3,0},
	{0,0,3,3,3,3,3,3,3,0},
	{0,0,0,0,0,0,0,0,0,0}
}

tablePole = { }
for i=1,10 do
	tablePole[i] = {}
	for j=1,10 do
		tablePole[i][j] = 0
	end
end

--Картинки
PicturePersona1 = love.graphics.newImage("gruzchik1.png")
PicturePersona2 = love.graphics.newImage("gruzchik2.png")
PicturePersona3 = love.graphics.newImage("gruzchik3.png")
PicturePersona4 = love.graphics.newImage("gruzchik4.png")
PictureBox = love.graphics.newImage("box.png")
PictureStar = love.graphics.newImage("star.png")
PictureStena = love.graphics.newImage("stena.jpg")
PictureTrava = love.graphics.newImage("trava.jpg")

function Levels( )
	DrawLevel( tablePole )
end

function DrawLevel( tableLevel )
	for i=1,10 do
		for j=1,10 do
			if tableLevel[i][j] == 1 then
				love.graphics.setColor( 250, 250, 250)
				--love.graphics.rectangle("fill", 50*(i-1), 50*(j-1), 50, 50)
				love.graphics.draw(PictureTrava, 50*(i-1), 50*(j-1))
				if KudaSmotret == 2 then 
					love.graphics.draw(PicturePersona2, 50*(i-1), 50*(j-1))
				elseif KudaSmotret == 3 then 
					love.graphics.draw(PicturePersona3, 50*(i-1), 50*(j-1))
				elseif KudaSmotret == 4 then 
					love.graphics.draw(PicturePersona4, 50*(i-1), 50*(j-1))	
				else 
					love.graphics.draw(PicturePersona1, 50*(i-1), 50*(j-1))
				end
			elseif tableLevel[i][j] == 2 then 
				love.graphics.setColor(250, 250, 250)
				--love.graphics.rectangle("fill", 50*(i-1), 50*(j-1), 50, 50)
				love.graphics.draw(PictureTrava, 50*(i-1), 50*(j-1))
				love.graphics.draw(PictureBox, 50*(i-1), 50*(j-1))
			elseif tableLevel[i][j] == 3 then
				love.graphics.setColor(250, 250, 250)
				love.graphics.draw(PictureStena, 50*(i-1), 50*(j-1))
				--love.graphics.rectangle("fill", 50*(i-1), 50*(j-1), 50, 50)
			elseif tableLevel[i][j] == 5 then 
				love.graphics.setColor(250, 0, 150)
				--love.graphics.rectangle("fill", 50*(i-1), 50*(j-1), 50, 50)
				love.graphics.draw(PictureTrava, 50*(i-1), 50*(j-1))
				love.graphics.setColor( 250, 250, 250)
				love.graphics.draw(PictureStar, 50*(i-1)+12.5, 50*(j-1)+12.5, 0, 1/2, 1/2)
			elseif tableLevel[i][j] == 10 then 
				love.graphics.setColor(250, 250, 250)
				--love.graphics.rectangle("fill", 50*(i-1), 50*(j-1), 50, 50)
				love.graphics.draw(PictureTrava, 50*(i-1), 50*(j-1))
			elseif tableLevel[i][j] == 51 then 
				love.graphics.setColor(0, 200, 250)
				--love.graphics.rectangle("fill", 50*(i-1), 50*(j-1), 50, 50)
				love.graphics.draw(PictureTrava, 50*(i-1), 50*(j-1))
				if KudaSmotret == 2 then 
					love.graphics.draw(PicturePersona2, 50*(i-1), 50*(j-1))
				elseif KudaSmotret == 3 then 
					love.graphics.draw(PicturePersona3, 50*(i-1), 50*(j-1))
				elseif KudaSmotret == 4 then 
					love.graphics.draw(PicturePersona4, 50*(i-1), 50*(j-1))	
				else 
					love.graphics.draw(PicturePersona1, 50*(i-1), 50*(j-1))
				end
			elseif tableLevel[i][j] == 52 then 
				love.graphics.setColor(250, 250, 0)
				--love.graphics.rectangle("fill", 50*(i-1), 50*(j-1), 50, 50)
				love.graphics.draw(PictureTrava, 50*(i-1), 50*(j-1))
				love.graphics.draw(PictureBox, 50*(i-1), 50*(j-1))
			end
		end
	end
end

function UpdateTablePole( )
	for i=1,10 do
		for j=1,10 do
			tablePole[i][j] = 0
		end
	end
end

function SetTablePole( countLevel )
	isfinish = false
	KudaSmotret = 1
	if countLevel == 1 then
		for i=1,10 do
			for j=1,10 do
				tablePole[i][j] = tableLevel1[i][j]
			end
		end
	end
	if countLevel == 2 then
		for i=1,10 do
			for j=1,10 do
				tablePole[i][j] = tableLevel2[i][j]
			end
		end
	end
	if countLevel == 3 then
		for i=1,10 do
			for j=1,10 do
				tablePole[i][j] = tableLevel3[i][j]
			end
		end
	end
	if countLevel == 4 then
		for i=1,10 do
			for j=1,10 do
				tablePole[i][j] = tableLevel4[i][j]
			end
		end
	end
	if countLevel == 5 then
		for i=1,10 do
			for j=1,10 do
				tablePole[i][j] = tableLevel5[i][j]
			end
		end
	end
end

--[[
	1 - вверх
	2 - вправо
	3 - вниз
	4 - влево
]]

function ActionInGame( turn )
	--Поиск где персонаж
	XPersona = 0
	YPersona = 0
	GdePersona = 0 
	for i=1,10 do
		for j=1,10 do
			if tablePole[i][j] == 1 then
				XPersona = i
				YPersona = j
				GdePersona = 1 
				break
			end
		end
	end
	if GdePersona == 0 then
		for i=1,10 do
			for j=1,10 do
				if tablePole[i][j] == 51 then
					XPersona = i
					YPersona = j
					GdePersona = 51 
					break
				end
			end
		end
	end
	if turn == 1 then
		KudaSmotret = 1
		--Персона - Куб
		if tablePole[XPersona - 1][YPersona] == 2 or tablePole[XPersona - 1][YPersona] == 52 then 
			if tablePole[XPersona - 2][YPersona] == 10 then 
				tablePole[XPersona - 2][YPersona] = 2 
				if tablePole[XPersona - 1][YPersona] == 2 then
					tablePole[XPersona - 1][YPersona] = 1
				else 
					tablePole[XPersona - 1][YPersona] = 51
				end
				if GdePersona == 1 then
					tablePole[XPersona][YPersona] = 10 
				else
					tablePole[XPersona][YPersona] = 5
				end
			elseif tablePole[XPersona - 2][YPersona] == 5 then 
				tablePole[XPersona - 2][YPersona] = 52 
				if tablePole[XPersona - 1][YPersona] == 2 then
					tablePole[XPersona - 1][YPersona] = 1
				else 
					tablePole[XPersona - 1][YPersona] = 51
				end
				if GdePersona == 1 then
					tablePole[XPersona][YPersona] = 10 
				else
					tablePole[XPersona][YPersona] = 5
				end
			end
		end
		-- Персона - контрольная точчка
		if tablePole[XPersona - 1][YPersona] == 5 then 
			tablePole[XPersona - 1][YPersona] = 51
			if GdePersona == 1 then
				tablePole[XPersona][YPersona] = 10 
			else
				tablePole[XPersona][YPersona] = 5
			end
		end
		-- Персона - пустота 
		if tablePole[XPersona - 1][YPersona] == 10 then 
			tablePole[XPersona - 1][YPersona] = 1
			if GdePersona == 1 then
				tablePole[XPersona][YPersona] = 10 
			else
				tablePole[XPersona][YPersona] = 5
			end
		end
	elseif turn == 2 then
		KudaSmotret = 2
		--Персона - Куб
		if tablePole[XPersona][YPersona + 1] == 2 or tablePole[XPersona][YPersona + 1] == 52 then 
			if tablePole[XPersona][YPersona + 2] == 10 then 
				tablePole[XPersona][YPersona + 2] = 2 
				if tablePole[XPersona][YPersona + 1] == 2 then
					tablePole[XPersona][YPersona + 1] = 1
				else 
					tablePole[XPersona][YPersona + 1] = 51
				end
				if GdePersona == 1 then
					tablePole[XPersona][YPersona] = 10 
				else
					tablePole[XPersona][YPersona] = 5
				end
			elseif tablePole[XPersona][YPersona + 2] == 5 then 
				tablePole[XPersona][YPersona + 2] = 52 
				if tablePole[XPersona][YPersona + 1] == 2 then
					tablePole[XPersona][YPersona + 1] = 1
				else 
					tablePole[XPersona][YPersona + 1] = 51
				end
				if GdePersona == 1 then
					tablePole[XPersona][YPersona] = 10 
				else
					tablePole[XPersona][YPersona] = 5
				end
			end
		end
		-- Персона - контрольная точчка
		if tablePole[XPersona][YPersona + 1] == 5 then 
			tablePole[XPersona][YPersona + 1] = 51
			if GdePersona == 1 then
				tablePole[XPersona][YPersona] = 10 
			else
				tablePole[XPersona][YPersona] = 5
			end
		end
		-- Персона - пустота 
		if tablePole[XPersona][YPersona + 1] == 10 then 
			tablePole[XPersona][YPersona + 1] = 1
			if GdePersona == 1 then
				tablePole[XPersona][YPersona] = 10 
			else
				tablePole[XPersona][YPersona] = 5
			end
		end
	elseif turn == 3 then
		KudaSmotret = 3
		--Персона - Куб
		if tablePole[XPersona + 1][YPersona] == 2 or tablePole[XPersona + 1][YPersona] == 52 then 
			if tablePole[XPersona + 2][YPersona] == 10 then 
				tablePole[XPersona + 2][YPersona] = 2 
				if tablePole[XPersona + 1][YPersona] == 2 then
					tablePole[XPersona + 1][YPersona] = 1
				else 
					tablePole[XPersona + 1][YPersona] = 51
				end
				if GdePersona == 1 then
					tablePole[XPersona][YPersona] = 10 
				else
					tablePole[XPersona][YPersona] = 5
				end
			elseif tablePole[XPersona + 2][YPersona] == 5 then 
				tablePole[XPersona + 2][YPersona] = 52 
				if tablePole[XPersona + 1][YPersona] == 2 then
					tablePole[XPersona + 1][YPersona] = 1
				else 
					tablePole[XPersona + 1][YPersona] = 51
				end
				if GdePersona == 1 then
					tablePole[XPersona][YPersona] = 10 
				else
					tablePole[XPersona][YPersona] = 5
				end
			end
		end
		-- Персона - контрольная точчка
		if tablePole[XPersona + 1][YPersona] == 5 then 
			tablePole[XPersona + 1][YPersona] = 51
			if GdePersona == 1 then
				tablePole[XPersona][YPersona] = 10 
			else
				tablePole[XPersona][YPersona] = 5
			end
		end
		-- Персона - пустота 
		if tablePole[XPersona + 1][YPersona] == 10 then 
			tablePole[XPersona + 1][YPersona] = 1
			if GdePersona == 1 then
				tablePole[XPersona][YPersona] = 10 
			else
				tablePole[XPersona][YPersona] = 5
			end
		end
	elseif turn == 4 then
		KudaSmotret = 4
		--Персона - Куб
		if tablePole[XPersona][YPersona - 1] == 2 or tablePole[XPersona][YPersona - 1] == 52 then 
			if tablePole[XPersona][YPersona - 2] == 10 then 
				tablePole[XPersona][YPersona - 2] = 2 
				if tablePole[XPersona][YPersona - 1] == 2 then
					tablePole[XPersona][YPersona - 1] = 1
				else 
					tablePole[XPersona][YPersona - 1] = 51
				end
				if GdePersona == 1 then
					tablePole[XPersona][YPersona] = 10 
				else
					tablePole[XPersona][YPersona] = 5
				end
			elseif tablePole[XPersona][YPersona - 2] == 5 then 
				tablePole[XPersona][YPersona - 2] = 52 
				if tablePole[XPersona][YPersona - 1] == 2 then
					tablePole[XPersona][YPersona - 1] = 1
				else 
					tablePole[XPersona][YPersona - 1] = 51
				end
				if GdePersona == 1 then
					tablePole[XPersona][YPersona] = 10 
				else
					tablePole[XPersona][YPersona] = 5
				end
			end
		end
		-- Персона - контрольная точчка
		if tablePole[XPersona][YPersona - 1] == 5 then 
			tablePole[XPersona][YPersona - 1] = 51
			if GdePersona == 1 then
				tablePole[XPersona][YPersona] = 10 
			else
				tablePole[XPersona][YPersona] = 5
			end
		end
		-- Персона - пустота 
		if tablePole[XPersona][YPersona - 1] == 10 then 
			tablePole[XPersona][YPersona - 1] = 1
			if GdePersona == 1 then
				tablePole[XPersona][YPersona] = 10 
			else
				tablePole[XPersona][YPersona] = 5
			end
		end
	end
end

function FinishGame( )
	isfinish = true
	for i=1,10 do
		for j=1,10 do
			if tablePole[i][j] == 2 then
				isfinish = false
			end
		end
	end

	if isfinish == true and whichlevel == wholevel and whichlevel < 5 then
		whichlevel = whichlevel + 1
	end
end

buttonFinishGame = 0

function UpdateFinishWindow( x, y )
	--for startgame
	if x > 50 and x < 450 and y > 300 and y < 350 then
		buttonFinishGame = 1
	elseif x > 50 and x < 450 and y > 400 and y < 450 then
		buttonFinishGame = 2
	else
		buttonFinishGame = 0
	end
end

function DrawFinishWindow( )
	love.graphics.setColor(250, 250, 250)
	love.graphics.rectangle("fill", 50, 200, 400, 50)
	love.graphics.setColor(0, 0, 0)
	if wholevel < 5 then 
		love.graphics.print("Level completed!", 115, 210) 
	else
		love.graphics.print("Finish!", 215, 210) 
	end
	if wholevel ~= 5 then 
		if buttonFinishGame == 1 then 
			love.graphics.setColor(250, 250, 0)
		else
			love.graphics.setColor(250, 250, 250)
		end
		love.graphics.rectangle("fill", 50, 300, 400, 50)
		love.graphics.setColor(0, 0, 0)
		love.graphics.print("Next", 225, 310) 
	end
	if buttonFinishGame == 2 then 
		love.graphics.setColor(250, 250, 0)
	else
		love.graphics.setColor(250, 250, 250)
	end
	love.graphics.rectangle("fill", 50, 400, 400, 50)
	love.graphics.setColor(0, 0, 0)
	love.graphics.print("Back", 225, 410) 
end