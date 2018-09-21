function dirtree(varargin)
%dirtree [-n LIMIT] [directory]: Show tree of Directory

    iin = 1;
    limit = 3;

    if length(varargin) > 1 && strcmp(varargin{iin}, '-n')
        limit = str2num(varargin{2});
        iin = iin+2;
    end

    if length(varargin) < iin
        basedir = pwd;
    else
        basedir = fullfile(pwd, strip(varargin{iin}, '\'));
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
        elseif level >= limit
            position = position+1;
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
            printSub(base(i).name, level, i == length(base))
            if base(i).isdir
                subdir = fullfile(subdir, base(i).name);
                break
            end
        end
    end
end

function printSub(name, level, islast)
        for i = 1:level-1
            fprintf('|   ')
        end
        if islast
            fprintf('`-- %s\n',name)
        else
            fprintf('|-- %s\n',name)
        end
end