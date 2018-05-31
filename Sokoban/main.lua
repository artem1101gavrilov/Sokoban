
function love.load()
	math.randomseed( os.time() )
	love.window.setMode(500, 500)
	love.graphics.setBackgroundColor( 43, 77, 168 )

	require "button"
	require "levels"
	require "saveload"

	ismenu = true
	isselectlevel = false
	islevel = false
end
 
function love.update(dt)
	local x, y = love.mouse.getPosition() -- get the position of the mouse
	if ismenu == true then 
		UpdateMenuButton( x, y )
	end
	if isselectlevel == true then
		UpdateSelectLevel( x, y )
	end
	if islevel == true and isfinish == true  then
		UpdateFinishWindow( x, y )
	end
end
 

function love.keypressed(key, unicode)
	if islevel == true and isfinish == false then 
		if key == "up" or key == "w" then
			 ActionInGame(4)
			 FinishGame( )
		elseif key == "down"  or key == "s" then
			 ActionInGame(2)
			 FinishGame( )
		elseif key == "left"  or key == "a" then
			  ActionInGame(1)
			  FinishGame( )
		elseif key == "right"  or key == "d" then
			 ActionInGame(3)
			 FinishGame( )
		end
	end
	if islevel == true then 
		if key == "escape" then
			isselectlevel = true
			islevel = false
		end
		if key == "r" then
			SetTablePole( wholevel )
		end
	end
end

function love.mousepressed(x, y, button, istouch)
	if button == 1 then
		if ismenu == true then
			if x > 50 and x < 450 and y > 200 and y < 250 then
				ismenu = false
				isselectlevel = true
			end

			if x > 50 and x < 450 and y > 300 and y < 350 then
				whichlevel = Load( )
				ismenu = false
				isselectlevel = true
			end

			if x > 50 and x < 450 and y > 400 and y < 450 then
				love.event.quit()
			end
		end
		if isselectlevel == true then
			for i=1,whichlevel do
				if x > 40 and x < 90 and y > 100 and y < 150 then
					isselectlevel = false
					islevel = true
					wholevel = 1
					SetTablePole( wholevel )
				elseif x > 130 and x < 180 and y > 100 and y < 150 and whichlevel > 1 then
					isselectlevel = false
					islevel = true
					wholevel = 2
					SetTablePole( wholevel )
				elseif x > 220 and x < 270 and y > 100 and y < 150 and whichlevel > 2 then
					isselectlevel = false
					islevel = true
					wholevel = 3
					SetTablePole( wholevel )
				elseif x > 310 and x < 360 and y > 100 and y < 150 and whichlevel > 3 then
					isselectlevel = false
					islevel = true
					wholevel = 4
					SetTablePole( wholevel )
				elseif x > 400 and x < 450 and y > 100 and y < 150 and whichlevel > 4 then
					isselectlevel = false
					islevel = true
					wholevel = 5
					SetTablePole( wholevel )
				end
			end
			if x > 50 and x < 450 and y > 300 and y < 350 then
				Save( whichlevel )
			end
			if x > 50 and x < 450 and y > 400 and y < 450 then
				ismenu = true
				isselectlevel = false
			end
		end
		if islevel == true then
			if x > 50 and x < 450 and y > 300 and y < 350 and wholevel < 5 and isfinish == true  then
				wholevel = wholevel + 1
				SetTablePole( wholevel )
			end
			if x > 50 and x < 450 and y > 400 and y < 450 and isfinish == true then
				isselectlevel = true
				islevel = false
			end
		end
  	end
end

function love.draw()
	--кнопки основного меню
	if ismenu == true then
		DrawAllButtons( rezhim1, rezhim2, rezhim3 )
	end
	if isselectlevel == true then
		DrawSelectLevels( whichlevel )
	end 
	if islevel == true then
		Levels()
		if isfinish == true then
			DrawFinishWindow( )
		end
	end 
	--меню выбора уровня
end