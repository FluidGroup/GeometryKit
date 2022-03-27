import CoreGraphics

public enum Geometry {

}

extension Geometry {

  public static func sizeThatAspectFit(
    size: CGSize,
    maxPixelSize: CGFloat
  ) -> CGSize {

    size.gk_sizeThatAspectFit(maxSize: maxPixelSize)
  }

  public static func sizeThatAspectFit(aspectRatio: CGSize, boundingSize: CGSize) -> CGSize {
    
    aspectRatio.gk_sizeThatAspectFit(in: boundingSize)
  }

  public static func sizeThatAspectFill(aspectRatio: CGSize, minimumSize: CGSize) -> CGSize {
    
    aspectRatio.gk_sizeThatAspectFill(minimumSize: minimumSize)
  }

  /// Returns a rectangle that fits inside provided bounding rectangle with respecting aspect ratio.
  public static func rectThatAspectFit(aspectRatio: CGSize, boundingRect: CGRect) -> CGRect {
    
    boundingRect.gk_makeRectThatAspectFit(aspectRatio: aspectRatio)
  }

  /// Returns a rectangle that fills inside provided bounding rectangle with respecting aspect ratio.
  public static func rectThatAspectFill(aspectRatio: CGSize, minimumRect: CGRect) -> CGRect {
    minimumRect.gk_makeRectThatAspectFill(aspectRatio: aspectRatio)
  }

  public static func diagonalRatio(to: CGSize, from: CGSize) -> CGFloat {
    let _from = sqrt(pow(from.height, 2) + pow(from.width, 2))
    let _to = sqrt(pow(to.height, 2) + pow(to.width, 2))

    return _to / _from
  }

  /**
   Returns a transform that makes `from` rect that `to` rect.
   */
  public static func transform(from: CGRect, to: CGRect) -> CGAffineTransform {

    return .init(
      a: to.width / from.width,
      b: 0,
      c: 0,
      d: to.height / from.height,
      tx: to.midX - from.midX,
      ty: to.midY - from.midY
    )
  }

  /**
   Returns a pair of `center` and `scale` that makes `from` rect that `to` rect.
   */
  public static func centerAndScale(from: CGRect, to: CGRect) -> (center: CGPoint, scale: CGPoint) {

    return (
      center: center(of: to),
      scale: .init(x: to.width / from.width, y: to.height / from.height)
    )

  }

  public static func center(of rect: CGRect) -> CGPoint {
    CGPoint(x: rect.midX, y: rect.midY)
  }

}
