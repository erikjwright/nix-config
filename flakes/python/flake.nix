{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
        python = pkgs.python312;
      in
      # pythonEnv = python.withPackages (p: [
      #   p.pyodbc
      # ]);
      with pkgs;
      {
        devShells.default = mkShell {
          buildInputs = [
                        libiodbc
            python
            # pythonEnv
            pyright
            ruff
            uv
          ];

          shellHook = ''
            export UV_PYTHON_PREFERENCE="only-system"
            export UV_PYTHON=${python}
            if [ ! -d ".venv" ]; then
              uv venv .venv
            fi
            source .venv/bin/activate
            echo "uv pip env ready"
          '';
        };
      }
    );
}
