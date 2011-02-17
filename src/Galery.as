package
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.filters.DropShadowFilter;	
	public class Galery
	{
		private var ThumbWidth:Number = 20
		private var ThumbHeight:Number = 20
		private var PaneWidth:Number = 655
		private var PaneHeight:Number = 256
		private var escala:Number = 0.2
		private var margin:Number = 10
		
		public var main:Main
		private var pane:MovieClip = new MovieClip()
		private var galerythumb:MovieClip = new MovieClip()
		public var cozinha:Cozinha = new Cozinha()
		public var quarto:Quarto = new Quarto()
		public var sala:Sala = new Sala()
		public var fachada1:Fachada1 = new Fachada1()
		public var fachada2:Fachada2 = new Fachada2()
		public function Galery()
		{
			super()
		}
		public function init():void {
			//LoadQuarto()
			//LoadSala()
			//LoadFachada1()
			CreatThumbs()
			CreatPane()
		}
		private function CreatPane():void {
			var shadow:DropShadowFilter = new DropShadowFilter(2, 125, 0x000000, 0.6, 5, 5, 1)
			pane.filters = [shadow]
			pane.x = main.MAX_WIDTH/2 - PaneWidth/2
			pane.y = main.MAX_HEIGHT/2 - PaneHeight/2
			pane.graphics.beginFill(0xffffff, 1)
			pane.graphics.drawRect(0, 0, PaneWidth, PaneHeight)
			pane.graphics.endFill()
			main.addChild(pane)
			galerythumb.y = -8
			pane.addChild(galerythumb)
			
		}
		private function CreatThumbs():void {
			quarto.thumb.scaleX = escala
			quarto.thumb.scaleY = escala
			quarto.thumb.x = margin
			quarto.thumb.y = 0
			galerythumb.addChild(quarto.thumb)
			quarto.thumb.addEventListener(MouseEvent.CLICK, LoadQuarto)
			//
			sala.thumb.scaleX = escala
			sala.thumb.scaleY = escala
			sala.thumb.x = (sala.thumb.width)*1+ (2*margin)
			sala.thumb.y = 0
			galerythumb.addChild(sala.thumb)
			sala.thumb.addEventListener(MouseEvent.CLICK, LoadSala)
			//
			fachada1.thumb.scaleX = escala
			fachada1.thumb.scaleY = escala
			fachada1.thumb.x = (fachada1.thumb.width)*2+(3*margin)
			fachada1.thumb.y = 0
			galerythumb.addChild(fachada1.thumb)
			fachada1.thumb.addEventListener(MouseEvent.CLICK, LoadFachada1)
			//
			fachada2.thumb.scaleX = escala
			fachada2.thumb.scaleY = escala
			fachada2.thumb.x = margin
			fachada2.thumb.y = fachada2.thumb.height + margin
			galerythumb.addChild(fachada2.thumb)
			fachada2.thumb.addEventListener(MouseEvent.CLICK, LoadFachada2)
			//
			cozinha.thumb.scaleX = escala
			cozinha.thumb.scaleY = escala
			cozinha.thumb.x = cozinha.thumb.width + 2*margin
			cozinha.thumb.y = cozinha.thumb.height + margin
			galerythumb.addChild(cozinha.thumb)
			cozinha.thumb.addEventListener(MouseEvent.CLICK, LoadCozinha)
		}
		public function Destroy():void {
			main.menufooter.btupload.addEventListener(MouseEvent.CLICK, main.PressBrowser)
			main.menufooter.btgalery.addEventListener(MouseEvent.CLICK, main.PressGalery)
			main.removeChild(pane)
		}
		private function LoadCozinha(e:MouseEvent):void {
			Destroy()
			main.i = 4
			main.img_select = cozinha.img
			main.multi_select = cozinha.multi
			main.foto.addChild(cozinha.img)			
			main.foto_multi.addChild(cozinha.multi)
			main.foto_multi.mask=main.form_masc;
			//
			main.form_cor.addChild(cozinha.cor_select1)
			main.form_cor.addChild(cozinha.cor1)
			main.form_masc.addChild(cozinha.mascara1)
			cozinha.mascara1.id = 1
			cozinha.mascara1.buttonMode = true
			cozinha.mascara1.addEventListener(MouseEvent.CLICK, main.MascPress)
			cozinha.mascara1.addEventListener(MouseEvent.MOUSE_OVER, main.MascOver)
			cozinha.mascara1.addEventListener(MouseEvent.MOUSE_OUT, main.MascOut)
			//
			main.form_cor.addChild(cozinha.cor_select2)
			main.form_cor.addChild(cozinha.cor2)
			main.form_masc.addChild(cozinha.mascara2)
			cozinha.mascara2.id = 2
			cozinha.mascara2.buttonMode = true
			cozinha.mascara2.addEventListener(MouseEvent.CLICK, main.MascPress)
			cozinha.mascara2.addEventListener(MouseEvent.MOUSE_OVER, main.MascOver)
			cozinha.mascara2.addEventListener(MouseEvent.MOUSE_OUT, main.MascOut)
			//
			main.form_cor.addChild(cozinha.cor_select3)
			main.form_cor.addChild(cozinha.cor3)
			main.form_masc.addChild(cozinha.mascara3)
			cozinha.mascara3.id = 3
			cozinha.mascara3.buttonMode = true
			cozinha.mascara3.addEventListener(MouseEvent.CLICK, main.MascPress)
			cozinha.mascara3.addEventListener(MouseEvent.MOUSE_OVER, main.MascOver)
			cozinha.mascara3.addEventListener(MouseEvent.MOUSE_OUT, main.MascOut)
			//
			main.DiffOld()
		}
		private function LoadQuarto(e:MouseEvent):void {
			Destroy()
			main.i = 4
			main.img_select = quarto.img
			main.multi_select = quarto.multi
			main.foto.addChild(quarto.img)			
			main.foto_multi.addChild(quarto.multi)
			main.foto_multi.mask=main.form_masc;
			//
			main.form_cor.addChild(quarto.cor_select1)
			main.form_cor.addChild(quarto.cor1)
			main.form_masc.addChild(quarto.mascara1)
			quarto.mascara1.id = 1
			quarto.mascara1.buttonMode = true
			quarto.mascara1.addEventListener(MouseEvent.CLICK, main.MascPress)
			quarto.mascara1.addEventListener(MouseEvent.MOUSE_OVER, main.MascOver)
			quarto.mascara1.addEventListener(MouseEvent.MOUSE_OUT, main.MascOut)
			//
			main.form_cor.addChild(quarto.cor_select2)
			main.form_cor.addChild(quarto.cor2)
			main.form_masc.addChild(quarto.mascara2)
			quarto.mascara2.id = 2
			quarto.mascara2.buttonMode = true
			quarto.mascara2.addEventListener(MouseEvent.CLICK, main.MascPress)
			quarto.mascara2.addEventListener(MouseEvent.MOUSE_OVER, main.MascOver)
			quarto.mascara2.addEventListener(MouseEvent.MOUSE_OUT, main.MascOut)
			//
			main.form_cor.addChild(quarto.cor_select3)
			main.form_cor.addChild(quarto.cor3)
			main.form_masc.addChild(quarto.mascara3)
			quarto.mascara3.id = 3
			quarto.mascara3.buttonMode = true
			quarto.mascara3.addEventListener(MouseEvent.CLICK, main.MascPress)
			quarto.mascara3.addEventListener(MouseEvent.MOUSE_OVER, main.MascOver)
			quarto.mascara3.addEventListener(MouseEvent.MOUSE_OUT, main.MascOut)
			//
			main.DiffOld()
		}
		private function LoadSala(e:MouseEvent):void {
			Destroy()
			main.i = 6
			main.img_select = sala.img
			main.multi_select = sala.multi
			main.foto.addChild(sala.img)			
			main.foto_multi.addChild(sala.multi)
			main.foto_multi.mask=main.form_masc;
			//
			main.form_cor.addChild(sala.cor_select1)
			main.form_cor.addChild(sala.cor1)
			main.form_masc.addChild(sala.mascara1)
			sala.mascara1.id = 1
			sala.mascara1.buttonMode = true
			sala.mascara1.addEventListener(MouseEvent.CLICK, main.MascPress)
			sala.mascara1.addEventListener(MouseEvent.MOUSE_OVER, main.MascOver)
			sala.mascara1.addEventListener(MouseEvent.MOUSE_OUT, main.MascOut)
			//
			main.form_cor.addChild(sala.cor_select2)
			main.form_cor.addChild(sala.cor2)
			main.form_masc.addChild(sala.mascara2)
			sala.mascara2.id = 2
			sala.mascara2.buttonMode = true
			sala.mascara2.addEventListener(MouseEvent.CLICK, main.MascPress)
			sala.mascara2.addEventListener(MouseEvent.MOUSE_OVER, main.MascOver)
			sala.mascara2.addEventListener(MouseEvent.MOUSE_OUT, main.MascOut)
			//
			main.form_cor.addChild(sala.cor_select3)
			main.form_cor.addChild(sala.cor3)
			main.form_masc.addChild(sala.mascara3)
			sala.mascara3.id = 3
			sala.mascara3.buttonMode = true
			sala.mascara3.addEventListener(MouseEvent.CLICK, main.MascPress)
			sala.mascara3.addEventListener(MouseEvent.MOUSE_OVER, main.MascOver)
			sala.mascara3.addEventListener(MouseEvent.MOUSE_OUT, main.MascOut)
			//
			main.form_cor.addChild(sala.cor_select4)
			main.form_cor.addChild(sala.cor4)
			main.form_masc.addChild(sala.mascara4)
			sala.mascara4.id = 4
			sala.mascara4.buttonMode = true
			sala.mascara4.addEventListener(MouseEvent.CLICK, main.MascPress)
			sala.mascara4.addEventListener(MouseEvent.MOUSE_OVER, main.MascOver)
			sala.mascara4.addEventListener(MouseEvent.MOUSE_OUT, main.MascOut)
			//
			main.form_cor.addChild(sala.cor_select5)
			main.form_cor.addChild(sala.cor5)
			main.form_masc.addChild(sala.mascara5)
			sala.mascara5.id = 5
			sala.mascara5.buttonMode = true
			sala.mascara5.addEventListener(MouseEvent.CLICK, main.MascPress)
			sala.mascara5.addEventListener(MouseEvent.MOUSE_OVER, main.MascOver)
			sala.mascara5.addEventListener(MouseEvent.MOUSE_OUT, main.MascOut)
			//
			main.DiffOld()
		}
		private function LoadFachada1(e:MouseEvent):void {
			Destroy()
			main.i = 9
			main.img_select = fachada1.img
			main.multi_select = fachada1.multi
			main.foto.addChild(fachada1.img)			
			main.foto_multi.addChild(fachada1.multi)
			main.foto_multi.mask=main.form_masc;
			//
			main.form_cor.addChild(fachada1.cor_select1)
			main.form_cor.addChild(fachada1.cor1)
			main.form_masc.addChild(fachada1.mascara1)
			fachada1.mascara1.id = 1
			fachada1.mascara1.buttonMode = true
			fachada1.mascara1.addEventListener(MouseEvent.CLICK, main.MascPress)
			fachada1.mascara1.addEventListener(MouseEvent.MOUSE_OVER, main.MascOver)
			fachada1.mascara1.addEventListener(MouseEvent.MOUSE_OUT, main.MascOut)
			//
			main.form_cor.addChild(fachada1.cor_select2)
			main.form_cor.addChild(fachada1.cor2)
			main.form_masc.addChild(fachada1.mascara2)
			fachada1.mascara2.id = 2
			fachada1.mascara2.buttonMode = true
			fachada1.mascara2.addEventListener(MouseEvent.CLICK, main.MascPress)
			fachada1.mascara2.addEventListener(MouseEvent.MOUSE_OVER, main.MascOver)
			fachada1.mascara2.addEventListener(MouseEvent.MOUSE_OUT, main.MascOut)
			//
			main.form_cor.addChild(fachada1.cor_select3)
			main.form_cor.addChild(fachada1.cor3)
			main.form_masc.addChild(fachada1.mascara3)
			fachada1.mascara3.id = 3
			fachada1.mascara3.buttonMode = true
			fachada1.mascara3.addEventListener(MouseEvent.CLICK, main.MascPress)
			fachada1.mascara3.addEventListener(MouseEvent.MOUSE_OVER, main.MascOver)
			fachada1.mascara3.addEventListener(MouseEvent.MOUSE_OUT, main.MascOut)
			//
			main.form_cor.addChild(fachada1.cor_select4)
			main.form_cor.addChild(fachada1.cor4)
			main.form_masc.addChild(fachada1.mascara4)
			fachada1.mascara4.id = 4
			fachada1.mascara4.buttonMode = true
			fachada1.mascara4.addEventListener(MouseEvent.CLICK, main.MascPress)
			fachada1.mascara4.addEventListener(MouseEvent.MOUSE_OVER, main.MascOver)
			fachada1.mascara4.addEventListener(MouseEvent.MOUSE_OUT, main.MascOut)
			//
			main.form_cor.addChild(fachada1.cor_select5)
			main.form_cor.addChild(fachada1.cor5)
			main.form_masc.addChild(fachada1.mascara5)
			fachada1.mascara5.id = 5
			fachada1.mascara5.buttonMode = true
			fachada1.mascara5.addEventListener(MouseEvent.CLICK, main.MascPress)
			fachada1.mascara5.addEventListener(MouseEvent.MOUSE_OVER, main.MascOver)
			fachada1.mascara5.addEventListener(MouseEvent.MOUSE_OUT, main.MascOut)
			//
			main.form_cor.addChild(fachada1.cor_select6)
			main.form_cor.addChild(fachada1.cor6)
			main.form_masc.addChild(fachada1.mascara6)
			fachada1.mascara6.id = 6
			fachada1.mascara6.buttonMode = true
			fachada1.mascara6.addEventListener(MouseEvent.CLICK, main.MascPress)
			fachada1.mascara6.addEventListener(MouseEvent.MOUSE_OVER, main.MascOver)
			fachada1.mascara6.addEventListener(MouseEvent.MOUSE_OUT, main.MascOut)
						//
			main.form_cor.addChild(fachada1.cor_select7)
			main.form_cor.addChild(fachada1.cor7)
			main.form_masc.addChild(fachada1.mascara7)
			fachada1.mascara7.id = 7
			fachada1.mascara7.buttonMode = true
			fachada1.mascara7.addEventListener(MouseEvent.CLICK, main.MascPress)
			fachada1.mascara7.addEventListener(MouseEvent.MOUSE_OVER, main.MascOver)
			fachada1.mascara7.addEventListener(MouseEvent.MOUSE_OUT, main.MascOut)
						//
			main.form_cor.addChild(fachada1.cor_select8)
			main.form_cor.addChild(fachada1.cor8)
			main.form_masc.addChild(fachada1.mascara8)
			fachada1.mascara8.id = 8
			fachada1.mascara8.buttonMode = true
			fachada1.mascara8.addEventListener(MouseEvent.CLICK, main.MascPress)
			fachada1.mascara8.addEventListener(MouseEvent.MOUSE_OVER, main.MascOver)
			fachada1.mascara8.addEventListener(MouseEvent.MOUSE_OUT, main.MascOut)
			//
			main.DiffOld()
		}
		private function LoadFachada2(e:MouseEvent):void {
			Destroy()
			main.i = 6
			main.img_select = fachada2.img
			main.multi_select = fachada2.multi
			main.foto.addChild(fachada2.img)			
			main.foto_multi.addChild(fachada2.multi)
			main.foto_multi.mask=main.form_masc;
			//
			main.form_cor.addChild(fachada2.cor_select1)
			main.form_cor.addChild(fachada2.cor1)
			main.form_masc.addChild(fachada2.mascara1)
			fachada2.mascara1.id = 1
			fachada2.mascara1.buttonMode = true
			fachada2.mascara1.addEventListener(MouseEvent.CLICK, main.MascPress)
			fachada2.mascara1.addEventListener(MouseEvent.MOUSE_OVER, main.MascOver)
			fachada2.mascara1.addEventListener(MouseEvent.MOUSE_OUT, main.MascOut)
			//
			main.form_cor.addChild(fachada2.cor_select2)
			main.form_cor.addChild(fachada2.cor2)
			main.form_masc.addChild(fachada2.mascara2)
			fachada2.mascara2.id = 2
			fachada2.mascara2.buttonMode = true
			fachada2.mascara2.addEventListener(MouseEvent.CLICK, main.MascPress)
			fachada2.mascara2.addEventListener(MouseEvent.MOUSE_OVER, main.MascOver)
			fachada2.mascara2.addEventListener(MouseEvent.MOUSE_OUT, main.MascOut)
			//
			main.form_cor.addChild(fachada2.cor_select3)
			main.form_cor.addChild(fachada2.cor3)
			main.form_masc.addChild(fachada2.mascara3)
			fachada2.mascara3.id = 3
			fachada2.mascara3.buttonMode = true
			fachada2.mascara3.addEventListener(MouseEvent.CLICK, main.MascPress)
			fachada2.mascara3.addEventListener(MouseEvent.MOUSE_OVER, main.MascOver)
			fachada2.mascara3.addEventListener(MouseEvent.MOUSE_OUT, main.MascOut)
			//
			main.form_cor.addChild(fachada2.cor_select4)
			main.form_cor.addChild(fachada2.cor4)
			main.form_masc.addChild(fachada2.mascara4)
			fachada2.mascara4.id = 4
			fachada2.mascara4.buttonMode = true
			fachada2.mascara4.addEventListener(MouseEvent.CLICK, main.MascPress)
			fachada2.mascara4.addEventListener(MouseEvent.MOUSE_OVER, main.MascOver)
			fachada2.mascara4.addEventListener(MouseEvent.MOUSE_OUT, main.MascOut)
			//
			main.form_cor.addChild(fachada2.cor_select5)
			main.form_cor.addChild(fachada2.cor5)
			main.form_masc.addChild(fachada2.mascara5)
			fachada2.mascara5.id = 5
			fachada2.mascara5.buttonMode = true
			fachada2.mascara5.addEventListener(MouseEvent.CLICK, main.MascPress)
			fachada2.mascara5.addEventListener(MouseEvent.MOUSE_OVER, main.MascOver)
			fachada2.mascara5.addEventListener(MouseEvent.MOUSE_OUT, main.MascOut)
			//
			main.DiffOld()
		}
	}
}