rezhim1 = false
rezhim2 = false
rezhim3 = false

--Одна переменная для определения подсвечивания в окне выбора уровня
-- 1 - 5 - уровня
-- 0 кнопка БЭк
-- -1 сохранение
-- -2 нет подсвечивания
ischooseselect = -2

----------------------------------------------------------------------------------------------------------
--								Главное меню															--
----------------------------------------------------------------------------------------------------------

function DrawAllButtons( rezhim1, rezhim2, rezhim3 )
	mainFont = love.graphics.newFont(30);
	love.graphics.setFont(mainFont);
	if rezhim1 == true then
		DrawButtonNewGame( true )
	else
		DrawButtonNewGame( false )
	end
	if rezhim2 == true then
		DrawButtonLoadGame( true )
	else
		DrawButtonLoadGame( false )
	end
	if rezhim3 == true then
		DrawButtonExitGame( true )
	else
		DrawButtonExitGame( false )
	end
end

function UpdateMenuButton( x, y )
	--for startgame
	if x > 50 and x < 450 and y > 200 and y < 250 then
		rezhim1 = true
	else
		rezhim1 = false
	end

	if x > 50 and x < 450 and y > 300 and y < 350 then
		rezhim2 = true
	else
		rezhim2 = false
	end

	if x > 50 and x < 450 and y > 400 and y < 450 then
		rezhim3 = true
	else
		rezhim3 = false
	end
end

function DrawButtonNewGame( rezhim )
	if rezhim == true then 
		love.graphics.setColor(250, 250, 0)
	else
		love.graphics.setColor(250, 250, 250)
	end
	love.graphics.rectangle("fill", 50, 200, 400, 50)
	love.graphics.setColor(0, 0, 0)
	love.graphics.print("NEW GAME", 175, 210) 
end

function DrawButtonLoadGame( rezhim )
	if rezhim == true then 
		love.graphics.setColor(250, 250, 0)
	else
		love.graphics.setColor(250, 250, 250)
	end
	love.graphics.rectangle("fill", 50, 300, 400, 50)
	love.graphics.setColor(0, 0, 0)
	love.graphics.print("LOAD GAME", 175, 310) 
end

function DrawButtonExitGame( rezhim )
	if rezhim == true then 
		love.graphics.setColor(250, 250, 0)
	else
		love.graphics.setColor(250, 250, 250)
	end
	love.graphics.rectangle("fill", 50, 400, 400, 50)
	love.graphics.setColor(0, 0, 0)
	love.graphics.print("EXIT", 225, 410) 
end

----------------------------------------------------------------------------------------------------------
--								Окно выбора уровней														--
----------------------------------------------------------------------------------------------------------


function UpdateSelectLevel( x, y )
	--for startgame
	if x > 40 and x < 90 and y > 100 and y < 150 then
		ischooseselect = 1
	elseif x > 130 and x < 180 and y > 100 and y < 150 then
		ischooseselect = 2
	elseif x > 220 and x < 270 and y > 100 and y < 150 then
		ischooseselect = 3
	elseif x > 310 and x < 360 and y > 100 and y < 150 then
		ischooseselect = 4
	elseif x > 400 and x < 450 and y > 100 and y < 150 then
		ischooseselect = 5
	elseif x > 50 and x < 450 and y > 300 and y < 350 then
		ischooseselect = -1
	elseif x > 40 and x < 450 and y > 400 and y < 450 then
		ischooseselect = 0
	else
		ischooseselect = -2
	end
end

function DrawSelectLevels( whichlevel )
	for i=1,(whichlevel) do
		if ischooseselect == i then
			love.graphics.setColor(250, 250, 0)
		else
			love.graphics.setColor(250, 250, 250)
		end
		love.graphics.rectangle("fill", 40 + 90*(i-1), 100, 50, 50)
		love.graphics.setColor(0, 0, 0)
		love.graphics.print(i, 40 + 90*(i-1)+20, 110) 
	end
	if ischooseselect == -1 then
		love.graphics.setColor(250, 250, 0)
	else
		love.graphics.setColor(250, 250, 250)
	end
	love.graphics.rectangle("fill", 40, 300, 410, 50)
	love.graphics.setColor(0, 0, 0)
	love.graphics.print("Save", 225, 310)

	if ischooseselect == 0 then
		love.graphics.setColor(250, 250, 0)
	else
		love.graphics.setColor(250, 250, 250)
	end
	love.graphics.rectangle("fill", 40, 400, 410, 50)
	love.graphics.setColor(0, 0, 0)
	love.graphics.print("Back", 225, 410) 
end

