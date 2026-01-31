{ email }:
{
  enable = true;
  signing = {
    key = "5C0125ED93A6C45E";
    signByDefault = true;
  };
  settings = {
    init.defaultBranch = "main";
    merge = {
      commit = true;
      ff = false;
    };
    pull.rebase = true;
    user = {
      name = "Adem Aydin";
      inherit email;
    };
  };
}
