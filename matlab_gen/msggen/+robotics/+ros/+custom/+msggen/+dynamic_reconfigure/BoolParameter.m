classdef BoolParameter < robotics.ros.Message
    %BoolParameter MATLAB implementation of dynamic_reconfigure/BoolParameter
    %   This class was automatically generated by
    %   robotics.ros.msg.internal.gen.MessageClassGenerator.
    
    %   Copyright 2014-2019 The MathWorks, Inc.
    
    %#ok<*INUSD>
    
    properties (Constant)
        MessageType = 'dynamic_reconfigure/BoolParameter' % The ROS message type
    end
    
    properties (Constant, Hidden)
        MD5Checksum = '23f05028c1a699fb83e22401228c3a9e' % The MD5 Checksum of the message definition
    end
    
    properties (Access = protected)
        JavaMessage % The Java message object
    end
    
    properties (Dependent)
        Name
        Value
    end
    
    properties (Constant, Hidden)
        PropertyList = {'Name', 'Value'} % List of non-constant message properties
        ROSPropertyList = {'name', 'value'} % List of non-constant ROS message properties
    end
    
    methods
        function obj = BoolParameter(msg)
            %BoolParameter Construct the message object BoolParameter
            import com.mathworks.toolbox.robotics.ros.message.MessageInfo;
            
            % Support default constructor
            if nargin == 0
                obj.JavaMessage = obj.createNewJavaMessage;
                return;
            end
            
            % Construct appropriate empty array
            if isempty(msg)
                obj = obj.empty(0,1);
                return;
            end
            
            % Make scalar construction fast
            if isscalar(msg)
                % Check for correct input class
                if ~MessageInfo.compareTypes(msg(1), obj.MessageType)
                    error(message('robotics:ros:message:NoTypeMatch', obj.MessageType, ...
                        char(MessageInfo.getType(msg(1))) ));
                end
                obj.JavaMessage = msg(1);
                return;
            end
            
            % Check that this is a vector of scalar messages. Since this
            % is an object array, use arrayfun to verify.
            if ~all(arrayfun(@isscalar, msg))
                error(message('robotics:ros:message:MessageArraySizeError'));
            end
            
            % Check that all messages in the array have the correct type
            if ~all(arrayfun(@(x) MessageInfo.compareTypes(x, obj.MessageType), msg))
                error(message('robotics:ros:message:NoTypeMatchArray', obj.MessageType));
            end
            
            % Construct array of objects if necessary
            objType = class(obj);
            for i = 1:length(msg)
                obj(i,1) = feval(objType, msg(i)); %#ok<AGROW>
            end
        end
        
        function name = get.Name(obj)
            %get.Name Get the value for property Name
            name = char(obj.JavaMessage.getName);
        end
        
        function set.Name(obj, name)
            %set.Name Set the value for property Name
            name = convertStringsToChars(name);
            
            validateattributes(name, {'char', 'string'}, {}, 'BoolParameter', 'Name');
            
            obj.JavaMessage.setName(name);
        end
        
        function value = get.Value(obj)
            %get.Value Get the value for property Value
            value = logical(obj.JavaMessage.getValue);
        end
        
        function set.Value(obj, value)
            %set.Value Set the value for property Value
            validateattributes(value, {'logical', 'numeric'}, {'nonempty', 'scalar'}, 'BoolParameter', 'Value');
            
            obj.JavaMessage.setValue(value);
        end
    end
    
    methods (Access = protected)
        function cpObj = copyElement(obj)
            %copyElement Implements deep copy behavior for message
            
            % Call default copy method for shallow copy
            cpObj = copyElement@robotics.ros.Message(obj);
            
            % Create a new Java message object
            cpObj.JavaMessage = obj.createNewJavaMessage;
            
            % Iterate over all primitive properties
            cpObj.Name = obj.Name;
            cpObj.Value = obj.Value;
        end
        
        function reload(obj, strObj)
            %reload Called by loadobj to assign properties
            obj.Name = strObj.Name;
            obj.Value = strObj.Value;
        end
    end
    
    methods (Access = ?robotics.ros.Message)
        function strObj = saveobj(obj)
            %saveobj Implements saving of message to MAT file
            
            % Return an empty element if object array is empty
            if isempty(obj)
                strObj = struct.empty;
                return
            end
            
            strObj.Name = obj.Name;
            strObj.Value = obj.Value;
        end
    end
    
    methods (Static, Access = {?matlab.unittest.TestCase, ?robotics.ros.Message})
        function obj = loadobj(strObj)
            %loadobj Implements loading of message from MAT file
            
            % Return an empty object array if the structure element is not defined
            if isempty(strObj)
                obj = robotics.ros.custom.msggen.dynamic_reconfigure.BoolParameter.empty(0,1);
                return
            end
            
            % Create an empty message object
            obj = robotics.ros.custom.msggen.dynamic_reconfigure.BoolParameter;
            obj.reload(strObj);
        end
    end
end
