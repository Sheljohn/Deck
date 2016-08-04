function s = style( name )

    % if no argument, list all available styles
    if nargin < 1
        s = dk.fs.list_files(fullfile( dk.path, 'style' ));
        return;
    end

    name = fullfile( dk.str.set_ext( name, 'mat' ) );
    dk.println('[dk] Loading style "%s".',name);
    s = load(fullfile( dk.path, 'style', name ));
    
end
