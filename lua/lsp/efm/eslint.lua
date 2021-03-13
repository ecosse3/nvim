return {
  lintCommand = 'eslint_d --stdin --stdin-filename ${INPUT} -f unix',
  lintStdin = true,
  lintIgnoreExitCode = true
}
