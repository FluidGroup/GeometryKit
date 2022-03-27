import CoreGraphics.CGGeometry

extension CGRect {
  
  /// Returns a rectangle that fits inside provided bounding rectangle with respecting aspect ratio.
  public func gk_makeRectThatAspectFit(
    aspectRatio: CGSize
  ) -> CGRect {
    
    let size = aspectRatio.gk_sizeThatAspectFit(in: self.size)
    var origin = origin
    origin.x += (size.width - size.width) / 2.0
    origin.y += (size.height - size.height) / 2.0
    return CGRect(origin: origin, size: size)
  }

  public func gk_makeRectThatAspectFill(aspectRatio: CGSize) -> CGRect {
    
    let minimumRect = self
    let size = aspectRatio.gk_sizeThatAspectFill(minimumSize: minimumRect.size)
    var origin = CGPoint.zero
    origin.x = (minimumRect.size.width - size.width) / 2.0
    origin.y = (minimumRect.size.height - size.height) / 2.0
    return CGRect(origin: origin, size: size)
  }
}
