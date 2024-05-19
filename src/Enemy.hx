import defold.Msg;
import defold.Sound;
import defold.Sprite;
import defold.Go;
import defold.Physics.PhysicsMessages;
import defold.Physics.PhysicsMessageTriggerResponse;
import defold.types.Message;
import defold.types.Url;
import defold.support.Script;
import defold.Msg;

class Enemy extends Script {
    static var hello = new Message("hello");

    override function onMessage<TMessage>(messageId: Message<TMessage>, message: TMessage, sender: Url) {
        switch messageId {
            case PhysicsMessages.trigger_response:
                Sound.play("#boom");
                Msg.post("interface#main", hello);
                Sprite.playFlipbook("#sprite", "enemy_death", function(_, _, _) {
                    Go.delete();
                });
        }
    }
}