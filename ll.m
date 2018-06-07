function ll(varargin)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

if isempty(varargin)
    directory = pwd;
else
    directory = varargin{1};
end
    


listing = dir(directory); 

for i = 1:length(listing)
    name = listing(i).name;
    if listing(i).isdir
        name = [name, '\'];
    end
    fprintf('%s %6s  %s\n',listing(i).date,humanSize(listing(i).bytes), name)

end

