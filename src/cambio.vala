/* -*- Mode: C; indent-tabs-mode: t; c-basic-offset: 4; tab-width: 4 -*-  */
/*
 * main.c
 * Copyright (C) 2018 Taylan Branco Meurer <tbmeurer@gmail.com>
 *
 * cambio is free software: you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * cambio is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

using GLib;
using Gtk;
using Math;


public class Main : Object
{

	/*
	 * Uncomment this line when you are done testing and building a tarball
	 * or installing
	 */
	//const string UI_FILE = Config.PACKAGE_DATA_DIR + "/ui/" + "cambio.ui";
	const string UI_FILE = "cambio.ui";
	string[] lista_box_presion = {"MegaPascal", "Pascal", "Bar", "atm", "kgf/cm²","kgf/m²","mmHG"};
	string[] lista_box_volumen = {"km³","m³","litro","dm³","cm³"};
	string[] lista_box_masa = {"Tonelada","kN","kg","hg","g"};
	string[] lista_box_fuerza = {"N","kgf","Dyna","Joule/metro","Pa/m²"};
	string[] lista_box_tiempo = {"hora","min","s","dia","ano"};
	string[] lista_box_velocidad = {"km/h","m/s","cm/s","km/s","vel_luz"};
	string[] lista_box_longitud = {"km","m","dm","cm","mm"};
	string[] lista_box_densidad = {"g/cm³","kg/m³","g/m³","mg/m³"};
	string[] lista_box_area = {"km²","m²","cm²"};

	Entry entry_presion_entrada;
	Entry entry_presion_saida;
	Entry entry_volumen_entrada;
	Entry entry_volumen_saida;
	Entry entry_masa_entrada;
	Entry entry_masa_saida;
	Entry entry_fuerza_entrada;
	Entry entry_fuerza_saida;
	Entry entry_densidad_entrada;
	Entry entry_densidad_saida;
	Entry entry_velocidad_entrada;
	Entry entry_velocidad_saida;
	Entry entry_area_entrada;
	Entry entry_area_saida;
	Entry entry_longitud_entrada;
	Entry entry_longitud_saida;
	Entry entry_tiempo_entrada;
	Entry entry_tiempo_saida;

	SpinButton spin_presion;
	SpinButton spin_masa;
	SpinButton spin_fuerza;
	SpinButton spin_volumen;
	SpinButton spin_densidad;
	SpinButton spin_area;
	SpinButton spin_longitud;
	SpinButton spin_tiempo;
	SpinButton spin_velocidad;

	ComboBox box_presion_entrada;
	ComboBox box_presion_saida;
	ComboBox box_fuerza_entrada;
	ComboBox box_fuerza_saida;
	ComboBox box_masa_entrada;
	ComboBox box_masa_saida;
	ComboBox box_densidad_entrada;
	ComboBox box_densidad_saida;
	ComboBox box_volumen_entrada;
	ComboBox box_volumen_saida;
	ComboBox box_velocidad_entrada;
	ComboBox box_velocidad_saida;
	ComboBox box_area_entrada;
	ComboBox box_area_saida;
	ComboBox box_longitud_entrada;
	ComboBox box_longitud_saida;
	ComboBox box_tiempo_entrada;
	ComboBox box_tiempo_saida;




	enum Column {
		 Presion_enum
	}



	/* ANJUTA: Widgets declaration for cambio.ui - DO NOT REMOVE */


	public Main ()
	{

		try
		{
			var builder = new Builder ();
			builder.add_from_file (UI_FILE);

			get_variables(builder);
			builder.connect_signals (this);
			Gtk.ListStore liststore_presion_e = new Gtk.ListStore(1, typeof(string));
			Gtk.ListStore liststore_presion_s = new Gtk.ListStore(1, typeof(string));
			Gtk.ListStore liststore_fuerza_e = new Gtk.ListStore(1, typeof(string));
			Gtk.ListStore liststore_fuerza_s = new Gtk.ListStore(1, typeof(string));
			Gtk.ListStore liststore_volumen_e = new Gtk.ListStore(1, typeof(string));
			Gtk.ListStore liststore_volumen_s = new Gtk.ListStore(1, typeof(string));
			Gtk.ListStore liststore_masa_e = new Gtk.ListStore(1, typeof(string));
			Gtk.ListStore liststore_masa_s = new Gtk.ListStore(1, typeof(string));
			Gtk.ListStore liststore_densidad_e = new Gtk.ListStore(1, typeof(string));
			Gtk.ListStore liststore_densidad_s = new Gtk.ListStore(1, typeof(string));
			Gtk.ListStore liststore_velocidad_e = new Gtk.ListStore(1, typeof(string));
			Gtk.ListStore liststore_velocidad_s = new Gtk.ListStore(1, typeof(string));
			Gtk.ListStore liststore_area_e = new Gtk.ListStore(1, typeof(string));
			Gtk.ListStore liststore_area_s = new Gtk.ListStore(1, typeof(string));
			Gtk.ListStore liststore_longitud_e = new Gtk.ListStore(1, typeof(string));
			Gtk.ListStore liststore_longitud_s = new Gtk.ListStore(1, typeof(string));
			Gtk.ListStore liststore_tiempo_e = new Gtk.ListStore(1, typeof(string));
			Gtk.ListStore liststore_tiempo_s = new Gtk.ListStore(1, typeof(string));
			//presion
			criar_liststore_para_combobox(box_presion_entrada,liststore_presion_e,lista_box_presion);
			criar_liststore_para_combobox(box_presion_saida,liststore_presion_s,lista_box_presion);
			//volumen
			criar_liststore_para_combobox(box_volumen_entrada,liststore_volumen_e,lista_box_volumen);
			criar_liststore_para_combobox(box_volumen_saida, liststore_volumen_s, lista_box_volumen);
			//masa
			criar_liststore_para_combobox(box_masa_entrada,liststore_masa_e,lista_box_masa);
			criar_liststore_para_combobox(box_masa_saida, liststore_masa_s, lista_box_masa);
			//fuerza
			criar_liststore_para_combobox(box_fuerza_entrada,liststore_fuerza_e,lista_box_fuerza);
			criar_liststore_para_combobox(box_fuerza_saida, liststore_fuerza_s, lista_box_fuerza);
			//densidad
			criar_liststore_para_combobox(box_densidad_entrada,liststore_densidad_e,lista_box_densidad);
			criar_liststore_para_combobox(box_densidad_saida, liststore_densidad_s, lista_box_densidad);
			//velocidad
			criar_liststore_para_combobox(box_velocidad_entrada,liststore_velocidad_e,lista_box_velocidad);
			criar_liststore_para_combobox(box_velocidad_saida, liststore_velocidad_s, lista_box_velocidad);
			//longitud
			criar_liststore_para_combobox(box_longitud_entrada,liststore_longitud_e,lista_box_longitud);
			criar_liststore_para_combobox(box_longitud_saida, liststore_longitud_s, lista_box_longitud);
			//tiempo
			criar_liststore_para_combobox(box_tiempo_entrada,liststore_tiempo_e,lista_box_tiempo);
			criar_liststore_para_combobox(box_tiempo_saida, liststore_tiempo_s, lista_box_tiempo);
			//area
			criar_liststore_para_combobox(box_area_entrada,liststore_area_e,lista_box_area);
			criar_liststore_para_combobox(box_area_saida, liststore_area_s, lista_box_area);

			var window = builder.get_object ("window") as Window;


			/* ANJUTA: Widgets initialization for cambio.ui - DO NOT REMOVE */
			window.show_all ();
		}
		catch (Error e) {
			stderr.printf ("Could not load UI: %s\n", e.message);
		}

	}


	[CCode (instance_pos = -1)]
	public void on_destroy (Widget window)
	{
		Gtk.main_quit();
	}

	private void criar_liststore_para_combobox(ComboBox box, Gtk.ListStore liststore, string[] lista){
		for (int i = 0; i < lista.length; i++){
			TreeIter iter;
			liststore.append(out iter);
			liststore.set(iter, Column.Presion_enum, lista[i]);

		}

		box.set_model(liststore);
		CellRendererText cell = new CellRendererText ();
		box.pack_start (cell, false);

		box.set_attributes (cell, "text", Column.Presion_enum);

		box.set_active(0);

	}

	private void get_variables (Builder builder) {
		this.spin_masa = builder.get_object("spin_masa") as SpinButton;
		this.spin_area = builder.get_object("spin_area") as SpinButton;
		this.spin_presion = builder.get_object("spin_presion") as SpinButton;
		this.spin_volumen = builder.get_object("spin_volumen") as SpinButton;
		this.spin_velocidad = builder.get_object("spin_velocidad") as SpinButton;
		this.spin_fuerza = builder.get_object("spin_fuerza") as SpinButton;
		this.spin_densidad = builder.get_object("spin_densidad") as SpinButton;
		this.spin_longitud = builder.get_object("spin_longitud") as SpinButton;
		this.spin_tiempo = builder.get_object("spin_tiempo") as SpinButton;

		this.entry_area_entrada = builder.get_object("entry_area_entrada") as Entry;
		this.entry_area_saida = builder.get_object("entry_area_saida") as Entry;
		this.entry_masa_entrada = builder.get_object("entry_masa_entrada") as Entry;
		this.entry_masa_saida = builder.get_object("entry_masa_saida") as Entry;
		this.entry_presion_entrada = builder.get_object("entry_presion_entrada") as Entry;
		this.entry_presion_saida = builder.get_object("entry_presion_saida") as Entry;
		this.entry_volumen_entrada = builder.get_object("entry_volumen_entrada") as Entry;
		this.entry_volumen_saida = builder.get_object("entry_volumen_saida") as Entry;
		this.entry_fuerza_entrada = builder.get_object("entry_fuerza_entrada") as Entry;
		this.entry_fuerza_saida = builder.get_object("entry_fuerza_saida") as Entry;
		this.entry_densidad_entrada = builder.get_object("entry_densidad_entrada") as Entry;
		this.entry_densidad_saida = builder.get_object("entry_densidad_saida") as Entry;
		this.entry_velocidad_entrada = builder.get_object("entry_velocidad_entrada") as Entry;
		this.entry_velocidad_saida = builder.get_object("entry_velocidad_saida") as Entry;
		this.entry_longitud_entrada = builder.get_object("entry_longitud_entrada") as Entry;
		this.entry_longitud_saida = builder.get_object("entry_longitud_saida") as Entry;
		this.entry_tiempo_entrada = builder.get_object("entry_tiempo_entrada") as Entry;
		this.entry_tiempo_saida = builder.get_object("entry_tiempo_saida") as Entry;

		this.box_presion_entrada = builder.get_object("box_presion_entrada") as ComboBox;
		this.box_presion_saida = builder.get_object("box_presion_saida") as ComboBox;
		this.box_volumen_entrada = builder.get_object("box_volumen_entrada") as ComboBox;
		this.box_volumen_saida = builder.get_object("box_volumen_saida") as ComboBox;
		this.box_fuerza_entrada = builder.get_object("box_fuerza_entrada") as ComboBox;
		this.box_fuerza_saida = builder.get_object("box_fuerza_saida") as ComboBox;
		this.box_masa_entrada = builder.get_object("box_masa_entrada") as ComboBox;
		this.box_masa_saida = builder.get_object("box_masa_saida") as ComboBox;
		this.box_densidad_entrada = builder.get_object("box_densidad_entrada") as ComboBox;
		this.box_densidad_saida = builder.get_object("box_densidad_saida") as ComboBox;
		this.box_velocidad_entrada = builder.get_object("box_velocidad_entrada") as ComboBox;
		this.box_velocidad_saida = builder.get_object("box_velocidad_saida") as ComboBox;
		this.box_area_entrada = builder.get_object("box_area_entrada") as ComboBox;
		this.box_area_saida = builder.get_object("box_area_saida") as ComboBox;
		this.box_longitud_entrada = builder.get_object("box_longitud_entrada") as ComboBox;
		this.box_longitud_saida = builder.get_object("box_longitud_saida") as ComboBox;
		this.box_tiempo_entrada = builder.get_object("box_tiempo_entrada") as ComboBox;
		this.box_tiempo_saida = builder.get_object("box_tiempo_saida") as ComboBox;

	}

	private void escribir_entrada(SpinButton spin, string[] lista, ComboBox box_entrada, Entry entry_entrada) {
		//entrada
		float valor;
		valor = (float) spin.get_value();
		var string = valor.to_string();
		string += "  "+lista[box_entrada.get_active()];
		entry_entrada.set_text(string);

	}

	private void escribir_saida(double aux, SpinButton spin, string[] lista, ComboBox box_saida, Entry entry_saida ){
		//saida
		float valor;
		valor = (float) aux;
		var string = valor.to_string();
		string += "  "+lista[box_saida.get_active()];
		entry_saida.set_text(string);
	}

	[CCode (instance_pos = -1)]
	public void on_but_aplicar_presion_clicked (Widget window)
	{

		//calcula a convercion
		double aux =  spin_presion.get_value();

		switch(box_presion_entrada.get_active()){
		case 0:
			//megaPascal
			switch(box_presion_saida.get_active()){
			case 0:
				//MegaPascal
				break;
			case 1:
				//Pascal
				//1MPa - 10^6 Pa
				aux *= Math.pow(10,6);
				break;
			case 2:
				//Bar
				// 1MPa -> 10 Bar
				aux *= 10;
				break;
			case 3:
				//atm
				// 1Mpa -> 9.87 atm
				aux *= 9.87;
				break;
			case 4:
				//kgf/cm²
				// 1MPa -> 10,2
				aux *= 10.2;
				break;
			case 5:
				//kgf/m²
				// Mpa -> 101.971,6
				aux *= 101971.6;
				break;
			case 6:
				//mmHG
				// 1MPa -> 7.500,64 mmHG
				aux *= 7500.64;
				break;
			default:
				aux = 0;
				break;
			}
			break;
		case 1:
			//Pascal
			switch(box_presion_saida.get_active()){
			case 0:
				//MegaPascal
				// 1PA -> 10^⁻6
				aux *= Math.pow(10,-6);
				break;
			case 1:
				//Pascal
				break;
			case 2:
				//Bar
				// 1Pa -> 10^⁻5 Bar
				aux *= Math.pow(10,-5);
				break;
			case 3:
				//atm
				// 1pa -> 9.87x10^-6 atm
				aux *= 9.87*Math.pow(10,-6);
				break;
			case 4:
				//kgf/cm²
				// 1Pa -> 1,02×10-5
				aux *= 0.0000101972;
				break;
			case 5:
				//kgf/m²
				// Pa -> 0.1
				aux *= 0.101972;
				break;
			case 6:
				//mmHG
				// 1Pa -> 7.500,64 mmHG
				aux *= 0.00750064;
				break;
			default:
				break;
			}
			break;
		case 2:
			//Bar
			switch(box_presion_saida.get_active()){
			case 0:
				//MegaPascal
				// 1Bar -> 0.1
				aux *= 0.101325;
				break;
			case 1:
				//Pascal
				aux *= 100000;
				break;
			case 2:
				//Bar
				// 1bar -> Bar
				break;
			case 3:
				//atm
				// 1bar ->  atm
				aux *= 0.986923;
				break;
			case 4:
				//kgf/cm²
				// 1bar ->
				aux *= 1.0197;
				break;
			case 5:
				//kgf/m²
				// 1 ->
				aux *= 10197.16;
				break;
			case 6:
				//mmHG
				// 1bar ->
				aux *= 750.06;
				break;
			default:
				break;
			}
			break;
		case 3:
			//atm
			switch(box_presion_saida.get_active()){
			case 0:
				//MegaPascal
				aux *= 0.101325;
				break;
			case 1:
				//Pascal
				aux *= 101325;
				break;
			case 2:
				//Bar
				aux *= 1.0132;
				break;
			case 3:
				//atm
				//aux *= 0.986923;
				break;
			case 4:
				//kgf/cm²
				aux *= 1.0332;
				break;
			case 5:
				//kgf/m²
				aux *= 10332.27;
				break;
			case 6:
				//mmHG
				aux *= 760;
				break;
			default:
				break;
			}
			break;
		case 4:
			//kgf/cm²
			switch(box_presion_saida.get_active()){
			case 0:
				//MegaPascal
				aux *= 0.098067;
				break;
			case 1:
				//Pascal
				aux *= 98066.52;
				break;
			case 2:
				//Bar
				aux *= 0.980665;
				break;
			case 3:
				//atm
				aux *= 0.967841;
				break;
			case 4:
				//kgf/cm²
				//aux *= ;
				break;
			case 5:
				//kgf/m²
				aux *= 10000;
				break;
			case 6:
				//mmHG
				aux *= 735.56;
				break;
			default:
				break;
			}
			break;
		case 5:
			//kgf/m²
			switch(box_presion_saida.get_active()){
			case 0:
				//MegaPascal
				aux *= 0.0000098067;
				break;
			case 1:
				//Pascal
				aux *= 9.8067;
				break;
			case 2:
				//Bar
				aux *= 0.0000980665;
				break;
			case 3:
				//atm
				aux *= 0.0000967841;
				break;
			case 4:
				//kgf/cm²
				aux *= 0.0001;
				break;
			case 5:
				//kgf/m²
				//aux *= 10000;
				break;
			case 6:
				//mmHG
				aux *= 0.073556;
				break;
			default:
				break;
			}
			break;
		case 6:
			//mmHG
			switch(box_presion_saida.get_active()){
			case 0:
				//MegaPascal
				aux *= 0.00013332;
				break;
			case 1:
				//Pascal
				aux *= 133.32;
				break;
			case 2:
				//Bar
				aux *= 0.00133322;
				break;
			case 3:
				//atm
				aux *= 0.00131579;
				break;
			case 4:
				//kgf/cm²
				aux *= 0.00135951;
				break;
			case 5:
				//kgf/m²
				aux *= 13.5951;
				break;
			case 6:
				//mmHG
				//aux *= 0.073556;
				break;
			default:
				break;
			}
			break;
		default:
			break;
		}
		escribir_entrada(spin_presion,lista_box_presion, box_presion_entrada, entry_presion_entrada);
		escribir_saida(aux, spin_presion, lista_box_presion, box_presion_saida, entry_presion_saida);

	}

	[CCode (instance_pos = -1)]
	public void on_but_aplicar_fuerza_clicked (Widget window)
	{

		//calcula a convercion
		double aux =  spin_fuerza.get_value();

		switch(box_fuerza_entrada.get_active()){
		case 0:
			//Newton
			switch(box_fuerza_saida.get_active()){
			case 0:
				//Newton
				break;
			case 1:
				//kgf
				aux *= 0.101972;
				break;
			case 2:
				//Dyna
				aux *= 100000;
				break;
			case 3:
				//Joule/metro
				//aux *= 9.87;
				break;
			case 4:
				//Pa/m²
				//aux *= 10.2;
				break;
			default:
				aux = 0;
				break;
			}
			break;
		case 1:
			//kgf
			switch(box_fuerza_saida.get_active()){
			case 0:
				//N
				aux *= 9.8066;
				break;
			case 1:
				//kgf
				break;
			case 2:
				//Dyna
				aux *= 980665;
				break;
			case 3:
				//Joule/m
				aux *= 9.8066;
				break;
			case 4:
				//pa/m²
				aux *= 9.8066;
				break;

			default:
				break;
			}
			break;
		case 2:
			//Dyna
			switch(box_fuerza_saida.get_active()){
			case 0:
				//N
				aux *= 0.00001;
				break;
			case 1:
				//kgf
				aux *= 0.0000010197;
				break;
			case 2:
				//Dyna
				break;
			case 3:
				//Joule/m
				aux *= 0.00001;
				break;
			case 4:
				//Pa/m²
				aux *= 0.00001;
				break;
			default:
				break;
			}
			break;
		case 3:
			//Joule/m
			switch(box_fuerza_saida.get_active()){
			case 0:
				//N
				//aux *= ;
				break;
			case 1:
				//kgf
				aux *= 0.101972;
				break;
			case 2:
				//dyna
				aux *= 100000;
				break;
			case 3:
				//j/m
				//aux *= 0.986923;
				break;
			case 4:
				//pa/m²
				//aux *= 1.0332;
				break;
			}
			break;
		case 4:
			//Pa/m²
			switch(box_fuerza_saida.get_active()){
			case 0:
				//N
				aux *= 0.098067;
				break;
			case 1:
				//kgf
				aux *= 0.101972;
				break;
			case 2:
				//dyna
				aux *= 100000;
				break;
			case 3:
				//j/m
				//aux *= 0.967841;
				break;
			case 4:
				//Pa/m²
				//aux *= ;
				break;
			default:
				break;
			}
			break;
		default:
			break;
		}
		escribir_entrada(spin_fuerza,lista_box_fuerza, box_fuerza_entrada, entry_fuerza_entrada);
		escribir_saida(aux, spin_fuerza, lista_box_fuerza, box_fuerza_saida, entry_fuerza_saida);

	}

	[CCode (instance_pos = -1)]
	public void on_but_aplicar_volumen_clicked (Widget window)
	{

		//calcula a convercion
		double aux =  spin_volumen.get_value();

		switch(box_volumen_entrada.get_active()){
		case 0:
			//km³
			switch(box_volumen_saida.get_active()){
			case 0:
				//km³
				//
				break;
			case 1:
				//m³
				aux *= 1000000000;
				break;
			case 2:
				//litro
				aux *= 1000000000000;
				break;
			case 3:
				//dm³
				aux *= 1000000000000;
				break;
			case 4:
				//cm³
				aux *= 1000000000000000;
				break;
			default:
				break;
			}
			break;
		case 1:
			//m³
			switch(box_volumen_saida.get_active()){
			case 0:
				//km³
				aux *= Math.pow(10,-9);
				break;
			case 1:
				//m³
				break;
			case 2:
				//litros
				aux *= 1000;
				break;
			case 3:
				//dm³
				aux *= 1000;
				break;
			case 4:
				//cm³
				aux *= 1000000;
				break;

			default:
				break;
			}
			break;
		case 2:
			//litros
			switch(box_volumen_saida.get_active()){
			case 0:
				//km³
				aux *= Math.pow(10,-12);
				break;
			case 1:
				//m³
				aux *= 0.001;
				break;
			case 2:
				//litros
				break;
			case 3:
				//dm³
				//aux *= 0.00001;
				break;
			case 4:
				//cm³
				aux *= 1000;
				break;
			default:
				break;
			}
			break;
		case 3:
			//dm³
			switch(box_volumen_saida.get_active()){
			case 0:
				//km³
				aux *= Math.pow(10,-12);
				break;
			case 1:
				//m³
				aux *= 0.001;
				break;
			case 2:
				//litros
				break;
			case 3:
				//dm³
				//aux *= 0.00001;
				break;
			case 4:
				//cm³
				aux *= 1000;
				break;
			default:
				break;
			}
			break;
		case 4:
			//cm³
			switch(box_volumen_saida.get_active()){
			case 0:
				//km³
				aux *= Math.pow(10,-15);
				break;
			case 1:
				//m³
				aux *= 0.000001;
				break;
			case 2:
				//litros
				aux *= 0.001;
				break;
			case 3:
				//dm³
				aux *= 0.001;
				break;
			case 4:
				//cm³
				//aux *= ;
				break;
			default:
				break;
			}
			break;
		default:
			break;
		}
		escribir_entrada(spin_volumen,lista_box_volumen, box_volumen_entrada, entry_volumen_entrada);
		escribir_saida(aux, spin_volumen, lista_box_volumen, box_volumen_saida, entry_volumen_saida);

	}
	[CCode (instance_pos = -1)]
	public void on_but_aplicar_masa_clicked (Widget window)
	{

		//calcula a convercion
		double aux =  spin_masa.get_value();

		switch(box_masa_entrada.get_active()){
		case 0:
			//tonelada
			switch(box_masa_saida.get_active()){
			case 0:
				//tonelada
				//
				break;
			case 1:
				//kN
				aux *= 9.8067;
				break;
			case 2:
				//kg
				aux *= 1000;
				break;
			case 3:
				//hg
				aux *= 10000;
				break;
			case 4:
				//g
				aux *= 1000000;
				break;
			default:
				break;
			}
			break;
		case 1:
			//kN
			switch(box_masa_saida.get_active()){
			case 0:
				//tonelada
				aux *= 0.101972;
				break;
			case 1:
				//kN
				//
				break;
			case 2:
				//kg
				aux *= 101.97;
				break;
			case 3:
				//hg
				aux *= 1019.72;
				break;
			case 4:
				//g
				aux *= 101971.6;
				break;

			default:
				break;
			}
			break;
		case 2:
			//kg
			switch(box_masa_saida.get_active()){
			case 0:
				//tonelada
				aux *= 0.001;
				break;
			case 1:
				//kN
				aux *= 0.00980665;
				break;
			case 2:
				//kg
				break;
			case 3:
				//hg
				aux *= 10;
				break;
			case 4:
				//g
				aux *= 1000;
				break;
			default:
				break;
			}
			break;
		case 3:
			//hg
			switch(box_masa_saida.get_active()){
			case 0:
				//tonelada
				aux *= 0.0001;
				break;
			case 1:
				//kN
				aux *= 0.00098067;
				break;
			case 2:
				//kg
				aux *= 0.1;
				break;
			case 3:
				//hg
				//aux *= 0.00001;
				break;
			case 4:
				//g
				aux *= 100;
				break;
			default:
				break;
			}
			break;
		case 4:
			//g
			switch(box_masa_saida.get_active()){
			case 0:
				//tonelada
				aux *= 0.000001;
				break;
			case 1:
				//kN
				aux *= 0.0000098067;
				break;
			case 2:
				//kg
				aux *= 0.001;
				break;
			case 3:
				//hg
				aux *= 0.01;
				break;
			case 4:
				//g
				//aux *= ;
				break;
			default:
				break;
			}
			break;
		default:
			break;
		}
		escribir_entrada(spin_masa,lista_box_masa, box_masa_entrada, entry_masa_entrada);
		escribir_saida(aux, spin_masa, lista_box_masa, box_masa_saida, entry_masa_saida);

	}

	[CCode (instance_pos = -1)]
	public void on_but_aplicar_densidad_clicked (Widget window)
	{

		//calcula a convercion
		double aux =  spin_densidad.get_value();

		switch(box_densidad_entrada.get_active()){
		case 0:
			//g/cm³
			switch(box_densidad_saida.get_active()){
			case 0:
				//g/cm³
				//
				break;
			case 1:
				//kg/m³
				aux *= 1000;
				break;
			case 2:
				//g/m³
				aux *= 1000000;
				break;
			case 3:
				//mg/m³
				aux *= 1000000000;
				break;
			default:
				break;
			}
			break;
		case 1:
			//kg/m³
			switch(box_densidad_saida.get_active()){
			case 0:
				//g/cm³
				aux *= 0.001;
				break;
			case 1:
				//kg/m³
				//
				break;
			case 2:
				//g/m³
				aux *= 1000;
				break;
			case 3:
				//mg/m³
				aux *= 1000000;
				break;
			default:
				break;
			}
			break;
		case 2:
			//g/m³
			switch(box_densidad_saida.get_active()){
			case 0:
				//g/cm³
				aux *= 0.000001;
				break;
			case 1:
				//kg/m³
				aux *= 0.001;
				break;
			case 2:
				//g/m³
				break;
			case 3:
				//mg/m³
				aux *= 1000;
				break;
			default:
				break;
			}
			break;
		case 3:
			//mg/m³
			switch(box_densidad_saida.get_active()){
			case 0:
				//g/cm³
				aux *= Math.pow(10,-9);
				break;
			case 1:
				//kg/m³
				aux *= 0.000001;
				break;
			case 2:
				//g/m³
				aux *= 0.001;
				break;
			case 3:
				//mg/m³
				//aux *= ;
				break;
			default:
				break;
			}
			break;
		default:
			break;
		}
		escribir_entrada(spin_densidad,lista_box_densidad, box_densidad_entrada, entry_densidad_entrada);
		escribir_saida(aux, spin_densidad, lista_box_densidad, box_densidad_saida, entry_densidad_saida);

	}


	static int main (string[] args)
	{
		Gtk.init (ref args);
		var app = new Main ();

		Gtk.main ();

		return 0;
	}
}
