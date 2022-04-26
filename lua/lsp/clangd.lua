return {
    cmd = {
        "clangd",
        "-update-debounce=0",
        "-include-ineligible-results",
        "-keep-asts=10",
        "-recovery-ast",
        "-ranking-model=heuristics",
        "-header-extensions=hpp;h;cuh;",
        --"--background-index",
        "-j=12",
        "--query-driver=/usr/bin/**/clang-*,/bin/clang,/bin/clang++-*,/usr/bin/gcc,/usr/bin/g++",
        "--clang-tidy",
        "--all-scopes-completion",
        "--cross-file-rename",
        "--completion-style=detailed",
        "--header-insertion-decorators",
        "--header-insertion=iwyu",
        "--pch-storage=memory",
    },
    filetypes = { "c", "cpp", "objc", "objcpp", "h", "hpp" },
    single_file_support = true
}
