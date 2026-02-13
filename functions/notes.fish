function notes
    set -l base_dir "Documents/records"
    
    if test -z (find ~ -wholename ~/$base_dir -type d)
        echo "Initialising base records directory"
        mkdir -p ~/$base_dir
        git init ~/$base_dir
    end

    set -l current_dir notes(date +%Y)/(date +%b)
    echo $base_dir/$current_dir
    if test -z (find ~ -wholename ~/$base_dir/$current_dir -type d)
        echo "Starting new month"
        mkdir -p ~/$base_dir/$current_dir
    end

    set -l file (date +%a)(date +%d).typ
    if test -z (find ~ -wholename ~/$base_dir/$current_dir/$file -type f)
        touch ~/$base_dir/$current_dir/$file
    end

    nvim ~/$base_dir/$current_dir/$file
end
