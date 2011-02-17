package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.geom.Matrix;
	import flash.printing.PrintJob;
    	
	public class PrintImg
	{
		var main:Main
		
		public function PrintImg()
		{
			super()
		}
		public function printPage(W:Number, H:Number, mc:MovieClip):void {
            main.ChangeAlign()
            var pj:PrintJob = new PrintJob();
            var pagesToPrint:uint = 0;
			var imageData:BitmapData = new BitmapData(W, H,false)
			
			//var mtx:Matrix = new Matrix()
			//mtx.tx = -(W - 1024)/2
			//mtx.ty = -(H - 768)/2
			
			imageData.draw(mc)
			var image:Bitmap = new Bitmap(imageData)
			main.addChild(image)

            if(pj.start()) {                
                try {
                    pj.addPage(main)
                    pagesToPrint++;  
                }
                catch(e:Error) {
                    //main.removeChild(image)
                }
                if(pagesToPrint > 0) {
                    pj.send();
                   //main.removeChild(image)
                }
            }
            main.removeChild(image)
            main.ChangeAlign()
        }

	}
}