function Save( whichlevel )
	file = love.filesystem.newFile("Sokoban.txt")
	file:open('w')
	file:write(whichlevel)
	filesize = file:getSize()
	success = file:close()
end

function Load()
	isFile = love.filesystem.isFile( "Sokoban.txt" )
	if isFile == true then
		file = love.filesystem.newFile("Sokoban.txt")
		file:open('r')
		data = file:read()
		success = file:close()
		return  tonumber(data)
	else 
		return 1
	end
end