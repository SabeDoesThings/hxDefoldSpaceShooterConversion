import defold.Sound;
import defold.Timer;
import defold.Factory;
import defold.types.Hash;
import defold.Go;
import defold.Go.GoMessages;
import defold.Msg;
import defold.support.ScriptOnInputAction;
import defold.support.Script;
import Defold.*;

class Player extends Script {
	override function init() {
		Msg.post(".", GoMessages.acquire_input_focus);

		Sound.play("#background");

		Timer.delay(1, true, function(_, _) {
			Factory.create("#factory");
			Sound.play("#shot");
		});
	}

	override function onInput(actionId: Hash, action: ScriptOnInputAction): Bool {
		if (actionId == hash("left")) {
			var pos = Go.getPosition();
			pos.x -= 10;
			Go.setPosition(pos);
		}
		else if (actionId == hash("right")) {
			var pos = Go.getPosition();
			pos.x += 10;
			Go.setPosition(pos);
		}

		return false;
	}
}
