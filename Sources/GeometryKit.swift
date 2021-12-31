import CoreGraphics

public enum Geometry {

}

extension Geometry {

  public func sizeThatAspectFit(size: CGSize, maxPixelSize: CGFloat) -> CGSize {

    guard size.width >= maxPixelSize || size.height >= maxPixelSize else {
      return size
    }

    var s = size

    if size.width > size.height {
      s.width = maxPixelSize
      s.height *= maxPixelSize / size.width
    } else {
      s.height = maxPixelSize
      s.width *= maxPixelSize / size.height
    }

    s.width.round()
    s.height.round()

    return s
  }

  public func sizeThatAspectFit(aspectRatio: CGSize, boundingSize: CGSize) -> CGSize {
    let widthRatio = boundingSize.width / aspectRatio.width
    let heightRatio = boundingSize.height / aspectRatio.height
    var size = boundingSize

    if widthRatio < heightRatio {
      size.height = boundingSize.width / aspectRatio.width * aspectRatio.height
    } else if heightRatio < widthRatio {
      size.width = boundingSize.height / aspectRatio.height * aspectRatio.width
    }

    return CGSize(
      width: ceil(size.width),
      height: ceil(size.height)
    )
  }

  public func sizeThatAspectFill(aspectRatio: CGSize, minimumSize: CGSize) -> CGSize {
    let widthRatio = minimumSize.width / aspectRatio.width
    let heightRatio = minimumSize.height / aspectRatio.height

    var size = minimumSize

    if widthRatio > heightRatio {
      size.height = minimumSize.width / aspectRatio.width * aspectRatio.height
    } else if heightRatio > widthRatio {
      size.width = minimumSize.height / aspectRatio.height * aspectRatio.width
    }

    return CGSize(
      width: ceil(size.width),
      height: ceil(size.height)
    )
  }

  public func rectThatAspectFit(aspectRatio: CGSize, boundingRect: CGRect) -> CGRect {
    let size = sizeThatAspectFit(aspectRatio: aspectRatio, boundingSize: boundingRect.size)
    var origin = boundingRect.origin
    origin.x += (boundingRect.size.width - size.width) / 2.0
    origin.y += (boundingRect.size.height - size.height) / 2.0
    return CGRect(origin: origin, size: size)
  }

  public func rectThatAspectFill(aspectRatio: CGSize, minimumRect: CGRect) -> CGRect {
    let size = sizeThatAspectFill(aspectRatio: aspectRatio, minimumSize: minimumRect.size)
    var origin = CGPoint.zero
    origin.x = (minimumRect.size.width - size.width) / 2.0
    origin.y = (minimumRect.size.height - size.height) / 2.0
    return CGRect(origin: origin, size: size)
  }

  public func diagonalRatio(to: CGSize, from: CGSize) -> CGFloat {
    let _from = sqrt(pow(from.height, 2) + pow(from.width, 2))
    let _to = sqrt(pow(to.height, 2) + pow(to.width, 2))

    return _to / _from
  }
}
