function f = new( name, figsize, screen, varargin )
%
% f = new( name, figsize, screen, varargin )
%
%     name : name of the new figure
%  figsize : size of the figure in pixels or normalised units
%   screen : screen in which the figure should be moved to
% varargin : additional arguments forwarded to Figure
%
%        f : figure handle
%
% JH

    f = figure( 'name', name, varargin{:} );
    if nargin > 2 && ~isempty(screen)
        dk.fig.movetoscreen(f,screen);
    end
    if nargin > 1 && ~isempty(figsize)
        dk.fig.resize( f, figsize );
    end

end