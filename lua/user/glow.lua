local status_ok, glow = pcall(require, "glow")
if not status_ok then
  return
end


glow.setup {
  -- glow_path = "", -- will be filled automatically with your glow bin in $PATH, if any
  install_path = "~/.local/bin", -- default path for installing glow binary
  border = "shadow", -- floating window border config
  style = "dark", -- filled automatically with your current editor background, you can override using glow json style
  pager = false,
  width = 100,
}
