function x = infreplace( x, val )
%
% x = dk.math.infreplace( x, val=nan )
%
% Replace all Inf with specified value.
%
% JH

    if nargin < 2, val = nan; end
    x(isinf(x)) = val;

end