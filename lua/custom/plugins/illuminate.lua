return {
    'RRethy/vim-illuminate',
    config = function()
        require('illuminate').configure({
            delay = 100,  -- Delay before highlighting
            under_cursor = true,
        })
    end
}
