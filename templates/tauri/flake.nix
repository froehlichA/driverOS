{
  inputs = {
  	flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }: 
  	flake-utils.lib.eachDefaultSystem (system:
	  let
	    pkgs = nixpkgs.legacyPackages.${system};
	    libraries = with pkgs; [
	      webkitgtk gtk3 cairo gdk-pixbuf glib dbus openssl_3
	    ];
      packages = with pkgs; [
        curl wget pkg-config dbus openssl_3 glib gtk3 libsoup webkitgtk
      ];
	  in {
	    # SHELL
	    devShells.default = pkgs.mkShell {
	      buildInputs = packages;
        nativeBuildInputs = with pkgs; [
          rustc cargo pkg-config
        ];

        shellHook = ''
          export LD_LIBRARY_PATH=${pkgs.lib.makeLibraryPath libraries}:$LD_LIBRARY_PATH
        '';
      };
	  }
  );
}