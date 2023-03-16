vim.api.nvim_create_autocmd(
    { "BufWritePre" },
    {
        pattern = { "*.py", "*.c", "*.cpp", "*.h", "*.hpp", "*.f90" },
        group = vim.api.nvim_create_augroup("auto formatting", { clear = true }),
        command = "Neoformat",
    }
)
