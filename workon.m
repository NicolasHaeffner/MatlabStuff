function workon(basepath)
    
    recproj = getenv('PROJECT');

    if isempty(recproj)
        addpath(genpath(basepath));
        cd(basepath);
        setenv('PROJECT', pwd);

        clc;

        fprintf('\nChanged project folder to %s\n\n', basepath)
        [status,cmdout] = system('git log --pretty=format:"%h %s" --graph -n 5');

        if ~status
            [~, lastcomm] = system('git log -1 --date=short --pretty=format:%cd');
            fprintf('last commit on %s\n', lastcomm);
            fprintf('last changes:\n\n%s\n\n', cmdout);
        else
            fprintf('No source control initialized\n\n');
        end

        if exist(fullfile(cd, 'init.m'), 'file') == 2
            fprintf('init.m found:\n%s\n\n', fullfile(cd, 'init.m'));
            run(fullfile(cd, 'init.m'));
            fprintf('\n\n');
        end
    else
        fprintf('Another project already loaded, finish first using done\n');
    end
    
    
end