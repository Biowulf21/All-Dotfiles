return {
  "redve-dev/neovim-git-reminder",
  dependencies = {
    'rcarriga/nvim-notify',
  },
  config = function()
    require("CommitReminder").setup({
      delay=5,
      remind_on_save_only=true,
      required_changes=40
    })
  end
  }
