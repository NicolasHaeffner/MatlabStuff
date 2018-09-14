function code(path)
    
    [status, cmdout] = system(char(string('"C:\Program Files\Microsoft VS Code\bin\code" ') + string(path)));
end
