{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kdlfmt
    nil
    nixfmt
    prettierd
    nodePackages.typescript-language-server
    nodePackages.vscode-langservers-extracted
    typescript
  ];

  programs.helix = {
    enable = true;
    languages = {
      language = [
        {
          name = "haskell";
          auto-format = true;
          language-servers = [ "haskell-language-server" ];
          grammar = ""; # https://github.com/tree-sitter/tree-sitter-haskell/issues/144
        }
        {
          name = "css";
          auto-format = true;
          formatter = {
            command = "prettierd";
            args = [ ".css" ];
          };
        }
        {
          name = "html";
          auto-format = true;
          formatter = {
            command = "prettierd";
            args = [ ".html" ];
          };
        }
        {
          name = "javascript";
          auto-format = true;
          formatter = {
            command = "prettierd";
            args = [ ".js" ];
          };
        }
        {
          name = "json";
          auto-format = true;
          formatter = {
            command = "prettierd";
            args = [ ".json" ];
          };
        }
        {
          name = "kdl";
          auto-format = false;
          formatter = {
            command = "kdlfmt";
            args = [
              "format"
              "-"
            ];
          };
        }
        {
          name = "typescript";
          auto-format = true;
          language-servers = [
            "typescript-language-server"
            "eslint"
          ];
          formatter = {
            command = "prettierd";
            args = [ ".ts" ];
          };
        }
        {
          name = "tsx";
          auto-format = true;
          language-servers = [
            "typescript-language-server"
            "eslint"
          ];
          formatter = {
            command = "prettierd";
            args = [ ".tsx" ];
          };
        }
        {
          name = "xml";
          auto-format = true;
          formatter = {
            command = "prettierd";
            args = [ ".xml" ];
          };
        }
        {
          name = "nix";
          auto-format = true;
          formatter.command = "nixfmt";
        }
        {
          name = "python";
          auto-format = true;
          language-servers = [
            "ruff"
            "pylsp"
          ];
          rulers = [ 88 ];
        }
      ];
      language-server.eslint = {
        command = "vscode-eslint-language-server";
        args = [ "--stdio" ];
        config = {
          validate = "on";
          run = "onSave";
          codeActionsOnSave.mode = "all";
          nodePath = "";
        };
      };
      language-server.ruff = {
        command = "ruff";
        args = [ "server" ];
      };
    };
    settings = {
      theme = "autumn";
      editor = {
        line-number = "relative";
        soft-wrap.enable = true;
        indent-guides.render = true;
      };
      keys.normal = {
        Cmd-f = ":format";
        Cmd-r = ":reload-all";
      };
    };
  };
}
