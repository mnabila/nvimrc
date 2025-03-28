return {
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_markers = { "go.work", "go.mod", ".git" },
  settings = {
    gopls = {
      gofumpt = true,
      analyses = {
        -- Ref: https://github.com/golang/tools/blob/master/gopls/doc/analyzers.md
        fieldalignment = false,
        nilness = true,
        shadow = true,
        unusedwrite = true,
        unusedparams = true,
        useany = true,
      },
      staticcheck = true,
      usePlaceholders = false,
      hints = {
        -- Ref: https://github.com/golang/tools/blob/master/gopls/doc/inlayHints.md
        constantValues = true,
        parameterNames = true,
      },
    },
  },
}
