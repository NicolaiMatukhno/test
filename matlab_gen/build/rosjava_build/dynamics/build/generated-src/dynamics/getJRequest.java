package dynamics;

public interface getJRequest extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "dynamics/getJRequest";
  static final java.lang.String _DEFINITION = "float64[] q\n";
  static final boolean _IS_SERVICE = true;
  static final boolean _IS_ACTION = false;
  double[] getQ();
  void setQ(double[] value);
}
