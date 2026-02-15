{ pkgs }:
{
  enable = true;
  plugins = [
    {
      name = "z";
      src = pkgs.fishPlugins.z.src;
    }
  ];
  shellAliases = {
    gap = "git add -p";
    gc = "git commit";
    gca = "git commit --amend";
    gd = "git diff";
    gl = "git log";
    gpull = "git pull";
    gpush = "git push";
    gs = "git status";
    gspo = "git stash pop";
    gspu = "git stash push -u";
    n = "nnn";
    rb = "sudo nixos-rebuild switch --flake ~/source/nixos-config";
  };
}
