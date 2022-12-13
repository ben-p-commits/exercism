// TODO: Define the Position struct
struct Position {
    var x: Int = 0
    var y: Int = 0
    
    mutating func moveTo(newX: Int,  newY: Int) {
        self.x = newX
        self.y = newY
    }
}

// TODO: Define the Size struct
struct Size {
    var width: Int = 80
    var height: Int = 60
    
    mutating func resize(newWidth: Int,  newHeight: Int) {
        self.width = newWidth
        self.height = newHeight
    }
}

// TODO: Define the Window class

class Window {
    var title : String = "New Window"
    let screenSize = Size(width: 800, height: 600)
    var size = Size()
    var position = Position()
    var contents: String?
    
    func resize(to: Size) {
        var clippedWidth = max(to.width, 1)
        var clippedHeight = max(to.height, 1)
        
        if position.x + clippedWidth > screenSize.width {
            clippedWidth = screenSize.width - position.x
        }
        
        if position.y + clippedHeight > screenSize.height {
            clippedHeight = screenSize.height - position.y
        }
        
        self.size.resize(newWidth: clippedWidth, newHeight: clippedHeight)
    }
    
    func move(to: Position) {
        var clippedX = max(to.x, 1)
        var clippedY = max(to.y, 1)
        
        if size.width + clippedX > screenSize.width {
            clippedX = screenSize.width - size.width
        }
        
        if size.height + clippedY > screenSize.height {
            clippedY = screenSize.height - size.height
        }
    }
    
    func update(title: String) {
        
    }
    func update(text: String?) {
        
    }
    func display() -> String {
        return ""
    }
}

var mainWindow: Window = {
    let window = Window()
    window.update(title: "Main Window")
    window.resize(to: Size(width: 400, height: 300))
    window.move(to: Position(x: 100, y: 100))
    window.update(text: "This is the main window")
    return window
}()
