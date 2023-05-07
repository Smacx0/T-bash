
## T'Bash (Themed Bash)

A Customized Bash Prompt with minimal themes.

### Installation

Git Clone the repo
```console
git clone https://github.com/Smacx0/T-bash.git
cd T-bash/
realpath tbash.sh
```

Add the below lines to `.bash_profile` or `.bashrc` file present in your home directory.

```sh
if [ -f /<path_to_file>/tbash.sh ]; then
   source "/<path_to_file>/tbash.sh";
   export PROMPT_COMMAND="${PROMPT_COMMAND:-echo -n}; update_terminal_prompt; echo"
fi
```

### Customization

`tbash.sh` file contains the list of global variables, which allow you to set theme and enable / disable of displaying git / hg branch names.

`config.ini` file contains the colour mapping of the tbash shell script. 


### Themes
![T'bash Themes](https://user-images.githubusercontent.com/64886941/236627771-ce976d53-34f6-4fe8-8eb7-24e686032667.png)