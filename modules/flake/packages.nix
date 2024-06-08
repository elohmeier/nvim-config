_: {
  perSystem = { pkgs, ... }: {
    packages = {
      inherit (pkgs)
        nixvim-full;

      default = pkgs.nixvim-full;
    };
  };
}

