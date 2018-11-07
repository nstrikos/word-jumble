//var component;
//var list = [];

//function createImageObject() {
//    component = Qt.createComponent("MyComponent.qml");
//    if (component.status === Component.Ready ||
//        component.status === Component.Error)
//        finishCreation()
//    else
//        component.statusChanged.connect(finishCreation)
//}

//function finishCreation() {
//    if (component.status === Component.Ready) {
//        var image = component.createObject(myRow,
//            {"x": 100, "y": 100, "text": "ok"})
//        if (image == null)
//            console.log("Error creating image");
//    }
//    else if (component.status === Component.error)
//        console.log("Error loading component:", component.errorString())
//}


var _component;
var _callback;
var _parent;
var _source;

function create(source, parent, callback, text)
{
    _parent = parent;
    _callback = callback;
    _source = source;

    _component = Qt.createComponent(source);
    if (_component.status === Component.Ready
        || _component.status === Component.Error) {
        createDone(text);
    }
    else
        _component.statusChanged.connect(createDone);
}

function createDone(displayText)
{
    if (_component.status === Component.Ready)
    {
        var obj = _component.createObject(_parent, {"x": 100, "y": 100, "text": displayText});
        if (obj !== null)
            _callback(obj, _source, displayText);
        else
            console.log("Error creating object: " + _source);

        _component.destroy();
    }
    else if (_component.status === Component.Error)
        console.log("Error creating component: " + component.errorString());
}



