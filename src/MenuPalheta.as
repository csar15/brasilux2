package
{
	import fl.controls.Button;
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;

	public class MenuPalheta extends MovieClip
	{
		public var searchcolor:SearchColor = new SearchColor()
		private var palheta:Palheta
		public var main:Main
		public var alvo:MovieClip
		public var txt:TextField = new TextField()
		public var btBrasipiso:Button = new Button()
		public var btBrasitelha:Button = new Button()
		public var btParede:Button = new Button()
		public var btMetais:Button = new Button()
		
		private var leading:Number = 25
		private var bordaX:Number = 15
		private var bordaY:Number = 45
		
		public function MenuPalheta()
		{			
			alvo = new MovieClip()
			this.addChild(alvo)
			CreatTitle()
			CreatSearch()
			CreatButtons()	
		}
		private function CreatSearch():void {
			this.addChild(searchcolor)
			searchcolor.x = bordaX
			searchcolor.y = 40
			searchcolor.bt_buscar.addEventListener(MouseEvent.CLICK, onSearch)
		}
		private function CreatButtons():void {
			
			btBrasipiso.label = "Brasipiso"
			btBrasipiso.addEventListener(MouseEvent.CLICK, onBrasipiso)
			btBrasipiso.x = bordaX
			btBrasipiso.y = leading + bordaY
			this.addChild(btBrasipiso)
			//
			btBrasitelha.label = "Brasitelha"
			btBrasitelha.addEventListener(MouseEvent.CLICK, onBrasitelha)
			btBrasitelha.x = bordaX
			btBrasitelha.y = leading*2 + bordaY
			this.addChild(btBrasitelha)
			//
			btParede.label = "Parede"
			btParede.addEventListener(MouseEvent.CLICK, onParede)
			btParede.x = bordaX
			btParede.y =leading*3 + bordaY
			this.addChild(btParede)
			//
			btMetais.label = "Metais/Madeira"
			btMetais.addEventListener(MouseEvent.CLICK, onMetais)
			btMetais.x = bordaX
			btMetais.y = leading*4 + bordaY
			this.addChild(btMetais)
			
		}
		private function Reset():void {
			searchcolor.ResultClear()
			this.removeChild(alvo)
			alvo = new MovieClip()
			this.addChild(alvo)
			alvo.x =18
			searchcolor.ResultClear()
		}
		private function onSearch(e:MouseEvent):void {
			var posY:Number = 40
			Reset()
			btBrasipiso.y 	= posY + leading 	+ bordaY
			btBrasitelha.y 	= posY + leading*2 	+ bordaY
			btParede.y 		= posY + leading*3 	+ bordaY
			btMetais.y 		= posY + leading*4 	+ bordaY
			//
			searchcolor.menupalheta = this
			searchcolor.ResetSearch()
			searchcolor.StartSearch()
		}
		private function onBrasipiso(e:MouseEvent):void {
			var posY:Number = 2320
			Reset()
			//
			palheta = new Palheta("xml/brasipiso_coresprontas.xml", "Cores Prontas", 0)
			palheta.menupalheta = this
			alvo.addChild(palheta)	
			//
			palheta = new Palheta("xml/brasipiso_lequecores.xml", "Leque de Cores", 40)
			palheta.menupalheta = this
			alvo.addChild(palheta)
	

			//
			btBrasipiso.y 	= leading 	+ bordaY
			btBrasitelha.y 	= posY + leading 	+ bordaY
			btParede.y 		= posY + leading*2 	+ bordaY
			btMetais.y 		= posY + leading*3 	+ bordaY
			//
			alvo.y = btBrasipiso.y + btBrasipiso.height
		}
		private function onBrasitelha(e:MouseEvent):void {
			var posY:Number = 90 + leading
			Reset()
			palheta = new Palheta("xml/brasitelha_coresprontas.xml", "Cores Prontas", 0)
			palheta.menupalheta = this
			alvo.addChild(palheta)
			//
			btBrasipiso.y 	= leading 	+ bordaY
			btBrasitelha.y 	= leading*2 + bordaY
			btParede.y 		= posY + leading 	+ bordaY
			btMetais.y 		= posY + leading*2 	+ bordaY
			//
			alvo.y = btBrasitelha.y + btBrasitelha.height
			//

		}
		private function onParede(e:MouseEvent):void {
			var posY:Number = 2400 + leading*2
			Reset()
			palheta = new Palheta("xml/parede_latexacrilico.xml", "Latex Acrílico", 0)
			palheta.menupalheta = this
			alvo.addChild(palheta)
			//
			palheta = new Palheta("xml/parede_lequecores.xml", "Leque de Cores", 145)
			palheta.menupalheta = this
			alvo.addChild(palheta)
			//
			btBrasipiso.y 	= leading 	+ bordaY
			btBrasitelha.y 	= leading*2 + bordaY
			btParede.y 		= leading*3 + bordaY
			btMetais.y 		= posY + leading*2 	+ bordaY
			//
			alvo.y = btParede.y + btParede.height
			//
		}
		private function onMetais(e:MouseEvent):void {
			var posY:Number = 130 + leading*3
			Reset()
			palheta = new Palheta("xml/metais_madeira_esmaltebrilhante.xml", "Esmalte Brilhante", 0)
			palheta.menupalheta = this
			alvo.addChild(palheta)
			//
			palheta = new Palheta("xml/metais_madeira_esmalteacetinado.xml", "Esmalte Acetinado", 115)
			palheta.menupalheta = this
			alvo.addChild(palheta)
			//
			palheta = new Palheta("xml/metais_madeira_esmaltemetalico.xml", "Esmalte Metálico", 175)
			palheta.menupalheta = this
			alvo.addChild(palheta)
			//
			btBrasipiso.y 	= leading 	+ bordaY
			btBrasitelha.y 	= leading*2 + bordaY
			btParede.y 		= leading*3 + bordaY
			btMetais.y 		= leading*4 + bordaY
			//
			alvo.y = btMetais.y + btMetais.height
		}
		private function CreatTitle():void {
			var textformat:TextFormat = new TextFormat()
			textformat.color = 0x9c9c9c
			textformat.size = 13
			textformat.font = "Arial"
			textformat.align = "right"
			txt.defaultTextFormat = textformat;	
			txt.autoSize = TextFieldAutoSize.RIGHT;
			txt.blendMode = "layer"
			txt.selectable = false
			txt.multiline = true
			txt.htmlText = "Tabela de cores <br>BRASILUX"
			txt.x = 20
			txt.y = 0
			addChild(txt)
		}		
	}
}