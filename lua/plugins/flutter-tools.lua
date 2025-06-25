return {
  -- 🔌 1. turn off the Mason bridge so it never loads
  { 'jay-babu/mason-nvim-dap.nvim', enabled = false },

  -- 🔌 2. flutter-tools (unchanged except for run_via_dap = true, optional)
  {
    'nvim-flutter/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim',
    },
    config = {
      debugger = {
        enabled = true,
        run_via_dap = true, -- let nvim-dap drive :FlutterRun as well
      },
    },
  },

  -- 🔌 3. manual DAP wiring that speaks *Flutter*, not plain Dart
  {
    'mfussenegger/nvim-dap',
    config = function()
      local dap = require 'dap'

      -- one adapter for both Dart CLI *and* Flutter apps
      dap.adapters.dart = {
        type = 'executable',
        command = 'flutter', -- <-- key change
        args = { 'debug_adapter' },
      }

      dap.configurations.dart = {
        {
          name = 'Flutter: Launch',
          type = 'dart',
          request = 'launch',
          program = '${workspaceFolder}/lib/main.dart',
          cwd = '${workspaceFolder}',

          -- everything after this line is forwarded to `flutter run`
          flutterMode = 'debug', -- tell the adapter it’s Flutter
          toolArgs = { '-d', 'linux' }, -- choose your device (phone, chrome…)
        },
      }
    end,
  },
}
