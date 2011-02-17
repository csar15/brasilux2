package
{
	import fl.containers.ScrollPane;
	import fl.video.CaptionChangeEvent;
	import fl.video.FLVPlayback;
	import fl.video.FLVPlaybackCaptioning;
	
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;	
	public class Help
	{
		public var main:Main
		public var helppane:HelpPane
		private var player:FLVPlayback
		private var captioning:FLVPlaybackCaptioning
		private var videoPath:String = "video.flv";
		private var captioningPath:String = "caption.xml"
		private var helper:String
		private var scrolltxt:ScrollPane = new ScrollPane();
		private var textformat:TextFormat = new TextFormat()
		private var txt:TextField = new TextField()
		private var captiontxt:TextField = new TextField()
		private var captionformat:TextFormat = new TextFormat()
		
		public var xml:XML
		public var loader:Loader = new Loader()
		public var xmlLoader:URLLoader
		
		private var txtexplicativo:String
		
		
		public function Help()
		{
			super()
		}
		public function Init():void {
			helper = ""
			helppane = new HelpPane()
			helppane.btclose.buttonMode = true
			helppane.btclose.addEventListener(MouseEvent.MOUSE_OVER, main.OverMenu)
			helppane.btclose.addEventListener(MouseEvent.MOUSE_OUT, main.OutMenu)
			helppane.btclose.addEventListener(MouseEvent.CLICK, HelpClose)
			//
			helppane.bthelptxt.buttonMode = true
			helppane.bthelptxt.addEventListener(MouseEvent.MOUSE_OVER, main.OverMenu)
			helppane.bthelptxt.addEventListener(MouseEvent.MOUSE_OUT, main.OutMenu)
			helppane.bthelptxt.addEventListener(MouseEvent.CLICK, CreatExplicativo)
			//
			helppane.btvideo.buttonMode = true
			helppane.btvideo.addEventListener(MouseEvent.MOUSE_OVER, main.OverMenu)
			helppane.btvideo.addEventListener(MouseEvent.MOUSE_OUT, main.OutMenu)
			helppane.btvideo.addEventListener(MouseEvent.CLICK, CreatVideo)
			main.addChild(helppane)
		}
		public function HelpClose(e:MouseEvent):void {
			if (helper == "video") {
				RemoveVideo()
			}
			if (helper == "explicativo") {
				RemoveTexto()
			}
			main.removeChild(helppane)

		}
		public function CreatVideo(e:MouseEvent):void {
			helppane.play()
			helper = "video"
			player = new FLVPlayback()
			player.width = 630
			player.height = 420
			player.x = helppane.width/2 - player.width/2
			player.y = helppane.height/2 - player.height/2 -15
			player.skin = "SkinOverPlaySeekMute.swf"
			player.source = videoPath;
			player.skinAutoHide = true
            player.skinBackgroundColor = 0xFFFFFF;
            player.skinBackgroundAlpha = 0.8;
            
            captioning = new FLVPlaybackCaptioning()
            captioning.flvPlayback = player
            captioning.source = captioningPath
            captioning.autoLayout = false
            captioning.showCaptions = false
            captioning.captionTarget = captiontxt
            
            captionformat.color = 0x000000
			captionformat.size = 15
			captionformat.font = "Arial"
			captionformat.align = "center"
			captiontxt.defaultTextFormat = captionformat;	
			
			captiontxt.selectable = false
			captiontxt.multiline = true
			captiontxt.wordWrap = true
			captiontxt.width = 420
			captiontxt.autoSize = TextFieldAutoSize.CENTER;
			captiontxt.x = helppane.width/2 - captiontxt.width/2
			captiontxt.y = 580
            
            helppane.addChild(player)
            helppane.addChild(captioning)
            helppane.addChild(captiontxt)
		}
		private function RemoveVideo():void {
			player.pause()
			helppane.removeChild(player)
			helppane.removeChild(captioning)
			helppane.removeChild(captiontxt)
		}
		private function CreatExplicativo(e:MouseEvent):void {
			helppane.play()
			helper = "explicativo"
			LoadTxt()
		}
		private function LoadTxt():void {
			main.addChild(loader);
			xmlLoader = new URLLoader(new URLRequest("help.xml"));
			xmlLoader.addEventListener(Event.COMPLETE, parseXML)
		}
		private function parseXML(event:Event):void {
			xmlLoader.removeEventListener(Event.COMPLETE, parseXML);
			xml = new XML(event.currentTarget.data);
			txtexplicativo = xml
			CreatTxt()
			CreatScroll()
		}
		private function CreatTxt():void {
			textformat.color = 0x000000
			textformat.size = 14
			textformat.font = "Arial"
			txt.defaultTextFormat = textformat;	
			
			txt.selectable = false
			txt.multiline = true
			txt.wordWrap = true
			txt.width = 380
			txt.autoSize = TextFieldAutoSize.RIGHT;
			txt.x = 20
			txt.y = 5
			txt.htmlText = txtexplicativo
		}
		private function CreatScroll():void {
			scrolltxt.move(main.MAX_WIDTH/2 - 420/2 , main.MAX_HEIGHT/2 - 420/2);
			scrolltxt.setSize(420,400);
			scrolltxt.scrollDrag = true;			
			scrolltxt.source = txt
			main.addChild(scrolltxt);
		}
		private function RemoveTexto():void {
			scrolltxt.move(0, main.MAX_HEIGHT*3);
			//helppane.removeChild(scrolltxt);
		}

	}
}