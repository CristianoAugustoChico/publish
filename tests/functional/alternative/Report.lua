-------------------------------------------------------------------------------------------
-- TerraME - a software platform for multiple scale spatially-explicit dynamic modeling.
-- Copyright (C) 2001-2016 INPE and TerraLAB/UFOP -- www.terrame.org

-- This code is part of the TerraME framework.
-- This framework is free software; you can redistribute it and/or
-- modify it under the terms of the GNU Lesser General Public
-- License as published by the Free Software Foundation; either
-- version 2.1 of the License, or (at your option) any later version.

-- You should have received a copy of the GNU Lesser General Public
-- License along with this library.

-- The authors reassure the license terms regarding the warranties.
-- They specifically disclaim any warranties, including, but not limited to,
-- the implied warranties of merchantability and fitness for a particular purpose.
-- The framework provided hereunder is on an "as is" basis, and the authors have no
-- obligation to provide maintenance, support, updates, enhancements, or modifications.
-- In no event shall INPE and TerraLAB / UFOP be held liable to any party for direct,
-- indirect, special, incidental, or consequential damages arising out of the use
-- of this software and its documentation.
--
-------------------------------------------------------------------------------------------

return {
	Report = function(unitTest)
		local error_func = function()
			Report(1)
		end
		unitTest:assertError(error_func, incompatibleTypeMsg(1, "table", 1))

		error_func = function()
			Report{title = 1}
		end
		unitTest:assertError(error_func, incompatibleTypeMsg("title", "string", 1))

		error_func = function()
			Report{
				title = "My Report",
				text = "Some text",
				arg = "void"
			}
		end
		unitTest:assertError(error_func, unnecessaryArgumentMsg("arg"))
	end,
	addImage = function(unitTest)
		local report = Report()

		local error_func = function()
			report:addImage()
		end
		unitTest:assertError(error_func, mandatoryArgumentMsg(1))

		error_func = function()
			report:addImage(1)
		end
		unitTest:assertError(error_func, incompatibleTypeMsg(1, "File", 1))

		error_func = function()
			report:addImage("urbis_2010_real.PNG", 1)
		end
		unitTest:assertError(error_func, incompatibleTypeMsg(2, "string", 1))

		local image = File("my_image")
		error_func = function()
			report:addImage(image)
		end
		unitTest:assertError(error_func, resourceNotFoundMsg("image", tostring(image)))

		image = filePath("agents.csv")
		error_func = function()
			report:addImage(image)
		end
		unitTest:assertError(error_func, "'csv' is an invalid extension for argument 'image'. Valid extensions ['bmp', 'gif', 'jpeg', 'jpg', 'png', 'svg'].")
	end,
	addText = function(unitTest)
		local report = Report()

		local error_func = function()
			report:addText()
		end
		unitTest:assertError(error_func, mandatoryArgumentMsg(1))

		error_func = function()
			report:addText(1)
		end
		unitTest:assertError(error_func, incompatibleTypeMsg(1, "string", 1))
	end,
	setTitle = function(unitTest)
		local report = Report()

		local error_func = function()
			report:setTitle()
		end
		unitTest:assertError(error_func, mandatoryArgumentMsg(1))

		error_func = function()
			report:setTitle(1)
		end
		unitTest:assertError(error_func, incompatibleTypeMsg(1, "string", 1))
	end
}
