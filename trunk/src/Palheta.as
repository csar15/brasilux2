package
{
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;

	public class Palheta extends MovieClip
	{
		
		public var menupalheta:MenuPalheta
		public var main:Main
		private var dot_cor:DotCor
		private var dot_margin:Number = 3
		private var gridX:Number = 8
		private var gridY:Number
		private var margin:Number = 10
		
		public var xml:XML
		public var loader:Loader = new Loader()
		public var xmlLoader:URLLoader
	 	
	 	public var maxCores:Number
	 	private var titHeight:Number = 24
	 	private var title:String
	 			
		
		public function Palheta(tabela:String, nome:String, leading:Number)
		{
			title = nome
			LoadTabela(tabela)
			Position(leading)
		}
		public function LoadTabela(tabela:String):void {
			
			this.addChild(loader);
			xmlLoader = new URLLoader(new URLRequest(tabela));
			xmlLoader.addEventListener(Event.COMPLETE, parseXML)
			
		}
		protected function parseXML(event:Event):void 
		{
			xmlLoader.removeEventListener(Event.COMPLETE, parseXML);
			xml = new XML(event.currentTarget.data);
			maxCores = xml.tr.length();
			CreatTitle()
			CreatCores();			
		}
		private function Position(leading:Number):void {
			this.y = leading + margin
		}
		private function CreatTitle():void {
			var tit:TextField = new TextField() 
			var textformat:TextFormat = new TextFormat()
			textformat.color = 0x000000
			textformat.size = 12
			textformat.font = "Arial"
			tit.defaultTextFormat = textformat;
			tit.x = -8
			tit.autoSize = TextFieldAutoSize.LEFT
			tit.selectable = false
			tit.multiline = true
			tit.height = 22
			tit.htmlText = title
			this.addChild(tit)
		}
		private function CreatCores():void {
			gridY = Math.ceil(maxCores/gridX)
			
			var num:Number = 0
			for (var i:Number = 0; i<gridX; i++) {
				for (var j:Number = 0; j<gridY; j++) {
					if(num<maxCores) {
						var hexaColor:String = xml.tr[num].td[2]
						var numColor:Number = parseInt("0x" +xml.tr[num].td[2])
						var nameColor:String = xml.tr[num].td[1]
						var codColor:String = xml.tr[num].td[0]
						dot_cor = new DotCor(numColor, nameColor, codColor, hexaColor)
						dot_cor.name  = "dot_cor" + num
					
            			dot_cor.x = (dot_cor.dot_width+dot_margin)*i
            			dot_cor.y = (dot_cor.dot_height+dot_margin)*j + titHeight
            		
            			dot_cor.addEventListener(MouseEvent.CLICK, PressCor)
            			dot_cor.addEventListener(MouseEvent.MOUSE_OVER, OverCor)
            			dot_cor.addEventListener(MouseEvent.MOUSE_OUT, OutCor)
            			dot_cor.buttonMode = true
            			addChild(dot_cor)
            			num++
     				}
				}
			}
		}
		private function OverCor(e:MouseEvent):void {
			e.target.scaleX = 1.8
			e.target.scaleY = 1.8
			var dot_index:DisplayObject = this.getChildByName(e.target.name)
			var num_index:Number  = this.getChildIndex(dot_index)
			var max_index:Number = maxCores
			this.swapChildrenAt(max_index, num_index)
			//
			menupalheta.main.captiontab.setTxt("cód: " + e.target.cod_color  + "<br>" + e.target.name_color)

		}
		private function OutCor(e:MouseEvent):void {
			e.target.scaleX = 1
			e.target.scaleY = 1
			menupalheta.main.captiontab.setTxt()
		}
		private function PressCor(e:MouseEvent):void {
			menupalheta.main.ChangeColor(menupalheta.main.masc_select,e.target.rd_color, e.target.name_color, e.target.cod_color, e.target.hexa_color)
			//
		}
		
		
		
	}
}