return {
    "mason-org/mason.nvim",
    config = function()
        require('mason').setup({
            registries = {
                'github:Crashdummyy/mason-registry', -- this contains the register for Roslyn
                'github:mason-org/mason-registry', 
            },
        })
    end
}
