package
{
	import com.adobe.images.JPGEncoder;
	
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.FileReference;
	import flash.utils.ByteArray;
	
	public class SaveImg
	{
		public function SaveImg()
		{
			super()
		}
		
		public function Save(W:Number, H:Number, mc:MovieClip):void {
			var imageData:BitmapData = new BitmapData(W, H)
			imageData.draw(mc);
			
			var encodedImage:ByteArray
			
			var fileNameRegExp:RegExp = /^(?P<fileName>.*)\..*$/;
			//var outputFileName:String = fileNameRegExp.exec(fileRef.name).fileName + "_brasilux";
			var outputFileName:String = "brasilux.jpg";
			
			var jpgEncoder:JPGEncoder = new JPGEncoder(85);
			encodedImage = jpgEncoder.encode(imageData);
			//outputFileName += ".jpg";
			
			var saveFile:FileReference = new FileReference();
			saveFile.addEventListener(Event.OPEN, saveBeginHandler);
			saveFile.addEventListener(Event.COMPLETE, saveCompleteHandler);
			saveFile.addEventListener(IOErrorEvent.IO_ERROR, saveIOErrorHandler);
			saveFile.save(encodedImage, outputFileName);
		}
		
		
		private function saveBeginHandler(event:Event):void
		{
			//setDisplayState(PROGRESS);
		}
		
		
		private function saveCompleteHandler(event:Event):void
		{			
			event.target.removeEventListener(Event.OPEN, saveBeginHandler);
			event.target.removeEventListener(Event.COMPLETE, saveCompleteHandler);
			event.target.removeEventListener(IOErrorEvent.IO_ERROR, saveIOErrorHandler);
			
		}
		
		private function saveIOErrorHandler(event:IOErrorEvent):void
		{
			event.target.removeEventListener(Event.COMPLETE, saveCompleteHandler);
			event.target.removeEventListener(IOErrorEvent.IO_ERROR, saveIOErrorHandler);
			
			trace("Error while trying to save:");
			trace(event);
		}

	}
}