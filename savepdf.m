function savefig(fig, name, varargin)
%
% description.
%
% @since 1.0.0
% @param {type} [name] description.
% @return {type} [name] description.
% @see dependencies
%
    if nargin > 2
        aspect = varargin{1};
    else
        aspect = 0.5;
    end
    % ax = get(fig, 'Children');
    % ax.Units = 'centimeters';
    fig.PaperUnits = 'centimeters';
    paperwidth = 21;
    linewidth= paperwidth/40*36;
    figheight = linewidth * aspect;
    % savepos = ax.Position;
    % outerpos = ax.OuterPosition;
    marg = 0.25*2.54;

    fig.PaperSize = [linewidth, figheight];
    fig.PaperPosition = [0, 0, linewidth, figheight];

    % ti = ax.TightInset;
    % left = ti(1)+marg;
    % bottom = ti(2)+marg;
    % ax_width = linewidth- ti(1) - ti(3);
    % ax_height = figheight - ti(2) - ti(4);
    % ax.Position = [left bottom ax_width ax_height];
    


    print(fig, name, '-dpdf')
    % saveas(fig, name, 'pdf')
    % ax.Position = savepos;
    % ax.Units = 'normalized';
end
