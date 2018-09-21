function done()
    projpath = getenv('PROJECT');
    [~, projname, ~] = fileparts(projpath);
    if ~isempty(projpath)
        if ~strncmp(projname, '_', 1)
            rmpath(genpath(projpath));
        end
        cd ..
        setenv('PROJECT', '')
    else 
        disp('ERROR: no project loaded.')
    end
end