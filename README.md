# windows-init

1. Initial Windows setup via Chocolatey. 
   
    Install Chocolatey and Windows packages ( VS Code and WSL )
    ``` powershell
    Set-ExecutionPolicy Unrestricted
    (new-object net.webclient).DownloadFile('https://raw.githubusercontent.com/AlexandreODelisle/windows-bootstrap-wsl/main/chocolatey/windows-bootstrap.ps1','windows-bootstrap.ps1')
    ./windows-bootstrap.ps1
    ```

1. Base setup to work on Ubuntu 

    Manages: clis, zsh, vscode extenions, others.

    Need to have `sudo` in order to install apt packages.

    ```shell 
    ansible-playbook ansible/playbook.yml -K 
    ```