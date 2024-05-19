import defold.Gui;
import defold.types.Message;
import defold.types.Url;
import defold.support.GuiScript;

class Main extends GuiScript {
    static var score = 0;

    override function onMessage<TMessage>(messageId:Message<TMessage>, message:TMessage, sender:Url) {
        score += 1000;
        Gui.setText(Gui.getNode("score"), Std.string(score));
        trace("Hello", message);
    }
}