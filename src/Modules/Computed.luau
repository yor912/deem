return function(scope: {}, data: any)
	if type(scope) == 'table' then
		return scope:Computed(function(use)
			return use(data)
		end)
	end
	error 'First argument must be a scope'
end