package
{
	import com.adobe.serialization.json.JSON;
	
	import flash.external.ExternalInterface;
	import flash.net.NetStream;
	import flash.utils.Dictionary;
	
	import org.osmf.elements.F4MElement;
	import org.osmf.elements.LightweightVideoElement;
	import org.osmf.elements.VideoElement;
	import org.osmf.media.URLResource;
	import org.osmf.net.NetClient;
	import org.osmf.net.NetLoader;
	import org.osmf.traits.MediaTraitType;
	
	
	/**
	 * This VideoElement will handle in stream events by making the 
	 * appropreate javascript calls.
	 */
	public class NetStreamVideoElement extends LightweightVideoElement {
		
		override public function NetStreamVideoElement(url:URLResource) {
			super(url);
		}
		
		override protected function processReadyState():void {			
			super.processReadyState();
			client.addHandler("question", onQuestion);
		}
		
		public function onQuestion(question:Object):void {
			//convert the question to json and call javascript handler
			var questionToJSON:Object = new Object();
			
			questionToJSON.text = question.text;
			questionToJSON.type = question.type;
			questionToJSON.duration = question.duration;
			questionToJSON.answers = question.answers;
			
			var questionJSON:String = JSON.encode(questionToJSON);
			trace("calling onQuestion");
			ExternalInterface.call("onQuestion", questionJSON);
		}
	}
}