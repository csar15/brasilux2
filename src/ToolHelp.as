package
{
	import flash.events.MouseEvent;
	
	public class ToolHelp
	{
		public var main:Main
		public function ToolHelp()
		{
			super()
		}
		public function Init():void {
			main.ToolON(main.menutools.bthelp)
			main.stage.addEventListener(MouseEvent.MOUSE_DOWN, Destroy)
			main.captiontab.setTxt("clique em qualquer lugar da tela<br>para desabilitar esta ferramenta<br>passe o mouse sobre os botões<br>para obter a explicação")
			//
			main.menupalheta.addEventListener(MouseEvent.MOUSE_OVER, Cores)
			main.menupalheta.addEventListener(MouseEvent.MOUSE_OUT, Out)
			
			main.menuweather.btday.addEventListener(MouseEvent.MOUSE_OVER, Day)
			main.menuweather.btday.addEventListener(MouseEvent.MOUSE_OUT, Out)
			main.menuweather.btfire.addEventListener(MouseEvent.MOUSE_OVER, Fire)
			main.menuweather.btfire.addEventListener(MouseEvent.MOUSE_OUT, Out)
			main.menuweather.btnigth.addEventListener(MouseEvent.MOUSE_OVER, Nigth)
			main.menuweather.btnigth.addEventListener(MouseEvent.MOUSE_OUT, Out)
			//
			main.menutools.btselect.addEventListener(MouseEvent.MOUSE_OVER, Select)
			main.menutools.btselect.addEventListener(MouseEvent.MOUSE_OUT, Out)
			main.menutools.btform.addEventListener(MouseEvent.MOUSE_OVER, Form)
			main.menutools.btform.addEventListener(MouseEvent.MOUSE_OUT, Out)
			main.menutools.btdel.addEventListener(MouseEvent.MOUSE_OVER, Del)
			main.menutools.btdel.addEventListener(MouseEvent.MOUSE_OUT, Out)
			//
			main.menufooter.btupload.addEventListener(MouseEvent.MOUSE_OVER, Upload)
			main.menufooter.btupload.addEventListener(MouseEvent.MOUSE_OUT, Out)
			main.menufooter.btsave.addEventListener(MouseEvent.MOUSE_OVER, Save)
			main.menufooter.btsave.addEventListener(MouseEvent.MOUSE_OUT, Out)
			main.menufooter.btprint.addEventListener(MouseEvent.MOUSE_OVER, Print)
			main.menufooter.btprint.addEventListener(MouseEvent.MOUSE_OUT, Out)
			main.menufooter.bthelp.addEventListener(MouseEvent.MOUSE_OVER, Help)
			main.menufooter.bthelp.addEventListener(MouseEvent.MOUSE_OUT, Out)
			main.menufooter.btgalery.addEventListener(MouseEvent.MOUSE_OVER, Galery)
			main.menufooter.btgalery.addEventListener(MouseEvent.MOUSE_OUT, Out)
			main.menufooter.btdiff.addEventListener(MouseEvent.MOUSE_OVER, Diff)
			main.menufooter.btdiff.addEventListener(MouseEvent.MOUSE_OUT, Out)
		}
		public function Destroy(e:MouseEvent):void {
			main.ToolOFF(main.menutools.bthelp)
			main.stage.removeEventListener(MouseEvent.MOUSE_DOWN, Destroy)
			main.captiontab.setTxt()
			//
			main.menupalheta.removeEventListener(MouseEvent.MOUSE_OVER, Cores)
			main.menupalheta.removeEventListener(MouseEvent.MOUSE_OUT, Out)
			//
			main.menuweather.btday.removeEventListener(MouseEvent.MOUSE_OVER, Day)
			main.menuweather.btday.removeEventListener(MouseEvent.MOUSE_OUT, Out)
			main.menuweather.btfire.removeEventListener(MouseEvent.MOUSE_OVER, Fire)
			main.menuweather.btfire.removeEventListener(MouseEvent.MOUSE_OVER, Out)
			main.menuweather.btnigth.removeEventListener(MouseEvent.MOUSE_OVER, Nigth)
			main.menuweather.btnigth.removeEventListener(MouseEvent.MOUSE_OUT, Out)
			//
			main.menutools.btselect.removeEventListener(MouseEvent.MOUSE_OVER, Select)
			main.menutools.btselect.removeEventListener(MouseEvent.MOUSE_OUT, Out)
			main.menutools.btform.removeEventListener(MouseEvent.MOUSE_OVER, Form)
			main.menutools.btform.removeEventListener(MouseEvent.MOUSE_OUT, Out)
			main.menutools.btdel.removeEventListener(MouseEvent.MOUSE_OVER, Del)
			main.menutools.btdel.removeEventListener(MouseEvent.MOUSE_OUT, Out)
			//
			main.menufooter.btupload.removeEventListener(MouseEvent.MOUSE_OVER, Upload)
			main.menufooter.btupload.removeEventListener(MouseEvent.MOUSE_OUT, Out)
			main.menufooter.btsave.removeEventListener(MouseEvent.MOUSE_OVER, Save)
			main.menufooter.btsave.removeEventListener(MouseEvent.MOUSE_OUT, Out)
			main.menufooter.btprint.removeEventListener(MouseEvent.MOUSE_OVER, Print)
			main.menufooter.btprint.removeEventListener(MouseEvent.MOUSE_OUT, Out)
			main.menufooter.bthelp.removeEventListener(MouseEvent.MOUSE_OVER, Help)
			main.menufooter.bthelp.removeEventListener(MouseEvent.MOUSE_OUT, Out)
			main.menufooter.btgalery.removeEventListener(MouseEvent.MOUSE_OVER, Galery)
			main.menufooter.btgalery.removeEventListener(MouseEvent.MOUSE_OUT, Out)
			main.menufooter.btdiff.removeEventListener(MouseEvent.MOUSE_OVER, Diff)
			main.menufooter.btdiff.removeEventListener(MouseEvent.MOUSE_OUT, Out)
		}
		private function Out(e:MouseEvent):void {
			main.captiontab.setTxt()
		}
		private function Cores(e:MouseEvent):void {
			main.captiontab.setTxt("Após ter selecionada ou<br>criado uma máscara de cor,<br>troque a cor da mesma pela<br>tabela de cores brasilux")
		}
		private function Day(e:MouseEvent):void {
			main.captiontab.setTxt("Habilita a imagem da galeria<br>na cor da luz do dia")
		}
		private function Fire(e:MouseEvent):void {
			main.captiontab.setTxt("Habilita a imagem da galeria<br>como um dia ensolarado")
		}
		private function Nigth(e:MouseEvent):void {
			main.captiontab.setTxt("Transforma a imagem da galeria<br>em luz noturna")
		}
		private function Select(e:MouseEvent):void {
			main.captiontab.setTxt("Seleciona as mascaras de cores das paredes")
		}
		private function Form(e:MouseEvent):void {
			main.captiontab.setTxt("Ferramenta de criação de máscaras de cores")
		}
		private function Del(e:MouseEvent):void {
			main.captiontab.setTxt("Remove a máscaca de cor selecionada")
		}
		private function Upload(e:MouseEvent):void {
			main.captiontab.setTxt("Carrega fotos do seu computador<br>para serem tratadas")
		}
		private function Save(e:MouseEvent):void {
			main.captiontab.setTxt("Salva a imagem tratda no simulador")
		}
		private function Print(e:MouseEvent):void {
			main.captiontab.setTxt("Imprimi a imagem construída no simulador")
		}
		private function Help(e:MouseEvent):void {
			main.captiontab.setTxt("Abre janela com vídeo e texto explicativo<br>sobre como usar o simulador")
		}
		private function Galery(e:MouseEvent):void {
			main.captiontab.setTxt("Abre janela contendo<br>imagens pré-definidas<br>para carregar no simulador")
		}
		private function Diff(e:MouseEvent):void {
			main.captiontab.setTxt("Clique para comparar a imagem<br>original com a tratada,<br>basta clicar novamente neste botão<br>para voltar com a imagem tratada")
		}

	}
}