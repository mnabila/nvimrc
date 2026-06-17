vim.api.nvim_create_autocmd("UIEnter", {
  once = true,
  callback = function()
    local capabilities = require("config.lsp.capabilities")

    vim.lsp.config("*", {
      capabilities = capabilities,
    })

    vim.lsp.enable({
      "bash-language-server",
      "buf",
      "clangd",
      "css-language-server",
      "docker-language-server",
      "emmet-language-server",
      "gopls",
      "json-language-server",
      "lua-language-server",
      "pyright",
      "rust-analyzer",
      "taplo",
      "ts_ls",
      "vim-language-server",
    })

    vim.diagnostic.config({
      signs = true,
      severity_sort = true,
      update_in_insert = false,
      underline = true,
      virtual_lines = {
        current_line = true,
        format = function(diagnostic)
          local message = diagnostic.message
          local win_width = vim.api.nvim_win_get_width(0)
          local max_width = math.floor(win_width * 0.75)
          local max_lines = 5
          local max_length = max_width * max_lines

          if #message > max_length then
            message = message:sub(1, max_length - 3) .. "..."
          end

          if #message <= max_width then
            return message
          end

          local wrapped = {}
          local line = ""

          for word in message:gmatch("%S+") do
            local test_line = line == "" and word or line .. " " .. word

            if #test_line <= max_width then
              line = test_line
            else
              if line ~= "" then
                table.insert(wrapped, line)
                if #wrapped >= max_lines then
                  wrapped[#wrapped] = wrapped[#wrapped] .. "..."
                  break
                end
              end
              line = word
            end
          end

          if line ~= "" and #wrapped < max_lines then
            table.insert(wrapped, line)
          end

          return table.concat(wrapped, "\n")
        end,
      },
    })

    local group = vim.api.nvim_create_augroup("UserLspConfig", {})

    vim.api.nvim_create_autocmd("LspDetach", {
      group = group,
      callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if not client or not client.attached_buffers then
          return
        end
        for buf_id in pairs(client.attached_buffers) do
          if buf_id ~= ev.buf then
            return
          end
        end
        client:stop()
      end,
      desc = "Auto Detach LSP",
    })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = group,
      callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)

        if not client then
          return
        end

        if client:supports_method("textDocument/hover") or client:supports_method("textDocument/signatureHelp") then
          vim.keymap.set("n", "K", function()
            vim.lsp.buf.hover({
              silent = true,
              border = "single",
              max_width = math.floor(vim.o.columns / 2),
            })
          end, { buffer = ev.buf, noremap = true, desc = "LSP: Show Documentation" })
        end

        if client:supports_method("textDocument/formatting") then
          vim.keymap.set("n", "<leader>f", function()
            vim.lsp.buf.format({ async = true })
          end, { buffer = ev.buf, noremap = true, desc = "LSP: Formats the current buffer" })
        end

        if client:supports_method("textDocument/definition") then
          vim.keymap.set(
            "n",
            "gd",
            vim.lsp.buf.definition,
            { buffer = ev.buf, noremap = true, desc = "LSP: Go to definition" }
          )
        end

        if client:supports_method("textDocument/inlayHint") then
          vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })

          vim.api.nvim_buf_create_user_command(ev.buf, "InlayHintToggle", function()
            local current_state = vim.lsp.inlay_hint.is_enabled({ bufnr = ev.buf })
            vim.lsp.inlay_hint.enable(not current_state, { bufnr = ev.buf })
          end, { desc = "Toggle inlay hints" })
        end

        vim.api.nvim_buf_create_user_command(ev.buf, "LspStop", function()
          if client:is_stopped() then
            vim.notify(client.name:upper() .. " is already stopped", vim.log.levels.WARN)
          else
            client:stop(true)
            vim.notify(client.name:upper() .. " stopped", vim.log.levels.INFO)
          end
        end, { desc = "Stop LSP client for this buffer" })
      end,
      desc = "User custom event for LspAttach",
    })

    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].filetype ~= "" then
        vim.api.nvim_exec_autocmds("FileType", { buffer = buf })
      end
    end
  end,
})
