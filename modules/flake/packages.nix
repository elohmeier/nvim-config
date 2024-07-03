_: {
  perSystem = { pkgs, ... }: {
    packages = {
      inherit (pkgs)
        nixvim-full
        nixvim-minimal;

      default = pkgs.nixvim-full;
    };
  };
}

