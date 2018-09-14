function savejpg(fig, name, varargin)
%savejpg - save a figure to a jpeg file with a fixed width 
%
    if nargin > 2
        aspect = varargin{1};
    else
        aspect = 0.5;
    end

    fig.PaperUnits = 'centimeters';
    paperwidth = 21;
    linewidth= paperwidth/40*36;
    figheight = linewidth * aspect;

    marg = 0.25*2.54;

    fig.PaperSize = [linewidth, figheight];
    fig.PaperPosition = [0, 0, linewidth, figheight];

    print(fig, name, '-djpeg')

end
