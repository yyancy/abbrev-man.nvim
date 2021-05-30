
local M = {}

local opts = require("isas.config").options

M.arguments = {}

local function has_element(table, element, type)
	if (type == "value") then
		for index, value in pairs(table) do
			if value == element then return true end
		end
	elseif (type == "index") then
		for index, value in pairs(table) do
			if index == element then return true end
		end
	end

    return false
end


function M.available_commands()

	local isas_langs_natural_list = require("isas.dictionaries.langs_natural.langs_natural_list").arguments
	local isas_langs_programming_list = require("isas.dictionaries.langs_programming.langs_programming_list").arguments
	local user_langs_natural_list = opts["natural_dictionaries"]
	local user_langs_programming_list = opts["programming_dictionaries"]

	-- local user_dicts = opts["natural_dictionaries"]

	for dict, dict_name in pairs(isas_langs_natural_list) do
		M.arguments[dict_name] = dict_name
	end

	for dict, dict_name in pairs(isas_langs_programming_list) do
		M.arguments[dict_name] = dict_name
	end


	for dict, dict_name in pairs(user_langs_natural_list) do
		if not has_element(M.arguments, dict, "value") then
			M.arguments[dict] = dict
		end
	end

	for dict, dict_name in pairs(user_langs_programming_list) do
		if not has_element(M.arguments, dict, "value") then
			M.arguments[dict] = dict
		end
	end


	-- for dict in pairs(isas_dicts) do
	-- 	M.arguments[dict] = dict
	-- end

	-- for dict in pairs(user_dicts) do
	-- 	if not has_element(M.arguments, dict, "value") then
	-- 		M.arguments[dict] = dict
	-- 	end
	-- end

	return vim.tbl_keys(M.arguments)
end



return M

