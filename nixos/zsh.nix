{
  programs.zsh = {
    enable = true;

    shellAliases = {
      ll = "ls -al";
    };

    ohMyZsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };

    interactiveShellInit = ''
      source /home/user/.remote-project-management-cli/zsh-completion.sh
      function my-remote-projects() {
          source /home/user/.remote-project-management-cli/bin/remote-project-management-cli-wrapper "$@"
      }
    '';
  };
}
