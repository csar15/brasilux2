package
{
	import fl.controls.Button;
	import fl.controls.TextInput;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;

	public class SearchColor extends MovieClip
	{
		public var menupalheta:MenuPalheta
		private var dot_cor:DotCor
		
		public var textinput:TextInput = new TextInput()
		public var bt_buscar:Button = new Button()
		public var StatusArea:TextField = new TextField()
		//
		private var palhetasdata:Array 
		private var palhetasname:Array 
		private var xmlLoader:URLLoader
		private var xml:XML
		public var maxCores:Number
		public var num_xml:Number
		
		private var result:Boolean
		
		public function SearchColor()
		{
			this.addChild(textinput)
			this.addChild(bt_buscar)
			textinput.width = 70
			bt_buscar.x = 70
			bt_buscar.width = 30
			bt_buscar.label = "IR"
			textinput.text = "Buscar cor"
			CreatResult()
		}	
		public function ResetSearch():void {
			num_xml = 0
			result = false
		}	
		public function CreatResult():void {
			var textformat:TextFormat = new TextFormat()
			textformat.color = 0x000000
			textformat.size = 11
			textformat.font = "Arial"
			//textformat.align = "left"
			StatusArea.defaultTextFormat = textformat;	
			
			StatusArea.x = 0
			StatusArea.y = 25
			StatusArea.autoSize = TextFieldAutoSize.LEFT;
			StatusArea.selectable = false
			StatusArea.multiline = true	
			addChild(StatusArea)
		}
		public function StartSearch():void {
			palhetasdata = new Array()
			palhetasname = new Array()
			palhetasdata = ["brasipiso_coresprontas", "brasipiso_lequecores", "brasitelha_coresprontas", "metais_madeira_esmalteacetinado", "metais_madeira_esmaltebrilhante", "metais_madeira_esmaltemetalico", "parede_latexacrilico", "parede_lequecores"]
			palhetasname = ["Brasipiso Cores prontas", "Brasipiso Leque de Cores", "Brasitelha Cores Prontas", "Metais/Madeira Esmalte Acetinado", "Metais/Madeira Esmalte Brilhante", "Metais/Madeira Esmalte Metálico", "Parede Latex Acrílico", "Parede Leque de Cores"]
			if (num_xml<palhetasdata.length) {
				var palheta_xml:String = palhetasdata[num_xml]
				xmlLoader = new URLLoader(new URLRequest("xml/" + palheta_xml + ".xml"));
				xmlLoader.addEventListener(Event.COMPLETE, parseXML)
			}
		}
		protected function parseXML(event:Event):void 
		{
			xmlLoader.removeEventListener(Event.COMPLETE, parseXML);
			xml = new XML(event.currentTarget.data);
			maxCores = xml.tr.length();
			SearchCor()
		}
		private function SearchCor():void {
			var num:Number = 0
			for (var i:Number = 0; i<maxCores; i++) {
				ResultError()
				var hexaColor:String = xml.tr[num].td[2]
				var numColor:Number = parseInt("0x" +xml.tr[num].td[2])
				var nameColor:String = xml.tr[num].td[1]
				var codColor:String = xml.tr[num].td[0]
				trace(codColor)
				if (codColor == textinput.text) {
					ResultClear()
					
					dot_cor = new DotCor(numColor, nameColor, codColor, hexaColor)
					dot_cor.name  = "dot_cor" + num
	    			dot_cor.x = 5
	    			dot_cor.y = 40
	    			dot_cor.addEventListener(MouseEvent.CLICK, PressCor)
	    			dot_cor.addEventListener(MouseEvent.MOUSE_OVER, OverCor)
	    			dot_cor.addEventListener(MouseEvent.MOUSE_OUT, OutCor)
	    			dot_cor.buttonMode = true
	    			addChild(dot_cor)
	    			//
	    			result = true
	    			ResultFind(palhetasname[num_xml], nameColor)
	    			// stop search
	    			num_xml = palhetasdata.length
	    			break
    			}
    			num++	
			}
			num_xml++
			StartSearch()
		}
		public function ResultError():void {
			StatusArea.htmlText = "Não encontrada.<br>Escreva o código da cor."	
		}
		public function ResultFind(palhetaname:String, corname:String):void {
			StatusArea.htmlText = palhetaname + "<br>" + corname
			StatusArea.multiline = true
			StatusArea.x = 20
		}
		public function ResultClear():void {
			StatusArea.htmlText = ""
			StatusArea.x = 0
			if (result == true) {
				removeChild(dot_cor)
				result = false
			}
		}
		private function OverCor(e:MouseEvent):void {
			e.target.scaleX = 1.8
			e.target.scaleY = 1.8
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