function dirtree(varargin)

    if isempty(varargin)
        basedir = pwd;
    else
        basedir = varargin{1};
    end
    
    [~, basename, ~] = fileparts(basedir);
    
    fprintf('%s\n',basename)
    
    subdir = basedir;
    level = 1;

    directory{level,1} = subdir;
    directory{level,2} = 1;
    
    while 1 
        [subdir, position] = printTillDir(directory{level,1}, directory{level,2}, level);
        directory{level,2} = position;
        if strcmp(directory{level,1}, subdir)
            level = level-1; 
            if ~level
                break
            else
                directory{level,2} = directory{level,2} +1;
            end
        else
            level = level+1;
            directory{level,1} = subdir;
            directory{level,2} = 1;
        end
    end

end


function [subdir, position] = printTillDir(subdir, offs, level)
    base = dir(subdir);
    position=offs;
    for i = (offs):length(base)
        position=position+1;
        if ~(strcmp(base(i).name(1), '.') || strcmp(base(i).name, '..'))
            printSub(base(i).name, level)
            if base(i).isdir
                subdir = fullfile(subdir, base(i).name);
                break
            end
        end
    end
end

function printSub(name, level)

        for i = 1:level-1
           fprintf('|   ')
        end
        fprintf('|-- %s\n',name)
    
end