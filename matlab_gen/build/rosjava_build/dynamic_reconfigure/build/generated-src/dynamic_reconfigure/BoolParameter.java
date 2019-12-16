package dynamic_reconfigure;

public interface BoolParameter extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "dynamic_reconfigure/BoolParameter";
  static final java.lang.String _DEFINITION = "string name\nbool value\n";
  static final boolean _IS_SERVICE = false;
  static final boolean _IS_ACTION = false;
  java.lang.String getName();
  void setName(java.lang.String value);
  boolean getValue();
  void setValue(boolean value);
}
