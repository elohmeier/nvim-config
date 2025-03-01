{ self, ... }:
{
  perSystem =
    {
      lib,
      pkgs,
      system,
      ...
    }:
    {
      devShells.default = pkgs.mkShell {
        packages = [ pkgs.nix-update ];

        # avoid pre-commit exec format issues when hopping between OSes in the same checkout
        shellHook = lib.optionalString (
          system == "aarch64-darwin"
        ) self.checks.${system}.git-hooks-check.shellHook;
      };
    };
}
