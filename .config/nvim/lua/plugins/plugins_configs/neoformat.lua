vim.g.neoformat_enabled_python = {"yapf"}
vim.g.neoformat_fortran_fprettify = {
    exe = "fprettify",
    args = {"--silent"}
}
vim.g.neoformat_enabled_fortran = {"fprettify"}
vim.g.neoformat_cpp_clangformat = {
    exe = "clang-format",
    args = {"--style=\"{IndentWidth: 4}\""}
}
vim.g.neoformat_c_clangformat = {
    exe = "clang-format",
    args = {"--style=\"{IndentWidth: 4}\""}
}
vim.g.neoformat_enabled_cpp = {"clangformat"}
vim.g.neoformat_enabled_c = {"clangformat"}
