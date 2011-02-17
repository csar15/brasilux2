package
{
	import flash.display.MovieClip;

	public class DotCor extends MovieClip
	{
		
		public var dot_width:Number = 12
		public var dot_height:Number = 12
		public var rd_color:Number
		public var name_color:String
		public var cod_color:String
		public var hexa_color:String
		
		public function DotCor(color_num:Number, color_name:String, color_cod:String, color_hexa:String)
		{
			name_color = color_name
			rd_color = color_num
			cod_color = color_cod
			hexa_color = color_hexa
			this.graphics.beginFill(rd_color)
			this.graphics.drawRect(-dot_width/2, -dot_height/2, dot_width, dot_height);
      		this.graphics.endFill();
		}
		
	}
}