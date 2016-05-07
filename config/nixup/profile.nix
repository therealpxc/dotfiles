{ config, pkgs, ... }:

{

  user.packages = with pkgs; [
    lyx
  ];

  imperativeNix.enable = true;

  # This option is a list of configuration files, expressed as attribution sets.
  # The only attributes in the sets are `target` and `text`, which give the location
  # and content of the config file.
#  user.resourceFiles = [
#    {
#      target = ".config/nixup.fake.1.cfg";
#      text = "text appears here?";
#    }

#    {
#      target = ".config/nixup.fake.2.cfg";
#      text = "other text";
#    }
#  ];

}
