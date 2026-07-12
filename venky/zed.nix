{ ... }: {
  programs.zed-editor = {
    enable = true;
    userSettings = {
      assistant.enabled = false;
      auto_signature_help = false;
      auto_install_extensions = {
        "*" = true;
      };
      calls = {
        mute_on_join = false;
        share_on_join = false;
      };
      collaboration_panel = {
        button = false;
      };
      colorize_brackets = true;
      diagnostics = {
        button = true;
        inline = {
          enabled = true;
          padding = 5;
        };
      };
      disable_ai = true;
      editor_tabs = {
        file_icon = true;
        git_status = true;
        show_diagnostics = "errors";
      };
      hour_format = "hour12";
      inlay_hints = {
        enabled = true;
      };
      lsp = {
        "*" = {
          binary.path_lookup = true;
        };
      };
      languages = {
        "*" = {
          formatter = "language_server";
          format_on_save = "on";
          tab_size = 2;
        };
      };
      relative_line_numbers = "enabled";
      semantic_tokens = "combined";
      soft_wrap = "editor_width";
      telemetry = {
        diagnostics = true;
        metrics = false;
      };
      terminal = {
        alternate_scroll = "on";
        cursor_shape = "bar";
      };
      use_smartcase_search = true;
      vim_mode = true;
    };
    userKeymaps = [
      {
        "context" = "Editor && vim_mode == normal";
        "bindings" = {
          "q q" = "pane::CloseActiveItem";
          "q w" = "workspace::Save";
          "q e" = [
            "action::Sequence"
            [
              "workspace::Save"
              "pane::CloseActiveItem"
            ]
          ];

          "s v" = "pane::SplitRight";
          "s h" = "pane::SplitDown";

          ";" = "command_palette::Toggle";
        };
      }
    ];
  };
}
