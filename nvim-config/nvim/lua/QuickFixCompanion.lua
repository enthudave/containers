function SendQuickfixToCodeCompanion()
  local qflist = vim.fn.getqflist()
  if vim.tbl_isempty(qflist) then
    vim.notify("Quickfix list is empty", vim.log.levels.WARN)
    return
  end

  -- Format entries
  local lines = {}
  for _, entry in ipairs(qflist) do
    local file = entry.bufnr and vim.fn.bufname(entry.bufnr) or entry.filename or "[no-file]"
    local lnum = entry.lnum or 0
    local text = entry.text or ""
    table.insert(lines, string.format("%s:%d: %s", file, lnum, text))
  end

  -- Add a prompt prefix
  table.insert(lines, 1, "Please review the following quickfix entries and suggest improvements:")
  table.insert(lines, "")

  -- Open chat first
  vim.cmd("CodeCompanionChat")

  -- Wait a moment for buffer to open
  vim.defer_fn(function()
    --local bufnr = vim.api.nvim_get_current_buf()
    --vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
    --vim.api.nvim_win_set_cursor(0, {#lines + 1, 0})
    vim.api.nvim_put(lines, 'l', true, true)
    vim.api.nvim_input('<CR>')
  end, 500)
end
-- Optional: map it
vim.keymap.set("n", "<leader>qc", SendQuickfixToCodeCompanion, { desc = "Send QF to CodeCompanion" })
