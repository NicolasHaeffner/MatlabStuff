function done()
    projpath = getenv('PROJECT');
    if ~isempty(projpath)
        rmpath(genpath(projpath));
        cd ..
        setenv('PROJECT','')
    else 
        disp('ERROR: no project loaded.')
    end
end