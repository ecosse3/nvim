return {
  lintCommand        = 'eslint_d --stdin --stdin-filename ${INPUT} -f visualstudio',
  lintSource         = 'eslint_d',
  lintStdin          = true,
  lintFormats        = {
    "%f(%l,%c): %tarning %m",
    "%f(%l,%c): %rror %m",
  },
  lintIgnoreExitCode = true,
  formatCommand      = "eslint_d --fix-to-stdout --stdin --stdin-filename ${INPUT}",
  formatStdin        = true
}
