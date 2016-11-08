function s = rep_ext( s, e, n )
%
% str = dk.str.rep_ext( str, ext, n=1 )
%
% Replace extension in string.
% See dk.str.rem_ext and dk.str.set_ext for more details.
% By default, only the part after the last dot is replaced (ie, n=1).
% If the extension to replace contains several dots, set n to a higher value.
%
% Example:
% dk.str.rep_ext( '/path/to/foo.bar.nii.gz', 'mat', 2 ) % foo.bar.mat
%
% JH

    if nargin < 3, n = 1; end
    s = dk.str.set_ext( dk.str.rem_ext(s,n), e );

end
