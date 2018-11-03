
public class Application : Gtk.Window {

	public Application () {

		this.title = "HexToRGB";
		this.window_position = Gtk.WindowPosition.CENTER;
		this.destroy.connect (Gtk.main_quit);
		this.set_default_size (320, 75);
		this.resizable = false;

		Gtk.Button btnConvert = new Gtk.Button.with_label ("Convert");
		Gtk.Entry hexCode = new Gtk.Entry ();
		hexCode.width_chars = 15;
		hexCode.max_length = 7;

		Gtk.Entry rValue = new Gtk.Entry ();
		rValue.width_chars = 4;
		rValue.max_length = 3;

		Gtk.Entry gValue = new Gtk.Entry ();
		gValue.width_chars = 4;
		gValue.max_length = 3;

		Gtk.Entry bValue = new Gtk.Entry ();
		bValue.width_chars = 4;
		bValue.max_length = 3;

		Gtk.Grid grid = new Gtk.Grid();
		this.add (grid);

		grid.column_spacing = 8;
		grid.row_spacing = 8;
		grid.attach(new Gtk.Label (" Hex Code : "),   0, 0, 1, 1);
		grid.attach(hexCode, 1, 0, 1, 1);
		grid.attach(btnConvert, 2, 0, 1, 2);

		Gtk.Grid rGrid = new Gtk.Grid();
		rGrid.attach(new Gtk.Label (" R : "), 0, 0, 1, 1);
		rGrid.attach(rValue, 1, 0, 1, 1);

		rGrid.attach(new Gtk.Label (" G : "), 2, 0, 1, 1);
		rGrid.attach(gValue, 3, 0, 1, 1);


		rGrid.attach(new Gtk.Label (" B : "), 4, 0, 1, 1);
		rGrid.attach(bValue,5, 0, 1, 1);

		grid.attach(rGrid, 0, 1, 3, 1);
		

		btnConvert.clicked.connect (() => {
			string hexCodeString = hexCode.get_text ().up ();
			if(hexCodeString.length > 6){
				 string rString = hexCodeString.substring(1,2);
				 string gString = hexCodeString.substring(3,2);
				 string bString = hexCodeString.substring(5,2);
				 rValue.set_text(hexadecimalToDecimal(rString).to_string());
				 gValue.set_text(hexadecimalToDecimal(gString).to_string());
				 bValue.set_text(hexadecimalToDecimal(bString).to_string());
			}else{
				rValue.set_text("");
				gValue.set_text("");
				bValue.set_text("");
			}
		});
	}

	int hexadecimalToDecimal(string hexVal) {    
		int len = hexVal.length; 
		int b = 1; 
		int dec_val = 0; 
		for (int i=len-1; i>=0; i--) {    
			if (hexVal[i]>='0' && hexVal[i]<='9') { 
				dec_val += (hexVal[i] - 48)*b;   
				b = b * 16; 
			} 
			else if (hexVal[i]>='A' && hexVal[i]<='F') { 
				dec_val += (hexVal[i] - 55)*b; 
				b = b*16; 
			} 
		} 
			return dec_val; 
		} 
	

	public static int main (string[] args) {
		Gtk.init (ref args);

		Application app = new Application ();
		app.show_all ();
		Gtk.main ();
		return 0;
	}
}