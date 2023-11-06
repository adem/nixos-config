{ ... }:

{
  virtualisation.docker.enable = true;
  users.users.adem.extraGroups = [ "docker" ];
}
