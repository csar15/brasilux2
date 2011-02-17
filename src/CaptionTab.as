package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.filters.DropShadowFilter;
	import flash.text.*;

	public class CaptionTab extends MovieClip
	{
		public var txt:TextField = new TextField()
		public function CaptionTab()
		{
			this.visible = false
			this.addEventListener(Event.ENTER_FRAME, loop)
			CreatTxt()
			CreatShadow()

		}
		private function CreatShadow():void {
			var shadow:DropShadowFilter = new DropShadowFilter(2, 135, 0x000000, 0.7, 6, 6, 0.6)
			txt.filters = [shadow]
		}
		private function CreatTxt():void {
			//txt.text = "DEKDEk"
			var textformat:TextFormat = new TextFormat()
			textformat.color = 0x000000
			textformat.size = 12
			textformat.font = "Arial"
			txt.defaultTextFormat = textformat;	
			txt.autoSize = TextFieldAutoSize.RIGHT;
			txt.selectable = false
			txt.multiline = true
			txt.background = true
			txt.backgroundColor = 0xD6D6D6
			txt.border = true
			txt.borderColor = 0xcccccc
			addChild(txt)
		}
		public function setTxt(tt:String = null):void {
			if (tt != null) {
				txt.htmlText = tt
				this.visible = true
			} else {
				this.visible = false
			}
			
		}
		private function loop(event:Event):void {
			var distanceX:Number = (stage.stageWidth/2 - stage.mouseX)/50
			this.x = this.x + (stage.mouseX - this.x + (this.width*distanceX)/10)/12
			this.y = this.y + (stage.mouseY - this.y + 20)/12
		}
		
	}
}