package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.events.MouseEvent;
	import flash.filters.DropShadowFilter;
	
	public class GaleryDiff extends MovieClip
	{
		public var main:Main
		private var shape:Shape = new Shape()
		private var margin:Number = 12
		private var W:Number = 1024
		private var H:Number = 555
		
		public function GaleryDiff(original:Bitmap, diff:MovieClip)
		{
			//main.FullScreen()
			var shadow:DropShadowFilter = new DropShadowFilter(2, 135, 0x000000, 0.6, 4, 4, 1.3)
			this.filters = [shadow]
			this.buttonMode = true
			this.addEventListener(MouseEvent.CLICK, Destroy)
			this.addEventListener(MouseEvent.MOUSE_OVER, Over)
			this.addEventListener(MouseEvent.MOUSE_OUT, Out)
			
			shape.graphics.beginFill(0xffffff, 1)
			shape.graphics.drawRect(0, 0, 957.6, 276)
			shape.graphics.endFill()
			addChild(shape)
			//
			//var imageDataOriginal:BitmapData = new BitmapData(W, H)
			//imageDataOriginal.draw(original)
			//var imageOriginal:Bitmap = new Bitmap(imageDataOriginal)
			original.scaleX = 0.45
			original.scaleY = 0.45
			original.x = margin
			original.y = margin
			this.addChild(original)
			//
			var imageDataDiff:BitmapData = new BitmapData(W, H)
			imageDataDiff.draw(diff)
			var imageDiff:Bitmap = new Bitmap(imageDataDiff)
			imageDiff.scaleX = 0.45
			imageDiff.scaleY = 0.45
			imageDiff.x = original.width + margin*2
			imageDiff.y = margin
			this.addChild(imageDiff)
		}
		private function Destroy(e:MouseEvent):void {
			this.removeEventListener(MouseEvent.CLICK, Destroy)
			this.removeEventListener(MouseEvent.MOUSE_OVER, Over)
			this.removeEventListener(MouseEvent.MOUSE_OUT, Out)
			main.captiontab.setTxt()
			main.removeChild(e.target)
			main.DiffOld()
			//main.ChangeAlign()
		}
		private function Over(e:MouseEvent):void {
			parent.captiontab.setTxt("FECHAR")	
		}
		private function Out(e:MouseEvent):void {
			parent.captiontab.setTxt()
		}

	}
}