

## view files 

- bat instead of cat


## Find files 

### With find
- find . -name "*.txt"
- find -type f -name likes*
- find . -type f -name \*controller\* -exec ls -l {} \;

# once per finding
- find . -type f -name \*controller\* -exec rm -i {} \;
# concatenate all
- find . -type f -name \*controller\* -exec rm -i {} \+


### With locate
- locate *.txt
sudo apt install locate 

- sudo update db
- localte likes_controller.rb

- touch 567something.rb 
- 0 * * * * sudo updatedb

## FzF

sudo apt install fzf 
sudo apt install abt
. in a directory 
- fzf 
- fzf --preview="cat {}"
- fzf --preview="bat --color=always {}"
- 



