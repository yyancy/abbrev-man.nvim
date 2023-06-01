

local M = {}


function M.setup(custome_opts)
	require("abbrev-man.config").set_options(custome_opts)
  require('abbrev-man.main').main(0, 'load_natural_dictionaries_at_startup')
  require('abbrev-man.main').main(0, 'load_programming_dictionaries_at_startup')

end


return M

