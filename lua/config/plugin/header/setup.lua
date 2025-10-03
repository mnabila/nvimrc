local function get_git_user_name()
  local result = vim.fn.systemlist("git config user.name")
  if vim.v.shell_error == 0 and #result > 0 then
    return result[1]
  end
  return nil
end

require("header").setup({
  allow_autocmds = true,
  file_name = true,
  author = get_git_user_name(),
  date_created = true,
  date_created_fmt = "%Y-%m-%d %H:%M:%S",
  date_modified = true,
  date_modified_fmt = "%Y-%m-%d %H:%M:%S",
  line_separator = nil,
  use_block_header = true,
  license_from_file = false,
})
