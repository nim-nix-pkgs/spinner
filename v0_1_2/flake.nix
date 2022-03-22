{
  description = ''Prebuilt components for the Fidget GUI library.'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-spinner-v0_1_2.flake = false;
  inputs.src-spinner-v0_1_2.owner = "tonogram";
  inputs.src-spinner-v0_1_2.ref   = "v0_1_2";
  inputs.src-spinner-v0_1_2.repo  = "spinner";
  inputs.src-spinner-v0_1_2.type  = "github";
  
  inputs."fidget".owner = "nim-nix-pkgs";
  inputs."fidget".ref   = "master";
  inputs."fidget".repo  = "fidget";
  inputs."fidget".dir   = "";
  inputs."fidget".type  = "github";
  inputs."fidget".inputs.nixpkgs.follows = "nixpkgs";
  inputs."fidget".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."gradient".owner = "nim-nix-pkgs";
  inputs."gradient".ref   = "master";
  inputs."gradient".repo  = "gradient";
  inputs."gradient".dir   = "";
  inputs."gradient".type  = "github";
  inputs."gradient".inputs.nixpkgs.follows = "nixpkgs";
  inputs."gradient".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-spinner-v0_1_2"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-spinner-v0_1_2";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}