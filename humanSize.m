function byteStr = humanSize(bytes)
    
    suffix = ['B', 'KB', 'MB', 'GB', 'TB'];
    
    tmpbytes = bytes;
    i = 1;
    
    while tmpbytes > 1024
        tmpbytes = round(tmpbytes/1024,1);
        i = i+1;
    end
    
    byteStr = strcat(num2str(tmpbytes), suffix(i));
    
end