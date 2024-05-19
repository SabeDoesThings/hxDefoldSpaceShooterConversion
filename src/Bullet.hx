import defold.Particlefx;
import defold.Window;
import defold.Physics.PhysicsMessages;
import defold.types.Message;
import defold.types.Url;
import defold.Go;
import defold.support.Script;

class Bullet extends Script {
    override function init() {
        Go.animate(".", "position.y", GoPlayback.OnceForward, 1000, GoEasing.Linear, 2, 0, function(_, _) {
            Go.delete();
        });
    }

    override function onMessage<TMessage>(messageId: Message<TMessage>, message: TMessage, sender: Url) {
        switch messageId {
            case PhysicsMessages.trigger_response:
                Go.delete();
                Particlefx.play("#explosion");
        }
    }
}