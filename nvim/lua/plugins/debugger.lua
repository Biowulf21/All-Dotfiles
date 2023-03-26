return {
  "mfussenegger/nvim-dap-ui",
  dependecies = {
    "mfussenegger/nvim-dap",
  },
  config = function()
    require("dapui").setup()
  end,
  keys = {

    {
      "<leader>d",
      function() end,
      desc = "Debug",
    },
    {
      "<leader>db",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "Toggle Breakpoint",
    },
    {
      "<leader>dc",
      function()
        require("dap").continue()
      end,
      desc = "Continue",
    },

    {
      "<leader>di",
      function()
        require("dap").step_into()
      end,
      desc = "Step Into",
    },
    {
      "<leader>do",
      function()
        require("dap").step_over()
      end,
      desc = "Step Over",
    },
    {
      "<leader>dw",
      function()
        require("dapui").open()
      end,
      desc = "Open Window",
    },
    {
      "<leader>dc",
      function()
        require("dapui").close()
      end,
      desc = "Close Window",
    },
    {
      "<leader>dt",
      function()
        require("dapui").toggle()
      end,
      desc = "Toggle Window",
    },
  },
}
