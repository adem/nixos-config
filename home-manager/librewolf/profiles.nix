{ extensions, settings }:
let
  profile = id: isDefault: {
    withExtraExtensions = extraExtensions: {
      inherit id isDefault;
      extensions.packages = extensions.base ++ extraExtensions;
      inherit settings;
    };
  };
in
{
  default = profile 0 true;
  a = profile 1 false;
}
