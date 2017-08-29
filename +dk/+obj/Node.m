classdef Node < handle
    
    properties (SetAccess = protected)
        data
        parent
        children
        depth
    end
    
    % dependent properties
    properties (Transient,Dependent)
        is_valid
        is_leaf
        is_empty
        n_children
        fields
    end
    methods
        function y=get.is_leaf(self)
            y=isempty(self.children);
        end
        function f=get.fields(self)
            f=fieldnames(self.data);
        end
        function y=get.is_empty(self)
            y=(numel(self.fields) > 0);
        end
        function y=get.is_valid(self)
            y=(self.depth > 0);
        end
        function n=get.n_children(self)
            n=numel(self.children);
        end
    end
    
    methods
        
        % constructor
        function self = Node(varargin)
            self.clear();
            if nargin == 1 && isstruct(varargin{1})
                self.unserialise(varargin{1});
            else
                self.assign(varargin{:});
            end
        end
        
        % cleanup
        function self=clear(self)
            self.depth = 0;
            self.parent = [];
            self.children = [];
            self.data = struct();
        end
        
        % clone
        function other=clone(self)
            other = dk.obj.Node( self.serialise() );
        end
        
        % creation
        function self=assign(self,depth,parent,varargin)
            self.depth = depth;
            self.parent = parent;
            if nargin > 3
                if isstruct(varargin{1})
                    self.data = varargin{1};
                else
                    self.data = struct(varargin{:});
                end
            end
        end
        
        % children editing
        function self=add_child(self,c)
            self.children(end+1) = c;
        end
        function self=rem_child(self,c)
            self.children = setdiff(self.children, c);
        end
        
        % remap indices
        function self=remap(self,old2new)
            self.parent = old2new(self.parent);
            self.children = old2new(self.children);
            assert( all([self.parent,self.children]), 'Error during remap (null index found).' );
        end
        
        % serialisation
        function s=serialise(self,file)
            f = {'data','parent','children','depth'};
            n = numel(f);
            s = struct();
            for i = 1:n
                s.(f{i}) = self.(f{i});
            end
            s.version = '0.1';
            if nargin > 1, save(file,'-v7','-struct','s'); end
        end
        function self=unserialise(self,s)
        if ischar(s), s=load(s); end
        switch s.version
            case '0.1'
                f = {'data','parent','children','depth'};
                n = numel(f);
                for i = 1:n
                    self.(f{i}) = s.(f{i});
                end
            otherwise
                error('Unknown version: %s',s.version);
        end
        end
        
    end
    
end