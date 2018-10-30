function yes = is_file( name )
%
% y = dk.fs.is_file( name )
%
% Check that path is a file.
% Note: this is not equivalent to isfile.
%
% See also: dk.fs.exist
%
% JH

    yes = dk.fs.exist( name, 'file' );
end
