static class Factory_Region {
  static boolean[] getRegion(String type) {
    boolean[] ret;
    switch(type) {
    case "Border": 
      ret = new boolean[]{true, true, true, true, true, true, true, true, false};
      return ret;
    case "Center":
      ret = new boolean[]{false, false, false, false, false, false, false, false, true};
      return ret;
    case "North":
      ret = new boolean[]{true, false, false, false, false, false, false, false, false};
      return ret;
    case "East":
      ret = new boolean[]{false, true, false, false, false, false, false, false, false};
      return ret;
    case "South":
      ret = new boolean[]{false, false, true, false, false, false, false, false, false};
      return ret;
    case "West":
      ret = new boolean[]{false, false, false, true, false, false, false, false, false};
      return ret;
    case "Top":
      ret = new boolean[]{false, false, false, false, true, false, false, false, false};
      return ret;
    case "Right":
      ret = new boolean[]{false, false, false, false, false, true, false, false, false};
      return ret;
    case "Bottom":
      ret = new boolean[]{false, false, false, false, false, false, true, false, false};
      return ret;
    case "Left":
      ret = new boolean[]{false, false, false, false, false, false, false, true, false};
      return ret;
    default:
      ret = new boolean[]{true, true, true, true, true, true, true, true, true};
      return ret;
    }
  }
}
