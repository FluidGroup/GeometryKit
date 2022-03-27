import CoreGraphics.CGGeometry

extension CGSize {
 
  public func gk_sizeThatAspectFit(maxSize: CGFloat) -> CGSize {
    
    guard width >= maxSize || height >= maxSize else {
      return self
    }
    
    var s = self
    
    if width > height {
      s.width = maxSize
      s.height *= maxSize / width
    } else {
      s.height = maxSize
      s.width *= maxSize / height
    }
    
    s.width.round()
    s.height.round()
    
    return s
  }
  
  public func gk_sizeThatAspectFit(in boundingSize: CGSize) -> CGSize {
    
    let aspectRatio = self
    
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
  
  public func gk_sizeThatAspectFill(minimumSize: CGSize) -> CGSize {
    
    let aspectRatio = self
    
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
}
