{ pkgs, config, nur, lib, ... }:


let
  mkAddOn = shortname: addonid: {
    "${addonid}" = {
      install_url = "https://addons.mozilla.org/firefox/downloads/latest/${shortname}/latest.xpi";
      installation_mode = "force_installed";
    };
  };


in { 
  programs.firefox = {
    enable = true;
  };

  programs.firefox.policies = {
    ExtensionSettings = lib.mkMerge [
      (mkAddOn "ublock-origin" "uBlock0@raymondhill.net")
      (mkAddOn "bitwarden-password-manager" "{446900e4-71c2-419f-a6a7-df9c091e268b}")
      (mkAddOn "i-dont-care-about-cookies" "jid1-KKzOGWgsW3Ao4Q@jetpack")
    ];
  };
}
